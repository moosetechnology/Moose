"
A RTKiviatBuilder is a builder for Kiviat Chart, comparing objects considering metrics.

Instance Variables
	axisSize:		<Object>
	highlight:		<Object>
	kiviatMetrics:		<Object>
	kiviatNodes:		<Object>
	metrics:		<Object>
	objects:		<Object>
	shapes:		<Object>

axisSize
	- xxxxx

highlight
	- xxxxx

kiviatMetrics
	- xxxxx

kiviatNodes
	- xxxxx

metrics
	- xxxxx

objects
	- xxxxx

shapes
	- xxxxx

"
Class {
	#name : #RTKiviatBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'kiviatMetrics',
		'kiviatNodes',
		'objects',
		'axisSize',
		'highlight',
		'polygons',
		'shapes',
		'axisTitle',
		'axisTitles',
		'axisBuilt'
	],
	#category : #'Roassal2-Builder-Kiviat'
}

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> activateAxisTitle [
"activate the axis titles in the view to identify metrics axis"
	axisTitle := #activated.

]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> activateHighlight [
"activate the Highlight of a chart node when mouse is over and reduce alpha of ther chart nodes."
	highlight := #activated.

]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> activatePolygons [
"activate the polygons in the view to identify chart nodes"
	polygons := #activated.

]

