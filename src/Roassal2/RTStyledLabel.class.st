"
I am a label that can be emphasized.

!! Usage

==label emphasis: TextEmphasis bold.==
or
==label emphasis: { TextEmphasis bold . TextEmphasis underlined }==

!! Example

[[[
|v|
v := RTView new.
l := RTStyledLabel new
	color: Color black;
	emphasis: TextEmphasis underlined;
	elementOn: 'Underlined Text'.
v add: l.
v open.
]]]
"
Class {
	#name : #RTStyledLabel,
	#superclass : #RTLabel,
	#instVars : [
		'emphasis'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #'public - configuration' }
RTStyledLabel >> bold [
	emphasis add: self emphasisClass bold
]

{ #category : #accessing }
RTStyledLabel >> emphasis: aValueOrOneArgBlock [
	self emphasisElement: [ :anElement | aValueOrOneArgBlock rtValue: anElement model ]
]

{ #category : #'private - utility' }
RTStyledLabel >> emphasisClass [

	^ TRPlatform current textEmphasisClass
]

{ #category : #accessing }
RTStyledLabel >> emphasisElement: aValueOrBlock [
	emphasis := aValueOrBlock
]

{ #category : #accessing }
RTStyledLabel >> emphasisFor: anElement [
	^ emphasis rtValue: anElement
]

{ #category : #initialization }
RTStyledLabel >> initialize [
	super initialize.
	emphasis := OrderedCollection new
]

{ #category : #'public - configuration' }
RTStyledLabel >> italic [
	emphasis add: self emphasisClass italic
]

{ #category : #'public - configuration' }
RTStyledLabel >> narrow [
	emphasis add: self emphasisClass narrow
]

{ #category : #'public - configuration' }
RTStyledLabel >> normal [
	emphasis add: self emphasisClass normal
]

{ #category : #'public - configuration' }
RTStyledLabel >> struckOut [
	emphasis add: self emphasisClass struckOut
]

{ #category : #'trachel shape production' }
RTStyledLabel >> trachelShapeForOneLine: anElement [
	| shape |
	shape := TRStyledLabelShape new.
	shape
		text: (self textFor: anElement);
		color: (self colorFor: anElement);
		position: anElement position;
		fontSize: (self heightFor: anElement);
		fontName: (self fontNameFor: anElement);
		emphasis: (self emphasisFor: anElement).
	^ shape
]

{ #category : #'public - configuration' }
RTStyledLabel >> underlined [
	emphasis add: self emphasisClass underlined
]

{ #category : #'trachel shape production' }
RTStyledLabel >> updateFor: anElement trachelShape: trachelShape [
	trachelShape isNil
		ifTrue: [ ^ self ].
	trachelShape
		color: (self colorFor: anElement);
		fontSize: (self heightFor: anElement);
		fontName: (self fontNameFor: anElement);
		emphasis: (self emphasisFor: anElement);
		position: anElement position;
		text: (self textFor: anElement) on: anElement position;
		rotateByDegrees: (self rotationFor: anElement);
		scaleBy: (self scaleFor: anElement)
]

{ #category : #rendering }
RTStyledLabel >> widthFor: anElement [
	^ TRStyledLabelShape
		widthOfText: (self textFor: anElement)
		fontName: (self fontNameFor: fontName)
		fontSize: (self heightFor: anElement)
		emphasis: (self emphasisFor: anElement)
]
