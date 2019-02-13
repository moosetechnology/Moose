"
RTLayoutBuilder is a higher abstract to manage layout. Most builder use it as it significantly shorten the use of layouts.

Consider the following example:
-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.

es := (RTBox new size: 8) elementsOn: (1 to: 100).
v addAll: es.

lb := RTLayoutBuilder new.
lb horizontalFlow.
lb setUpElements: es.

v
-=-=-=-=-=-=-=-=-=-=-=-=

Another example using conditional layout:
-=-=-=-=-=-=-=-=-=-=-=-=
b := RTMondrian new.
b nodes: self.
b edges connectToAll: [ :c | c queryAllOutgoingInvocations atTypeScope ].
b layout 
	forceWithCharge: -300;
	ifElement: #isNotConnected then: RTNullLayout new.
b
-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTLayoutBuilder,
	#superclass : #RTObject,
	#instVars : [
		'layout',
		'actionOnEdges',
		'partitions',
		'dynamicForceBasedLayout'
	],
	#category : #'Roassal2-Builder-Common'
}

{ #category : #'public - layout' }
RTLayoutBuilder >> cell [
	layout := RTCellLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> circle [
	layout := RTCircleLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> circleWithRadius: aRadiusInPixels [
	layout := RTCircleLayout new.
	layout radius: aRadiusInPixels.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> clean [
	"Move non connected elements to a side
	
	Here is an example:
-=-=-=-=-=
b := RTMondrian new. 
b nodes: Collection allSubclasses.
b normalizer normalizeSize: #numberOfMethods.

b edges connectFrom: #superclass.
b layout 
	tree; 
	clean.
b
-=-=-=-=-=
	"
	self ifNotConnectedThen: RTGridLayout new.
]

{ #category : #'public - layout' }
RTLayoutBuilder >> cluster [

	layout := RTClusterLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> date [
	"Used by RTCalendarBuilder"
	layout := RTDateLayout new.
	^ layout
]

{ #category : #building }
RTLayoutBuilder >> doActionsOnEdgesFor: elements [
	| allEdges asSet |
	actionOnEdges ifEmpty: [ ^ self ].
	allEdges := OrderedCollection new.
	elements do: [ :e | allEdges addAll: e connectedEdges ].
	asSet := allEdges asSet.
	actionOnEdges
		do: [ :act | 
			asSet
				do: [ :e | 
					e isUsedInLayout
						ifTrue: [ act rtValue: e ] ] ]
]

{ #category : #building }
RTLayoutBuilder >> doDynamicForceBasedLayoutOn: elements [
	| v |
	v := elements anyOne view.
	v addAnimation: (RTForceLayoutStepping new view: v)
]

{ #category : #'public - layout' }
RTLayoutBuilder >> dominanceTree [
	actionOnEdges add: [ :edge | edge shape withVerticallAttachPoint ].
	layout := RTDominanceTreeLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> dynamicForce [
	"This flag is used in setUpElements to add an animation to the view. This is a bit hackish, yes. We will see in the future"
	dynamicForceBasedLayout := true
]

{ #category : #'public - condition' }
RTLayoutBuilder >> else: elseLayout [ 
	self assert: [ layout class == RTConditionalLayout ].
	layout elseLayout: elseLayout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> flow [
	layout := RTFlowLayout new.
	^ layout
]

{ #category : #'public - partition' }
RTLayoutBuilder >> for: aBlockCondition use: aLayout [

	partitions add: (Array with: aBlockCondition with: aLayout)
]

{ #category : #'public - layout' }
RTLayoutBuilder >> force [
	layout := RTOptimizedForceBasedLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> forceWithCharge: aBlockOrANumber [
	"E.g -300"
	layout := RTOptimizedForceBasedLayout new.
	layout charge: aBlockOrANumber.
	^ layout
]

{ #category : #configuring }
RTLayoutBuilder >> gapSize: aValue [
	layout gapSize: aValue
]

{ #category : #'public - layout' }
RTLayoutBuilder >> grid [
	layout := RTGridLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> gridWithPerRow: aNumber [
	layout := RTGridLayout new.
	layout lineItemsCount: aNumber.
	^ layout
]

{ #category : #'public - partition' }
RTLayoutBuilder >> hasPartition [
	^ partitions notEmpty
]

{ #category : #'public - layout' }
RTLayoutBuilder >> horizontalDominanceTree [
	actionOnEdges add: [ :edge | edge shape withHorizontalAttachPoint ].
	layout := RTHorizontalDominanceTreeLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> horizontalFlow [
	layout := RTHorizontalFlowLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> horizontalLine [
	layout := RTHorizontalLineLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> horizontalReversedTree [
	actionOnEdges add: [ :edge | edge shape withShorterHorizontalAttachPoint ].
	layout :=  RTHorizontalTreeLayout new.
	layout horizontallyReverse.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> horizontalTree [
	"The layout to use is the horizontal tree"
	layout := RTHorizontalTreeLayout new.
	^ layout
]

{ #category : #'public - condition' }
RTLayoutBuilder >> if: blockCondition then: thenLayout [
	^ self ifElement: [ :anElement | blockCondition rtValue: anElement model ] then: thenLayout
]

{ #category : #'public - condition' }
RTLayoutBuilder >> ifConnectedThen: thenLayout [
"
b := RTMondrian new.
b nodes: (1 to: 100).
b layout 
	force;
	ifConnectedThen: RTGridLayout new.
b edges connectTo: [ :v | v \\ 4 ].
b
"
	^ self ifElement: #isConnected then: thenLayout
]

{ #category : #'public - condition' }
RTLayoutBuilder >> ifElement: blockCondition then: thenLayout [

"
Here is an example:
b := RTMondrian new.
b nodes: (1 to: 100).
b layout 
	force;
	ifElement: #isNotConnected then: RTGridLayout new.
b edges connectTo: [ :v | v \\ 4 ].
b.
"
	
	| oldLayout |
	oldLayout := layout.
	layout := RTConditionalLayout new.
	layout condition: blockCondition.
	layout thenLayout: thenLayout.
	layout elseLayout: oldLayout.
	^ layout
]

{ #category : #'public - condition' }
RTLayoutBuilder >> ifNotConnectedThen: thenLayout [
	"Apply a layout on the set of elements that are not connected.
	
	
	b := RTMondrian new.
	b nodes: Collection allSubclasses.
	b edges connectFrom: #superclass.
	b layout tree; ifNotConnectedThen: RTGridLayout new.
	b
	"

	^ self ifElement: #isNotConnected then: thenLayout
]

{ #category : #initialization }
RTLayoutBuilder >> initialize [
	super initialize.
	layout := RTFlowLayout new.
	actionOnEdges := OrderedCollection new.
	partitions := OrderedCollection new.
	dynamicForceBasedLayout := false
]

{ #category : #accessing }
RTLayoutBuilder >> layout [
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> month [
	"Used by RTCalendarBuilder"
	layout := RTMonthLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> none [
	layout := RTNoLayout new.
	^ layout
]

{ #category : #'public - condition' }
RTLayoutBuilder >> overall: overallLayout [ 
	self assert: [ layout class == RTConditionalLayout ].
	layout overallLayout: overallLayout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> packed [
	"Rectangle packed layout"
	layout := RTRectanglePackLayout new.
	^ layout
]

{ #category : #'public - partition' }
RTLayoutBuilder >> processPartitions: elements [

	| groupOfElements els |
	groupOfElements := OrderedCollection new.
	partitions do: [ :tupple |
		"tupple = { conditionblock . layout }"
		els := elements select: [ :el | tupple first rtValue: el model ].
		tupple second on: els.
		groupOfElements add: els asGroup.
		 ].
	
	layout on: groupOfElements
]

{ #category : #'public - layout' }
RTLayoutBuilder >> radial [

	layout := RTRadialTreeLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> radialTree [
	layout := RTRadialTreeLayout new.
	^ layout
]

{ #category : #building }
RTLayoutBuilder >> setUpElements: elements [
	"Perform the layout on the provided elements"
	self doActionsOnEdgesFor: elements.

	dynamicForceBasedLayout ifTrue: [ ^ self doDynamicForceBasedLayoutOn: elements ].
	
	elements do: #updateEdgesOFF.
	self hasPartition
		ifTrue: [ self processPartitions: elements ]
		ifFalse: [ layout on: elements ].
	elements do: #updateEdgesON.
	elements do: #updateConnectedEdges.

]

{ #category : #'public - layout' }
RTLayoutBuilder >> sugiyama [
	actionOnEdges add: [ :edge | edge shape withVerticallAttachPoint ].
	layout := RTSugiyamaLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> sunburstWithArcWidth: aNumber [
	layout := RTSunburstConstantWidthLayout new.
	layout arcWidth: aNumber.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> sunburstWithRadius [
	^ self sunburstWithRadius: 200.

]

{ #category : #'public - layout' }
RTLayoutBuilder >> sunburstWithRadius: radius [
	layout := RTSunburstExtentLayout new.
	layout extent: radius asPoint * 2.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> tree [
	"The layout to use is the vertical tree"
	layout := RTTreeLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> verticalLine [
	layout := RTVerticalLineLayout new.
	^ layout
]

{ #category : #'public - layout' }
RTLayoutBuilder >> weightedCircle [
	layout := RTWeightedCircleLayout new.
	^ layout
]
