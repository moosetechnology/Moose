Class {
	#name : #DelphiFormScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #'generated-initialization' }
DelphiFormScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(20 'END' 12) #(20 'FALSE' 19) #(20 'INHERITED' 13) #(20 'INLINE' 14) #(20 'ITEM' 15) #(20 'OBJECT' 16) #(20 'TRUE' 19))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
DelphiFormScanner >> bytesId [
	^ 24
]

{ #category : #generated }
DelphiFormScanner >> emptySymbolTokenId [
	^ 50
]

{ #category : #generated }
DelphiFormScanner >> errorTokenId [
	^ 51
]

{ #category : #generated }
DelphiFormScanner >> keywordFor: aString [
	^ aString asUppercase
]

{ #category : #generated }
DelphiFormScanner >> scan1 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan10 [
	self recordMatch: #(22 24).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	((currentCharacter between: $A and: $F)
		or: [ currentCharacter between: $a and: $f ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan11 [
	self recordMatch: #(20).
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ self recordMatch: #(20 24).
			self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan11 ] ].
	currentCharacter isLetter
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter isAlphaNumeric ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan12 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(26).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
DelphiFormScanner >> scan2 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(23).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
DelphiFormScanner >> scan3 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(22).
			self step.
			currentCharacter isDigit ] whileTrue ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan4 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(22).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan5 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(22).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan6 [
	self recordMatch: #(21).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan3 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan6X1 ].
	('Dd' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(22 24).
			self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(24).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan9 ].
			('+-' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			((currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	((currentCharacter between: $A and: $C)
		or: [ currentCharacter == $F
				or: [ (currentCharacter between: $a and: $c)
						or: [ currentCharacter == $f ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan6X1 [
	self recordMatch: #(21 24).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan3 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	('Dd' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(22).
			self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan10 ].
			('+-' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			((currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	((currentCharacter between: $A and: $C)
		or: [ currentCharacter == $F
				or: [ (currentCharacter between: $a and: $c)
						or: [ currentCharacter == $f ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan7 [
	self recordMatch: #(24).
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan8 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scan9 [
	self recordMatch: #(22).
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	((currentCharacter between: $A and: $F)
		or: [ currentCharacter between: $a and: $f ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scanForToken [
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self scanForTokenX4
]

{ #category : #generated }
DelphiFormScanner >> scanForTokenX1 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(21).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter isDigit ] whileTrue.
			('Dd' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan4 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scanForTokenX2 [
	[ self recordMatch: #(25).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> scanForTokenX3 [
	[ self recordMatch: #(20).
	self step.
	currentCharacter isAlphaNumeric ] whileTrue
]

{ #category : #generated }
DelphiFormScanner >> scanForTokenX4 [
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $`
		ifTrue: [ ^ self scan12 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX2 ].
	((currentCharacter between: $A and: $F)
		or: [ currentCharacter between: $a and: $f ])
		ifTrue: [ ^ self scan11 ].
	currentCharacter isLetter
		ifTrue:
			[ self scanForTokenX3 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiFormScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace #patternToken)
]

{ #category : #generated }
DelphiFormScanner >> tokenClass [
	^SmaCCCaseInsensitiveToken
]
