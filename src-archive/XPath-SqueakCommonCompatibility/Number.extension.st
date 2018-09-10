Extension { #name : #Number }

{ #category : #'*XPath-SqueakCommonCompatibility' }
Number >> isXPathNegativeZero [
	"This is a backwards compatible way to test for -0.0 on Squeak/Pharo.
	Avoid #sign for portability, and do not assume floats are immediate,
	unboxed objects for 32-bit SpurVM with 'self == -0.0'"
	^ self isZero
		and: [(self asFloat at: 1) > 0]
]

{ #category : #'*XPath-SqueakCommonCompatibility' }
Number >> isXPathPositiveZero [
	"see the #isXPathNegativeZero comment"
	^ self isZero
		and: [(self asFloat at: 1) isZero]
]
