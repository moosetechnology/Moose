Class {
	#name : #SmaCCRewriteTestScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Rewrite_Engine_Tests'
}

{ #category : #generated }
SmaCCRewriteTestScanner >> emptySymbolTokenId [
	^ 13
]

{ #category : #generated }
SmaCCRewriteTestScanner >> errorTokenId [
	^ 14
]

{ #category : #generated }
SmaCCRewriteTestScanner >> scanForToken [
	self step.
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $/
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $`
		ifTrue: [ [ self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			true ] whileTrue ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(8).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(9).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SmaCCRewriteTestScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil #whitespace #patternToken)
]
