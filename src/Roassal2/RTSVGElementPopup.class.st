"
A RTSVGElementPopup is a single element popup. 

The element may be any translatable Roassal Shape.
"
Class {
	#name : #RTSVGElementPopup,
	#superclass : #RTSVGPopup,
	#instVars : [
		'element'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGElementPopup >> addEventHandlers: aStream id: aString element: aRTElement  center: aNumber [
	| visitor myElement|
	myElement := (self element value: aRTElement ).
	aStream nextPutAll: '<g visibility="hidden">', String cr.
	visitor := RTSVGVisitor new stream: aStream; center: aNumber; yourself.
	visitor canvas: myElement encompassingRectangle.
	visitor visitElement: myElement.
	aStream 
		nextPutAll: (self mouseAction: aString);
		nextPutAll:  '</g>'
]

{ #category : #accessing }
RTSVGElementPopup >> element [
	^ element
]

{ #category : #accessing }
RTSVGElementPopup >> element: anObject [
	element := anObject
]

{ #category : #initialization }
RTSVGElementPopup >> initialize [
	super initialize.
	element := [ :m | (RTElement  on: m) + (RTBox new color: Color blue; yourself)]
]
