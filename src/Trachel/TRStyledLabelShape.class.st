Class {
	#name : #TRStyledLabelShape,
	#superclass : #TRLabelShape,
	#instVars : [
		'emphasis'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #utility }
TRStyledLabelShape class >> getFontNamed: aFontName forSize: aNumber emphasis: anEmphasis [
	^ (self getFontNamed: aFontName ForSize: aNumber)
		emphasized: (anEmphasis inject: 0 into: [ :sum :next | sum + next emphasisCode ])
]

{ #category : #utility }
TRStyledLabelShape class >> widthOfText: aString fontName: aFontName fontSize: aNumber emphasis: anEmphasis [
	^ (self getFontNamed: aFontName forSize: aNumber emphasis: anEmphasis)
		widthOfString: aString
]

{ #category : #drawing }
TRStyledLabelShape >> drawOn: athensCanvas [
	"self drawEncompassingRectangleOn: athensCanvas."
	athensCanvas pathTransform
		restoreAfter:
			[ | advance cls |
			cls := TRPlatform current textEmphasisClass.
			athensCanvas pathTransform
				multiplyBy: matrix asFloatTransform;
				translateBy: ((self textWidth / -2) @ (self textHeight / 2)) asFloatPoint;
				translateBy: (0 @ self descent negated) asFloatPoint.
			athensCanvas setFont: font.
			athensCanvas setPaint: color.
			advance := athensCanvas drawString: text.
			(emphasis includes: cls underlined)
				ifTrue: [ athensCanvas drawShape: (0 @ 1 extent: advance x @ 1) ].
			(emphasis includes: cls struckOut)
				ifTrue:
					[ athensCanvas pathTransform
						translateBy: (0 @ (self textHeight / 4) negated) asFloatPoint.
					athensCanvas drawShape: (0 @ 1 extent: advance x @ 1) ] ]
]

{ #category : #accessing }
TRStyledLabelShape >> emphasis: anEmphasis [
	emphasis := anEmphasis isCollection
		ifTrue: [ anEmphasis ]
		ifFalse: [ Array with: anEmphasis ].
	self updateFont
]

{ #category : #accessing }
TRStyledLabelShape >> fontName: aFontName [
	fontName := aFontName.
	self updateFont
]

{ #category : #accessing }
TRStyledLabelShape >> fontSize: aNumber [
	fontSize := aNumber.
	self updateFont
]

{ #category : #'managing font' }
TRStyledLabelShape >> getFontNamed: aFontName ForSize: aNumber [
	^ self getFontNamed: aFontName forSize: aNumber emphasis: emphasis
]

{ #category : #'managing font' }
TRStyledLabelShape >> getFontNamed: aFontName forSize: aNumber emphasis: anEmphasis [
	^ self class getFontNamed: aFontName forSize: aNumber emphasis: anEmphasis
]

{ #category : #initialization }
TRStyledLabelShape >> initialize [
	emphasis := #().
	super initialize
]

{ #category : #'managing font' }
TRStyledLabelShape >> updateFont [
	font := self getFontNamed: fontName forSize: fontSize emphasis: emphasis
]
