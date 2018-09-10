"
This class parses XPath number literals like '1.0', '.0', '1.', and '-1.0'. If the sign is absent, it is assumed to be 1, and if the integer part is absesnt (as in '.1' or '-.1') or the fraction part is absent (as  in '1' or '1.'), they are assumed to be zero.
"
Class {
	#name : #XPathNumberParser,
	#superclass : #XPathParser,
	#category : #'XPath-Core-Parsers'
}

{ #category : #private }
XPathNumberParser >> errorExpectedFractionPart [
	self errorExpected: 'fraction part'
]

{ #category : #private }
XPathNumberParser >> errorExpectedIntegerPart [
	self errorExpected: 'integer part'
]

{ #category : #parsing }
XPathNumberParser >> nextFractionPartOptional: aBoolean [
	(readStream atEnd not
		and: [readStream peek isDigit])
		ifTrue: [| base fractionPart |
			base := 10.
			fractionPart :=
				(readStream next asciiValue - $0 asciiValue) / base.
			[readStream atEnd not
				and: [readStream peek isDigit]]
				whileTrue: [
					base := base * 10.
					fractionPart :=
						fractionPart +
							((readStream next asciiValue - $0 asciiValue) / base)].
			handler handleFractionPart: fractionPart]
		ifFalse: [
			aBoolean
				ifTrue: [handler handleFractionPart: 0]
				ifFalse: [self errorExpectedFractionPart]]
]

{ #category : #parsing }
XPathNumberParser >> nextIntegerPart [
	| integerPart |

	(readStream atEnd not
		and: [readStream peek isDigit])
		ifFalse: [self errorExpectedIntegerPart].
	integerPart := readStream next asciiValue - $0 asciiValue.
	[readStream atEnd not
		and: [readStream peek isDigit]]
		whileTrue: [
			integerPart :=
				(integerPart * 10) +
					(readStream next asciiValue - $0 asciiValue)].
	handler handleIntegerPart: integerPart.
]

{ #category : #parsing }
XPathNumberParser >> parseInput [
	readStream skipSeparators.
	self peekForSign.
	(readStream peekFor: $.)
		ifTrue: [
			handler handleIntegerPart: 0.
			self nextFractionPartOptional: false]
		ifFalse: [
			self nextIntegerPart.
			(readStream peekFor: $.)
				ifTrue: [self nextFractionPartOptional: true]
				ifFalse: [handler handleFractionPart: 0]].
]

{ #category : #parsing }
XPathNumberParser >> peekForSign [
	(readStream peekFor: $-)
		ifTrue: [handler handleNegativeSign]
		ifFalse: [
			readStream peekFor: $+.
			handler handlePositiveSign]
]
