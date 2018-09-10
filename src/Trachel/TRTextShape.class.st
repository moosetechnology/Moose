Class {
	#name : #TRTextShape,
	#superclass : #TRShape,
	#instVars : [
		'text',
		'font'
	],
	#category : #'Trachel-MorphSpecific'
}

{ #category : #visitor }
TRTextShape >> accept: aVisitor [
	aVisitor visitTextShape: self
]

{ #category : #private }
TRTextShape >> basicEncompassingRectangle [
	| wh |
	wh := self extentOf: text asString.
	^ wh / -2 extent: wh
]

{ #category : #drawing }
TRTextShape >> drawOn: athensCanvas [
	| spacing |
	spacing := self fontMetrics fontHeight.
	"self drawEncompassingRectangleOn: athensCanvas."
	athensCanvas pathTransform
		restoreAfter: [ | e |
			e := self extent.
			athensCanvas pathTransform
				multiplyBy: matrix asFloatTransform;
				translateBy: e / (-2 @ -2).
			athensCanvas setFont: font.
			athensCanvas setPaint: color.
			athensCanvas pathTransform translateBy: 0 @ font ascent.
			text lines
				do: [ :line | 
					athensCanvas drawString: line.
					athensCanvas pathTransform translateBy: 0 @ spacing ] ]
]

{ #category : #accessing }
TRTextShape >> encompassingRectangle [
	^ self transformedEncompassingRectangle 
]

{ #category : #accessing }
TRTextShape >> extent [
	^ self encompassingRectangle extent
]

{ #category : #private }
TRTextShape >> extentOf: aText [
	| lines metrics maxWidth |
	lines := aText lines.
	lines ifEmpty: [ ^ 0 @ 0 ].
	metrics := self fontMetrics.
	maxWidth := lines
		max: [ :line | 
			| e |
			e := metrics extentsOf: line.
			e width + e x_bearing ].
	^ maxWidth asFloat @ (lines size * metrics fontHeight)
]

{ #category : #accessing }
TRTextShape >> font [
	^ font
]

{ #category : #accessing }
TRTextShape >> font: aFont [
	font := aFont
]

{ #category : #accessing }
TRTextShape >> fontMetrics [
	^ TRPlatform current fontMetricsClass new
		font: self font;
		yourself
]

{ #category : #accessing }
TRTextShape >> fontName: aFamilyName [
	font := TRPlatform current fontFamilyName: aFamilyName pointSize: font pointSize
]

{ #category : #accessing }
TRTextShape >> fontSize: aNumber [
	font := TRPlatform current fontFamilyName: font familyName pointSize: aNumber
]

{ #category : #testing }
TRTextShape >> includesPoint: aPoint [
	^ self encompassingRectangle containsPoint: aPoint
]

{ #category : #accessing }
TRTextShape >> initialize [
	super initialize.
	font := TRLabelShape getFontForSize: 10
]

{ #category : #accessing }
TRTextShape >> text [
	^ text
]

{ #category : #accessing }
TRTextShape >> text: aText [
	text := aText
]
