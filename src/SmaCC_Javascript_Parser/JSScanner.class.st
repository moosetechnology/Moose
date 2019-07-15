Class {
	#name : #JSScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #'generated-initialization' }
JSScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(97 'as' #(49 #(#default))) #(97 'break' #(50 #(#default))) #(97 'case' #(51 #(#default))) #(97 'catch' #(52 #(#default))) #(97 'class' #(53 #(#default))) #(97 'const' #(54 #(#default))) #(97 'continue' #(55 #(#default))) #(97 'debugger' #(56 #(#default))) #(97 'default' #(57 #(#default))) #(97 'delete' #(58 #(#default))) #(97 'do' #(59 #(#default))) #(97 'else' #(60 #(#default))) #(97 'export' #(61 #(#default))) #(97 'extends' #(62 #(#default))) #(97 'false' #(63 #(#default))) #(97 'finally' #(64 #(#default))) #(97 'for' #(65 #(#default))) #(97 'from' #(66 #(#default))) #(97 'function' #(67 #(#default))) #(97 'get' #(68 #(#default))) #(97 'if' #(69 #(#default))) #(97 'import' #(70 #(#default))) #(97 'in' #(71 #(#default))) #(97 'instanceof' #(72 #(#default))) #(97 'let' #(73 #(#default))) #(97 'new' #(74 #(#default))) #(97 'null' #(75 #(#default))) #(97 'of' #(76 #(#default))) #(97 'return' #(77 #(#default))) #(97 'set' #(78 #(#default))) #(97 'static' #(79 #(#default))) #(97 'super' #(80 #(#default))) #(97 'switch' #(81 #(#default))) #(97 'target' #(82 #(#default))) #(97 'this' #(83 #(#default))) #(97 'throw' #(84 #(#default))) #(97 'true' #(85 #(#default))) #(97 'try' #(86 #(#default))) #(97 'typeof' #(87 #(#default))) #(97 'var' #(88 #(#default))) #(97 'void' #(89 #(#default))) #(97 'while' #(90 #(#default))) #(97 'with' #(91 #(#default))) #(97 'yield' #(92 #(#default))) #(98 'as' #(49 #(#default))) #(98 'break' #(50 #(#default))) #(98 'case' #(51 #(#default))) #(98 'catch' #(52 #(#default))) #(98 'class' #(53 #(#default))) #(98 'const' #(54 #(#default))) #(98 'continue' #(55 #(#default))) #(98 'debugger' #(56 #(#default))) #(98 'default' #(57 #(#default))) #(98 'delete' #(58 #(#default))) #(98 'do' #(59 #(#default))) #(98 'else' #(60 #(#default))) #(98 'export' #(61 #(#default))) #(98 'extends' #(62 #(#default))) #(98 'false' #(63 #(#default))) #(98 'finally' #(64 #(#default))) #(98 'for' #(65 #(#default))) #(98 'from' #(66 #(#default))) #(98 'function' #(67 #(#default))) #(98 'get' #(68 #(#default))) #(98 'if' #(69 #(#default))) #(98 'import' #(70 #(#default))) #(98 'in' #(71 #(#default))) #(98 'instanceof' #(72 #(#default))) #(98 'let' #(73 #(#default))) #(98 'new' #(74 #(#default))) #(98 'null' #(75 #(#default))) #(98 'of' #(76 #(#default))) #(98 'return' #(77 #(#default))) #(98 'set' #(78 #(#default))) #(98 'static' #(79 #(#default))) #(98 'super' #(80 #(#default))) #(98 'switch' #(81 #(#default))) #(98 'target' #(82 #(#default))) #(98 'this' #(83 #(#default))) #(98 'throw' #(84 #(#default))) #(98 'true' #(85 #(#default))) #(98 'try' #(86 #(#default))) #(98 'typeof' #(87 #(#default))) #(98 'var' #(88 #(#default))) #(98 'void' #(89 #(#default))) #(98 'while' #(90 #(#default))) #(98 'with' #(91 #(#default))) #(98 'yield' #(92 #(#default))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JSScanner >> emptySymbolTokenId [
	^ 305
]

{ #category : #generated }
JSScanner >> errorTokenId [
	^ 306
]

{ #category : #testing }
JSScanner >> hasNewlineBetween: startIndex and: endIndex [
	| position |
	position := stream position.
	[ stream position: startIndex.
	[ stream position < endIndex and: [ stream atEnd not ] ]
		whileTrue: [ | char |
			char := stream next.
			(char == Character cr or: [ char == Character lf ])
				ifTrue: [ ^ true ] ] ]
		ensure: [ stream position: position ].
	^ false
]

{ #category : #generated }
JSScanner >> identifierId [
	^ 97
]

{ #category : #generated }
JSScanner >> identifierNameId [
	^ 98
]

{ #category : #generated }
JSScanner >> jsxLTId [
	^ 108
]

{ #category : #generated }
JSScanner >> ltId [
	^ 10
]

{ #category : #generated }
JSScanner >> regular_expressionId [
	^ 102
]

{ #category : #generated }
JSScanner >> rightBraceId [
	^ 4
]

{ #category : #generated }
JSScanner >> scan1 [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scan1X13 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue:
			[ ^ self scan1X15 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scan1X12 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $*
		ifTrue:
			[ ^ self scan1X11 ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scan1X10 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scan1X9 ].
	^ self scan1X17
]

{ #category : #generated }
JSScanner >> scan10 [
	[ self recordMatch: #(101).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan11 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(101).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(101).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan12 [
	[ self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan16 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan17 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan13 [
	self recordMatch: #(102).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan15 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan14 [
	[ self recordMatch: #(102).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan15 ].
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan15 [
	self step.
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
										ifTrue: [ ^ self scan14 ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan16 [
	[ self step.
	currentCharacter == $\
		ifTrue: [ self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ ^ self scan16 ].
			^ self reportLastMatch ].
	currentCharacter == $]
		ifTrue: [ ^ self scan12 ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan17 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan18 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(96) ].
			^ self scan18 ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan19 [
	[ self recordMatch: #(101).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X1 [
	self recordMatch: #(8).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan18 ].
	^ self scan1X1X3
]

{ #category : #generated }
JSScanner >> scan1X10 [
	self recordMatch: #(34).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X11 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X12 [
	self recordMatch: #(39).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(40) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X13 [
	self recordMatch: #(46).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(47).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(48) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X14 [
	self recordMatch: #(45).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X15 [
	self recordMatch: #(42).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X16 [
	currentCharacter == $^
		ifTrue:
			[ ^ self scan1X14 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan20 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scan1X7 ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan19 ].
	(currentCharacter isSeparator
		or: [ currentCharacter = (Character value: 160)
				or: [ currentCharacter =
						(Character value: 65279) ] ])
		ifTrue:
			[ ^ self scan1X6 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X17 [
	currentCharacter == $.
		ifTrue:
			[ ^ self scan1X8 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan1X2 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(95) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scan1X5 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scan1X4 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scan1X3 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self scan1X16
]

{ #category : #generated }
JSScanner >> scan1X1X1 [
	self recordMatch: #(9).
	self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan16 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan17 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X1X2 [
	[ self recordMatch: #(96).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X1X3 [
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X1X2 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scan1X1X1 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan16 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan17 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $))
						or: [ (currentCharacter between: $+ and: $.)
								or: [ (currentCharacter between: $0 and: $<)
										or: [ (currentCharacter between: $> and: $Z)
												or: [ currentCharacter >= $] ] ] ] ] ] ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X2 [
	self recordMatch: #(101).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan19 ].
	('Bb' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ [ self recordMatch: #(101).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('Oo' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ [ self recordMatch: #(101).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue ].
			^ self reportLastMatch ].
	('Xx' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(101).
					self step.
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X3 [
	self recordMatch: #(13).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(14).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(17).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(16) ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X4 [
	self recordMatch: #(22).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(23).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(24) ].
			^ self reportLastMatch ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X5 [
	self recordMatch: #(10).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(11).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(12) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X6 [
	[ self recordMatch: #(99).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter = (Character value: 160)
				or: [ currentCharacter =
						(Character value: 65279) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X7 [
	self recordMatch: #(43).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(44) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X8 [
	self recordMatch: #(21).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(93) ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan1X9 [
	self recordMatch: #(36).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan4 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan20 [
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $?
		ifTrue: [ self step.
			currentCharacter == $$
				ifTrue: [ ^ self scan25 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan26 ].
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(104) ].
			^ self scan24 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(104) ].
	^ self scan21
]

{ #category : #generated }
JSScanner >> scan21 [
	[ self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan22 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(104) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan22 [
	self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(104) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(105) ].
	^ self scan21
]

{ #category : #generated }
JSScanner >> scan23 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ ^ self scan21 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan24 [
	[ self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan25 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan26 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(103 104) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan25 [
	self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(103 104) ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(105).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(103) ].
			^ self scan27 ].
	^ self scan24
]

{ #category : #generated }
JSScanner >> scan26 [
	self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(103).
			self step.
			currentCharacter == $$
				ifTrue: [ ^ self scan22 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan23 ].
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(104) ].
			^ self scan21 ].
	(currentCharacter == Character lf
		or: [ currentCharacter == Character cr ])
		ifTrue: [ ^ self scan27 ].
	^ self scan24
]

{ #category : #generated }
JSScanner >> scan27 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(103) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan28 [
	[ self recordMatch: #(109).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan29 ].
	currentCharacter isAlphaNumeric
		or:
			[ '$-_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan29 [
	self step.
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
										ifTrue: [ ^ self scan28 ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan3 [
	self recordMatch: #(100).
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan30 [
	[ self step.
	currentCharacter == $$
		ifTrue: [ self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(107) ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(106) ].
			^ self scan30 ].
	currentCharacter == $\
		ifTrue: [ self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ ^ self scan30 ].
			^ self reportLastMatch ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(107) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan4 [
	self step.
	currentCharacter == Character cr
		ifTrue: [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan4 ].
			(currentCharacter <= Character newPage
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	^ self scan2
]

{ #category : #generated }
JSScanner >> scan5 [
	[ self recordMatch: #(97 98).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan6 ].
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan6 [
	self step.
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
										ifTrue: [ ^ self scan5 ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan7 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan9 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan8 [
	self recordMatch: #(100).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan9 [
	self step.
	currentCharacter == Character cr
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan8 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan9 ].
			(currentCharacter <= Character newPage
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	^ self scan7
]

{ #category : #generated }
JSScanner >> scanForToken [
	scope == #jsxText
		ifTrue:
			[ ^ self scanForTokenX2 ].
	scope == #jsx
		ifTrue:
			[ ^ self scanForTokenX1 ].
	scope == #default
		ifTrue: [ ^ self scan1 ].
	scope == #template
		ifTrue: [ self step.
			currentCharacter == $/
				ifTrue:
					[ ^ self scanForTokenX3 ].
			currentCharacter == $`
				ifTrue: [ ^ self scan20 ].
			currentCharacter == $}
				ifTrue: [ ^ self scan30 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	^ self scanForTokenX1X2
]

{ #category : #generated }
JSScanner >> scanForTokenX1X1 [
	[ self recordMatch: #(99).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter = (Character value: 160)
				or: [ currentCharacter =
						(Character value: 65279) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1X2 [
	currentCharacter == $/
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(108) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $\
		ifTrue: [ ^ self scan29 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	(currentCharacter isSeparator
		or: [ currentCharacter = (Character value: 160)
				or: [ currentCharacter =
						(Character value: 65279) ] ])
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan28 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX2 [
	self step.
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(10 108) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	true
		ifTrue: [ [ self recordMatch: #(110).
			self step.
			currentCharacter <= $;
				or: [ currentCharacter == $=
						or: [ (currentCharacter between: $? and: $z)
								or: [ currentCharacter == $| or: [ currentCharacter >= $~ ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX3 [
	self step.
	currentCharacter == $[
		ifTrue: [ ^ self scan16 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan17 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $))
						or: [ (currentCharacter between: $+ and: $.)
								or: [ (currentCharacter between: $0 and: $Z)
										or: [ currentCharacter >= $] ] ] ] ] ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> semicolonId [
	^ 7
]

{ #category : #generated }
JSScanner >> slashEqualId [
	^ 9
]

{ #category : #generated }
JSScanner >> slashId [
	^ 8
]

{ #category : #generated }
JSScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment nil nil #whitespace nil nil nil #patternToken)
]
