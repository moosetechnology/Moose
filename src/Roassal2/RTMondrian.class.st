"
A RTMondrian describes Mondrian, a domain-specific language that is adapted to represent polymetric views. More info about polymetric views in ""Michele Lanza and Stéphane Ducasse. Polymetric Views—A Lightweight Visual Approach to Reverse Engineering. In Transactions on Software Engineering (TSE) 29(9) p. 782—795, September 2003.""

RTMondrian maintains a stack of frame, instances of RTMondrianFrame

Instance Variables
	currentFrame:		<RTMondrianFrame>
	edgeBuilder:		<RTEdgeBuilder>
	metricNormalizer:		<RTMetricNormalizer>
	rootFrame:		<RTMondrianFrame>

currentFrame
	- xxxxx

edgeBuilder
	- xxxxx

metricNormalizer
	- xxxxx

rootFrame
	- xxxxx

"
Class {
	#name : #RTMondrian,
	#superclass : #RTBuilder,
	#instVars : [
		'currentFrame',
		'edgeBuilder',
		'rootFrame',
		'recurrentBlock'
	],
	#category : #'Roassal2-Builder-Mondrian'
}

{ #category : #public }
RTMondrian >> applyLayout [
	layoutBuilder setUpElements: self topElements
]

{ #category : #benchmarking }
RTMondrian >> benchmark [

"

[ 100 timesRepeat: [| b | b := RTMondrianViewBuilder new.
b shape rectangle
	width: [ :c | c numberOfVariables * 4];
	height: #numberOfMethods;
	linearFillColor: #numberOfLinesOfCode within: RTShape withAllSubclasses.
b nodes: RTShape withAllSubclasses.
b edgesFrom: #superclass.
b treeLayout.
b build] ] timeToRun

 0:00:00:00.393"

"
[ 100 timesRepeat: [|b| b := RTMondrian new.
b shape rectangle
	width: [ :c | c numberOfVariables * 4];
	height: #numberOfMethods;
	linearFillColor: #numberOfLinesOfCode within: RTShape withAllSubclasses.
b nodes: RTShape withAllSubclasses.
b edges connectFrom: #superclass.
b layout tree.
b build ] ] timeToRun
 0:00:00:00.393"
]

{ #category : #benchmarking }
RTMondrian >> benchmark02 [

"

[ 100 timesRepeat: [| b | b := RTMondrianViewBuilder new.
b nodes: RTShape withAllSubclasses forEach: [ :c | b nodes: c methods ].
b edgesFrom: #superclass.
b treeLayout.
b build] ] timeToRun

 0:00:00:02.804"

"
[ 100 timesRepeat: [|b| b := RTMondrian new.
b nodes: RTShape withAllSubclasses forEach: [ :c | b nodes: c methods ].
b edges connectFrom: #superclass.
b layout tree.
b build ] ] timeToRun
 0:00:00:01.414"
]

{ #category : #public }
RTMondrian >> build [
	super build.
	self applyLayout 
]

{ #category : #'deprecated - compatibility layer' }
RTMondrian >> circleLayout [
	^ self layout circle
]

{ #category : #hooks }
RTMondrian >> computeColorForNode [
	^ Color gray: ((5 - (self currentDepth + 1 min: 5)) / 5.0) asFloat
]

{ #category : #hooks }
RTMondrian >> createInteractionBuilder [
	^ RTInteractionBuilder new popup; draggable; yourself
]

{ #category : #factories }
RTMondrian >> createLayoutBuilder [
	| newLayoutBuilder |
	newLayoutBuilder := RTLayoutBuilder new.
	newLayoutBuilder horizontalLine.
	^ newLayoutBuilder
]

{ #category : #factories }
RTMondrian >> createNewFrame [
	^ RTMondrianFrame new
]

{ #category : #hooks }
RTMondrian >> createShapeBuilder [
	| sb |
	sb := RTBoundedShapeBuilder new.
	sb shapeInitializer:
		[ :aShape | sb color: self computeColorForNode ].
	^ sb
]

{ #category : #hooks }
RTMondrian >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #accessing }
RTMondrian >> currentDepth [
	^ self currentFrame depth
]

{ #category : #accessing }
RTMondrian >> currentElements [
	^ self currentFrame elements
]

{ #category : #accessing }
RTMondrian >> currentFrame [
	^ currentFrame
]

{ #category : #accessing }
RTMondrian >> edges [
	edgeBuilder 
		elements: self currentElements; 
		view: view;
		shapeBuilder: shapeBuilder.
	^ edgeBuilder
]

{ #category : #'deprecated - compatibility layer' }
RTMondrian >> edges: objects from: fromBlock to: toBlock [
	^ self edges
			objects: objects;
			connectFrom: fromBlock to: toBlock
		
]

{ #category : #'deprecated - compatibility layer' }
RTMondrian >> edgesFrom: aBlock [
	^ self edges connectFrom: aBlock
]

{ #category : #'deprecated - compatibility layer' }
RTMondrian >> flowLayout [
	^ self layout flow
]

{ #category : #initialization }
RTMondrian >> initialize [
	rootFrame := self createNewFrame.
	currentFrame := rootFrame.
	super initialize.
	self resetLayoutBuilder.
	self resetEdgeBuilder
]

{ #category : #accessing }
RTMondrian >> layout [
	^ layoutBuilder 
]

{ #category : #hooks }
RTMondrian >> metricNormalizerClass [
	^ RTMetricNormalizer
]

{ #category : #'public - nodes' }
RTMondrian >> node: anObject [
	"Add a new node represengint an object to the view
	
	For example:
	b := RTMondrian new.
	b node: 10.
	b node: 20.
	b open
	"
	^ (self nodes: (Array with: anObject)) first
]

{ #category : #'public - nodes' }
RTMondrian >> node: anObject forIt: aBlock [
	"Add a new node represengint an object to the view. The node is a container for other objects.
	
	For example:
	b := RTMondrian new.
	b node: 10 forIt: [ b nodes: (1 to: 5) ].
	b node: 20 forIt: [ b nodes: (1 to: 5) ].
	b open
	"
	^ (self nodes: (Array with: anObject) forEach: [ :each | aBlock value ]) first
]

{ #category : #'public - nodes' }
RTMondrian >> nodes: objects [
	"Add a new node represengint an object to the view. The node is a container for other objects.
	
	For example:
	b := RTMondrian new.
	b nodes: (1 to: 10).
	b layout force.
	b open
	
	
	Another example:
	b := RTMondrian new.
	b shape box size: #numberOfMethods.
	b nodes: Collection withAllSubclasses.
	b layout flow.
	b open
	
	Another example:
	b := RTMondrian new.
	b shape box size: #numberOfMethods.
	b nodes: Collection withAllSubclasses.
	b edges connectFrom: #superclass.
	b normalizer 
		normalizeSize: #numberOfMethods;
		normalizeColor: #numberOfMethods.
	b layout cluster.
	b open
	"
	
	| els |
	self assert: [ objects isCollection ] description: 'You need to provide a collection to #nodes:'.
	els := self elementsOn: objects.
	self currentFrame addElements: els.
	view addAll: els.
	self resetShapeBuilder.
	self resetLayoutBuilder.
	self resetInteraction.
	^ els
]

{ #category : #'public - nodes' }
RTMondrian >> nodes: objects forEach: aOneArgBlock [
	"Add new nodes representing for each object to the view. Each node is a container for other objects.
	
	For example:
	b := RTMondrian new.
	b nodes: (1 to: 10) forEach: [ :valueBetween1And10 | 
		b nodes: (1 to: valueBetween1And10).
		b layout grid ].
	b layout grid.
	b open

	
	Another example:
	b := RTMondrian new.
	b shape box size: #numberOfMethods.
	b nodes: Collection withAllSubclasses forEach: [ :cls |
		b nodes: cls methods.
		b layout grid. ].
	b edges connectFrom: #superclass.
	b layout tree.
	b open
	"
	| result |
	result := self nodes: objects.
	
	result do: [ :element | 
		self pushNewFrame.
		self resetShapeBuilder.
		self resetLayoutBuilder.
		self resetEdgeBuilder.
		self resetInteraction.
			
		aOneArgBlock rtValue: element model.
		RTNest new
			layout: layoutBuilder layout;
			on: element nest: self currentFrame elements.
		self popFrame.
	].
	self resetShapeBuilder.
	self resetLayoutBuilder.
	self resetInteraction.
	^ result
]

{ #category : #stack }
RTMondrian >> numberOfAllFrames [
	"Return the number of all the frame accessible within the builder"
	^ rootFrame numberOfAllFrames
]

{ #category : #stack }
RTMondrian >> popFrame [
	currentFrame := currentFrame parentFrame
]

{ #category : #stack }
RTMondrian >> pushFrame: aFrame [
	currentFrame pushFrame: aFrame.
	currentFrame := aFrame.
	^ aFrame
]

{ #category : #stack }
RTMondrian >> pushNewFrame [
	^ self pushFrame: self createNewFrame
]

{ #category : #'public - recursive nodes' }
RTMondrian >> recurTo: anObject [
	"This method is used to recur"
	self assert: [ recurrentBlock notNil ] description: 'The #recurTo: message has to be called within a recursiveNodes:forEach: call'.
	recurrentBlock value: anObject
]

{ #category : #'public - recursive nodes' }
RTMondrian >> recursiveNodes: aDataStructure forEach: aOneArgBlock [
	"This method enables one to create recursive nested nodes"
	
	"
	Here is an example:

-=-=-=-=	
	allElements := #(((1 2 (39 ) 2 )) 3).
	b := RTMondrian new.
	b recursiveNodes: allElements forEach: [ :elements |
	    b shape rectangle.
	    b nodes: elements forEach: [ :el |
	        el isArray ifTrue: [ b recurTo: el ]
	    ] ].
	b
-=-=-=-=

	Another example:
-=-=-=-=
    root := '/Users/alexandrebergel/Documents' asFileReference.
    b := RTMondrian new.
    b
        recursiveNodes: root
        forEach: [ :aFileReference | 
            b shape box if: [ :aFile | aFile basename endsWith: '.pdf' ] color: Color green.
            aFileReference isDirectory
                ifTrue: [ b nodes: aFileReference children forEach: [ :aFileRef | b recurTo: aFileRef ] ]
                ifFalse: [ b node: aFileReference ].
            b layout grid ].
    b
-=-=-=-=
	"
	
	recurrentBlock := aOneArgBlock.
	aOneArgBlock value: aDataStructure.
	recurrentBlock := nil
]

{ #category : #initialization }
RTMondrian >> resetEdgeBuilder [
	edgeBuilder := RTEdgeBuilder new
]

{ #category : #initialization }
RTMondrian >> resetLayoutBuilder [
	layoutBuilder := self createLayoutBuilder
]

{ #category : #initialization }
RTMondrian >> resetShapeBuilder [
	shapeBuilder := self createShapeBuilder
]

{ #category : #accessing }
RTMondrian >> rootFrame [
	^ rootFrame
]

{ #category : #stack }
RTMondrian >> topElements [
	^ rootFrame elements
]

{ #category : #'deprecated - compatibility layer' }
RTMondrian >> treeLayout [
	^ self layout tree
]
