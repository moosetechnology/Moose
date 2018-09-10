"
Add a menu entry to easily allow for selection

[[[
| v |
v := RTView new.
v addAll: (RTBox elementsOn: (Collection withAllSubclasses)).
RTGridLayout on: v elements.
v elements @ RTPopup.
v @  RTHighlightElementsInView.
]]]

[[[
| b | 
b := RTMondrian new.
b node: 4 forIt: [
	b node: 4 ].
b view @ RTHighlightElementsInView new transparent.
b
]]]			
"
Class {
	#name : #RTHighlightElementsInView,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'view',
		'colorIndex',
		'transparency'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #initialization }
RTHighlightElementsInView >> askForPattern [
	^ TRPlatform current
		dialogRequest:
			'Enter a regular expression (leave empty to remove all previous selection)'
		initialAnswer: '*aPattern*'
]

{ #category : #initialization }
RTHighlightElementsInView >> currentColor [
	| rawColor |
	rawColor := self palette at: colorIndex + 1.
	self isNotTransparent
		ifTrue: [ ^ rawColor ].
	^ rawColor alpha: self transparency
]

{ #category : #initialization }
RTHighlightElementsInView >> getColorIndex [
	^ view attributeAt: #RTHighlightElementsInView ifAbsentPut: [ 1 ]
]

{ #category : #initialization }
RTHighlightElementsInView >> getRelevantElementsFor: string [
	^ view elements select: [ :e | string match: e model printString ]
]

{ #category : #initialization }
RTHighlightElementsInView >> highlightElementsUsing: string [
	"Highlight some elements depending on the entered string.
	String has to be a regular expression"
	string ifEmpty: [ ^ self processEmptyString ].
	(self getRelevantElementsFor: string)
		do: [ :e | 
			self rememberPreviousColorIfNecessaryFor: e.
			e trachelShape color: self currentColor ].
	self increaseColorIndex.
	view signalUpdate
]

{ #category : #initialization }
RTHighlightElementsInView >> increaseColorIndex [
	colorIndex := colorIndex + 1 \\ self palette size
]

{ #category : #initialization }
RTHighlightElementsInView >> initialize [
	super initialize.
	colorIndex := 0.
	transparency := 1.0
]

{ #category : #initialization }
RTHighlightElementsInView >> initializeElement: aView [
	| string |
	view := aView.
	view
		addMenu: 'Highlight'
		callback: [ string := self askForPattern.
			string ifNotNil:
				[ self highlightElementsUsing: string ] ]
]

{ #category : #testing }
RTHighlightElementsInView >> isNotTransparent [
	^ self transparency = 1.0
]

{ #category : #initialization }
RTHighlightElementsInView >> palette [
	^ Array with: Color blue with: Color green with: Color orange
]

{ #category : #initialization }
RTHighlightElementsInView >> processEmptyString [
	view attributeAt: #RTHighlightElementsInView ifAbsentPut: [ 1 ].
	"Should remove the color previously set"
	view elements
		do: [ :e | 
			(e hasAttribute: #prevousColorRTHighlightElementsInView)
				ifTrue: [ e trachelShape
						color: (e attributeAt: #prevousColorRTHighlightElementsInView).
					e removeAttributeAt: #prevousColorRTHighlightElementsInView ] ].
	^ self
]

{ #category : #initialization }
RTHighlightElementsInView >> rememberPreviousColorIfNecessaryFor: e [
	(e hasAttribute: #prevousColorRTHighlightElementsInView)
		ifFalse: [ e
				attributeAt: #prevousColorRTHighlightElementsInView
				put: e trachelShape color ]
]

{ #category : #accessing }
RTHighlightElementsInView >> transparency [
	^ transparency
]

{ #category : #accessing }
RTHighlightElementsInView >> transparency: aFloatBetweenZeroAndOne [
	"Transparency is useful in case objects are nested"
	transparency := aFloatBetweenZeroAndOne
]

{ #category : #configuration }
RTHighlightElementsInView >> transparent [
	transparency := 0.4
]
