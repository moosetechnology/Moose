"
shows a continuous popup in one element
"
Class {
	#name : #RTContinuousPopup,
	#superclass : #RTPopup,
	#instVars : [
		'pointers',
		'controlPoint',
		'view'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #accessing }
RTContinuousPopup >> blockValidArea [
	^ controlPoint
]

{ #category : #accessing }
RTContinuousPopup >> blockValidArea: aBlock [
	controlPoint := aBlock
]

{ #category : #initialization }
RTContinuousPopup >> createAndShowPopupFor: element event: event [
	| popupPosition popup idealPosition g |
	self removeLastPopup.
	
	popup := self getNewPopupFor: event.
	
	
	"The following is useful when testing"
	event position isNil
		ifTrue: [ idealPosition := element position ]
		ifFalse: [ idealPosition := (element view canvas camera fromSpaceToPixel: event position)
			- ((popup width/2)@0) ].
	popupPosition := self closestPositionOf: popup from: idealPosition inView: element view.

	popup translateTopLeftTo: popupPosition.	
	pointers ifNotNil: [ 
		g := RTGroup new.
		pointers value: g value: event.
		g do: [:x | 
			element view add: x.
			popup add: x ]. ].
	
	self lastPopup: popup.

]

{ #category : #initialization }
RTContinuousPopup >> getNewPopupFor: evt [
	"the super of this method recibes an element i recibe an event of roassal"
	| popupGroup |
	popupGroup := self createPopupFor: evt.
	popupGroup do: [ :e | 
		view add: e.
		e trachelShape setAsFixed. ].
	evt signalUpdate.
	^ popupGroup
]

{ #category : #initialization }
RTContinuousPopup >> initializeElement: element [
	| close |
	view := element view.
	close := [ :evt | 
		self removeLastPopup.
		evt signalUpdate ].
	element 
		when: TRMouseClick do: close;
		when: TRMouseLeave do: close;
		when: TRMouseDragging do: close;
		when: TRMouseMove
		do: [ :event |
			(self validPoint: event position)
				ifTrue: [ self createAndShowPopupFor: element event: event ]
				ifFalse: [ close value: event ] ].
]

{ #category : #accessing }
RTContinuousPopup >> pointers [
	^ pointers
]

{ #category : #accessing }
RTContinuousPopup >> pointers: aBlockOfTwoArgs [
	"example
	self pointers: [:anEmptyRTGroup :aMouseMoveEvent | elementsThatShowsThatPointOrPoints]"
	pointers := aBlockOfTwoArgs 
]

{ #category : #accessing }
RTContinuousPopup >> popupOffset [
	^ 0 @ 15.
]

{ #category : #testing }
RTContinuousPopup >> validPoint: aPosition [
	controlPoint ifNil: [ ^ true ].
	^ controlPoint value: aPosition
]
