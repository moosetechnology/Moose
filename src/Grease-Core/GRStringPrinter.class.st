Class {
	#name : #GRStringPrinter,
	#superclass : #GRPrinter,
	#instVars : [
		'trim',
		'length',
		'pad',
		'character'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #accessing }
GRStringPrinter >> character: aCharacter [
	"The character to pad the string with."
	
	character := aCharacter
]

{ #category : #initialization }
GRStringPrinter >> initialize [
	super initialize.
	self character: $ ; length: nil.
	self trimNone; padNone
]

{ #category : #accessing }
GRStringPrinter >> length: anInteger [
	"The maximal size of the string, or the size to pad to."

	length := anInteger
]

{ #category : #padding }
GRStringPrinter >> padCenter [
	"Pad to the center."
	
	pad := #pad:center:to:
]

{ #category : #padding }
GRStringPrinter >> padLeft [
	"Pad to the left."
	
	pad := #pad:left:to:
]

{ #category : #padding }
GRStringPrinter >> padNone [
	"Do not pad the input."
	
	pad := nil
]

{ #category : #padding }
GRStringPrinter >> padRight [
	"Pad to the right."
	
	pad := #pad:right:to:
]

{ #category : #printing }
GRStringPrinter >> print: anObject on: aStream [ 
	| string |
	string := anObject greaseString.
	trim isNil
		ifFalse: [ string := string perform: trim ].
	length isNil ifFalse: [
		length < string size 
			ifTrue: [ string := string copyFrom: 1to: length ].
		(pad isNil or: [ character isNil ])
			ifFalse: [ string := self perform: pad with: string with: character with: length ] ].
	aStream nextPutAll: string
]

{ #category : #trimming }
GRStringPrinter >> trimBoth [
	"Trim to the left and to the right."

	trim := #trimBoth
]

{ #category : #trimming }
GRStringPrinter >> trimLeft [
	"Trim to the left and to the right."

	trim := #trimLeft
]

{ #category : #trimming }
GRStringPrinter >> trimNone [
	"Do not trim the input."

	trim := nil
]

{ #category : #trimming }
GRStringPrinter >> trimRight [
	"Trim to the left and to the right."

	trim := #trimRight
]
