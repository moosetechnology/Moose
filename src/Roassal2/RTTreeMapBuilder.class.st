"
I am a class to produces treemap visualizations

see examples to  know how to use me.

check this to get more info:
http://www.humane-assessment.com/blog/system-nesting-map
"
Class {
	#name : #RTTreeMapBuilder,
	#superclass : #RTAbstractTreeBuilder,
	#instVars : [
		'extent',
		'rectangle',
		'inset'
	],
	#category : #'Roassal2-Builder-TreeMap'
}

{ #category : #hooks }
RTTreeMapBuilder >> createView [
	^ super createView @ RTDraggableView.
]

{ #category : #'default-values' }
RTTreeMapBuilder >> defaultExtent [
	^ 500@500.
]

{ #category : #'default-values' }
RTTreeMapBuilder >> defaultInset [
	^ 4
]

{ #category : #customizing }
RTTreeMapBuilder >> depthShadedBorder [
	| normalizer |
	normalizer := RTNColorLinearNormalizer 
		inContext: self elements 
		withCommand: [ :e | e attributes at: #depth ] 
		lowColor: Color gray
		highColor: Color white darker.
	self elements do: [ :e | e trachelShape strokePaint: (normalizer rtValue: e) ].
]

{ #category : #accesing }
RTTreeMapBuilder >> extent [
	^ extent
]

{ #category : #accesing }
RTTreeMapBuilder >> extent: anObject [
	extent := anObject.
	
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> getRemainingSpace [
	^ self rectangle shortestSide
]

{ #category : #layout }
RTTreeMapBuilder >> highestAspectRatioFor: row remainingSpace: remainingSpace [
	| sum areas minArea maxArea |
	areas := row collect: [ :e | e attributes at: #area ].
	sum := areas sum.
	maxArea := areas max.
	minArea := areas min.
	((remainingSpace <=0) or: [minArea <= 0])
		ifTrue: [ ^ SmallInteger maxVal ]
		ifFalse: [ ^ ((((remainingSpace * remainingSpace) * maxArea) / (sum * sum))  max: ((sum * sum) / (minArea * (remainingSpace * remainingSpace)))) ]
]

{ #category : #initialization }
RTTreeMapBuilder >> initialize [
	super initialize.
	self shape rectangle 
		fillColor: Color white;
		borderColor: Color gray.
	self interaction popup; draggable.
	inset := self defaultInset.
	extent := self defaultExtent.
]

{ #category : #accesing }
RTTreeMapBuilder >> inset [
	^ inset
]

{ #category : #accesing }
RTTreeMapBuilder >> inset: anObject [
	inset := anObject
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> layoutChildrenOfRow: row [
	| oldCanvas|
	oldCanvas := self rectangle veryDeepCopy.
	row do: [ :each | | children |
		children := each attributes at: self childrenKey ifAbsent: [ #() ].
		self 
			squarify: children 
			inRectangle: (RTRectangleTreeMap fromContainerBounds: (each position extent: each extent) withInset: self inset) ].
	
	self rectangle: oldCanvas.
]

{ #category : #layout }
RTTreeMapBuilder >> layoutElements [
	self squarify: rootNodes
		inRectangle: (RTRectangleTreeMap origin: 0@0 extent: self extent).

	
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> layoutHorizontalRow: row [ 

	| container totalWidth areaToLayout height |
	container := self rectangle currentSubrectangle.
	totalWidth := container width.	
	areaToLayout := row inject: 0 into: [ :s :e | s + (e attributes at: #area) ].
	height := areaToLayout / totalWidth.
	row do: [ :each | each extent: (((each attributes at: #area) / height) @ height) ].	
	self translateElementsHorizontally: row in: container.
]

{ #category : #layout }
RTTreeMapBuilder >> layoutRow: row [
	| container |
	container := rectangle currentSubrectangle.
	(container width >= container height)
		ifTrue: [ self layoutVerticalRow: row ]
		ifFalse: [ self layoutHorizontalRow: row ].
	self layoutChildrenOfRow: row.
	self prepareNextRectangleAfterRow: row.
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> layoutVerticalRow: row [
	| container totalHeight areaToLayout width |
	container := rectangle currentSubrectangle.
	totalHeight := container height.
	areaToLayout := row inject: 0 into: [ :s :e | s+ (e attributes at: #area) ].
	width := areaToLayout /totalHeight.
	row do: [ :each | each extent: (width @ ( (each attributes at: #area) / width)) ].
	self translateElementsVertically: row in: container.
]

{ #category : #accesing }
RTTreeMapBuilder >> popup [
	^ self interaction popup.
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> prepareElementsForLayout: elms inRectangle: rec [
	| elementsArea viewArea area |
	elms isEmpty ifTrue: [ ^ elms ].
	elementsArea := elms inject: 0 into: [ :s :e | 
		s + (weight rtValue: e) ].
	
	viewArea := rec width * rec height.
	elms do: [ :e|
		area := ((viewArea * (weight rtValue: e))/elementsArea) asFloat.
		e attributes at: #area put: area. ].
	
	^ elms
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> prepareNextRectangleAfterRow: row [
	| nextRect |
	nextRect := self rectangle currentSubrectangle computeRemainingSubrectangleFrom: row.
	self rectangle addSubrectangle: nextRect
]

{ #category : #accesing }
RTTreeMapBuilder >> rectangle [
	^ rectangle.
]

{ #category : #accesing }
RTTreeMapBuilder >> rectangle: anObject [
	rectangle := anObject
]

{ #category : #hooks }
RTTreeMapBuilder >> renderIn: aView [
	super renderIn: aView.
	self layoutElements.
	
	
]

{ #category : #layout }
RTTreeMapBuilder >> squarify: children currentRow: row remainingSpace: remainingSpace [
	| firstElement remainingChildren |
	firstElement := children first.
	(row isEmpty or: [
		| oldRatio newElementRatio |
		oldRatio := self highestAspectRatioFor: row remainingSpace: remainingSpace.
		newElementRatio := self highestAspectRatioFor: (row, (Array with: firstElement)) remainingSpace: remainingSpace.
		oldRatio >= newElementRatio ] ) 
	ifTrue: [ 
		remainingChildren := children allButFirst.
		(remainingChildren isEmpty) ifTrue: [ self layoutRow: (row, (Array with: firstElement)) ]
		ifFalse: [ 
			self 
				squarify: remainingChildren
				currentRow: (row, (Array with: firstElement) )
				remainingSpace: remainingSpace ]
	 ] ifFalse: [ 
		self layoutRow: row.
		self 
			squarify: children
			currentRow: (OrderedCollection new)
			remainingSpace: self getRemainingSpace.
	 ].
	firstElement pushBack
]

{ #category : #layout }
RTTreeMapBuilder >> squarify: children inRectangle: aTreeRectangle [

	| elementsToLayout |
	children isEmpty ifTrue: [ ^ self  ].
	self rectangle: aTreeRectangle.
	elementsToLayout := self prepareElementsForLayout: children inRectangle: aTreeRectangle.
	self 
		squarify: elementsToLayout
		currentRow: OrderedCollection new
		remainingSpace: (aTreeRectangle width min: aTreeRectangle height).
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> translateElementsHorizontally: row in: container [

	| currentPoint |
	currentPoint := container origin.
	row do: [ :each |
		each translateTo: currentPoint + (each extent / 2).
		currentPoint := currentPoint translateBy: ((each width) @ 0 ).
	].
]

{ #category : #'layout-utils' }
RTTreeMapBuilder >> translateElementsVertically: row in: container [
	| currentPoint |
	currentPoint := container origin.
	row do: [ :each | 
		each translateBy: currentPoint+(each extent/2).
		currentPoint := currentPoint + (0@(each height)) ]
]

{ #category : #customizing }
RTTreeMapBuilder >> withShadedFramesFromColor: fromColor toColor: toColor [

	| normalizer |
	
	normalizer := RTNColorLinearNormalizer 
		inContext: self elements 
		withCommand: [ :e | weight rtValue: e ] 
		lowColor: fromColor highColor: toColor.
	self elements do: [ :e | e trachelShape strokePaint: (normalizer rtValue: e ) ].
]
