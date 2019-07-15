"
A RTSVGBoxedTextPopup is a text popup, contained in a square box.

This boxing, in SVG, supports many features, not included in this class.


"
Class {
	#name : #RTSVGBoxedTextPopup,
	#superclass : #RTSVGTextPopup,
	#instVars : [
		'backgroundColor',
		'borderColor'
	],
	#category : #'Roassal2-Exporter-SVG'
}

{ #category : #adding }
RTSVGBoxedTextPopup >> addEventHandlers: aStream id: aString element: aRTElement center: aPoint [
	|rText xOverflow yOverflow x y rectangle converter|
	rText := (self text value: aRTElement model) asString.
	x := aPoint x.
	y := aPoint y.
	xOverflow := aPoint x - bounds width + ((TRPlatform current fontFamilyName: self font size: self fontSize)  widthOfString: rText).
	yOverflow := aPoint y - bounds height + self fontSize.
	xOverflow >= 0 ifTrue: [ x:= x - xOverflow ].
	yOverflow >= 0 ifTrue: [ y:= y - yOverflow ].
	rectangle := TRLabelShape new text: rText; encompassingRectangle.
	converter := RTSVGStringConverter new.
	aStream
		nextPutAll: '<g id="',aString,'pop" " visibility="hidden">';
		nextPutAll: String cr,'<rect x="',(x - (rectangle width/10)) asString,'" y="',(y - (3 *rectangle height / 4))  asString,'" width="',rectangle width asString,'" height="',rectangle height asString,'"  style="fill:',self backgroundColor asHTMLColor,'; stroke:',self borderColor asHTMLColor,';stroke-width:1"/>';
		nextPutAll: String cr,'<text id="',aString,'pop" x="',x asString,'" y="',y asString,'" font-size="',self fontSize asString,'" style="fill:',self color asHTMLColor,'"><tspan font-family = "',self font,'">',(converter convertString: rText),'</tspan></text>';
		nextPutAll: String cr, (self mouseAction: aString), '</g>' 
]

{ #category : #accessing }
RTSVGBoxedTextPopup >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
RTSVGBoxedTextPopup >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #accessing }
RTSVGBoxedTextPopup >> borderColor [
	^ borderColor
]

{ #category : #accessing }
RTSVGBoxedTextPopup >> borderColor: anObject [
	borderColor := anObject
]

{ #category : #configuration }
RTSVGBoxedTextPopup >> defaultBackgroundColor [
	^ Color veryLightGray.
]

{ #category : #configuration }
RTSVGBoxedTextPopup >> defaultBorderColor [
	^ Color black.
]

{ #category : #initialization }
RTSVGBoxedTextPopup >> initialize [
	super initialize.
	self backgroundColor: self defaultBackgroundColor.
	self borderColor: self defaultBorderColor.
]
