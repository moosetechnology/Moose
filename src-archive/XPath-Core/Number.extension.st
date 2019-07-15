Extension { #name : #Number }

{ #category : #'*XPath-Core-converting' }
Number >> asXPathBoolean [
	^ (self isNaN
		or: [self isZero]) not
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathComparable [
	^ XPathNumberComparable value: self
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathFilterExpressionLocationPathRoot [
	XPathTypeException signal: 'Cannot use numbers as location path roots'
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathFilterExpressionPredicateRoot [
	XPathTypeException signal: 'Cannot filter numbers'
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathNodeSet [
	XPathTypeException signal: 'Cannot convert numbers to node sets'
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathNodeSetPosition [
	"this catches literal integer predicates used with #??"
	self isInteger
		ifTrue: [^ self].

	"Pharo/Squeak (but not GS) OrderedCollections, which XPathNodeSets
	use internally, round float indexes down to the nearest integer, which is
	not OK because the spec doesn't require it (and LibXML2 doesn't do it), so
	fractional, NaN, and infinite positions all have to be converted to an
	always out-of-bounds index"
	(self isNaN
		or: [self isInfinite])
		ifFalse: [| truncated |
			(truncated := self truncated) = self
				ifTrue: [^ truncated]].

	"always out-of-bounds"
	^ 0.
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathNumber [
	^ self asFloat
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathString [
	"NaN is converted to the string NaN
	positive zero is converted to the string 0
	negative zero is converted to the string 0
	positive infinity is converted to the string Infinity
	negative infinity is converted to the string -Infinity"
	self isNaN
		ifTrue: [^ 'NaN'].
	self isZero
		ifTrue: [^ '0'].
	self isInfinite
		ifTrue: [
			self negative
				ifTrue: [^ '-Infinity']
				ifFalse: [^ 'Infinity']].

	"integers and floats with no fractional part must be printed as integers,
	so 1 and 1.0 are both output as '1' and -1 and -1.0 are output as '-1'"
	self fractionPart isZero
		ifTrue: [
			"#integerPart returns a float, so it can't be used"
			^ self asInteger asString]
		ifFalse: [| printedWithFixedDecimalPlaces end |
			"this portably gives a decimal, not scientific, representation
			of the number (unlike #asString or #printString:base:, which use
			scientific for some floats), but it may have redundant trailing
			zeros that the spec forbids that need to be removed"
			printedWithFixedDecimalPlaces := self printShowingDecimalPlaces: 16.
			end := printedWithFixedDecimalPlaces size.
			[end > 3
				and: [(printedWithFixedDecimalPlaces at: end) == $0
					and: [(printedWithFixedDecimalPlaces at: end - 1) ~~ $.]]]
				whileTrue: [end := end - 1].
			end < printedWithFixedDecimalPlaces size
				ifTrue: [
					"avoid #first: for portability"
					^ printedWithFixedDecimalPlaces
						copyFrom: 1
						to: end]
				ifFalse: [^ printedWithFixedDecimalPlaces]].
]

{ #category : #'*XPath-Core-converting' }
Number >> asXPathUnionable [
	XPathTypeException signal: 'Cannot union numbers'
]

{ #category : #'*XPath-Core-testing' }
Number >> hasSameXPathSignAs: aNumber [
	"#sign/#sign: do not behave consistently across Pharo/Squeak/GS"
	^ (self negative
		or: [self isXPathNegativeZero]) =
			(aNumber negative
				or: [aNumber isXPathNegativeZero])
]

{ #category : #'*XPath-Core-evaluating' }
Number >> xpathCeiling [
	"'The ceiling function returns the smallest (closest to negative infinity)
	number that is not less than the argument and that is an integer.'
	(The spec doesn't say how to handle NaN and infinity; LibXML2 returns NaN.)"
	(self isNaN
		or: [self isInfinite])
		ifTrue: [^ Float nan]
		ifFalse: [^ self ceiling]
]

{ #category : #'*XPath-Core-evaluating' }
Number >> xpathDivision: aDivisor [
	self isNaN
		ifTrue: [^ self].

	aDivisor isZero
		ifTrue: [
			self isZero
				ifTrue: [^ Float nan].
			"if the signs are different, the result should be negative infinity"
			(self hasSameXPathSignAs: aDivisor)
				ifTrue: [^ Float infinity]
				ifFalse: [^ Float xpathNegativeInfinity]].

	^ self / aDivisor.
]

{ #category : #'*XPath-Core-evaluating' }
Number >> xpathFloor [
	"'The floor function returns the largest (closest to positive infinity)
	number that is not greater than the argument and that is an integer.'
	(The spec doesn't say how to handle NaN and infinity; LibXML2 returns NaN.)"
	(self isNaN
		or: [self isInfinite])
		ifTrue: [^ Float nan]
		ifFalse: [^ self floor]
]

{ #category : #'*XPath-Core-evaluating' }
Number >> xpathModulus: aDivisor [
	| modulus |

	"XPath modulus must take the sign of the receiver unlike #// which
	takes the sign of the argument"
	modulus := self - ((self xpathDivision: aDivisor) xpathFloor * aDivisor).
	(modulus hasSameXPathSignAs: self)
		ifTrue: [^ modulus]
		ifFalse: [^ modulus negated].
]

{ #category : #'*XPath-Core-evaluating' }
Number >> xpathRounded [
	| rounded |

	(self isNaN
		or: [self isZero
			or: [self isInfinite]])
		ifTrue: [^ self].

	((rounded := (self + 0.5) xpathFloor) isZero
		and: [self negative])
		ifTrue: [^ Float xpathNegativeZero]
		ifFalse: [^ rounded].
]
