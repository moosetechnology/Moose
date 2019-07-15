Class {
	#name : #JavaScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Java'
}

{ #category : #'generated-initialization' }
JavaScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(105 'abstract' 42) #(105 'assert' 43) #(105 'boolean' 44) #(105 'break' 45) #(105 'byte' 46) #(105 'case' 47) #(105 'catch' 48) #(105 'char' 49) #(105 'class' 50) #(105 'continue' 51) #(105 'default' 52) #(105 'do' 53) #(105 'double' 54) #(105 'else' 55) #(105 'enum' 56) #(105 'extends' 57) #(105 'false' 101) #(105 'final' 58) #(105 'finally' 59) #(105 'float' 60) #(105 'for' 61) #(105 'if' 62) #(105 'implements' 63) #(105 'import' 64) #(105 'instanceof' 65) #(105 'int' 66) #(105 'interface' 67) #(105 'long' 68) #(105 'native' 69) #(105 'new' 70) #(105 'null' 104) #(105 'package' 71) #(105 'private' 72) #(105 'protected' 73) #(105 'public' 74) #(105 'return' 75) #(105 'short' 76) #(105 'static' 77) #(105 'strictfp' 78) #(105 'super' 79) #(105 'switch' 80) #(105 'synchronized' 81) #(105 'this' 82) #(105 'throw' 83) #(105 'throws' 84) #(105 'transient' 85) #(105 'true' 101) #(105 'try' 86) #(105 'void' 87) #(105 'volatile' 88) #(105 'while' 89))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JavaScanner >> GREATER_THANId [
	^ 96
]

{ #category : #generated }
JavaScanner >> SIGNED_RIGHT_SHIFTId [
	^ 97
]

{ #category : #generated }
JavaScanner >> UNSIGNED_RIGHT_SHIFTId [
	^ 98
]

{ #category : #generated }
JavaScanner >> emptySymbolTokenId [
	^ 327
]

{ #category : #generated }
JavaScanner >> errorTokenId [
	^ 328
]

{ #category : #generated }
JavaScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(103) ].
	currentCharacter == $\
		ifTrue: [ self step.
			currentCharacter == $u
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ self step.
											(currentCharacter isDigit
												or: [ (currentCharacter between: $A and: $F)
														or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self scan1 ] ] ] ].
					^ self reportLastMatch ].
			(('"''' includes: currentCharacter)
				or: [ (currentCharacter between: $0 and: $7)
						or: [ '\bfnrt' includes: currentCharacter ] ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
JavaScanner >> scan10 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(108).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
JavaScanner >> scan2 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(102) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan3 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(102) ].
	(currentCharacter between: $0 and: $7)
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan4 [
	[ self recordMatch: #(100).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan5 [
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan6 [
	[ self recordMatch: #(100).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan7 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(107) ].
			^ self scan7 ].
	true ] whileTrue
]

{ #category : #generated }
JavaScanner >> scan8 [
	self recordMatch: #(99).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(99).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan4 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan9 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(99) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(100) ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(99).
					self step.
					currentCharacter == $.
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ [ self step.
									('Pp' includes: currentCharacter)
										ifTrue: [ ^ self scan5 ].
									currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
							^ self reportLastMatch ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(99) ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scan9 [
	[ self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX17 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX16 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $'
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX15 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	^ self scanForTokenX20
]

{ #category : #generated }
JavaScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $\
		ifTrue: [ self step.
			currentCharacter == $u
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ self step.
											(currentCharacter isDigit
												or: [ (currentCharacter between: $A and: $F)
														or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self scan2 ] ] ] ].
					^ self reportLastMatch ].
			(currentCharacter between: $0 and: $3)
				ifTrue: [ self step.
					currentCharacter == $'
						ifTrue: [ ^ self recordAndReportMatch: #(102) ].
					(currentCharacter between: $0 and: $7)
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ].
			(currentCharacter between: $4 and: $7)
				ifTrue: [ ^ self scan3 ].
			('"''\bfnrt' includes: currentCharacter)
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	(currentCharacter <= $&
		or: [ (currentCharacter between: $( and: $[)
				or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX10 [
	self recordMatch: #(5).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX11 [
	[ self recordMatch: #(106).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX12 [
	self recordMatch: #(40).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX13 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX14 [
	self recordMatch: #(24).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX15 [
	self recordMatch: #(10).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX16 [
	self recordMatch: #(3).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX17 [
	self recordMatch: #(1).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX18 [
	[ self recordMatch: #(105).
	self step.
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue
]

{ #category : #generated }
JavaScanner >> scanForTokenX19 [
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan10 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(90) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(95) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX3 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX11 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue:
			[ self scanForTokenX18 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX2 [
	self recordMatch: #(22).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(107).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX20 [
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX13 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	^ self scanForTokenX19
]

{ #category : #generated }
JavaScanner >> scanForTokenX3 [
	[ self recordMatch: #(99).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan4 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(100) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX4 [
	self recordMatch: #(96).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(97).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(34) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(98).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(35) ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX5 [
	self recordMatch: #(16).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX6 [
	self recordMatch: #(27).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(28).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(29) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX7 [
	self recordMatch: #(91).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(92) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(93) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX8 [
	self recordMatch: #(20).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(21) ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> scanForTokenX9 [
	self recordMatch: #(12).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	^ self reportLastMatch
]

{ #category : #generated }
JavaScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace #comment #patternToken)
]
