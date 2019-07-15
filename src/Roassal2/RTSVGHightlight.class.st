"
A RTSVGHightlight is hightlight of SVG elements.

Highlighting of edges is NOT supported.
"
Class {
	#name : #RTSVGHightlight,
	#superclass : #RTSVGInteraction,
	#instVars : [
		'color'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGHightlight class >> on: anExporter color: aColor targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; color: aColor; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #adding }
RTSVGHightlight >> addEventHandlers: aStream id: aString element: element center: aNumber [
	aStream
		nextPutAll: 'hightlight '
]

{ #category : #adding }
RTSVGHightlight >> addFunctions: aStream [
	| attr  |
	attr := self targetColorAttribute.
	aStream
		nextPutAll: '			var color;
			function hightlight(evt) {
				if (evt.target.id == "BackDrop")
					return;
				if (!evt.target.classList.contains("hightlight"))
					return;
				var affected = evt.target;
				if (color == affected.style["',attr,'"] || color == null) {
					color = affected.style["',attr,'"];
					affected.style["',attr,'"] = "',self color asHTMLColor,'";
				}
			};
			
			function unHightlight(evt) {
				if (evt.target.id == "BackDrop")
					return;
				if (!evt.target.classList.contains("hightlight"))
					return;
				var affected = evt.target;
				affected.style["',attr,'"] = color;
				color = null;
			}';
		nextPutAll: String cr.
]

{ #category : #adding }
RTSVGHightlight >> addGlobalHandlers: aStream [
	aStream
		nextPutAll: '
	onmouseover="hightlight(evt)"
	onmouseout="unHightlight(evt)"
'
]

{ #category : #accessing }
RTSVGHightlight >> color [
	^ color
]

{ #category : #accessing }
RTSVGHightlight >> color: anObject [
	color := anObject
]

{ #category : #initialization }
RTSVGHightlight >> initialize [
	color := Color red.
	contained := true.
	external := false.
	self type: 'hightlight'.
]
