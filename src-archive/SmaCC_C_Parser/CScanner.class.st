Class {
	#name : #CScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'typeNames'
	],
	#category : #'SmaCC_C_Parser'
}

{ #category : #'generated-initialization' }
CScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(76 'auto' 38) #(76 'break' 39) #(76 'case' 40) #(76 'char' 41) #(76 'const' 42) #(76 'continue' 43) #(76 'default' 44) #(76 'do' 45) #(76 'double' 46) #(76 'else' 47) #(76 'enum' 48) #(76 'extern' 49) #(76 'float' 50) #(76 'for' 51) #(76 'goto' 52) #(76 'if' 53) #(76 'int' 54) #(76 'long' 55) #(76 'register' 56) #(76 'return' 57) #(76 'short' 58) #(76 'signed' 59) #(76 'sizeof' 60) #(76 'static' 61) #(76 'struct' 62) #(76 'switch' 63) #(76 'typedef' 64) #(76 'union' 65) #(76 'unsigned' 66) #(76 'void' 67) #(76 'volatile' 68) #(76 'while' 69))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #testing }
CScanner class >> needsLineNumbers [
	^ true
]

{ #category : #generated }
CScanner >> CONSTANTId [
	^ 77
]

{ #category : #scanning }
CScanner >> IDENTIFIER [
	| name |
	name := outputStream contents.
	matchActions := (typeNames includes: name)
		ifTrue: [ Array with: self TypeNameId ]
		ifFalse: [ Array with: self IDENTIFIERId ].
	outputStream reset.
	^ SmaCCToken value: name start: start ids: matchActions
]

{ #category : #generated }
CScanner >> IDENTIFIERId [
	^ 76
]

{ #category : #generated }
CScanner >> TypeNameId [
	^ 149
]

{ #category : #scanning }
CScanner >> addTypeName: aString [
	typeNames add: aString
]

{ #category : #generated }
CScanner >> emptySymbolTokenId [
	^ 150
]

{ #category : #generated }
CScanner >> errorTokenId [
	^ 151
]

{ #category : #'initialize-release' }
CScanner >> initialize [
	super initialize.
	typeNames := Set new
]

{ #category : #generated }
CScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(78) ].
	currentCharacter == $\
		ifTrue: [ self step.
			^ self scan1 ].
	true ] whileTrue
]

{ #category : #generated }
CScanner >> scan10 [
	[ self recordMatch: #(77).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('LUlu' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scan2 [
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	(currentCharacter <= $!
		or: [ (currentCharacter between: $# and: $[)
				or: [ currentCharacter >= $] ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scan3 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ [ self recordMatch: #(77).
			self step.
			currentCharacter == $' ] whileTrue.
			currentCharacter == $\
				ifTrue: [ ^ self scan4 ].
			(currentCharacter <= $!
				or: [ (currentCharacter between: $# and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	currentCharacter <= $!
		or: [ (currentCharacter between: $# and: $&)
				or: [ (currentCharacter between: $( and: $[)
						or: [ currentCharacter >= $] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scan4 [
	self step.
	^ self scan3
]

{ #category : #generated }
CScanner >> scan5 [
	[ self recordMatch: #(77).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('FLfl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scan6 [
	self step.
	('+-' includes: currentCharacter)
		ifTrue: [ self step ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scan7 [
	[ self recordMatch: #(77).
	self step.
	currentCharacter isDigit ] whileTrue.
	('FLfl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scan8 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(75) ].
			^ self scan8 ].
	true ] whileTrue
]

{ #category : #generated }
CScanner >> scan9 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX18 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scanForTokenX12 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scanForTokenX17 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX5 ].
	^ self scanForTokenX20
]

{ #category : #generated }
CScanner >> scanForTokenX1 [
	self recordMatch: #(77).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan9 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan6 ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(77).
					self step.
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue.
					('LUlu' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(77) ] ].
			^ self reportLastMatch ].
	('LUlu' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX10 [
	self recordMatch: #(12).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX11 [
	self recordMatch: #(5).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX12 [
	self recordMatch: #(3).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX13 [
	[ self recordMatch: #(83).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX14 [
	self recordMatch: #(36).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX15 [
	self recordMatch: #(29).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX16 [
	self recordMatch: #(23).
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX17 [
	self recordMatch: #(10).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX18 [
	self recordMatch: #(1).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX19 [
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX13 ].
	((currentCharacter between: $A and: $K)
		or: [ (currentCharacter between: $M and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue:
			[ self scanForTokenX4 ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX2 [
	self recordMatch: #(76).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(76).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX20 [
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX16 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX15 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $L
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	^ self scanForTokenX19
]

{ #category : #generated }
CScanner >> scanForTokenX3 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(26).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(27) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX4 [
	[ self recordMatch: #(76).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
CScanner >> scanForTokenX5 [
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
CScanner >> scanForTokenX6 [
	self recordMatch: #(31).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(33).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(34) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX7 [
	self recordMatch: #(70).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(71) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(72) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX8 [
	self recordMatch: #(21).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> scanForTokenX9 [
	self recordMatch: #(20).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(74) ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
CScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment #IDENTIFIER nil nil nil nil nil nil #whitespace)
]
