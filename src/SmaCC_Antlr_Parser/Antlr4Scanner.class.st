Class {
	#name : #Antlr4Scanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #'generated-initialization' }
Antlr4Scanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(45 'catch' #(27 #(#default))) #(45 'channels' #(28 #(#default))) #(45 'finally' #(29 #(#default))) #(45 'fragment' #(30 #(#default))) #(45 'grammar' #(31 #(#default))) #(45 'import' #(32 #(#default))) #(45 'lexer' #(33 #(#default))) #(45 'locals' #(34 #(#default))) #(45 'mode' #(35 #(#default))) #(45 'options' #(36 #(#default))) #(45 'parser' #(37 #(#default))) #(45 'private' #(38 #(#default))) #(45 'protected' #(39 #(#default))) #(45 'public' #(40 #(#default))) #(45 'returns' #(41 #(#default))) #(45 'throws' #(42 #(#default))) #(45 'tokens' #(43 #(#default))))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #private }
Antlr4Scanner >> actionBlock [
	| code |
	code := String with: currentCharacter.
	[ code := code , (stream upTo: $}).
	self canParse: code ]
		whileFalse: [ stream atEnd
				ifTrue: [ ^ self scannerError ].
			code := code , '}' ].
	matchActions := Array with: self actionBlockId.
	stream position: stream position - 1.
	self scope: #default.
	^ self createTokenFor: code
]

{ #category : #generated }
Antlr4Scanner >> actionBlockId [
	^ 1
]

{ #category : #private }
Antlr4Scanner >> argActionBlock [
	| code |
	code := String with: currentCharacter.
	[ code := code , (stream upTo: $]).
	self canParse: code ]
		whileFalse: [ stream atEnd
				ifTrue: [ ^ self scannerError ].
			code := code , ']' ].
	matchActions := Array with: self argActionBlockId.
	stream position: stream position - 1.
	self scope: #default.
	^ self createTokenFor: code
]

{ #category : #generated }
Antlr4Scanner >> argActionBlockId [
	^ 2
]

{ #category : #private }
Antlr4Scanner >> canParse: aString [
	| count scanner |
	count := 0.
	scanner := JavaScanner on: (ReadStream on: aString).
	scanner contents
		do: [ :each | 
			(#('''' '"') includes: each value)
				ifTrue: [ ^ false ].
			each value = '{'
				ifTrue: [ count := count + 1 ].
			each value = '}'
				ifTrue: [ count := count - 1 ] ].
	^ count = 0
]

{ #category : #generated }
Antlr4Scanner >> emptySymbolTokenId [
	^ 151
]

{ #category : #generated }
Antlr4Scanner >> errorTokenId [
	^ 152
]

{ #category : #generated }
Antlr4Scanner >> scan1 [
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scan1X6 ].
	^ self scan1X11
]

{ #category : #generated }
Antlr4Scanner >> scan1X1 [
	self step.
	currentCharacter == $*
		ifTrue: [ self step.
			currentCharacter == $*
				ifTrue: [ ^ self scan4 ].
			^ self scan3 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(49).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X10 [
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $~
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan1X9 ].
	(currentCharacter between: $A and: $Z)
		ifTrue:
			[ ^ self scan1X3 ].
	(currentCharacter between: $a and: $z)
		ifTrue:
			[ ^ self scan1X2 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ self scan1X7 ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X11 [
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scan1X8 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scan1X5 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scan1X1 ].
	currentCharacter == $0
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scan1X4 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self scan1X10
]

{ #category : #generated }
Antlr4Scanner >> scan1X2 [
	[ self recordMatch: #(45).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X3 [
	[ self recordMatch: #(44).
	self step.
	currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X4 [
	self recordMatch: #(24).
	self step.
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X5 [
	self recordMatch: #(15).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X6 [
	self recordMatch: #(21).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X7 [
	[ self recordMatch: #(50).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue
]

{ #category : #generated }
Antlr4Scanner >> scan1X8 [
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan1X9 [
	[ self recordMatch: #(46).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan2 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(47) ].
	currentCharacter == $\
		ifTrue: [ self step.
			^ self scan2 ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: $&)
						or: [ (currentCharacter between: $( and: $[)
								or: [ currentCharacter >= $] ] ] ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan3 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ ^ self recordAndReportMatch: #(49) ].
			^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
Antlr4Scanner >> scan4 [
	[ self step.
	currentCharacter == $* ] whileTrue.
	currentCharacter == $/
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	true
		ifTrue: [ [ self step.
			currentCharacter == $*
				ifTrue: [ ^ self scan4 ].
			currentCharacter == $/
				ifTrue: [ ^ self scan3 ].
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan5 [
	[ self recordMatch: #(48).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan6 ].
	currentCharacter <= $[ or: [ currentCharacter >= $^ ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> scan6 [
	self step.
	^ self scan5
]

{ #category : #generated }
Antlr4Scanner >> scanForToken [
	scope == #default
		ifTrue: [ ^ self scan1 ].
	scope == #argAction
		ifTrue: [ self step.
			^ self recordAndReportMatch: #(2) ].
	scope == #action
		ifTrue: [ self step.
			^ self recordAndReportMatch: #(1) ].
	scope == #lexerCharSet
		ifTrue: [ self step.
			currentCharacter == $\
				ifTrue: [ ^ self scan6 ].
			currentCharacter == $]
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
Antlr4Scanner >> tokenActions [
	^ #(#actionBlock #argActionBlock nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment #whitespace)
]
