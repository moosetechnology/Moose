"
A DCTRStyledLineShape is line with possibility of being dashed, dotted, etc.

solid - dashes: nil
dotted - dashes: #(""fill"" 1 ""gap"" 2)
dashed - dashes: #(""fill"" 6 ""gap"" 4)
dashdot - dashes: #(""fill"" 6 ""gap"" 3 ""fill"" 1 ""gap"" 3)
"
Class {
	#name : #TRStyledLineShape,
	#superclass : #TRLineShape,
	#instVars : [
		'dashes',
		'capStyle'
	],
	#category : #'Trachel-Shapes'
}

{ #category : #drawing }
TRStyledLineShape >> capStyle [
	^ capStyle ifNil: [ #capButt ]
]

{ #category : #drawing }
TRStyledLineShape >> capStyle: aStyle [
	self assert: [ aStyle isNil or: [ #(capRound capButt capSquare) includes: aStyle ] ].
	capStyle := aStyle
]

{ #category : #drawing }
TRStyledLineShape >> dashes: anArrayOfNumeric [
	dashes := anArrayOfNumeric
]

{ #category : #drawing }
TRStyledLineShape >> drawOn: athensCanvas [
	athensCanvas pathTransform
		restoreAfter: [ athensCanvas setShape: self path.
			(athensCanvas setStrokePaint: self themedColor)
				width: width;
				perform: self capStyle;
				dashes: dashes offset: 0.
			athensCanvas draw ]
]
