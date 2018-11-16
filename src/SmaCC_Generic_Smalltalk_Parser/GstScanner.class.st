Class {
	#name : #GstScanner,
	#superclass : #SmaCCScanner,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #'generated-initialization' }
GstScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(15 'false' 12) #(15 'nil' 13) #(15 'true' 14))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
GstScanner >> barId [
	^ 17
]

{ #category : #generated }
GstScanner >> binaryId [
	^ 18
]

{ #category : #generated }
GstScanner >> emptySymbolTokenId [
	^ 67
]

{ #category : #generated }
GstScanner >> errorTokenId [
	^ 68
]

{ #category : #generated }
GstScanner >> scan1 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(20).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
GstScanner >> scan10 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $3)
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter between: $0 and: $3 ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan11 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $4)
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter between: $0 and: $4 ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan12 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $5)
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter between: $0 and: $5 ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan13 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $6)
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter between: $0 and: $6 ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan14 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan15 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter between: $0 and: $8)
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter between: $0 and: $8 ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan16 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(26).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan16 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
GstScanner >> scan2 [
	self recordMatch: #(20).
	self step.
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self step.
			currentCharacter == $:
				ifTrue: [ ^ self scan2 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan3 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ self recordMatch: #(19).
			self step.
			currentCharacter == $'
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
GstScanner >> scan4 [
	[ self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter isDigit ] whileTrue.
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan5 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter isDigit ] whileTrue.
			((currentCharacter between: $d and: $e)
				or: [ currentCharacter == $q ])
				ifTrue: [ ^ self scan6 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan6 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(24).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $0
		ifTrue: [ ^ self scan7X9 ].
	currentCharacter == $1
		ifTrue: [ ^ self scan7X8 ].
	currentCharacter == $2
		ifTrue: [ ^ self scan7X7 ].
	currentCharacter == $3
		ifTrue: [ ^ self scan7X6 ].
	^ self scan7X11
]

{ #category : #generated }
GstScanner >> scan7X1 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $H ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $H ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X10 [
	self step.
	(currentCharacter isDigit
		or: [ currentCharacter between: $A and: $I ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter isDigit
				or: [ currentCharacter between: $A and: $I ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X11 [
	currentCharacter == $4
		ifTrue: [ ^ self scan7X5 ].
	currentCharacter == $5
		ifTrue: [ ^ self scan7X4 ].
	currentCharacter == $6
		ifTrue: [ ^ self scan7X3 ].
	currentCharacter == $7
		ifTrue: [ ^ self scan7X2 ].
	currentCharacter == $8
		ifTrue: [ ^ self scan7X1 ].
	currentCharacter isDigit
		ifTrue: [ self recordMatch: #(25).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan5 ].
			currentCharacter == $r
				ifTrue:
					[ ^ self scan7X10 ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ] ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X2 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $G ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $G ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X3 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $F ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $F ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X4 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $E ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $E ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X5 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $D ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $D ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X6 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $C ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $C ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X7 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $B ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $B ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X8 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit or: [ currentCharacter == $A ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit or: [ currentCharacter == $A ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan7X9 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan8X10 ].
	^ self scan8X12
]

{ #category : #generated }
GstScanner >> scan8X1 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $S ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $S ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X10 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $J ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $J ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X11 [
	self step.
	(currentCharacter between: $0 and: $1)
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter between: $0 and: $1 ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X12 [
	currentCharacter == $1
		ifTrue:
			[ ^ self scan8X9 ].
	currentCharacter == $2
		ifTrue:
			[ ^ self scan8X8 ].
	currentCharacter == $3
		ifTrue:
			[ ^ self scan8X7 ].
	currentCharacter == $4
		ifTrue:
			[ ^ self scan8X6 ].
	currentCharacter == $5
		ifTrue:
			[ ^ self scan8X5 ].
	currentCharacter == $6
		ifTrue:
			[ ^ self scan8X4 ].
	currentCharacter == $7
		ifTrue:
			[ ^ self scan8X3 ].
	currentCharacter == $8
		ifTrue:
			[ ^ self scan8X2 ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scan8X1 ].
	currentCharacter == $r
		ifTrue:
			[ ^ self scan8X11 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X2 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $R ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $R ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X3 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $Q ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $Q ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X4 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $P ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $P ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X5 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $O ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $O ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X6 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $N ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $N ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X7 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $M ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $M ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X8 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $L ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $L ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan8X9 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $K ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $K ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9 [
	self recordMatch: #(25).
	self step.
	^ self scan9X9
]

{ #category : #generated }
GstScanner >> scan9X1 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $Z ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $Z ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X2 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $Y ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $Y ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X3 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $X ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $X ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X4 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $W ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $W ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X5 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $V ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $V ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X6 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $U ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $U ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X7 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $r
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ currentCharacter between: $A and: $T ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter isDigit
						or: [ currentCharacter between: $A and: $T ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X8 [
	self step.
	(currentCharacter between: $0 and: $2)
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter between: $0 and: $2 ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scan9X9 [
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan9X7 ].
	currentCharacter == $1
		ifTrue:
			[ ^ self scan9X6 ].
	currentCharacter == $2
		ifTrue:
			[ ^ self scan9X5 ].
	currentCharacter == $3
		ifTrue:
			[ ^ self scan9X4 ].
	currentCharacter == $4
		ifTrue:
			[ ^ self scan9X3 ].
	currentCharacter == $5
		ifTrue:
			[ ^ self scan9X2 ].
	currentCharacter == $6
		ifTrue:
			[ ^ self scan9X1 ].
	currentCharacter == $r
		ifTrue:
			[ ^ self scan9X8 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan4 ].
	((currentCharacter between: $d and: $e)
		or: [ currentCharacter == $q ])
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForToken [
	self step.
	currentCharacter == $"
		ifTrue: [ [ self step.
			currentCharacter == $"
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			true ] whileTrue ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $$
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self scanForTokenX9
]

{ #category : #generated }
GstScanner >> scanForTokenX1 [
	self recordMatch: #(18).
	self step.
	currentCharacter == $0
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $1
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $2
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $3
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $4
		ifTrue: [ ^ self scan10 ].
	currentCharacter == $5
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $6
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $7
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $8
		ifTrue: [ ^ self scan14 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan15 ].
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(18).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX2 [
	self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter isSpecial ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter == $:
				ifTrue: [ ^ self scan2 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX3 [
	[ self recordMatch: #(23).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX4 [
	self recordMatch: #(6).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX5 [
	self recordMatch: #(17 18).
	self step.
	currentCharacter isSpecial
		ifTrue: [ [ self recordMatch: #(18).
			self step.
			currentCharacter isSpecial ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX6 [
	[ self recordMatch: #(18).
	self step.
	currentCharacter isSpecial ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX7 [
	self step.
	^ self recordAndReportMatch: #(21)
]

{ #category : #generated }
GstScanner >> scanForTokenX8 [
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $^
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $`
		ifTrue: [ ^ self scan16 ].
	currentCharacter == $|
		ifTrue:
			[ ^ self scanForTokenX5 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter isSpecial
		ifTrue:
			[ ^ self scanForTokenX6 ].
	(currentCharacter isLetter or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(15).
			self step.
			currentCharacter == $:
				ifTrue: [ ^ self recordAndReportMatch: #(16) ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
GstScanner >> scanForTokenX9 [
	currentCharacter == $0
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $1
		ifTrue: [ ^ self scan7 ].
	currentCharacter == $2
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $3
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $4
		ifTrue: [ ^ self scan10 ].
	currentCharacter == $5
		ifTrue: [ ^ self scan11 ].
	currentCharacter == $6
		ifTrue: [ ^ self scan12 ].
	currentCharacter == $7
		ifTrue: [ ^ self scan13 ].
	currentCharacter == $8
		ifTrue: [ ^ self scan14 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan15 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self scanForTokenX8
]

{ #category : #generated }
GstScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment #whitespace nil nil #patternToken)
]
