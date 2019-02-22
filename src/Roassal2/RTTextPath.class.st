"
I am a simple class to generate text in roassal with Athens cairo that uses the textPathCommand from roassal
"
Class {
	#name : #RTTextPath,
	#superclass : #RTLabel,
	#instVars : [
		'outlineWidth',
		'outlineColor'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #accessing }
RTTextPath >> colorFor: element [
	| res |
	res := super colorFor: element.
	res isColor ifFalse: [ 
		res := Color colorFrom: res ].
	^ res
]

{ #category : #initialization }
RTTextPath >> initialize [
	super initialize.
	outlineWidth := 1.
	outlineColor := self defaultColor.
]

{ #category : #accessing }
RTTextPath >> outlineColor: aValueOrAOneArgBlock [
	self outlineColorElement: [ :e | aValueOrAOneArgBlock rtValue: e model ].
]

{ #category : #accessing }
RTTextPath >> outlineColorElement [
	^ outlineColor
]

{ #category : #accessing }
RTTextPath >> outlineColorElement: aValueOrAOneArgBlock [
	outlineColor := aValueOrAOneArgBlock
]

{ #category : #accessing }
RTTextPath >> outlineColorFor: element [
	| res |
	res := outlineColor rtValue: element.
	res isColor ifFalse: [ res := Color colorFrom: res ].
	^ res
]

{ #category : #accessing }
RTTextPath >> outlineWidth [
	^ outlineWidth
]

{ #category : #accessing }
RTTextPath >> outlineWidth: aValueOrAOneArgBlock [
	self outlineWidthElement: [ :e | aValueOrAOneArgBlock rtValue: e model ].
]

{ #category : #accessing }
RTTextPath >> outlineWidthElement: aValueOrAOneArgBlock [
	outlineWidth := aValueOrAOneArgBlock
]

{ #category : #accessing }
RTTextPath >> outlineWidthFor: element [
	^ outlineWidth rtValue: element
]

{ #category : #'trachel shape production' }
RTTextPath >> trachelShapeForOneLine: anElement [
	| shape |
	shape := TRTextPath new.
	shape
		text: (self textFor: anElement);
		color: (self colorFor: anElement);
		position: anElement position;
		fontSize: (self heightFor: anElement);
		fontName: (self fontNameFor: anElement);
		outlineColor: (self outlineColorFor: anElement);
		outlineWidth: (self outlineWidthFor: anElement).
	^ shape
]
