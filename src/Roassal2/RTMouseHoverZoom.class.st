Class {
	#name : #RTMouseHoverZoom,
	#superclass : #RTInteraction,
	#instVars : [
		'desiredExtent',
		'resizeStrategy',
		'zoomInElements',
		'ratio'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #public }
RTMouseHoverZoom >> animated [
	self animatedDuring: 0.3
]

{ #category : #public }
RTMouseHoverZoom >> animatedDuring: seconds [
	resizeStrategy := [ :anElement :newExtent :afterBlock |
		anElement view addAnimation: (RTResizeMove new
			toExtent: newExtent during: seconds on: anElement;
			after: afterBlock) ].
]

{ #category : #private }
RTMouseHoverZoom >> attributeSymbol [
	^ #automaticZoomExtent
]

{ #category : #configuration }
RTMouseHoverZoom >> defaultRatio [

	^ 1.3
]

{ #category : #public }
RTMouseHoverZoom >> desiredExtent: anExtentOrOneArgBlock [
	desiredExtent := anExtentOrOneArgBlock.
]

{ #category : #private }
RTMouseHoverZoom >> doZoomEffect: anElement [
	(anElement hasAttribute: self attributeSymbol) ifTrue: [ ^ self ].
	
	zoomInElements do: [ :el | self undoZoomEffect: el ].
	zoomInElements := OrderedCollection new.
	zoomInElements add: anElement.
	
	anElement attributeAt: self attributeSymbol put: anElement extent.
	self setExtent: (desiredExtent rtValue: anElement) for: anElement after: [].
]

{ #category : #initialization }
RTMouseHoverZoom >> initialize [
	super initialize.
	ratio := self defaultRatio.
	desiredExtent := [ :anElement | anElement extent * ratio ].
	zoomInElements := OrderedCollection new.
	self animated.
]

{ #category : #hooks }
RTMouseHoverZoom >> initializeElement: element [
	element when: TRMouseEnter do: [ :anEvent |
		self doZoomEffect: element ].
	
	element when: TRMouseLeave do: [ :anEvent |
		self undoZoomEffect: element ]
]

{ #category : #accessing }
RTMouseHoverZoom >> ratio [
	^ ratio
]

{ #category : #accessing }
RTMouseHoverZoom >> ratio: aFloat [
	"Ratio by wich the element will grow"
	ratio := aFloat
]

{ #category : #private }
RTMouseHoverZoom >> setExtent: newExtent for: anElement after: aBlock [
	resizeStrategy cull: anElement cull: newExtent cull: aBlock
]

{ #category : #public }
RTMouseHoverZoom >> simple [
	resizeStrategy := [ :anElement :newExtent :afterBlock |
		anElement extent: newExtent.
		afterBlock value.
		anElement signalUpdate. ].
]

{ #category : #private }
RTMouseHoverZoom >> undoZoomEffect: anElement [
	| previousExtent |
	previousExtent := anElement attributeAt: self attributeSymbol ifAbsent: [ ^ self ].
	self setExtent: previousExtent for: anElement after: [ anElement removeAttributeAt: self attributeSymbol ifAbsent: [ nil ] ]

]
