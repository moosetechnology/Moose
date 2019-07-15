Class {
	#name : #LineScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Line_Parser'
}

{ #category : #generated }
LineScanner >> emptySymbolTokenId [
	^ 7
]

{ #category : #generated }
LineScanner >> errorTokenId [
	^ 8
]

{ #category : #generated }
LineScanner >> scanForToken [
	self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == Character cr
		ifTrue: [ self recordMatch: #(2).
			self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			^ self reportLastMatch ].
	true
		ifTrue: [ [ self recordMatch: #(1).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]
