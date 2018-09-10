Extension { #name : #Number }

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> checkForOldSyntax: t1 with: t2 on: t3 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."
	
	(t3 atEnd not and: [t3 peekFor: $.])
		ifTrue:
			[(t3 atEnd not
				and:
					[t3 peek digitValue
						between: 0
						and: t1 - 1])
				ifTrue:
					[self
						error:
							#errRadixDecimal << #dialogs >>
									'Non-radix 10 numbers may not contain decimal points']
				ifFalse: [t3 skip: -1]].
	(t3 atEnd not and: [t3 peek asLowercase = $e])
		ifTrue:
			[self
				error:
					#errRadixExponent << #dialogs >>
							'Non-radix 10 numbers may not have an exponent'].
	^t2
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> chooseFloatRepresentationFor: t1 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."
	
	^ Float
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> chooseFloatRepresentationFor: t1 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."
	
	^ Float
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> coerce: t1 precision: t2 exponent: t3 exponentChar: t4 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."

	t3 ifNil: [ ^ self zero coerce: t1 ].
	^ (self zero coerce: t1) * (10 raisedTo: t3)
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> coerce: t1 to: t2 precision: t3 exponent: t4 exponentChar: t5 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."
	
	^t2 coerce: t1 precision: t3 exponent: t4 exponentChar: t5
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> differenceFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a - self]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> differenceFromVector: aVector [
	
	^aVector collect: [:a | a - self]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> dist: aNumber [

	^self < aNumber
		ifTrue: [ aNumber - self ]
		ifFalse: [ self - aNumber ]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> productFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a * self]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> productFromVector: aVector [
	
	^aVector collect: [:a | a * self]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> quotientFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a / self]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> quotientFromVector: aVector [
	
	^aVector collect: [:a | a / self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> readIntegerFrom: t1 radix: t2 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."
	
	| t3 t4 |
	t4 := 0.
	[t1 atEnd]
		whileFalse:
			[((t3 := t1 next digitValue) < 0 or: [t3 >= t2])
				ifTrue:
					[t1 skip: -1.
					^t4].
			t4 := t4 * t2 + t3].
	^t4
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> readSmalltalkAndCFloat: integerPart from: aStream [
	"Answer an instance of me as described on the stream, aStream."

	| value coercionClass possibleCoercionClass precision digit num den exp neg endOfNumber eChar |
	precision := 0.
	num := 0.
	den := 1.
	coercionClass := Integer.
	(aStream peekFor: $.)
		ifTrue: [ 
			"<integer>.<fraction>"
			(aStream atEnd not and: [ aStream peek isDigit ])
				ifTrue: [ 
					| atEnd |
					coercionClass := Float.
					[ (atEnd := aStream atEnd) or: [ (digit := aStream next) isDigit not ] ]
						whileFalse: [ 
							num := num * 10 + digit digitValue.
							precision := precision + 1 ].
					den := 10 ** precision.
					atEnd
						ifFalse: [ aStream skip: -1 ] ]
				ifFalse: [ 
					"oops - just <integer>."
					"un-gobble the period"
					aStream skip: -1 ] ].
	eChar := aStream peek.
	eChar
		ifNil: [ possibleCoercionClass := nil ]
		ifNotNil: [ 
			"SystemUtils isVW20LanguageCompatible ifTrue: [eChar := eChar asLowercase]."
			possibleCoercionClass := self chooseFloatRepresentationFor: eChar.
			possibleCoercionClass == nil
				ifFalse: [ aStream next ] ].
	exp := nil.
	possibleCoercionClass == nil
		ifFalse: [ 
			coercionClass := possibleCoercionClass.
			endOfNumber := aStream position.
			(aStream peekFor: $+)
				ifTrue: [ aStream next ].
			neg := aStream peekFor: $-.
			((digit := aStream peek) notNil and: [ digit isDigit ])
				ifTrue: [ 
					exp := self readIntegerFrom: aStream radix: 10.
					neg
						ifTrue: [ exp := exp negated ] ]
				ifFalse: [ aStream position: endOfNumber ] ].
	value := integerPart + (num / den).	"The exponent will be added in the next step."
	^ self
		coerce: value
		to: coercionClass
		precision: precision
		exponent: exp
		exponentChar: eChar
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> readSmalltalkAndCSyntaxFrom: aStream [
	"Answer an instance of me as described on the stream, aStream."
	
	| value neg |
	(aStream atEnd or: [aStream peek isLetter]) ifTrue: [^0].
	neg := aStream peekFor: $-.
	value := self readIntegerFrom: aStream radix: 10.
	(aStream peekFor: $r)
		ifTrue:
			[| radix |
			radix := value.
			value := self readSmalltalkRadix: value from: aStream.
			value := self checkForOldSyntax: radix with: value on: aStream]
		ifFalse: [value := self readSmalltalkAndCFloat: value from: aStream].
	^neg
		ifTrue: [value negated]
		ifFalse: [value]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> readSmalltalkRadix: t1 from: t2 [
	"	***This is decompiled code.*** 
	The source was unavailable because the source pointer appears to point 
	to an incorrect position in the file. The file may have been modified after 
	this method was updated."
	
	t1 < 2 ifTrue: [^self error: #INVALIDRADIX << #dialogs >> 'INVALID RADIX'].
	(t2 atEnd
		or:
			[(t2 peek digitValue
				between: 0
				and: t1 - 1) not])
		ifTrue:
			[t2 skip: -1.
			^t1].
	^self readIntegerFrom: t2 radix: t1
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> sumFromMatrix: aMatrix [
	
	^aMatrix collect: [:a | a + self]
]

{ #category : #'*moose-algos-linearAlgebra' }
Number >> sumFromVector: aVector [
	
	^aVector collect: [:a | a + self]
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Number class >> zero [
	^ 0
]
