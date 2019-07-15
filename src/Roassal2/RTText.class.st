"
I am a shape describing a possibly multiline text.

If you need just a simple label, use RTLabel instead.
"
Class {
	#name : #RTText,
	#superclass : #RTAbstractElementShape,
	#instVars : [
		'text',
		'font',
		'fontSize',
		'shouldWrap'
	],
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #accessing }
RTText >> doNotWrapText [
	shouldWrap := false
]

{ #category : #accessing }
RTText >> font: aValueOrOneArgBlock [
	font := self valueRetrieverOn: aValueOrOneArgBlock
]

{ #category : #accessing }
RTText >> fontFor: anElement [
	^ font rtValue: anElement
]

{ #category : #accessing }
RTText >> fontSize: aValueOrOneArgBlock [
	fontSize := self valueRetrieverOn: aValueOrOneArgBlock
]

{ #category : #accessing }
RTText >> fontSizeFor: anElement [
	^ fontSize rtValue: anElement
]

{ #category : #initialization }
RTText >> initialize [
	super initialize.
	self text: [ :model | model asString ].
	shouldWrap := false.
	font := RTTheme current textFont.
	fontSize := RTTheme current textSize.
	color := RTTheme current textColor
]

{ #category : #accessing }
RTText >> text: aTextOrBlock [
	text := self valueRetrieverOn: aTextOrBlock
]

{ #category : #accessing }
RTText >> textFor: anElement [
	^ text rtValue: anElement
]

{ #category : #hooks }
RTText >> trachelShapeClass [
	^ TRTextShape
]

{ #category : #hooks }
RTText >> updateFor: anElement trachelShape: trachelShape [
	^ trachelShape
		text: (self wrap: (self textFor: anElement) to: (self widthFor: anElement));
		font: (self fontFor: anElement);
		fontSize: (self fontSizeFor: anElement);
		color: (self colorFor: anElement);
		position: anElement position;
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement);
		yourself
]

{ #category : #accessing }
RTText >> valueRetrieverOn: aValueOrAOneArgBlock [
	^ [ :anElement | aValueOrAOneArgBlock rtValue: anElement model ]
]

{ #category : #wrapping }
RTText >> wrap: aText to: maxWidth [
	"This is a naive brute-force implementation of line-wrapping algorithm.

	There is also TxAthensCharacterWrappingStrategy that is more advanced, but requires the use of 	TxModel/Spans, etc."

	| string words lineWidth lines line ww |
	shouldWrap
		ifFalse: [ ^ aText ].
	string := aText copyReplaceAll: String cr with: ' '.
	words := string splitOn: ' '.
	lineWidth := 0.
	lines := OrderedCollection new.
	line := OrderedCollection new.
	lines add: line.
	words
		do: [ :word | 
			ww := font widthOfString: word.
			lineWidth = 0
				ifTrue: [ line add: word.
					lineWidth := lineWidth + ww ]
				ifFalse: [ ww + lineWidth > maxWidth
						ifTrue: [ lineWidth := 0.
							line := OrderedCollection new.
							lines add: line ].
					line add: word.
					lineWidth := lineWidth + ww ] ].
	^ (lines collect: [ :each | each joinUsing: ' ' ]) joinUsing: String cr
]

{ #category : #accessing }
RTText >> wrapText [
	shouldWrap := true
]
