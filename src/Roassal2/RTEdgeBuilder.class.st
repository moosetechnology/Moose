"
RTEdgeBuilder offers an API to easily build edges.

Here is an example:
[ [ [ 
	| v es |
	v := RTView new.

	es := (RTEllipse new size: 20) elementsOn: (1 to: 20).
	v addAll: es.

	RTEdgeBuilder new
		view: v;
		objects: (1 to: 20);
		connectFrom: [ :value | value // 2 ].

	es @ RTPopup @ RTDraggable.
	RTTreeLayout on: es.
	v ] ] ]
"
Class {
	#name : #RTEdgeBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'allowRepetition',
		'fromElements',
		'toElements',
		'shouldMoveBehind',
		'shouldNotBeUsedInLayout',
		'createdEdges',
		'viewHasBeenManuallySet',
		'actions'
	],
	#category : #'Roassal2-Builder-Common'
}

{ #category : #'public repetition' }
RTEdgeBuilder >> allowRepetition [
	allowRepetition := true
]

{ #category : #public }
RTEdgeBuilder >> connectFrom: aBlockOrASymbol [
	^ self connectFrom: aBlockOrASymbol to: [ :each | each ]
]

{ #category : #public }
RTEdgeBuilder >> connectFrom: aFromBlock to: aBlockOrASymbol [
	| toElement fromElement |
	self resetCreatedEdges.
	self fromElements copy
		do: [ :e | 
			fromElement := self fromElements elementFromModel: (aFromBlock rtValue: e model).
			toElement := self toElements elementFromModel: (aBlockOrASymbol rtValue: e model).
			toElement ifNotNil: [ self createEdgeIfNecessaryFrom: fromElement to: toElement ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #public }
RTEdgeBuilder >> connectFrom: aFromBlock toAll: aBlockOrASymbol [

	| fromElement tes |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		fromElement := self fromElements elementFromModel: (aFromBlock rtValue: e model).
		tes := self toElements elementsFromModels: (aBlockOrASymbol rtValue: e model).
		tes ifNotNil: [ 
			tes do: [ :toE | 
				self createEdgeIfNecessaryFrom: fromElement to: toE ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges 
]

{ #category : #public }
RTEdgeBuilder >> connectFromAll: aFromBlockOrSymbol [
	^ self connectFromAll: aFromBlockOrSymbol to: [ :each | each ]

]

{ #category : #public }
RTEdgeBuilder >> connectFromAll: aFromBlockOrSymbol to: aBlockOrASymbol [

	| toElement tfromElements |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		tfromElements := self fromElements elementsFromModels: (aFromBlockOrSymbol rtValue: e model). 
		toElement := self toElements elementFromModel: (aBlockOrASymbol rtValue: e model).
		tfromElements ifNotNil: [ 
			tfromElements do: [ :fromElement | 
				self createEdgeIfNecessaryFrom: fromElement to: toElement ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #public }
RTEdgeBuilder >> connectTo: aBlockOrASymbol [
	^ self connectFrom: [ :each | each ] to: aBlockOrASymbol
]

{ #category : #public }
RTEdgeBuilder >> connectToAll: aBlockOrASymbol [
	"Should this method use connectFrom:ToAll: ?????"
	| tmptoElements |
	self resetCreatedEdges.
	self fromElements copy do: [ :e | 
		tmptoElements := self toElements elementsFromModels: (aBlockOrASymbol rtValue: e model).
		tmptoElements ifNotNil: [ 
			tmptoElements do: [ :toE | 
				self createEdgeIfNecessaryFrom: e to: toE ] ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #'private - utility' }
RTEdgeBuilder >> createEdgeIfNecessaryFrom: fromElement to: toElement [
	(self shouldCreateEdgeFrom: fromElement to: toElement)
		ifTrue: [ createdEdges add: (self edgeFrom: fromElement to: toElement) ]
]

{ #category : #'private - utility' }
RTEdgeBuilder >> edgeFrom: source to: target [ 
	"source and target are elements"
	| edge |
	edge := super edgeFrom: source to: target.
	shouldNotBeUsedInLayout ifFalse: [ edge notUseInLayout ].
	self processEdge: edge.
	^ edge
]

{ #category : #accessing }
RTEdgeBuilder >> elements: someElements [
	self toElements: someElements.
	self fromElements: someElements
]

{ #category : #accessing }
RTEdgeBuilder >> fromElements [
	fromElements ifNil: [ ^ self view elements ].
	^ fromElements
]

{ #category : #accessing }
RTEdgeBuilder >> fromElements: someElements [
	fromElements := someElements
]

{ #category : #accessing }
RTEdgeBuilder >> fromObjects [
	"Return the list of objects considered as targets for the edges"
	^ self fromElements collect: #model
]

{ #category : #accessing }
RTEdgeBuilder >> fromObjects: someObjectsOrABlock [
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	 
	(someObjectsOrABlock isCollection and: [ someObjectsOrABlock isSymbol not ])
		ifTrue: [ self fromElements: (view elementsFromModels: someObjectsOrABlock) ]
		ifFalse: [ self fromElements: (view elements select: [ :el | someObjectsOrABlock rtValue: el model ]) ]
]

{ #category : #'public - configuration' }
RTEdgeBuilder >> highlightable [
	"Make the edges highlightable.
	Here is an example:
	
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b

	"
	actions add: [ :edge | 
		edge @ RTHighlightable ] 
]

{ #category : #initialization }
RTEdgeBuilder >> initialize [
	super initialize.
	self noRepetition.
	shouldMoveBehind := false.
	shouldNotBeUsedInLayout := true.
	
	"The view has to be explicitely set by the end-user"
	viewHasBeenManuallySet := false.
	
	actions := OrderedCollection new
]

{ #category : #accessing }
RTEdgeBuilder >> label: twoArgBlock [
	"Method useful to label edges. The argument is a two arg block that accept the starting object model and the ending object model. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		label: [ :from :to | from asString, '>', to asString ];
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	^ self label: twoArgBlock fontSize: TRLabelShape defaultFontSize
]

{ #category : #accessing }
RTEdgeBuilder >> label: twoArgBlock fontSize: fontSizeAsBlockOrValue [
	"Method useful to label edges. The argument is a two arg block that accept the starting object model and the ending object model. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		label: [ :from :to | from asString, '>', to asString ] fontSize: 5;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	actions add: [ :edge | 
		| lbl lblEl |
		lbl := twoArgBlock value: edge from model value: edge to model.
		lblEl := RTLabel new height: fontSizeAsBlockOrValue; elementOn: lbl.
		view add: lblEl.
		TRConstraint stick: lblEl between: edge from and: edge to ] 
]

{ #category : #accessing }
RTEdgeBuilder >> labelElement: oneArgBlock [
	"Method useful to label edges. The argument is a one arg block that accept the edge. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		labelElement: [ :anEdge | anEdge from model asString, '>', anEdge to model asString ];
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	^ self labelElement: oneArgBlock fontSize: TRLabelShape defaultFontSize
]

{ #category : #accessing }
RTEdgeBuilder >> labelElement: oneArgBlock fontSize: fontSizeAsBlockOrValue [
	"Method useful to label edges. The argument is a one arg block that accept the edge. The block has to return a String that will be used to label the edge.
	
	Here is an example:
	| b edges |
	b := RTMondrian new.
	b shape circle size: 10; color: Color red.
	b nodes: (1 to: 20).

	b edges 
		moveBehind; 
		highlightable;
		labelElement: [ :anEdge | anEdge from model asString, '>', anEdge to model asString ] fontSize: 5;
		connectFrom: [ :v | v // 2 ].

	b layout cluster.
	b
	"
	actions add: [ :edge | 
		| lbl lblEl |
		lbl := oneArgBlock value: edge.
		lblEl := RTLabel new height: fontSizeAsBlockOrValue; elementOn: lbl.
		view add: lblEl.
		TRConstraint stick: lblEl between: edge from and: edge to ] 
]

{ #category : #'private - utility' }
RTEdgeBuilder >> linkElements: someElements [
	"Link the first element to the second, the second to the third and so on"
	| head |
	head := someElements first.
	someElements allButFirst do: [ :e |
		self edgeFrom: head to: e.
		head := e.
		]
]

{ #category : #accessing }
RTEdgeBuilder >> moveBehind [
	"Set the builder as such that edge that are built and added in the view _behind_ the extremities of each edges"
	shouldMoveBehind := true
]

{ #category : #'private - utility' }
RTEdgeBuilder >> moveBehindIfNecessary: someEdges [
	shouldMoveBehind ifFalse: [ ^ self ].
	someEdges pushBack
]

{ #category : #initialization }
RTEdgeBuilder >> noRepetition [
	"
	Avoid having more than one edge between two elements

	b := RTMondrian new.
	b nodes: (1 to: 3).
	b shape line
		color: Color red trans;
		withVerticallAttachPoint.
	b edges noRepetition; useAssociations: { 1 -> 2 . 2 -> 3 . 1 -> 2}.
	b layout grid.
	b build.
	b view numberOfEdges
	"
	allowRepetition := false
]

{ #category : #'public - configuration' }
RTEdgeBuilder >> notUseInLayout [
	shouldNotBeUsedInLayout := false
]

{ #category : #accessing }
RTEdgeBuilder >> object: anObject [
	^ self objects: (Array with: anObject)
]

{ #category : #accessing }
RTEdgeBuilder >> objects: someObjectsOrABlock [
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	self toObjects: someObjectsOrABlock.
	self fromObjects: someObjectsOrABlock.
]

{ #category : #'private - utility' }
RTEdgeBuilder >> processEdge: anEdge [
	actions do: [ :action | action value: anEdge ]
]

{ #category : #'private - utility' }
RTEdgeBuilder >> resetCreatedEdges [
	createdEdges := RTGroup new
]

{ #category : #'public repetition' }
RTEdgeBuilder >> shouldAllowRepetition [
	^ allowRepetition
]

{ #category : #testing }
RTEdgeBuilder >> shouldCreateEdgeFrom: fromElement to: toElement [
	"Return true if an edge has to be created"
	fromElement == toElement ifTrue: [ ^ false ].
	(fromElement isNil or: [ toElement isNil ]) ifTrue: [ ^ false ].
	allowRepetition ifFalse: [ ^ fromElement outgoingEdges noneSatisfy: [ :edge | edge to == toElement ] ].
	^ true
]

{ #category : #'public using source' }
RTEdgeBuilder >> source: objects connectFrom: fromblock to: toBlock [
	"Define some edges from objects that are not part of the view
	
nbOfNodes := 40.
nbOfRandomEdges := 40.

nodes := 1 to: nbOfNodes.
edges := (1 to: nbOfRandomEdges) 
				collect: [ :notUsed | nodes atRandom -> nodes atRandom ].

b := RTMondrian new.

b shape circle color: (Color black alpha: 0.5).
b nodes: nodes.

b shape line color: (Color gray alpha: 0.3).
b edges
	source: edges connectFrom: #key to: #value.

b layout force.
b
	"
	| assocs allObjects |
	self assert: [ objects notNil ] description: 'Cannot provide a nil value as the source'.
	self assert: [ objects isCollection ] description: 'Need to provide a collection as the source'.
	allObjects := Set new.
	
	assocs := objects collect: [ :o | 
		| f t |
		f := fromblock rtValue: o.
		t := toBlock rtValue: o.
		allObjects add: f; add: t.
		f -> t ].
	self objects: allObjects asArray.
	^ self useAssociations: assocs
]

{ #category : #'public using source' }
RTEdgeBuilder >> source: objects connectFrom: fromblock toAll: toBlock [
	"Define some edges from objects that are not part of the view
	
nbOfNodes := 40.
nbOfRandomEdges := 40.

nodes := 1 to: nbOfNodes.
edges := (1 to: nbOfRandomEdges) 
				collect: [ :notUsed | nodes atRandom -> {nodes atRandom . nodes atRandom} ].

b := RTMondrian new.

b shape circle color: (Color black alpha: 0.5).
b nodes: nodes.

b shape line color: (Color gray alpha: 0.3).
b edges
	source: edges connectFrom: #key toAll: #value.

b layout force.
b
	"
	| assocs allObjects |
	allObjects := Set new.

	assocs := objects flatCollect: [ :o | 
		| cc |
		cc := toBlock rtValue: o.
		cc collect: [ :ccc | 
			| t |
			t := fromblock rtValue: o.
			allObjects add: t; add: ccc.
			t -> ccc ] ].
	self objects: allObjects asArray.
	^ self useAssociations: assocs
]

{ #category : #'public using source' }
RTEdgeBuilder >> source: objects connectFromAll: fromBlock to: toBlock [
	"Define some edges from objects that are not part of the view
	
nbOfNodes := 40.
nbOfRandomEdges := 40.

nodes := 1 to: nbOfNodes.
edges := (1 to: nbOfRandomEdges) 
				collect: [ :notUsed | {nodes atRandom . nodes atRandom} -> nodes atRandom ].

b := RTMondrian new.

b shape circle color: (Color black alpha: 0.5).
b nodes: nodes.

b shape line color: (Color gray alpha: 0.3).
b edges
	source: edges connectFromAll: #key to: #value.

b layout force.
b
	"
	| assocs allObjects |
	allObjects := Set new.

	assocs := objects flatCollect: [ :o | 
		| cc |
		cc := fromBlock rtValue: o.
		cc collect: [ :ccc | 
			| t |
			t := toBlock rtValue: o.
			allObjects add: ccc; add: t.
			ccc -> t ] ].
	self objects: allObjects asArray.
	^ self useAssociations: assocs
]

{ #category : #accessing }
RTEdgeBuilder >> toElements [
	toElements ifNil: [ ^ self view elements ].
	^ toElements
]

{ #category : #accessing }
RTEdgeBuilder >> toElements: someElements [
	toElements := someElements
]

{ #category : #accessing }
RTEdgeBuilder >> toObject: anObject [
	^ self toObjects: (Array with: anObject)
]

{ #category : #accessing }
RTEdgeBuilder >> toObjects [
	"Return the list of objects considered as sources for the edges"
	^ self toElements collect: #model
]

{ #category : #accessing }
RTEdgeBuilder >> toObjects: someObjectsOrABlock [
	"Identify the elements we are considering for the edge building process. Note that the view has to be set beforehand."
	self assert: [ viewHasBeenManuallySet ] description: 'A view has to be set, please use #view:'.
	 
	(someObjectsOrABlock isCollection and: [ someObjectsOrABlock isSymbol not ])
		ifTrue: [ self toElements: (view elementsFromModels: someObjectsOrABlock) ]
		ifFalse: [ self toElements: (view elements select: [ :el | someObjectsOrABlock rtValue: el model ]) ]
]

{ #category : #'public associations' }
RTEdgeBuilder >> useAssociation: assoc [
	"assoc have to be between model objects"
	self assert: [ assoc isKindOf: Association ] description: 'Please, provide an association instead'.
	self useAssociations: (Array with: assoc)
]

{ #category : #'public associations' }
RTEdgeBuilder >> useAssociations: associations [
	"associations have to be between model objects"
	
	"
	Here is an example
	
b := RTMondrian new.
b nodes: (1 to: 3).
b shape line
	color: Color red trans;
	withVerticallAttachPoint.
b edges noRepetition; useAssociations: { 1 -> 2 . 2 -> 3 . 1 -> 2}.
b layout grid.
b 

	"
	
	| fromElement toElement |
	createdEdges := RTGroup new.
	associations do: [ :assoc |
		fromElement := self fromElements elementFromModel: assoc key.
		toElement := self toElements elementFromModel: assoc value.
		(fromElement notNil and: [ toElement notNil ])
			ifTrue: [ self createEdgeIfNecessaryFrom: fromElement to: toElement ] ].
	self moveBehindIfNecessary: createdEdges.
	^ createdEdges
]

{ #category : #'public associations' }
RTEdgeBuilder >> useElementAssociations: associationsBetweenElements [
	associationsBetweenElements do: [ :assoc |
		self edgeFrom: assoc key to: assoc value ]
]

{ #category : #accessing }
RTEdgeBuilder >> view: aView [
	viewHasBeenManuallySet := true.
	super view: aView
]
