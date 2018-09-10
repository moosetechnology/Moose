Class {
	#name : #TRLabelShape,
	#superclass : #TRShape,
	#instVars : [
		'text',
		'font',
		'fontSize',
		'fontName',
		'cachedWidth',
		'cachedHeight'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #configuration }
TRLabelShape class >> defaultFamilyFontName [
	^ TRPlatform current defaultFamilyFontName.
]

{ #category : #configuration }
TRLabelShape class >> defaultFontSize [
	^ 12
]

{ #category : #configuration }
TRLabelShape class >> familyFontName [
	"Default Family font"
	^ self defaultFamilyFontName
]

{ #category : #utility }
TRLabelShape class >> getFontForSize: aNumber [
	^ self getFontNamed: self familyFontName ForSize: aNumber

]

{ #category : #utility }
TRLabelShape class >> getFontNamed: aFontName ForSize: aNumber [
	"
	self getFontNamed: 'Arial'ForSize: 70
	"

	^ TRPlatform current fontFamilyName: aFontName pointSize: aNumber
]

{ #category : #utility }
TRLabelShape class >> widthOfText: aString fontName: aFontName fontSize: aNumber [
	^ (self getFontNamed: aFontName ForSize: aNumber) widthOfString: aString
]

{ #category : #utility }
TRLabelShape class >> widthOfText: aString fontSize: aNumber [
	^ (self getFontForSize: aNumber) widthOfString: aString
]

{ #category : #visitor }
TRLabelShape >> accept: aVisitor [
	aVisitor visitLabelShape: self
]

{ #category : #accessing }
TRLabelShape >> ascent [
	^ font ascent
]

{ #category : #private }
TRLabelShape >> basicEncompassingRectangle [
	| w h |
	w := self textWidth.
	h := self textHeight.
	^ ((w / -2) @ (h / -2)) extent: (w @ h)
]

{ #category : #accessing }
TRLabelShape >> center [
	^ self position
]

{ #category : #initialization }
TRLabelShape >> defaultFontSize [
	^ self class defaultFontSize
]

{ #category : #accessing }
TRLabelShape >> descent [
	^ font descent
]

{ #category : #drawing }
TRLabelShape >> drawOn: athensCanvas [
	"self drawEncompassingRectangleOn: athensCanvas."
	athensCanvas pathTransform restoreAfter: [
		"Draw the label centered on the position"
		athensCanvas pathTransform
			multiplyBy: matrix asFloatTransform;
			translateBy: ((self textWidth / -2) @ (self textHeight / 2)) asFloatPoint;
			translateBy: (0 @ self descent negated) asFloatPoint.
		athensCanvas setFont: font.
		athensCanvas setPaint: self themedColor.
		athensCanvas drawString: text
	]
]

{ #category : #accessing }
TRLabelShape >> encompassingRectangle [
	^ self transformedEncompassingRectangle 
]

{ #category : #accessing }
TRLabelShape >> extent [
	^ self encompassingRectangle extent
]

{ #category : #accessing }
TRLabelShape >> extent: newExtent [
	"Labels cannot have their extent changed."
]

{ #category : #accessing }
TRLabelShape >> font [
	^ font
]

{ #category : #accessing }
TRLabelShape >> fontName [
	"Return the font name used when drawing"
	^ fontName
]

{ #category : #accessing }
TRLabelShape >> fontName: aFontName [
	"Set the font name used by the label. You can check the expression
		FontChooser new fontListStrings.
	to know the different font installed on the system"
	fontName := aFontName.
	font := self getFontNamed: fontName ForSize: fontSize.
	self resetCache
]

{ #category : #accessing }
TRLabelShape >> fontSize [
	^ fontSize
]

{ #category : #accessing }
TRLabelShape >> fontSize: aNumber [
	font := self getFontNamed: fontName ForSize: aNumber.
	fontSize := aNumber.
	self resetCache
]

{ #category : #'managing font' }
TRLabelShape >> getFontForSize: aNumber [

	^ self getFontNamed: fontName ForSize: aNumber
]

{ #category : #'managing font' }
TRLabelShape >> getFontNamed: aFontName ForSize: aNumber [
	^ self class getFontNamed: aFontName ForSize: aNumber
]

{ #category : #accessing }
TRLabelShape >> height [

	^ self encompassingRectangle height
]

{ #category : #testing }
TRLabelShape >> includesPoint: aPoint [
	^ self encompassingRectangle containsPoint: aPoint
]

{ #category : #initialization }
TRLabelShape >> initialize [
	super initialize.
	text := 'Trachel label'.
	fontName := self class familyFontName.
	self fontSize: self defaultFontSize
]

{ #category : #initialization }
TRLabelShape >> resetCache [
	cachedWidth := nil.
	cachedHeight := nil
]

{ #category : #accessing }
TRLabelShape >> text [
	^ text
]

{ #category : #accessing }
TRLabelShape >> text: aText [
	| oldExtent newExtent |
	oldExtent := self extent.
	text := aText.
	self resetCache.
	newExtent := self extent.
	(newExtent ~= oldExtent) ifTrue: [ 
		self triggerCallbacksForNewExtent: newExtent oldExtent: oldExtent ].

]

{ #category : #public }
TRLabelShape >> text: aText on: aPosition [
	self text: aText.
	self position: aPosition
]

{ #category : #private }
TRLabelShape >> textHeight [
	"without any transformation"
	^ cachedHeight ifNil: [ cachedHeight := font height ]
]

{ #category : #private }
TRLabelShape >> textWidth [
	"without any transformation"
	"font widthOfString: is a really expensive operation, so we cache it"
	^ cachedWidth ifNil: [ cachedWidth := font widthOfString: text ]
]

{ #category : #public }
TRLabelShape >> translateLeftTo: aPosition [
	self translateTo: (aPosition - ((self width / -2) @ 0) ) asIntegerPoint
]

{ #category : #public }
TRLabelShape >> translateRightTo: aPosition [
	self translateTo: (aPosition + ((self width / -2) @ 0) ) asIntegerPoint
]

{ #category : #accessing }
TRLabelShape >> width [

	^ self encompassingRectangle width
]

{ #category : #'managing font' }
TRLabelShape >> widthOfText: aString fontSize: aNumber [
	^ (self getFontForSize: aNumber) widthOfString: aString
]
