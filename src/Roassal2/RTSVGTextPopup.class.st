"
A RTSVGTextPopup is a simple text popup.

"
Class {
	#name : #RTSVGTextPopup,
	#superclass : #RTSVGPopup,
	#instVars : [
		'text',
		'font',
		'fontSize'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #'as yet unclassified' }
RTSVGTextPopup class >> on: anExporter text: aString color: aColor font: aFont size: aNumber targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; text: aString; color: aColor; font: aFont; fontSize: aNumber; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGTextPopup class >> on: anExporter text: aString color: aColor size: aNumber targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; text: aString; color: aColor; fontSize: aNumber; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGTextPopup class >> on: anExporter text: aString font: aFont size: aNumber targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; text: aString; font: aFont; fontSize: aNumber; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGTextPopup class >> on: anExporter text: aString targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; text: aString; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGTextPopup class >> onClick: anExporter text: aString color: aColor size: aNumber targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; text: aString; color: aColor; fontSize: aNumber; click: true; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #'as yet unclassified' }
RTSVGTextPopup class >> onClick: anExporter text: aString targets: aRTShape [
	| generator |
	generator := [ :e |  self new target: e; text: aString; click: true; yourself ].
	self on: anExporter targets: aRTShape generator: generator
]

{ #category : #adding }
RTSVGTextPopup >> addEventHandlers: aStream id: aString element: aRTElement center: aPoint [
	|rText xOverflow yOverflow x y converter|
	rText := (self text value: aRTElement model) asString.
	x := aPoint x.
	y := aPoint y.
	xOverflow := aPoint x - bounds width + ((TRPlatform current familyName: self font size: self fontSize)  widthOfString: rText).
	yOverflow := aPoint y - bounds height + self fontSize.
	xOverflow >= 0 ifTrue: [ x:= x - xOverflow ].
	yOverflow >= 0 ifTrue: [ y:= y - yOverflow ].
	converter := RTSVGStringConverter new.
	aStream
		nextPutAll: String cr,'<text id="',aString,'pop" x="',x asString,'" y="',y asString,'" font-size="',self fontSize asString,'" style="fill:',self color asHTMLColor,'" visibility="hidden"><tspan font-family = "',self font,'">',(converter convertString: rText),(self mouseAction: aString),'</tspan></text>'
]

{ #category : #configuration }
RTSVGTextPopup >> defaultFont [
	^'Arial, Helvetica, sans-serif'
]

{ #category : #accessing }
RTSVGTextPopup >> font [
	^ font
]

{ #category : #accessing }
RTSVGTextPopup >> font: anObject [
	font := anObject
]

{ #category : #accessing }
RTSVGTextPopup >> fontSize [
	^ fontSize
]

{ #category : #accessing }
RTSVGTextPopup >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #initialization }
RTSVGTextPopup >> initialize [
	super initialize.
	text := #asString.
	fontSize := 12.
	font := self defaultFont.
]

{ #category : #accessing }
RTSVGTextPopup >> text [
	^text
]

{ #category : #accessing }
RTSVGTextPopup >> text: aSymbolOrBlock [
	text := aSymbolOrBlock
]

{ #category : #accessing }
RTSVGTextPopup >> yBound [
	^fontSize
]
