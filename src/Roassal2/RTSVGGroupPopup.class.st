"
A RTSVGGroupPopup is a RTGroup popup. 
"
Class {
	#name : #RTSVGGroupPopup,
	#superclass : #RTSVGPopup,
	#instVars : [
		'group'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGGroupPopup class >> on: anExporter targets: aRTShape group: aGroupBlock [
	| generator |
	generator := [ :e |  self new target: e; group: aGroupBlock;  yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #adding }
RTSVGGroupPopup >> addEventHandlers: aStream id: aString element: aRTElement center: aNumber [
	| visitor myGroup |
	myGroup := self group.
	aStream nextPutAll: '<g visibility="hidden" id="';
		nextPutAll: aString;
		nextPutAll: '">';
		nextPutAll: String cr.
	visitor := RTSVGVisitor new stream: aStream; center: aNumber; yourself.
	visitor canvas: myGroup encompassingRectangle.
	visitor visitGroup: myGroup.
	aStream 
		nextPutAll:  '</g>'
]

{ #category : #accessing }
RTSVGGroupPopup >> group [
	^ group
]

{ #category : #accessing }
RTSVGGroupPopup >> group: anObject [
	group := anObject
]

{ #category : #initialization }
RTSVGGroupPopup >> initialize [
	super initialize.
	group := [ :m | RTGroup new add: ((RTElement on: m) + (RTBox new color: Color blue; yourself)); yourself]
]
