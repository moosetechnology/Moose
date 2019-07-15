"
A RTSVGLink is a link (to an external browser) when clicking a certain element. 
"
Class {
	#name : #RTSVGLink,
	#superclass : #RTSVGInteraction,
	#instVars : [
		'link'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGLink class >> on: anExporter link: anHref targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; link: anHref; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #adding }
RTSVGLink >> addEventHandlers: aStream id: aString element: aRTElement center: aNumber [
	aStream
		nextPutAll: '<a xlink:href="',(self link value: aRTElement model),'" target="_blank">'.
	"return the missing closing"
	^'</a>'
]

{ #category : #adding }
RTSVGLink >> addFunctions: aStream [
	"do nothing"
]

{ #category : #adding }
RTSVGLink >> addGlobalHandlers: aStream [
	"do nothing"
]

{ #category : #accessing }
RTSVGLink >> initialize [
	link := [:a |'http://objectprofile.com/'].
	self type: 'link'.
	contained := false.
	external := false.
]

{ #category : #accessing }
RTSVGLink >> link [
	^ link
]

{ #category : #accessing }
RTSVGLink >> link: anObject [
	link := anObject
]