{ #category : #adding }
RTKiviatBuilder >> addDynamicObject: anObject [

	(objects includes: anObject) ifFalse: [ 
		objects add: anObject.
		self build.
		self view signalUpdate.
		]
]

{ #category : #adding }
RTKiviatBuilder >> addDynamicObjects: anObjectCollection [

	anObjectCollection do: [ :o | 
		self addDynamicObject: o
	].

]

{ #category : #adding }
RTKiviatBuilder >> addMetric: blockOrSymbol [
	self addMetric: blockOrSymbol title: (blockOrSymbol asString).
]

{ #category : #adding }
RTKiviatBuilder >> addMetric: blockOrSymbol max: kiviatMetricMaxValue [
	self addMetric: blockOrSymbol max: kiviatMetricMaxValue title: (blockOrSymbol asString).
]

{ #category : #adding }
RTKiviatBuilder >> addMetric: blockOrSymbol max: kiviatMetricMaxValue title: aString [
	kiviatMetrics add: (RTKiviatMetric new block: blockOrSymbol; named: aString; maxValue:kiviatMetricMaxValue ).
]

{ #category : #adding }
RTKiviatBuilder >> addMetric: blockOrSymbol title: aString [
	self addMetric: blockOrSymbol max: nil  title: aString .
]

{ #category : #adding }
RTKiviatBuilder >> addNodesAndEdgesToView [
"add to the view the chart nodes created"
	kiviatNodes do: [ :kn |
		view addAll: kn nodeKiviatElements.
		view addAll: kn edgeKiviatElements. 
		( polygons = #activated ) ifTrue: [ view add: kn polygonElement ].
		]
]

{ #category : #adding }
RTKiviatBuilder >> addNodesAndEdgesToView: aKiviatNode [
"add to the view the chart nodes created"
	( polygons = #activated ) ifTrue: [ view add: aKiviatNode polygonElement ].
	view addAll: aKiviatNode edgeKiviatElements. 
	view addAll: aKiviatNode nodeKiviatElements.
		

]

{ #category : #adding }
RTKiviatBuilder >> addObject: anObject [
	objects add: anObject.
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> axis: aRTKiviatMetric [
"creation of a metric axis"
	| config centralPoint allValues |	
	
	allValues := (objects collect: [ :p | (aRTKiviatMetric block)  rtValue: p ]).	
	aRTKiviatMetric maxValue ifNil: [ aRTKiviatMetric maxValue: ( (allValues isEmpty) ifTrue: [ 0 ] ifFalse: [ allValues max ])].
	aRTKiviatMetric minValue: ( (allValues isEmpty) ifTrue: [ 0 ] ifFalse: [ allValues min ]).
		
	config := RTAxisConfiguration new
					builder: self;
					numberOfTicks: 4;
					numberOfLabels: 4;
					minValue: 0;
					maxValue: aRTKiviatMetric maxValue;
					ticksCentered: true;					
					labelConversion: [ :number | number asFloat round: 2 ];
					positionLabel: [ :aLabel :aTick | aLabel translateTo: aTick position + (0 @ 15) ].
					(axisTitle = #activated) ifTrue: [ config title: (aRTKiviatMetric named)].
					
					
	centralPoint := (0@0).
	
	config axisFrom: 0@0 to: (aRTKiviatMetric modelBlock value: (self getNormalizedValue:(aRTKiviatMetric maxValue)  min:0  max:(aRTKiviatMetric maxSize)  minValue:(aRTKiviatMetric minValue) maxValue: (aRTKiviatMetric maxValue))).
	
]

{ #category : #accessing }
RTKiviatBuilder >> axisSize [
	^ axisSize
]

{ #category : #accessing }
RTKiviatBuilder >> axisSize: aSizeInPixels [
"define the size in pixel of all the axis"
	axisSize := aSizeInPixels
]

{ #category : #accessing }
RTKiviatBuilder >> axisTitles [
	^ axisTitles.
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> buildAxis [
"define the blocks of the metrics, divise 360° by the number of total metrics, and call the axis creation according to metrics"
	| angle |
	angle := 0.

	kiviatMetrics doWithIndex: [ :m :i | 
		self axis: (m modelBlock: [ :v | (v*(((i-1) * ((2 * Float pi) / (kiviatMetrics size)))cos))@(v*(((i-1) * ((2 * Float pi) / (kiviatMetrics size)))sin))]; maxSize: axisSize) ].
	
	axisBuilt := true.	
]

{ #category : #actions }
RTKiviatBuilder >> clean [
	self removeDynamicObjects: objects copy
]

{ #category : #view }
RTKiviatBuilder >> configureView: aView [
	aView @ RTDraggableView.
]

{ #category : #hooks }
RTKiviatBuilder >> createShapeBuilder [
"redefinition for default shape"
	| sb |
	sb := super createShapeBuilder.
	sb shape: (RTEllipse new color: (Color blue alpha: 0.3); size: 10).
	^ sb
]

{ #category : #initialization }
RTKiviatBuilder >> createView [
	^ super createView @ RTDraggableView
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> defaultAxisSize [
	axisSize := 200
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> desactivateAxisTitle [
"desactivate the axis titles in the view to identify metrics axis"
	axisTitle := #desactivated.

]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> desactivateHighlight [
	highlight := #desactivated.

]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> desactivatePolygons [
	polygons := #desactivated.

]

{ #category : #accessing }
RTKiviatBuilder >> executeHighlight [

	self executeHighlightLowColor: 0.2 highColor: 1.0

]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> executeHighlightLowColor: lowColor highColor: highColor [
| titles |
"define the alpha values of the highlighted and others chart nodes to the view"
	
	( axisTitle = #activated ) ifTrue: [ 
		"for now this way to recover the axis Titles elements in the view is not really clean, but because of using RTAxisRenderer to create the axis and titles in the same time I did not found a way to get only the title element from it."
		titles := OrderedCollection new.
		self kiviatMetrics do: [ :m | titles add: (view elements detect: [ :e |  (e shape isKindOf: RTLabel) and: [ (e trachelShape text) = (m named) ] ])].
		 ].

	((kiviatNodes flatCollect: [ :kn | kn nodeKiviatElements]) asGroup) do: [  :e | 
		e @ (RTShowLabel new labelledInteraction: (RTLabeled new text: [ :el | el kiviatNode named])).
		].
	
	((kiviatNodes flatCollect: [ :kn | kn nodeKiviatElements]) asGroup)  when: TRMouseEnter do: [  :evt | 
		(kiviatNodes select: [ :kn | kn named = evt element model kiviatNode named ]) do: [ :kn |
			
			kn nodeKiviatElements do: [ :e | self recordElement: e. e trachelShape color: (e trachelShape color alpha: highColor)].
			kn edgeKiviatElements do: [ :e | self recordElement: e. e trachelShape color: (e trachelShape color alpha: highColor)].
			].
		(kiviatNodes select: [ :kn | kn named ~= evt element model kiviatNode named ]) do: [ :kn |
			kn nodeKiviatElements do: [ :e | self recordElement: e. e trachelShape color: (e trachelShape color alpha: lowColor)].
			kn edgeKiviatElements do: [ :e | self recordElement: e. e trachelShape color: (e trachelShape color alpha: lowColor)]
			].
		( axisTitle = #activated ) ifTrue: [ titles do: [ :t | t trachelShape color: (t trachelShape color alpha: 0)]].
		view signalUpdate.
		].
	
	((kiviatNodes flatCollect: [ :kn | kn nodeKiviatElements]) asGroup) when: TRMouseLeave do: [  :evt | 
		kiviatNodes do: [ :kn |
			kn nodeKiviatElements do: [ :e | e trachelShape color: (e attributes at: #originalColor)].
			kn edgeKiviatElements do: [ :e | e trachelShape color: (e attributes at: #originalColor)].
			view signalUpdate].
		( axisTitle = #activated ) ifTrue: [ titles do: [ :t | t trachelShape color: (t trachelShape color alpha: 1)]].
		view signalUpdate.
		]. 
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> executePolygonNode: aKiviatNode [

	self executePolygonsColor: 0.2 node: aKiviatNode
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> executePolygons [

	self executePolygonsColor: 0.2.
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> executePolygonsColor: alpha [
"define the alpha value and create polygons"
	kiviatNodes do: [  :kn |
		kn polygonElement: ((RTPolygon new borderColor: ((kn nodeKiviatElements first color) alpha: alpha);  color: ((kn nodeKiviatElements first color)alpha: alpha); vertices: ((kn nodeKiviatElements collect: [ :ne | ne position ]) asArray)) elementOn: kn).
		]

]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> executePolygonsColor: alpha node: aKiviatNode [
"define the alpha value and create polygon"
		aKiviatNode polygonElement: ((RTPolygon new borderColor: ((aKiviatNode nodeKiviatElements first color) alpha: alpha);  color: ((aKiviatNode nodeKiviatElements first color)alpha: alpha); vertices: ((aKiviatNode nodeKiviatElements collect: [ :ne | ne position ]) asArray)) elementOn: aKiviatNode).
]

{ #category : #'as yet unclassified' }
RTKiviatBuilder >> getNormalizedValue: val min: min max: max minValue: minValue maxValue: maxValue [ 
"obtain a normalized value from the original value given by a metric calculation according to the size of the axis"
	(val = min) ifTrue: [ ^ min].
	(maxValue = minValue) ifTrue: [ ^ max].
	
 	^ (min + ((max - min) * ( (val - minValue) / (maxValue - minValue)))).
]

{ #category : #initialization }
RTKiviatBuilder >> initialize [
	super initialize.

	self configureView: view.	
	self defaultAxisSize.
	
	highlight := #activated.
	polygons := #desactivated.
	axisTitle := #desactivated.
	
	axisBuilt := false.
	
	axisTitles := OrderedCollection new.

	objects := OrderedCollection new.
	
	kiviatNodes := OrderedCollection new.
	kiviatMetrics := OrderedCollection new.


]

{ #category : #accessing }
RTKiviatBuilder >> kiviatMetrics [
	^ kiviatMetrics
]

{ #category : #accessing }
RTKiviatBuilder >> kiviatNodes [
	^ kiviatNodes
]

{ #category : #accessing }
RTKiviatBuilder >> node: anRTKiviatNode [
"a chart node is represented by a set of elements according to the metrics values and connected by edges.
 Finish the creation of a chart node, creating elements in the view and edges."
| nodeElems edgeElems shapeNode shapeEdge |

	kiviatNodes add: anRTKiviatNode.
	nodeElems := OrderedCollection new.
	edgeElems := OrderedCollection new.
	
	shapeNode := (shapes isNil) ifFalse: [ RTEllipse new color:(shapes at: (kiviatNodes indexOf: anRTKiviatNode)); size: 10 ] ifTrue: [ anRTKiviatNode shapeNode ] .
	shapeEdge := anRTKiviatNode shapeEdge. 
	
	kiviatMetrics do: [ :m |
		nodeElems add: ((shapeNode) elementOn: ( RTKiviatElement new metric:(m block); position: (m modelBlock value: (self getNormalizedValue: (anRTKiviatNode arrayValues at: (kiviatMetrics indexOf: m)) min: 0  max: (m maxSize)  minValue: 0  maxValue:(m maxValue))); kiviatNode: anRTKiviatNode; value: (anRTKiviatNode arrayValues at: (kiviatMetrics indexOf: m))) ).
		].
	
	anRTKiviatNode addNodeElements: nodeElems.	
		
	nodeElems allButLast do: [ :e | edgeElems add: ((RTEdge from: e to: (nodeElems after:e)) + (shapeEdge color: (e trachelShape color)))]. 
	edgeElems add: ((RTEdge from: (nodeElems last) to: (nodeElems first)) + (shapeEdge color: (nodeElems first trachelShape color))).
	
	anRTKiviatNode addEdgeElements: edgeElems.	
	
	nodeElems do: [  :e | e translateBy: (e model position) ].
]

{ #category : #accessing }
RTKiviatBuilder >> objects [
	^ objects
]

{ #category : #accessing }
RTKiviatBuilder >> objects: anObjectsCollection [
"Define the number of objects to be evaluated by the metrics"
	objects := anObjectsCollection
]

{ #category : #actions }
RTKiviatBuilder >> recordElement: anElement [
	anElement attributes at: #originalColor put: (anElement trachelShape color)
]

{ #category : #adding }
RTKiviatBuilder >> removeDynamicObject: anObject [

	(objects includes: anObject) ifTrue: [ 
		| kn |
		objects remove: anObject.
		kn := (kiviatNodes detect: [ :k| k named = anObject ]). 	
		view removeElements: kn edgeKiviatElements. 
		view removeElements: kn nodeKiviatElements.
		(kn polygonElement) ifNotNil:  [view removeElement: kn polygonElement].
		kiviatNodes remove: kn.
		
		self view signalUpdate.
	]
]

{ #category : #adding }
RTKiviatBuilder >> removeDynamicObjects: anObjectCollection [
	anObjectCollection do: [ :o | 
		self removeDynamicObject: o ]
]

{ #category : #hooks }
RTKiviatBuilder >> renderIn: aView [
	
	((kiviatMetrics size = 0) | (axisBuilt = true)) ifFalse: [ self buildAxis ].
	self resetCreatedElements.
	
	"a chart node is represented by a set of elements according to the metrics values and connected by edges."
	objects do: [ :p | kiviatNodes detect: [:k | k named = p] ifNone: [ 
			| kn |
			kn := (RTKiviatNode new values:(kiviatMetrics collect: [ :m | m block rtValue: p ]); named: p; shapeNode: self shape).
			self node: kn.
			( polygons = #activated ) ifTrue: [ self executePolygonNode: kn].
			self addNodesAndEdgesToView: kn.
			] 
		].
	
	( highlight = #activated ) ifTrue: [ self executeHighlight ].
		
	"globalBuilder executeOn: self createdElements."


]

{ #category : #accessing }
RTKiviatBuilder >> shapes: aColorArray [
"shapes: takes in argument a collection of colors, at least of the size of the numbers of objects"
	shapes := aColorArray.
]
