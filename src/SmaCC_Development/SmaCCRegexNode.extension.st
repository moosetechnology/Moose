Extension { #name : #SmaCCRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> allCharacters [
	^ SmaCCGrammar allCharacters
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> asRegularExpression [
	^ self subclassResponsibility
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> carriageReturnString [
	^ SmaCCCharacterSet with: (Character value: 13)
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> formFeedString [
	^ SmaCCCharacterSet with: (Character value: 12)
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> hexStringFrom: aStream [
	^ SmaCCCharacterSet with: (Character value: (self hexValueFrom: aStream))
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> hexValueFrom: aStream [
	| char value count |
	count := value := 0.
	[ aStream atEnd not
		and: [ count < 4
				and: [ char := aStream peek.
					(char between: $0 and: $9) or: [ (char between: $A and: $F) or: [ char between: $a and: $f ] ] ] ] ]
		whileTrue: [ count := count + 1.
			value := value * 16 + aStream next digitValue ].
	^ value
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> isDigit: each [
	^ each between: $0 and: $9
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> isLetterOrDigit: each [
	^ (each between: $a and: $z) or: [ (each between: $A and: $Z) or: [ (self isDigit: each) or: [ each == $_ ] ] ]
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> isWhitespace: each [
	^ self whitespaceValues includes: each asInteger
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> newlineString [
	^ SmaCCCharacterSet with: (Character value: 10)
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> nodeFor: aStream [
	| block char |
	block := nil.
	char := aStream next.
	char == $f
		ifTrue: [ ^ SmaCCCharacterRENode characters: self formFeedString ].
	char == $n
		ifTrue: [ ^ SmaCCCharacterRENode characters: self newlineString ].
	char == $r
		ifTrue: [ ^ SmaCCCharacterRENode characters: self carriageReturnString ].
	char == $t
		ifTrue: [ ^ SmaCCCharacterRENode characters: self tabString ].
	char == $v
		ifTrue: [ ^ SmaCCCharacterRENode characters: self verticalTabString ].
	char == $c
		ifTrue: [ ^ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: (Character value: aStream next asInteger - $A asInteger)) ].
	char == $x
		ifTrue: [ ^ SmaCCCharacterRENode characters: (self hexStringFrom: aStream) ].
	char == $d
		ifTrue: [ block := [ :each | self isDigit: each ] ].
	char == $D
		ifTrue: [ block := [ :each | (self isDigit: each) not ] ].
	char == $s
		ifTrue: [ block := [ :each | self isWhitespace: each ] ].
	char == $S
		ifTrue: [ block := [ :each | (self isWhitespace: each) not ] ].
	char == $w
		ifTrue: [ block := [ :each | self isLetterOrDigit: each ] ].
	char == $W
		ifTrue: [ block := [ :each | (self isLetterOrDigit: each) not ] ].
	block isNil
		ifTrue: [ ^ SmaCCCharacterRENode characters: (SmaCCCharacterSet with: char) ].
	^ SmaCCCharacterRENode characters: (self allCharacters select: block)
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> regularExpression [
	^ self attributeNamed: #regularExpression ifAbsentPut: [ self asRegularExpression ]
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> tabString [
	^ SmaCCCharacterSet withAll: '	'
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> verticalTabString [
	^ SmaCCCharacterSet with: (Character value: 11)
]

{ #category : #'*SmaCC_Development' }
SmaCCRegexNode >> whitespaceValues [
	^ #[9 10 11 12 13 32]
]
