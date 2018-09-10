Class {
	#name : #JSScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #'generated-initialization' }
JSScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(97 'as' #(43 #(#default #template))) #(97 'break' #(44 #(#default #template))) #(97 'case' #(45 #(#default #template))) #(97 'catch' #(46 #(#default #template))) #(97 'class' #(47 #(#default #template))) #(97 'const' #(48 #(#default #template))) #(97 'continue' #(49 #(#default #template))) #(97 'debugger' #(50 #(#default #template))) #(97 'default' #(51 #(#default #template))) #(97 'delete' #(52 #(#default #template))) #(97 'do' #(53 #(#default #template))) #(97 'else' #(54 #(#default #template))) #(97 'export' #(55 #(#default #template))) #(97 'extends' #(56 #(#default #template))) #(97 'false' #(57 #(#default #template))) #(97 'finally' #(58 #(#default #template))) #(97 'for' #(59 #(#default #template))) #(97 'from' #(60 #(#default #template))) #(97 'function' #(61 #(#default #template))) #(97 'get' #(62 #(#default #template))) #(97 'if' #(63 #(#default #template))) #(97 'import' #(64 #(#default #template))) #(97 'in' #(65 #(#default #template))) #(97 'instanceof' #(66 #(#default #template))) #(97 'let' #(67 #(#default #template))) #(97 'new' #(68 #(#default #template))) #(97 'null' #(69 #(#default #template))) #(97 'of' #(70 #(#default #template))) #(97 'return' #(71 #(#default #template))) #(97 'set' #(72 #(#default #template))) #(97 'static' #(73 #(#default #template))) #(97 'super' #(74 #(#default #template))) #(97 'switch' #(75 #(#default #template))) #(97 'target' #(76 #(#default #template))) #(97 'this' #(77 #(#default #template))) #(97 'throw' #(78 #(#default #template))) #(97 'true' #(79 #(#default #template))) #(97 'try' #(80 #(#default #template))) #(97 'typeof' #(81 #(#default #template))) #(97 'var' #(82 #(#default #template))) #(97 'void' #(83 #(#default #template))) #(97 'while' #(84 #(#default #template))) #(97 'with' #(85 #(#default #template))) #(97 'yield' #(86 #(#default #template))) #(98 'as' #(43 #(#default #template))) #(98 'break' #(44 #(#default #template))) #(98 'case' #(45 #(#default #template))) #(98 'catch' #(46 #(#default #template))) #(98 'class' #(47 #(#default #template))) #(98 'const' #(48 #(#default #template))) #(98 'continue' #(49 #(#default #template))) #(98 'debugger' #(50 #(#default #template))) #(98 'default' #(51 #(#default #template))) #(98 'delete' #(52 #(#default #template))) #(98 'do' #(53 #(#default #template))) #(98 'else' #(54 #(#default #template))) #(98 'export' #(55 #(#default #template))) #(98 'extends' #(56 #(#default #template))) #(98 'false' #(57 #(#default #template))) #(98 'finally' #(58 #(#default #template))) #(98 'for' #(59 #(#default #template))) #(98 'from' #(60 #(#default #template))) #(98 'function' #(61 #(#default #template))) #(98 'get' #(62 #(#default #template))) #(98 'if' #(63 #(#default #template))) #(98 'import' #(64 #(#default #template))) #(98 'in' #(65 #(#default #template))) #(98 'instanceof' #(66 #(#default #template))) #(98 'let' #(67 #(#default #template))) #(98 'new' #(68 #(#default #template))) #(98 'null' #(69 #(#default #template))) #(98 'of' #(70 #(#default #template))) #(98 'return' #(71 #(#default #template))) #(98 'set' #(72 #(#default #template))) #(98 'static' #(73 #(#default #template))) #(98 'super' #(74 #(#default #template))) #(98 'switch' #(75 #(#default #template))) #(98 'target' #(76 #(#default #template))) #(98 'this' #(77 #(#default #template))) #(98 'throw' #(78 #(#default #template))) #(98 'true' #(79 #(#default #template))) #(98 'try' #(80 #(#default #template))) #(98 'typeof' #(81 #(#default #template))) #(98 'var' #(82 #(#default #template))) #(98 'void' #(83 #(#default #template))) #(98 'while' #(84 #(#default #template))) #(98 'with' #(85 #(#default #template))) #(98 'yield' #(86 #(#default #template))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JSScanner >> emptySymbolTokenId [
	^ 273
]

{ #category : #generated }
JSScanner >> errorTokenId [
	^ 274
]

{ #category : #testing }
JSScanner >> hasNewlineBetween: startIndex and: endIndex [
	| position |
	position := stream position.
	[ stream position: startIndex.
	[ stream position <= endIndex and: [ stream atEnd not ] ]
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
JSScanner >> regular_expressionId [
	^ 102
]

{ #category : #generated }
JSScanner >> rightBraceId [
	^ 95
]

{ #category : #generated }
JSScanner >> scan1 [
	self recordMatch: #(1).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(2).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(3) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan10 [
	self recordMatch: #(100).
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan11 [
	self step.
	currentCharacter == Character cr
		ifTrue: [ self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan10 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan11 ].
			(currentCharacter <= Character newPage
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	^ self scan9
]

{ #category : #generated }
JSScanner >> scan12 [
	self recordMatch: #(11).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan13 [
	self recordMatch: #(14).
	self step.
	currentCharacter == $+
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan14 [
	self recordMatch: #(18).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan15 [
	self recordMatch: #(21).
	self step.
	currentCharacter == $.
		ifTrue: [ self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan16 [
	[ self recordMatch: #(101).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan17 [
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
JSScanner >> scan18 [
	self recordMatch: #(93).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan25 ].
	^ self scan18X3
]

{ #category : #generated }
JSScanner >> scan18X1 [
	self recordMatch: #(94).
	self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan20 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan24 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ])
		ifTrue: [ ^ self scan19 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan18X2 [
	[ self recordMatch: #(96).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan18X3 [
	currentCharacter == $/
		ifTrue:
			[ ^ self scan18X2 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scan18X1 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan24 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $))
						or: [ (currentCharacter between: $+ and: $.)
								or: [ (currentCharacter between: $0 and: $<)
										or: [ (currentCharacter between: $> and: $Z)
												or: [ currentCharacter >= $] ] ] ] ] ] ])
		ifTrue: [ ^ self scan19 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan19 [
	[ self step.
	currentCharacter == $/
		ifTrue: [ ^ self scan20 ].
	currentCharacter == $[
		ifTrue: [ ^ self scan23 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan24 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $.)
						or: [ (currentCharacter between: $0 and: $Z)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
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
	self recordMatch: #(102).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan22 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan21 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan21 [
	[ self recordMatch: #(102).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan22 ].
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan22 [
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
										ifTrue: [ ^ self scan21 ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan23 [
	[ self step.
	currentCharacter == $\
		ifTrue: [ self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ ^ self scan23 ].
			^ self reportLastMatch ].
	currentCharacter == $]
		ifTrue: [ ^ self scan19 ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan24 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ ^ self scan19 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan25 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(96) ].
			^ self scan25 ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan26 [
	self recordMatch: #(101).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan16 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan27 ].
	('Bb' includes: currentCharacter)
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ [ self recordMatch: #(101).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan17 ].
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
JSScanner >> scan27 [
	[ self recordMatch: #(101).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan16 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan17 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan28 [
	self recordMatch: #(24).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(25).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan29 [
	self recordMatch: #(28).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(29).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(31) ].
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
	self recordMatch: #(32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(34).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			currentCharacter == $>
				ifTrue: [ self recordMatch: #(36).
					self step.
					currentCharacter == $=
						ifTrue: [ ^ self recordAndReportMatch: #(37) ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan31 [
	self recordMatch: #(41).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan32 [
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan34 ].
	currentCharacter == $?
		ifTrue: [ self step.
			currentCharacter == $$
				ifTrue: [ ^ self scan37 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan38 ].
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(104) ].
			^ self scan36 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan35 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(104) ].
	^ self scan33
]

{ #category : #generated }
JSScanner >> scan33 [
	[ self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan34 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan35 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(104) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan34 [
	self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(104) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(105) ].
	^ self scan33
]

{ #category : #generated }
JSScanner >> scan35 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ ^ self scan33 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan36 [
	[ self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan37 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan38 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(103 104) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan37 [
	self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(103 104) ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(105).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(103) ].
			^ self scan39 ].
	^ self scan36
]

{ #category : #generated }
JSScanner >> scan38 [
	self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(103).
			self step.
			currentCharacter == $$
				ifTrue: [ ^ self scan34 ].
			currentCharacter == $\
				ifTrue: [ ^ self scan35 ].
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(104) ].
			^ self scan33 ].
	(currentCharacter == Character lf
		or: [ currentCharacter == Character cr ])
		ifTrue: [ ^ self scan39 ].
	^ self scan36
]

{ #category : #generated }
JSScanner >> scan39 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(103) ].
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
JSScanner >> scan40 [
	self recordMatch: #(88).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(89) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(90) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan41 [
	[ self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan42 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan43 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(107) ].
	true ] whileTrue
]

{ #category : #generated }
JSScanner >> scan42 [
	self step.
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(107) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(106) ].
	^ self scan41
]

{ #category : #generated }
JSScanner >> scan43 [
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ ^ self scan41 ].
	^ self reportLastMatch
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
	self recordMatch: #(4).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan8 [
	self recordMatch: #(6).
	self step.
	currentCharacter == $&
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scan9 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan10 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan11 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForToken [
	scope == #template
		ifTrue:
			[ ^ self scanForTokenX1 ].
	scope == #default
		ifTrue: [ self step.
			currentCharacter == $!
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $"
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $%
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $&
				ifTrue: [ ^ self scan8 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan9 ].
			currentCharacter == $(
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			currentCharacter == $*
				ifTrue: [ ^ self scan12 ].
			currentCharacter == $+
				ifTrue: [ ^ self scan13 ].
			currentCharacter == $,
				ifTrue: [ ^ self recordAndReportMatch: #(17) ].
			currentCharacter == $-
				ifTrue: [ ^ self scan14 ].
			currentCharacter == $.
				ifTrue: [ ^ self scan15 ].
			currentCharacter == $/
				ifTrue: [ ^ self scan18 ].
			currentCharacter == $0
				ifTrue: [ ^ self scan26 ].
			currentCharacter == $:
				ifTrue: [ ^ self recordAndReportMatch: #(23) ].
			currentCharacter == $;
				ifTrue: [ ^ self recordAndReportMatch: #(92) ].
			currentCharacter == $<
				ifTrue: [ ^ self scan28 ].
			currentCharacter == $=
				ifTrue: [ ^ self scan29 ].
			currentCharacter == $>
				ifTrue: [ ^ self scan30 ].
			currentCharacter == $?
				ifTrue: [ ^ self recordAndReportMatch: #(38) ].
			currentCharacter == $[
				ifTrue: [ ^ self recordAndReportMatch: #(39) ].
			currentCharacter == $\
				ifTrue: [ ^ self scan6 ].
			currentCharacter == $]
				ifTrue: [ ^ self recordAndReportMatch: #(40) ].
			currentCharacter == $^
				ifTrue: [ ^ self scan31 ].
			currentCharacter == $`
				ifTrue: [ ^ self scan32 ].
			currentCharacter == ${
				ifTrue: [ ^ self recordAndReportMatch: #(87) ].
			currentCharacter == $|
				ifTrue: [ ^ self scan40 ].
			currentCharacter == $}
				ifTrue: [ ^ self recordAndReportMatch: #(95) ].
			currentCharacter == $~
				ifTrue: [ ^ self recordAndReportMatch: #(91) ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan27 ].
			currentCharacter isSeparator
				ifTrue:
					[ ^ self scanForTokenX2 ].
			(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
				ifTrue: [ ^ self scan5 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $&
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $*
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $+
		ifTrue: [ ^ self scan13 ].
	^ self scanForTokenX1X4
]

{ #category : #generated }
JSScanner >> scanForTokenX1X1 [
	self recordMatch: #(95).
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan42 ].
	currentCharacter == $\
		ifTrue: [ ^ self scan43 ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(107) ].
	^ self scan41
]

{ #category : #generated }
JSScanner >> scanForTokenX1X2 [
	[ self recordMatch: #(99).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1X3 [
	currentCharacter == $\
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(40) ].
	currentCharacter == $^
		ifTrue: [ ^ self scan31 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan32 ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(87) ].
	currentCharacter == $|
		ifTrue: [ ^ self scan40 ].
	currentCharacter == $}
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(91) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan27 ].
	currentCharacter isSeparator
		ifTrue:
			[ ^ self scanForTokenX1X2 ].
	(currentCharacter isLetter or: [ '$_' includes: currentCharacter ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> scanForTokenX1X4 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $-
		ifTrue: [ ^ self scan14 ].
	currentCharacter == $.
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $/
		ifTrue: [ ^ self scan18 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan26 ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(92) ].
	currentCharacter == $<
		ifTrue: [ ^ self scan28 ].
	currentCharacter == $=
		ifTrue: [ ^ self scan29 ].
	currentCharacter == $>
		ifTrue: [ ^ self scan30 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(39) ].
	^ self scanForTokenX1X3
]

{ #category : #generated }
JSScanner >> scanForTokenX2 [
	[ self recordMatch: #(99).
	self step.
	currentCharacter isSeparator ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JSScanner >> semicolonId [
	^ 92
]

{ #category : #generated }
JSScanner >> slashEqualId [
	^ 94
]

{ #category : #generated }
JSScanner >> slashId [
	^ 93
]

{ #category : #generated }
JSScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment nil nil #whitespace nil nil nil #patternToken)
]
