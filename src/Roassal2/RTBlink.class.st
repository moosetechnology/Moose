"
RTBlink is an interaction to make element blink. You simply need to invoke  ""RTBlink on: aRoassalElement""

Here is an example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
v := RTView new.
v @ RTDraggableView.
shape := RTBox new width: [ :cls | cls numberOfVariables * 5  max: 5 ]; height: [ :cls | cls numberOfMethods sqrt * 2 ].
es := shape elementsOn: Collection withAllSubclasses.
v addAll: es.
RTFlowLayout on: es.
RTMetricNormalizer new
	elements: es;
	normalizeColor: #numberOfLinesOfCode.
	
es when: TRMouseClick do: [ :event | RTBlink new color: Color blue; on: event element ].
v
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

And a larger example:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
""Set here the classes you wish to visualize""
classes := Collection withAllSubclasses.

v := RTView new.
v @ RTDraggableView.
shape := RTBox new width: [ :cls | cls numberOfVariables * 5  max: 5 ]; height: [ :cls | cls numberOfMethods sqrt * 2 ].
es := shape elementsOn: classes.
v addAll: es.
RTFlowLayout on: es.
RTMetricNormalizer new
	elements: es;
	normalizeColor: #numberOfLinesOfCode.

""Set here the classes you wish to visualize""
labels := (RTLabel new height: 8) elementsOn: classes.
RTFlowLayout new gapSize: 0; on: labels.
v addAll: labels.
TRConstraint move: labels onTheRightOf: es.
labels translateBy: 20 @ 0.

labels @ RTHighlightable.
labels when: TRMouseClick do: [ :event | RTBlink new color: Color blue; on: (es elementFromModel: event element model) ].

es @ RTHighlightable.
es when: TRMouseClick do: [ :event | RTBlink new color: Color blue; on: (labels elementFromModel: event element model) ].
v
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
"
Class {
	#name : #RTBlink,
	#superclass : #RTInteraction,
	#instVars : [
		'color'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #configuration }
RTBlink class >> defaultColor [
	^ Color red
]

{ #category : #util }
RTBlink class >> highlight: element [
	self highlight: element color: self defaultColor
]

{ #category : #util }
RTBlink class >> highlight: element color: aColor [
	self set: element color: aColor
]

{ #category : #public }
RTBlink class >> highlightElements: elements [
	^ elements do: [ :el | self highlight: el ] 
 
]

{ #category : #public }
RTBlink class >> highlightElements: elements color: aColor [
	^ elements do: [ :el | self highlight: el color: aColor ] 
 
]

{ #category : #public }
RTBlink class >> highlightIncomingEdgesOf: element [
	"Blink all the edges that leave the node element"
	element view elementsAsEdge 
		do: [ :edg | (edg to == element) ifTrue: [ self highlight: edg ] ].
]

{ #category : #public }
RTBlink class >> highlightOutgoingEdgesOf: element [
	"Blink all the edges that leave the node element"
	element view elementsAsEdge 
		do: [ :edg | (edg from == element) ifTrue: [ self highlight: edg ] ].
]

{ #category : #public }
RTBlink class >> incomingEdgesOf: element [
	"Blink all the edges that leave the node element"
	element view edges 
		do: [ :edg | (edg from == element) ifTrue: [ RTBlink on: edg ] ].
]

{ #category : #testing }
RTBlink class >> isBlinking: element [
	^ element attributes includesKey: #oldColor
]

{ #category : #testing }
RTBlink class >> isHighlighted: element [
	^ element attributes includesKey: #oldColor
]

{ #category : #public }
RTBlink class >> on: element [

	^ self new on: element
]

{ #category : #public }
RTBlink class >> on: element in: view [
	| anim |
	anim := self on: element.
	view addAnimation: anim.
	anim start
]

{ #category : #public }
RTBlink class >> outgoingEdgesOf: element [
	"Blink all the edges that leave the node element"
	element view edges 
		do: [ :edg | (edg to == element) ifTrue: [ RTBlink on: edg ] ].
]

{ #category : #util }
RTBlink class >> set: element color: aColor [
	| shape |
	shape := element shape.
	(element attributes includesKey: #oldColor)
		ifFalse: 
			[ element attributes at: #oldColor put: element trachelShape color.
				element trachelShape
					 color: aColor;
					 signalUpdate ]
]

{ #category : #util }
RTBlink class >> unhighlight: element [
	| shape |
	(self isHighlighted: element) ifFalse: [ ^ self ].
	shape := element trachelShape.
	shape color: (element attributes at: #oldColor).
	element attributes removeKey: #oldColor. 
	element trachelShape signalUpdate
]

{ #category : #public }
RTBlink class >> unhighlightElements: elements [
	^ elements do: [ :el | self unhighlight: el ] 
 
]

{ #category : #public }
RTBlink class >> unhighlightOutgoingEdgesOf: element [
	"Blink all the edges that leave the node element"
	element view elementsAsEdge 
		do: [ :edg | (edg from == element) ifTrue: [ self unhighlight: edg ] ].
]

{ #category : #accessing }
RTBlink >> color [
	"Return a color, a symbol or a block"
	^ color
]

{ #category : #accessing }
RTBlink >> color: aColorOrABlockOrASymbol [
	color := aColorOrABlockOrASymbol
]

{ #category : #configuration }
RTBlink >> defaultColor [
	^ self class defaultColor
]

{ #category : #util }
RTBlink >> highlight: element [
	^ self class highlight: element
]

{ #category : #util }
RTBlink >> highlight: element color: aColor [
	^ self class highlight: element color: aColor
]

{ #category : #initialization }
RTBlink >> initialize [
	super initialize.
	color := self defaultColor.
]

{ #category : #initialization }
RTBlink >> initializeElement: element [
	| anim |
	self highlight: element color: (color rtValue: element).
	anim := RTNopAnimation new
		waitFor: self nbOfSecondsLightOn after: [ self unhighlight: element ].
	element view addAnimation: anim.
	anim start.
	^ anim
]

{ #category : #testing }
RTBlink >> isHighlighted: element [
	^ self class isHighlighted: element
]

{ #category : #configuration }
RTBlink >> nbOfSecondsLightOn [
	^ 1
]

{ #category : #'instance creation' }
RTBlink >> on: element [
	^ self initializeElement: element
]

{ #category : #util }
RTBlink >> set: element color: aColor [
	^ self class set: element color: aColor
]

{ #category : #util }
RTBlink >> unhighlight: element [
	^ self class unhighlight: element
]
