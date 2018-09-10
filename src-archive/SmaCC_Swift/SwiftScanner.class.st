Class {
	#name : #SwiftScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Swift'
}

{ #category : #'generated-initialization' }
SwiftScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(90 '->' 7) #(90 '...' 9) #(90 '==' 14) #(86 'Protocol' 18) #(86 'Type' 19) #(86 '__COLUMN__' 23) #(86 '__FILE__' 24) #(86 '__FUNCTION__' 25) #(86 '__LINE__' 26) #(86 'as' 27) #(86 'associativity' 28) #(86 'break' 29) #(86 'case' 30) #(86 'class' 31) #(86 'continue' 32) #(86 'convenience' 33) #(86 'default' 34) #(86 'deinit' 35) #(86 'didSet' 36) #(86 'do' 37) #(86 'dynamicType' 38) #(86 'else' 39) #(86 'enum' 40) #(86 'extension' 41) #(86 'fallthrough' 42) #(86 'for' 43) #(86 'func' 44) #(86 'get' 45) #(86 'if' 46) #(86 'import' 47) #(86 'in' 48) #(86 'infix' 49) #(86 'init' 50) #(86 'inout' 51) #(86 'is' 52) #(86 'left' 53) #(86 'let' 54) #(86 'mutating' 55) #(86 'none' 56) #(86 'nonmutating' 57) #(86 'operator' 58) #(86 'override' 59) #(86 'postfix' 60) #(86 'precedence' 61) #(86 'prefix' 62) #(86 'protocol' 63) #(86 'return' 64) #(86 'right' 65) #(86 'self' 66) #(86 'set' 67) #(86 'static' 68) #(86 'struct' 69) #(86 'subscript' 70) #(86 'super' 71) #(86 'switch' 72) #(86 'typealias' 73) #(86 'unowned' 74) #(86 'var' 77) #(86 'weak' 78) #(86 'where' 79) #(86 'while' 80) #(86 'willSet' 81))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
SwiftScanner >> emptySymbolTokenId [
	^ 365
]

{ #category : #generated }
SwiftScanner >> errorTokenId [
	^ 366
]

{ #category : #generated }
SwiftScanner >> scan1 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(89) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $!)
						or: [ (currentCharacter between: $# and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan10 [
	self recordMatch: #(86).
	self step.
	currentCharacter == $o
		ifTrue:
			[ ^ self scan10X1 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $n)
								or: [ currentCharacter between: $p and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan10X1 [
	self recordMatch: #(86).
	self step.
	currentCharacter == $w
		ifTrue:
			[ ^ self scan10X1X1 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $v)
								or: [ currentCharacter between: $x and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan10X1X1 [
	self recordMatch: #(86).
	self step.
	currentCharacter == $n
		ifTrue:
			[ ^ self scan10X1X1X1 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $m)
								or: [ currentCharacter between: $o and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan10X1X1X1 [
	self recordMatch: #(86).
	self step.
	currentCharacter == $e
		ifTrue: [ self recordMatch: #(86).
			self step.
			currentCharacter == $d
				ifTrue: [ self recordMatch: #(86).
					self step.
					currentCharacter == $(
						ifTrue: [ self step.
							currentCharacter == $s
								ifTrue: [ (self scanForString: 'afe)')
										ifTrue: [ ^ self recordAndReportMatch: #(75) ].
									^ self reportLastMatch ].
							currentCharacter == $u
								ifTrue: [ (self scanForString: 'nsafe)')
										ifTrue: [ ^ self recordAndReportMatch: #(76) ] ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ [ self recordMatch: #(86).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_
								or: [ (currentCharacter between: $a and: $c)
										or: [ currentCharacter between: $e and: $z ] ] ] ])
				ifTrue: [ [ self recordMatch: #(86).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $d)
								or: [ currentCharacter between: $f and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan1X1 [
	self step.
	currentCharacter == $U
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
	currentCharacter == $u
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $x
		ifTrue: [ ^ self scan3 ].
	('"(0\nrt' includes: currentCharacter)
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan2 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan3 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan3 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ ^ self scan1 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan4 [
	[ self recordMatch: #(90).
	self step.
	currentCharacter == $*
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ self recordMatch: #(85 90).
					self step.
					(currentCharacter == $!
						or: [ (currentCharacter between: $% and: $&)
								or: [ (currentCharacter between: $* and: $+)
										or: [ (currentCharacter between: $- and: $/)
												or: [ (currentCharacter between: $< and: $>)
														or: [ '^|~' includes: currentCharacter ] ] ] ] ])
						ifTrue: [ [ self recordMatch: #(90).
							self step.
							currentCharacter == $!
								or: [ (currentCharacter between: $% and: $&)
										or: [ (currentCharacter between: $* and: $+)
												or: [ (currentCharacter between: $- and: $/)
														or: [ (currentCharacter between: $< and: $>)
																or: [ '^|~' includes: currentCharacter ] ] ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			(currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ currentCharacter == $+
								or: [ (currentCharacter between: $- and: $.)
										or: [ (currentCharacter between: $< and: $>)
												or: [ '^|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self scan4 ].
			^ self scan5 ].
	currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ currentCharacter == $+
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or: [ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue.
	^ self scan5
]

{ #category : #generated }
SwiftScanner >> scan5 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(85) ].
			^ self scan5 ].
	true ] whileTrue
]

{ #category : #generated }
SwiftScanner >> scan6 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(88).
			self step.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan7 ].
			currentCharacter isDigit or: [ currentCharacter == $_ ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan7 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(88).
			self step.
			currentCharacter isDigit or: [ currentCharacter == $_ ] ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(88).
					self step.
					currentCharacter isDigit or: [ currentCharacter == $_ ] ]
						whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan8 [
	[ self recordMatch: #(87 88).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan6 ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan7 ].
	currentCharacter isDigit or: [ currentCharacter == $_ ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scan9 [
	self recordMatch: #(86).
	self step.
	currentCharacter == $n
		ifTrue: [ ^ self scan10 ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_
						or: [ (currentCharacter between: $a and: $m)
								or: [ currentCharacter between: $o and: $z ] ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX14 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scanForTokenX2 ].
	^ self scanForTokenX16
]

{ #category : #generated }
SwiftScanner >> scanForTokenX1 [
	self recordMatch: #(90).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ currentCharacter == $+
						or: [ (currentCharacter between: $- and: $.)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX10 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ [ self step.
			currentCharacter == $`
				ifTrue: [ ^ self recordAndReportMatch: #(86) ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX11 [
	self recordMatch: #(22 86).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX12 [
	[ self recordMatch: #(86).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX13 [
	[ self recordMatch: #(84).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX14 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(86).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX15 [
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan8 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX13 ].
	((currentCharacter between: $A and: $Z)
		or: [ (currentCharacter between: $a and: $t)
				or: [ currentCharacter between: $v and: $z ] ])
		ifTrue:
			[ ^ self scanForTokenX12 ].
	(currentCharacter == $%
		or: [ (currentCharacter between: $* and: $+)
				or:
					[ '-^|~' includes: currentCharacter ] ])
		ifTrue:
			[ self scanForTokenX9 ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX16 [
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $=
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter == $_
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $`
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $u
		ifTrue: [ ^ self scan9 ].
	^ self scanForTokenX15
]

{ #category : #generated }
SwiftScanner >> scanForTokenX1X1 [
	[ self recordMatch: #(85 90).
	self step.
	currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue.
	^ self scanForTokenX1X1X2
]

{ #category : #generated }
SwiftScanner >> scanForTokenX1X1X1 [
	[ self recordMatch: #(85).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue
]

{ #category : #generated }
SwiftScanner >> scanForTokenX1X1X2 [
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter
						between: (Character value: 14)
						and: Character space)
						or: [ (currentCharacter between: $" and: $$)
								or: [ (currentCharacter between: $' and: $))
										or: [ currentCharacter == $,
												or: [ (currentCharacter between: $0 and: $;)
														or: [ (currentCharacter between: $? and: $])
																or: [ (currentCharacter between: $_ and: ${)
																		or: [ currentCharacter == $}
																				or: [ currentCharacter >= (Character value: 127) ] ] ] ] ] ] ] ] ] ])
		ifTrue:
			[ self scanForTokenX1X1X1 ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX2 [
	self recordMatch: #(87 88).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan6 ].
	currentCharacter == $b
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ [ self recordMatch: #(87).
					self step.
					(currentCharacter between: $0 and: $1)
						or: [ currentCharacter == $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $o
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ [ self recordMatch: #(87).
					self step.
					(currentCharacter between: $0 and: $7)
						or: [ currentCharacter == $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $x
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(87).
					self step.
					currentCharacter == $.
						ifTrue: [ [ self step.
							('Pp' includes: currentCharacter)
								ifTrue: [ ^ self scan7 ].
							currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $f ] ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					('Pp' includes: currentCharacter)
						ifTrue: [ ^ self scan7 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $f ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan7 ].
	(currentCharacter isDigit or: [ currentCharacter == $_ ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX3 [
	self recordMatch: #(15 90).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX4 [
	self recordMatch: #(13 90).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX5 [
	self recordMatch: #(12 90).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX6 [
	self recordMatch: #(8 90).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX7 [
	self recordMatch: #(3 90).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX8 [
	self recordMatch: #(1 90).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
SwiftScanner >> scanForTokenX9 [
	[ self recordMatch: #(90).
	self step.
	currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue
]

{ #category : #generated }
SwiftScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace #comment)
]
