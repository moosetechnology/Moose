"
A MalHierarchicalGraph is composed of a collection of nodes situated in a hierarchy and two types of edges: edges between the base nodes and edges that are propagated up in the hierarchy.

Instance Variables
	levels:		<Dictionary>

levels
	- dict keys: level, values: all nodes on that level as a Collection.

"
Class {
	#name : #MalHierarchicalGraph,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'levels'
	],
	#category : #'Moose-Algos-HierarchicalGraph'
}

{ #category : #creation }
MalHierarchicalGraph class >> basicCreate: baseEntities [
	| hiGraph |
	hiGraph := self new.
	"TODO: refactor this"
	((baseEntities isKindOf: Collection) and: ((baseEntities isKindOf: String) not))
		ifTrue: [ hiGraph nodes: baseEntities. ]
		ifFalse: [ hiGraph node: baseEntities ].
	^ hiGraph.
]

{ #category : #creation }
MalHierarchicalGraph class >> with: baseModels [
	"Building a HiGraph from base models (collection of root or leaf nodes)."
	
	 ^ self basicCreate: baseModels
	
]

{ #category : #api }
MalHierarchicalGraph >> addEdge: aModel from: source to: target [
	"Imperative method to add a single edge to the graph."
	self addEdges: (OrderedCollection with: aModel) from: source to: target.
]

{ #category : #api }
MalHierarchicalGraph >> addEdges: aCollection from: source to: destination [
	"Imperative method to add edges. Can be called multiple times, before #propagateEdges is called (must be done manually)."
	self addEdges: aCollection source: source destination: destination.
]

{ #category : #building }
MalHierarchicalGraph >> addEdges: aCollection source: source destination: destination [
	| foundClasses |
	self addEdges: aCollection
		sourceBlock: [ :e |
			(source isKindOf: Array)
				ifTrue: [ 
					foundClasses := (source select: [ :asso | e isKindOf: asso key ]).
					foundClasses ifEmpty: [ nil ] ifNotEmpty: [ foundClasses last value value: e ].
				]
	     			"Symbol (method) or block based way"
				ifFalse: [ 
					source value: e.
				].
		] 
		destinationBlock: [  :e |
			(destination isKindOf: Array)
				ifTrue: [ 
					foundClasses := (destination select: [ :asso | e isKindOf: asso key ]).
					foundClasses ifEmpty: [ nil ] ifNotEmpty: [ foundClasses last value value: e ].
				]
	     			"Symbol (method) or block based way"
				ifFalse: [ 
					destination value: e.
				].
		].
]

{ #category : #building }
MalHierarchicalGraph >> addEdges: aCollection sourceBlock: srcBlock destinationBlock: dstBlock [
	"Add given edges to the higraph.
	If through given edges new nodes are found, they are NOT added to the graph."
	| srcEntity dstEntity srcNode dstNode edge |
	aCollection do: [ :e | 
		
		"Get source and destination models."
		srcEntity := srcBlock value: e.
		dstEntity := dstBlock value: e.

		"Models should not be nil"
	      self assert: (srcEntity notNil and: dstEntity notNil) description: 'Models should never be nil. Check correctness of srcBlock and dstBlock.'.
			
		"Get nodes from entities"
		(nodes includesKey: srcEntity)
			ifTrue: [
				srcNode := nodes at: srcEntity.
			].
			
		(nodes includesKey: dstEntity)
			ifTrue: [
				dstNode := nodes at: dstEntity.
			].
		
		"Only create edge if nodes were found."
		(srcNode isNil or: dstNode isNil) ifFalse: [
			
			"Create an edge between the nodes and add it to the graph."
			edge := MalGraphEdge with: e from: srcNode to: dstNode.
			
			"Adding edge to the graphs edge collection"
			self edges add: edge.
			
			"Add edge references to the node themselves"
			srcNode addOutgoing: edge.
			dstNode addIncoming: edge.
		].
	].
]

{ #category : #api }
MalHierarchicalGraph >> aggregation: howToGetParent [
	| foundClasses |
	(howToGetParent isKindOf: Array)
		"Class based"
		ifTrue: [ 
			self blockToGetParent: [ :e |
				foundClasses := (howToGetParent select: [ :asso | e isKindOf: asso key ]).
				foundClasses ifEmpty: [ nil ] ifNotEmpty: [ foundClasses last value value: e ].
			]
		]
	      "Symbol (method) or block based way"
		ifFalse: [ 
			self blockToGetParent: [ :e | howToGetParent value: e ].
		].
]

{ #category : #building }
MalHierarchicalGraph >> blockToGetChildren: aBuildingBlock [ 
	"Builds the hierarchical graph based on root entities and given block"
	| rootNodes nodesToProcess |

	"Make sure base entities are set before calling this method."
	self assert: (nodes notEmpty) description: 'Base nodes have to be set before calling this method.'.
	
	"If this method is called we know that we are in top down building mode, 
	this means all given base nodes are root nodes (level 0)."
	rootNodes := self nodes asOrderedCollection.
	rootNodes do: [ :n | n level: 0 ].
	levels at: 0 put: rootNodes.

	nodesToProcess := Stack new.
	nodesToProcess addAll: rootNodes.

	[nodesToProcess notEmpty] whileTrue:  [
		| node childrenNodes |
		
		node := nodesToProcess pop.
		
		childrenNodes := self setChildrenOfNode: node builder: aBuildingBlock.
		
		(childrenNodes notEmpty) ifTrue: [
			
			"Need to re-evaluate found children"
			childrenNodes do: [ :childNode | 
				nodesToProcess push: childNode.
			].
		]
	].
]

{ #category : #building }
MalHierarchicalGraph >> blockToGetParent: aBuildingBlock [ 
	"Builds the hierarchical graph based on the leaf entities and given block"
	| nodesToProcess |
	
	"Make sure leafs are set before calling this method."
	self assert: (nodes notEmpty) description: 'Base nodes have to be set before calling this method.'.
	
	nodesToProcess := Stack new.
	nodesToProcess addAll: nodes values.

	[nodesToProcess notEmpty] whileTrue:  [
		| node parentNode |
		
		node := nodesToProcess pop.
		
		parentNode := self setParentOfNode: node builder: aBuildingBlock.
		
		(parentNode notNil) ifTrue: [
			"Need to re-evaluate found parent"
			nodesToProcess push: parentNode.
		]
	].

	"After we have set up the hierarchy, we have to set the levels of the node(s), 
	so we can use this information when propagating relationships."
	self setLevels.
]

{ #category : #api }
MalHierarchicalGraph >> bottomUp: howToGetParent [
	"Build the hiGraph bottom up from given leaf nodes."
	self aggregation: howToGetParent.
]

{ #category : #api }
MalHierarchicalGraph >> containment: howToGetChildren [
	| foundClasses |
	(howToGetChildren isKindOf: Array)
		"Class based"
		ifTrue: [ 
			self blockToGetChildren: [ :e |
				foundClasses := (howToGetChildren select: [ :asso | e isKindOf: asso key ]).
				foundClasses ifEmpty: [ nil ] ifNotEmpty: [ foundClasses last value value: e ].
			]
		]
	
		"Symbol (method) or block based way"
		ifFalse: [ 
			self blockToGetChildren: [ :e | howToGetChildren value: e ].
		].
]

{ #category : #testing }
MalHierarchicalGraph >> deepestLevel [
	"Returns the deepest level in the hierarchy, i.e. the level the leaf nodes reside on."
	^ levels keys asSortedCollection last

]

{ #category : #accessing }
MalHierarchicalGraph >> edges [ 
	"Returns a Collection of all edges in this hiGraph."
	^ edges.
]

{ #category : #api }
MalHierarchicalGraph >> edges: aCollection from: source to: destination [
	"Declerative method to add and propagate edges in one go."
	self addEdges: aCollection source: source destination: destination.
	self propagateEdges.
]

{ #category : #api }
MalHierarchicalGraph >> edges: aCollection from: source to: target weight: weightFunction [
	ShouldNotImplement signal. "There are no weights in a hierarchical graph."
]

{ #category : #enumerating }
MalHierarchicalGraph >> edgesNotPropagated [
	"Returns a Collection of all edges that were not propagated in this hiGraph."
	^ edges reject: [ :rel | rel class = MalHgPropagatedEdge ].
]

{ #category : #enumerating }
MalHierarchicalGraph >> edgesPropagated [
	"Returns a Collection of all edges that were propagated in this hiGraph."
	^ edges select: [ :rel | rel class = MalHgPropagatedEdge ].
]

{ #category : #enumerating }
MalHierarchicalGraph >> findNode: aModel [
	"Returns the node wrapping the given model or nil if such a node does not exists in the graph."
	^ self nodeWrapping: aModel.
]

{ #category : #enumerating }
MalHierarchicalGraph >> findNode: aModel ifAbsent: aBlock [
	"Returns the node wrapping the given model, runs given block if such a node does not exists in the graph."
	^ self nodeWrapping: aModel ifAbsent: aBlock.
]

{ #category : #'initialize-release' }
MalHierarchicalGraph >> initialize [
	self reset.

]

{ #category : #enumerating }
MalHierarchicalGraph >> leafNodes [
	"Returns a Collection of all leaf nodes of this hiGraph."
	^ levels at: self deepestLevel.
]

{ #category : #api }
MalHierarchicalGraph >> leaves: entities [
	self nodes: entities.
]

{ #category : #enumerating }
MalHierarchicalGraph >> level: aLevel [
	"Returns a collection of all nodes on given level."
	^ self nodesOnLevel: aLevel.
]

{ #category : #accessing }
MalHierarchicalGraph >> levels [
	^ levels.
]

{ #category : #api }
MalHierarchicalGraph >> node: anEntity [
	"Convenience method to add a single base entity e.g. a single root node."
	self nodes: (OrderedCollection with: anEntity ).
]

{ #category : #configuration }
MalHierarchicalGraph >> nodeClass [
	^ MalHgNode.
]

{ #category : #accessing }
MalHierarchicalGraph >> nodeModels [
	"Returns a Collection of all wrapped models in the nodes of this HiGraph."
	^ nodes keys
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodeWrapping: aModel [
	"Returns the node wrapping the given model or nil if such a node does not exists in the graph."
	^ self nodeWrapping: aModel ifAbsent: [ nil ].
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodeWrapping: aModel ifAbsent: aBlock [
	"Returns the node wrapping the given model."
	^ nodes at: aModel ifAbsent: aBlock .
]

{ #category : #accessing }
MalHierarchicalGraph >> nodes [
	"Returns an Array of all nodes in this hiGraph."
	^ nodes values
]

{ #category : #api }
MalHierarchicalGraph >> nodes: aCollection [
	"Adds base entites (can be root or leaf nodes) to the graph from which we will start building the complete graph.
	This has to be done before calling blockToGetChildren or blockToGetParent."
	
	"Adding given entites as MalHgNode to the nodesDict."
	aCollection do: [ :anEntity | 
		nodes at: anEntity put: (MalHgNode in: self with: anEntity).
	]
]

{ #category : #accessing }
MalHierarchicalGraph >> nodesDict [
	"Returns a Dictionary with keys: models and values: nodes"
	^ nodes
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodesDownFromLevel: aLevel [
	"Returns a Collection of all nodes on given and on deeper levels (deeper meaning farer away from the root nodes)."
	| result currLevel |
	
	result := OrderedCollection new.
	currLevel := aLevel.
	
	[ levels includesKey: currLevel ] whileTrue: [ 
		result addAll: (levels at: currLevel).
		currLevel := currLevel + 1.
	].
	
	 ^ result.
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodesFor: aCollectionOfModels [
	"Returns the nodes wrapping the given models or an empty collection if no such nodes could be found in the graph."
	^ self nodesWrapping: aCollectionOfModels
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodesOnLevel: aLevel [
	"Returns a collection of all nodes on a certain level (a cross cut of the higraph)"
	^ levels at: aLevel ifAbsent: [ OrderedCollection new ].
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodesUpFromLevel: aLevel [
	"Returns a collection of all nodes on given and on higher levels (higher means nearer to the root node"
	| result currLevel |
	result := OrderedCollection new.
	currLevel := aLevel.
	[ aLevel >= 0 ] whileTrue: [ 
		result addAll: (levels at: currLevel).
		currLevel := currLevel - 1.
	].
	
	 ^ result.
]

{ #category : #enumerating }
MalHierarchicalGraph >> nodesWrapping: aModelCollection [
	"Returns the nodes wrapping the given models or an empty collection if no such nodes could be found in the graph."
	| result |
	result := OrderedCollection new.
	
	nodes do: [ :node | 
		aModelCollection do: [ :model | (node model = model) ifTrue: [ result add: node ]].
	].

	^ result.
]

{ #category : #printing }
MalHierarchicalGraph >> printOn: aStream [
	aStream
		nextPutAll: 'HiGraph: (n: ';
		nextPutAll: self nodesDict size printString;
		nextPutAll: ', e: ';
		nextPutAll: self edges size printString;
		nextPutAll: ')'.
]

{ #category : #private }
MalHierarchicalGraph >> privateEdges: aCollection [
	self edges: aCollection.
]

{ #category : #private }
MalHierarchicalGraph >> privateNodes: aCollection [
	ShouldNotImplement signal.
]

{ #category : #api }
MalHierarchicalGraph >> propagateEdges [
	"Propagates relationships up in the hiGraph from the leaf nodes."
	self propagateEdges: OrderedCollection new.
]

{ #category : #api }
MalHierarchicalGraph >> propagateEdges: classCollection [
	"Propagates relationships up in the hiGraph from the leaf nodes.
	If a collection with classes is provied, only relationships between given classes are propagated."
	| nodesToProcess propagatedRelationship srcNode dstNode srcAncestry dstAncestry  srcAncestorNodeIsAllowedClass dstAncestorNodeIsAllowedClass |
	
	nodesToProcess := Stack new.
	nodesToProcess addAll: self nodes.

	[nodesToProcess notEmpty] whileTrue: [
		srcNode := nodesToProcess pop.

		"Only check non-root nodes."
		(srcNode isRootNode) ifFalse: [
		
			"If there are outgoing relationships from this node..."
			(srcNode outgoing notEmpty) 
				ifTrue: [
					
					"Go through all original relations."
					srcNode outgoingNotPropagated do: [ :outgoingRelationship |

						"Get destination node of relationship"
						dstNode := outgoingRelationship to.
						
						srcAncestry := LinkedList new.
						dstAncestry := LinkedList new.

						"Initialize ancestries with src and dest nodes."
						srcAncestry add: srcNode.
						dstAncestry add: dstNode.
	
						"Have to bring ancestries to the same level."
						[srcAncestry last level = dstAncestry last level] whileFalse: [
							srcAncestry last level > dstAncestry last level ifTrue: [
								srcAncestry add: (srcAncestry last parent).
							]
							ifFalse: [
								dstAncestry add: (dstAncestry last parent).
							].
						].
					
						"Fill up ancestry chains by searching for either common ancestor or two separate parents that are root nodes."
						[(srcAncestry last parent == dstAncestry last parent) 
						or: 
						((srcAncestry last isRootNode) or: (dstAncestry last isRootNode))]
						whileFalse: [
							srcAncestry add: (srcAncestry last parent).
							dstAncestry add: (dstAncestry last parent).
						].

						"Now add outgoing relations from source node and its ancestry to destination node and its ancestry."
						srcAncestry do: [ :srcAncestorNode |
							
							"Relationships from all source ancestry nodes to all destination ancestry nodes."
							dstAncestry do: [ :dstAncestorNode |
								
								"Reset class restrictions. Assuming not allowed."
								srcAncestorNodeIsAllowedClass := false.
								dstAncestorNodeIsAllowedClass := false.
									
								"Add all connections in the ancestries as new relations. Except :
								 - the original relation
								 - If they are the same node
								 - if a given class restriction is not satisfied"
								((srcAncestorNode = srcNode and: (dstAncestorNode = dstNode)) 
								or: 
								(srcAncestorNode = dstAncestorNode)) 
								ifFalse: [

									classCollection isEmpty ifTrue: [
										srcAncestorNodeIsAllowedClass := true.
										dstAncestorNodeIsAllowedClass := true.
									] ifFalse: [
										"Are the classes of both nodes in the collection of allowed classes?"
										classCollection do: [ :class |
	
											srcAncestorNode model class == class ifTrue: [srcAncestorNodeIsAllowedClass := true ].
											dstAncestorNode model class == class ifTrue: [dstAncestorNodeIsAllowedClass := true ].
										].
									].
								
									"Only add the propoagated relationships if it satisfied the class restrictions."
									(srcAncestorNodeIsAllowedClass and: dstAncestorNodeIsAllowedClass) ifTrue: [
										
										"And finally, create and add a new propagated relationship."
										propagatedRelationship := MalHgPropagatedEdge 
											with: outgoingRelationship model 
											from: srcAncestorNode 
											to: dstAncestorNode.
										edges add: propagatedRelationship.
										srcAncestorNode addOutgoing: propagatedRelationship.
										dstAncestorNode addIncoming: propagatedRelationship.
									].
								].
							].
						].
					].
				].
			].
		].
]

{ #category : #resetting }
MalHierarchicalGraph >> reset [
	self resetNodes.
]

{ #category : #resetting }
MalHierarchicalGraph >> resetEdges [
	"Collection of all relationships in the graph."
	edges := OrderedCollection new. 
	
	"Remove edge reference form nodes."
	self nodes ifNotEmpty: [ 
		self nodes do: [ :n | n resetEdges ].
	].
]

{ #category : #resetting }
MalHierarchicalGraph >> resetNodes [
	"dict keys: models, values: nodes"
	nodes := Dictionary new.
	
	"dict keys: level, values: all nodes on that level as a Collection."
	levels := Dictionary new.
	
	"If nodes are reset, we have to reset edges as well, since there can't be edges without nodes."
	self resetEdges.
]

{ #category : #api }
MalHierarchicalGraph >> root: entity [
	self node: entity.
]

{ #category : #enumerating }
MalHierarchicalGraph >> rootNodes [
	"Returns a Collection of all root nodes of this hiGraph."
	^ levels at: 0 ifAbsentPut: [ OrderedCollection new ].
]

{ #category : #enumerating }
MalHierarchicalGraph >> searchForModelsNamed: aSearchString [
	| matcher |
	"Returns a collection of nodes whose model names match the given RegEx string"
	matcher := RxMatcher forString: aSearchString.
	^ self nodes select: [ :node | matcher search: node model name ].
]

{ #category : #enumerating }
MalHierarchicalGraph >> searchForModelsNamed: aSearchString onLevel: level [
	| matcher |
	"Returns a collection of nodes on given level whose model names match the given RegEx string"
	matcher := RxMatcher forString: aSearchString.
	^ (self level: level) select: [ :node | matcher search: node model name ].
]

{ #category : #building }
MalHierarchicalGraph >> setChildrenOfNode: aNode builder: buildingBlock [
	"Gets children of given node via buildingBlock and sets them.
	Returns a collection with found children or an empty one if no children were found."
	| children currentLevel childrenEntities childNode |

	self assert: (self rootNodes notEmpty) description: 'There must be at least one root node set before calling this method.'.
		
	"Get children entities via blockToGetChildren"
	childrenEntities := buildingBlock value: aNode model.
	children := OrderedCollection new.

	"If the entity has no children it is a leaf and we return an empty collection."
	(childrenEntities isNil)
		ifTrue: [ ^ children. ]
		
		"Else we add found children to the graph."
		ifFalse: [
			
			currentLevel := aNode level.

			"Go through all found children..."
			childrenEntities do: [ :childEntity | 
		
				"Check if we already have the child stored in the graph, if yes retrieve it, else store it."
				(nodes includesKey: childEntity) 
				ifTrue: [
					childNode := nodes at: childEntity.
				]
				"Else ceate new child node."
				ifFalse: [
					childNode := MalHgNode in: self with: childEntity level: currentLevel + 1.
					nodes at: childEntity put: childNode.
				].
			
				"Add given node as parent to child."
				childNode parent: aNode.
			
				"Add child to given node."
				aNode addChild: childNode.
			
				"Add node to found children."
				children add: childNode.
			].
		
			"Need to add children to correct level in the higraph."
			levels at: (currentLevel + 1)
				ifPresent: [ :collection | collection addAll: children ] 
				ifAbsent: [ levels at: (currentLevel + 1) put: children ].
	
			^ children.
		].
]

{ #category : #building }
MalHierarchicalGraph >> setLevels [
	"Goes through all nodes in the graph and sets their levels relative to the root (level 0)"
	self rootNodes do: [ :rootNode |
		rootNode level: 0.
		rootNode setLevels. "Sets levels on all his children"
	].
]

{ #category : #building }
MalHierarchicalGraph >> setParentOfNode: aNode builder: buildingBlock [
	"Gets parent of given node via blockToGetParent, and sets it - or adds node to root nodes, if there is no parent.
	Returns parent if one was found, nil else"
	| parentNode parentEntity rootNodes |

	"Get parent entity through blockToGetParent"
	parentEntity := buildingBlock value: aNode model.

	"If the entity has no parent, it is a rootNode"
	(parentEntity isNil) 
	ifTrue: [
		rootNodes := levels at: 0 ifAbsentPut: [ OrderedCollection new ].
		(rootNodes includes: aNode) ifFalse: [ rootNodes add: aNode ].
		^ nil.
	]
	ifFalse: [
		
		"Check if we already have the parent stored in the graph, if yes retrieve it, else store it."
		(nodes includesKey: parentEntity) 
			ifTrue: [
				parentNode := nodes at: parentEntity.
			]
			ifFalse: [
				parentNode := MalHgNode in: self with: parentEntity.
				nodes at: parentEntity put: parentNode.
			].
			
		"Add current node as child to parent"
		parentNode addChild: aNode.
			
		"Add parent to current node as parent"
		aNode parent: parentNode.

		"Return parent."
		^ parentNode.
	].
]

{ #category : #api }
MalHierarchicalGraph >> topDown: howToGetChildren [
	"Build the hiGraph top down from given root nodes."
	self containment: howToGetChildren.
]
