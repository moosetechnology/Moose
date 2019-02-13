"
A ROExploraBuilder is xxxxxxxxx.

Instance Variables
	layout:		<Object>
	lineShape:		<Object>
	nextId:		<Object>
	nodeListeners:		<Object>
	nodeProperties:		<Object>
	nodes:		<Object>
	popUp:		<Object>
	view:		<Object>

layout
	- xxxxx

lineShape
	- xxxxx

nextId
	- xxxxx

nodeListeners
	- xxxxx

nodeProperties
	- xxxxx

nodes
	- xxxxx

popUp
	- xxxxx

view
	- xxxxx

"
Class {
	#name : #RTExploraBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'nodes',
		'layout',
		'lineShape',
		'nodeListeners',
		'popUp',
		'popupText',
		'nextId',
		'dragChildren',
		'icons',
		'lastAddedNodes'
	],
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #action }
RTExploraBuilder >> addListenerBlock: listenerBlock [
	"The block is executed at each node created"
	nodes do: listenerBlock.
	nodeListeners add: listenerBlock
]

{ #category : #adding }
RTExploraBuilder >> buildNode: object parent: parent [
	| node element elementIconOpen elementIconClose |
	
	node := RTExploraNode new.
	node builder: self.
	node id: self newNodeId.
	node parentNode: parent.
	element := RTElement new model: object.	
	node element: element.
	
	element addShape: self shape shape.
	
	dragChildren ifTrue: [ element @ RTDraggableChildren ] ifFalse: [ element @ RTDraggable ].
	popUp ifTrue: [ element @ (RTPopup new group: self explorePopUp) ].
	
	(icons) ifNotNil: [ 

		elementIconOpen := (icons first) elementOn: #iconOpen.
		elementIconClose := (icons second) elementOn: #iconClose.
		
		RTConstraint move: ((Array with: elementIconOpen with: elementIconClose) asGroup) onTheRightOf: element.

		element addCallback: (TRTranslationCallback new block: [
			TRConstraint move: ((Array with: elementIconOpen with: elementIconClose) asGroup) onTheRightOf:element. 		
			self view signalUpdate
			]).
	
		node iconOpen: elementIconOpen.
		node iconClose: elementIconClose.
		]. 

	nodeListeners do: [ :block | block value: node ].
	
	^ node
]

{ #category : #layout }
RTExploraBuilder >> circleLayout [
	" Not working properly! needs fix somewhere. "
	^ self layout: [ :elem | RTCircleLayout "(RTCenteredCircleLayout new;
		center: elem position)" ]
]

{ #category : #layout }
RTExploraBuilder >> clusterLayout [
	^ self layout: [ RTClusterLayout new ]
]

{ #category : #view }
RTExploraBuilder >> configureView: aView [
	aView @ RTDraggableView.
]

{ #category : #layout }
RTExploraBuilder >> defaultLayout [
	^ self treeLayout
]

{ #category : #'default values' }
RTExploraBuilder >> defaultLineShape [
	^ RTLine new
]

{ #category : #'default values' }
RTExploraBuilder >> defaultNodeShape [
	self shape circle size: 20; color: (Color blue alpha: 0.5); yourself
]

{ #category : #'default values' }
RTExploraBuilder >> defaultTextColor [
	^ Color black
]

{ #category : #view }
RTExploraBuilder >> dragChildren [
	dragChildren := true
]

{ #category : #adding }
RTExploraBuilder >> explorePopUp [
	^ [ :group :elem |
			| background node |
			node := elem attributes at: #node.
			background := (RTBox new color: (Color lightGreen alpha: 0.95)) element.
			group add: (RTElement new model: elem model)
				+ (RTLabel new text: [ :e | popupText rtValue: e]).
			group addAll: (node expansionDirections collect: [
				:direction |
				(RTElement new model:
					((node expansionDirections size > 1
						ifFalse: ['']
						ifTrue: [(direction key) asString , ': ']),(
					(node explorationStatus: direction)
					))) + (RTLabel new height: 8)]).
			(RTVerticalLineLayout withGap: 0) on: group.
			
			RTNest new centerOn: background elements: group.
			group addFirst: background ]
]

{ #category : #layout }
RTExploraBuilder >> horizontalTreeLayout [
	^ self layout: RTHorizontalTreeLayout new
]

{ #category : #layout }
RTExploraBuilder >> icons [
	^ icons.
]

{ #category : #initialization }
RTExploraBuilder >> initialize [
	super initialize.
	nextId := 0.
	popUp := false.
	dragChildren := false.
	nodes := OrderedCollection new.
	lastAddedNodes := OrderedCollection new.
	nodeListeners := OrderedCollection new.
	lineShape := self defaultLineShape.
	self configureView: view.
	self initializeNodes.
	self defaultLayout.
]

{ #category : #initialization }
RTExploraBuilder >> initializeNodes [
	self defaultNodeShape.
]

{ #category : #layout }
RTExploraBuilder >> lastAddedNodes [
	^ lastAddedNodes 
]

{ #category : #layout }
RTExploraBuilder >> lastAddedNodes: aCollectionOfNodes [
	lastAddedNodes := aCollectionOfNodes
]

{ #category : #accessing }
RTExploraBuilder >> layout [
	^ layout
]

{ #category : #accessing }
RTExploraBuilder >> layout: aLayout [
	layout := aLayout.
	^ aLayout
]

{ #category : #accessing }
RTExploraBuilder >> lineShape [
	^ lineShape
]

{ #category : #accessing }
RTExploraBuilder >> lineShape: aShape [
	lineShape := aShape
]

{ #category : #layout }
RTExploraBuilder >> linearLayout [
	^ self layout: RTHorizontalLineLayout new
]

{ #category : #adding }
RTExploraBuilder >> newNodeId [
	nextId := nextId + 1.
	^ nextId
]

{ #category : #adding }
RTExploraBuilder >> node: anObject [ 
	^ self node: anObject parent: nil.
]

{ #category : #adding }
RTExploraBuilder >> node: anObject parent: element [
	| node |
	node := self buildNode: anObject parent: element.
	nodes add: node.
	^ node.
]

{ #category : #accessing }
RTExploraBuilder >> nodes [
	^ nodes
]

{ #category : #action }
RTExploraBuilder >> onClickExplore: aBlock [
	self addListenerBlock: [ :el |
		el addListenerFor: TRMouseClick onDirection: #default -> #From withBlock: aBlock ].
]

{ #category : #action }
RTExploraBuilder >> onLeftClickExplore: aBlock [
	self onLeftClickExplore: aBlock edges: #From
]

{ #category : #action }
RTExploraBuilder >> onLeftClickExplore: aBlock edges: edgeDirection [
	self onLeftClickExplore: aBlock edges: edgeDirection direction: #LeftClick
]

{ #category : #action }
RTExploraBuilder >> onLeftClickExplore: aBlock edges: edgeDirection direction: directionName [
	self addListenerBlock: [ :el |
		el addListenerFor: TRMouseLeftClick onDirection: directionName -> edgeDirection withBlock: aBlock ]
]

{ #category : #action }
RTExploraBuilder >> onRightClickExplore: aBlock [ 
	self onRightClickExplore: aBlock edges: #To
]

{ #category : #action }
RTExploraBuilder >> onRightClickExplore: aBlock edges: edgeDirection [
	self onRightClickExplore: aBlock edges: edgeDirection direction: #RightClick
]

{ #category : #action }
RTExploraBuilder >> onRightClickExplore: aBlock edges: edgeDirection direction: directionName [
	self addListenerBlock: [ :el |
		el addListenerFor: TRMouseRightClick onDirection: directionName -> edgeDirection withBlock: aBlock ]
]

{ #category : #layout }
RTExploraBuilder >> radialTreeLayout [
	^ self layout: RTRadialTreeLayout new
]

{ #category : #view }
RTExploraBuilder >> renderIn: rView [
	nodes do: [ :n | rView add: n element. lastAddedNodes add: n ].
	icons ifNotNil:[
		nodes do: [ :n | n iconOpen ifNotNil: [rView add: n iconOpen] ]
		]
]

{ #category : #layout }
RTExploraBuilder >> treeLayout [
	^ self layout: RTTreeLayout new
]

{ #category : #layout }
RTExploraBuilder >> withIcons [
	self withIconsColor: Color black.
]

{ #category : #layout }
RTExploraBuilder >> withIconsColor: aColor [
		|iconOpen iconClose p1 p2|
		
		p1 := 'M401.625,267.75H344.25v-57.375c0-21.114-17.136-38.25-38.25-38.25s-38.25,17.117-38.25,38.25v57.375h-57.375
				c-21.114,0-38.25,17.117-38.25,38.25c0,21.114,17.136,38.25,38.25,38.25h57.375v57.375c0,21.114,17.136,38.25,38.25,38.25
				s38.25-17.117,38.25-38.25V344.25h57.375c21.114,0,38.25-17.136,38.25-38.25S422.739,267.75,401.625,267.75z M306,0
				C136.992,0,0,136.992,0,306s136.992,306,306,306s306-136.992,306-306S475.008,0,306,0z M306,554.625
				C168.912,554.625,57.375,443.088,57.375,306S168.912,57.375,306,57.375S554.625,168.912,554.625,306S443.088,554.625,306,554.625z'.
		p2 := 'M401.625,267.75h-191.25c-21.114,0-38.25,17.117-38.25,38.25c0,21.114,17.136,38.25,38.25,38.25h191.25
				c21.114,0,38.25-17.136,38.25-38.25S422.758,267.75,401.625,267.75z M306,0C136.992,0,0,136.992,0,306s136.992,306,306,306
				s306-136.992,306-306S475.008,0,306,0z M306,554.625C168.912,554.625,57.375,443.088,57.375,306S168.912,57.375,306,57.375
				S554.625,168.912,554.625,306S443.088,554.625,306,554.625z'.

		iconOpen := (RTSVGPath new path: p1; color: aColor; scale: 0.025).
		iconClose := (RTSVGPath new path: p2; color: aColor; scale: 0.025).
		
	self withIconsSVG: (Array with: iconOpen with: iconClose )
]

{ #category : #layout }
RTExploraBuilder >> withIconsSVG: anRTSVGPathArray [ 
	icons := anRTSVGPathArray
]

{ #category : #view }
RTExploraBuilder >> withPopup [
	self withPopup: [ :obj | obj printString ]
]

{ #category : #view }
RTExploraBuilder >> withPopup: aStringOrBlock [
	popUp := true.
	popupText := aStringOrBlock
]
