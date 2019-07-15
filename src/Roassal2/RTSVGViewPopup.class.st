"
A RTSVGViewPopup is a RTView popup. As in a complete view generated from each element.
"
Class {
	#name : #RTSVGViewPopup,
	#superclass : #RTSVGPopup,
	#instVars : [
		'view'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGViewPopup class >> on: anExporter view: aRTView targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; view: aRTView; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGViewPopup class >> onClick: anExporter view: aRTView targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; click: true; view: aRTView; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #adding }
RTSVGViewPopup >> addEventHandlers: aStream id: aString element: aRTElement center: aNumber [
	aStream nextPutAll: '<g visibility="hidden">', String cr.
	RTSVGVisitor visit: (self view value: aRTElement model) on: aStream center: aNumber.
	aStream 
		nextPutAll: (self mouseAction: aString);
		nextPutAll:  '</g>'
]

{ #category : #initialization }
RTSVGViewPopup >> initialize [
	super initialize.
	view := [ :m | RTView new add: ((RTElement on: m) + (RTBox new color: Color blue; yourself))]
]

{ #category : #accessing }
RTSVGViewPopup >> view [
	^ view
]

{ #category : #accessing }
RTSVGViewPopup >> view: anObject [
	view := anObject
]
