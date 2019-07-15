"
A RTSVGPopup is any kind of popup born from a certain element.

The click refers to the posibility of activating the popup only when the element is clicked. This is disabled by default.
"
Class {
	#name : #RTSVGPopup,
	#superclass : #RTSVGInteraction,
	#instVars : [
		'click',
		'color',
		'position',
		'bounds'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGPopup class >> on: anExporter color: aColor targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; color: aColor; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGPopup class >> onClick: anExporter color: aColor targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; color: aColor; click: true; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGPopup class >> onClick: anExporter targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; click: true; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #adding }
RTSVGPopup >> addEventHandlers: aStream id: aString element: aRTElement  center: aNumber [
	self subclassResponsibility 
]

{ #category : #adding }
RTSVGPopup >> addFunctions: aStream [
	"do nothing"
]

{ #category : #adding }
RTSVGPopup >> addGlobalHandlers: aStream [
	"do nothing"
]

{ #category : #accessing }
RTSVGPopup >> bounds [
	^ bounds
]

{ #category : #accessing }
RTSVGPopup >> bounds: anObject [
	bounds := anObject
]

{ #category : #accessing }
RTSVGPopup >> click [
	^ click
]

{ #category : #accessing }
RTSVGPopup >> click: anObject [
	click := anObject
]

{ #category : #accessing }
RTSVGPopup >> color [
	^ color
]

{ #category : #accessing }
RTSVGPopup >> color: anObject [
	color := anObject
]

{ #category : #initialization }
RTSVGPopup >> initialize [
	super initialize.
	click := false.
	color := Color black.
	contained := false.
	external := true.
	self type: 'popup'.
	position := [ :element | element trachelShape position ].
]

{ #category : #adding }
RTSVGPopup >> mouseAction: aString [
	^click 
		ifTrue: ["Still does not work"
	'
    <set id="',aString,'s" attributeName="visibility" from="visible" to="hidden" begin="',aString,'.click"/>
  '			  ]
		ifFalse: [  
	'
    <set attributeName="visibility" from="hidden" to="visible" begin="',aString,'.mouseover" end="',aString,'.mouseout"/>
  ']
]

{ #category : #accessing }
RTSVGPopup >> position [
	^ position
]

{ #category : #accessing }
RTSVGPopup >> position: anObject [
	position := anObject
]

{ #category : #accessing }
RTSVGPopup >> xBound [
	^1
]

{ #category : #accessing }
RTSVGPopup >> yBound [
	^1
]
