Class {
	#name : #XPathNumberComparableTest,
	#superclass : #XPathComparableTest,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathNumberComparableTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XPathNumberComparableTest >> defaultComparable [
	^ self comparableNumberValue
]

{ #category : #tests }
XPathNumberComparableTest >> testEqualToBoolean [
	"from the spec:
			'a number is true if and only if it is neither positive or negative
		zero nor NaN'"
	self assert:
		self comparableNumberValue =
			self comparableTrueValue.
	self assert:
		self comparableInfinityValue =
			self comparableTrueValue.
	self assert:
		self comparableNegativeInfinityValue =
			self comparableTrueValue.
	self deny:
		self comparableZeroValue =
			self comparableTrueValue.
	self deny:
		self comparableNegativeZeroValue =
			self comparableTrueValue.
	self deny:
		self comparableNaNValue =
			self comparableTrueValue.

	self deny:
		self comparableNumberValue =
			self comparableFalseValue.
	self deny:
		self comparableInfinityValue =
			self comparableFalseValue.
	self deny:
		self comparableNegativeInfinityValue =
			self comparableFalseValue.
	self assert:
		self comparableZeroValue =
			self comparableFalseValue.
	self assert:
		self comparableNegativeZeroValue =
			self comparableFalseValue.
	self assert:
		self comparableNaNValue =
			self comparableFalseValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testEqualToNodeSet [
	self assert:
		self comparableNumberValue =
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableDisjointNumberValue =
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNumberValue =
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableDisjointNumberValue =
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNumberValue =
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathNumberComparableTest >> testEqualToNumber [
	self assert:
		self comparableNumberValue =
			self comparableNumberValue.
	self deny:
		self comparableDisjointNumberValue =
			self comparableNumberValue.
	self deny:
		self comparableNumberValue =
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testEqualToString [
	self assert:
		self comparableNumberValue =
			self comparableNumberStringValue.
	self deny:
		self comparableDisjointNumberValue =
			self comparableNumberStringValue.
	self deny:
		self comparableNumberValue =
			self comparableEmptyStringValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanBoolean [
	"from the spec:
			'a number is true if and only if it is neither positive or negative
		zero nor NaN'"
	self deny:
		self comparableNumberValue >
			self comparableTrueValue.
	self assert:
		self comparableInfinityValue >
			self comparableTrueValue.
	self deny:
		self comparableNegativeInfinityValue >
			self comparableTrueValue.
	self deny:
		self comparableZeroValue >
			self comparableTrueValue.
	self deny:
		self comparableNegativeZeroValue >
			self comparableTrueValue.

	self assert:
		self comparableNumberValue >
			self comparableFalseValue.
	self assert:
		self comparableInfinityValue >
			self comparableFalseValue.
	self deny:
		self comparableNegativeInfinityValue >
			self comparableFalseValue.
	self deny:
		self comparableZeroValue >
			self comparableFalseValue.
	self deny:
		self comparableNegativeZeroValue >
			self comparableFalseValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanNodeSet [
	self deny:
		self comparableNumberValue >
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableDisjointNumberValue >
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNumberValue >
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableDisjointNumberValue >
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNumberValue >
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanNumber [
	self deny:
		self comparableNumberValue >
			self comparableNumberValue.
	self assert:
		self comparableDisjointNumberValue >
			self comparableNumberValue.
	self deny:
		self comparableNumberValue >
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanOrEqualToBoolean [
	"from the spec:
			'a number is true if and only if it is neither positive or negative
		zero nor NaN'"
	self assert:
		self comparableNumberValue >=
			self comparableTrueValue.
	self assert:
		self comparableInfinityValue >=
			self comparableTrueValue.
	self deny:
		self comparableNegativeInfinityValue >=
			self comparableTrueValue.
	self deny:
		self comparableZeroValue >=
			self comparableTrueValue.
	self deny:
		self comparableNegativeZeroValue >=
			self comparableTrueValue.

	self assert:
		self comparableNumberValue >=
			self comparableFalseValue.
	self assert:
		self comparableInfinityValue >=
			self comparableFalseValue.
	self deny:
		self comparableNegativeInfinityValue >=
			self comparableFalseValue.
	self assert:
		self comparableZeroValue >=
			self comparableFalseValue.
	self assert:
		self comparableNegativeZeroValue >=
			self comparableFalseValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanOrEqualToNodeSet [
	self assert:
		self comparableNumberValue >=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableDisjointNumberValue >=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNumberValue >=
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableDisjointNumberValue >=
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNumberValue >=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanOrEqualToNumber [
	self assert:
		self comparableNumberValue >=
			self comparableNumberValue.
	self assert:
		self comparableDisjointNumberValue >=
			self comparableNumberValue.
	self deny:
		self comparableNumberValue >=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanOrEqualToString [
	self assert:
		self comparableNumberValue >=
			self comparableNumberStringValue.
	self assert:
		self comparableDisjointNumberValue >=
			self comparableNumberStringValue.
	self deny:
		self comparableNumberValue >=
			self comparableDisjointNumberStringValue.
	self assert:
		self comparableDisjointNumberValue >=
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testGreaterThanString [
	self deny:
		self comparableNumberValue >
			self comparableNumberStringValue.
	self assert:
		self comparableDisjointNumberValue >
			self comparableNumberStringValue.
	self deny:
		self comparableNumberValue >
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableDisjointNumberValue >
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanBoolean [
	"from the spec:
			'a number is true if and only if it is neither positive or negative
		zero nor NaN'"
	self deny:
		self comparableNumberValue <
			self comparableTrueValue.
	self deny:
		self comparableInfinityValue <
			self comparableTrueValue.
	self assert:
		self comparableNegativeInfinityValue <
			self comparableTrueValue.
	self assert:
		self comparableZeroValue <
			self comparableTrueValue.
	self assert:
		self comparableNegativeZeroValue <
			self comparableTrueValue.

	self deny:
		self comparableNumberValue <
			self comparableFalseValue.
	self deny:
		self comparableInfinityValue <
			self comparableFalseValue.
	self assert:
		self comparableNegativeInfinityValue <
			self comparableFalseValue.
	self deny:
		self comparableZeroValue <
			self comparableFalseValue.
	self deny:
		self comparableNegativeZeroValue <
			self comparableFalseValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanNodeSet [
	self assert:
		self comparableNumberValue <
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableDisjointNumberValue <
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNumberValue <
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableDisjointNumberValue <
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNumberValue <
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanNumber [
	self deny:
		self comparableNumberValue <
			self comparableNumberValue.
	self deny:
		self comparableDisjointNumberValue <
			self comparableNumberValue.
	self assert:
		self comparableNumberValue <
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanOrEqualToBoolean [
	"from the spec:
			'a number is true if and only if it is neither positive or negative
		zero nor NaN'"
	self assert:
		self comparableNumberValue <=
			self comparableTrueValue.
	self deny:
		self comparableInfinityValue <=
			self comparableTrueValue.
	self assert:
		self comparableNegativeInfinityValue <=
			self comparableTrueValue.
	self assert:
		self comparableZeroValue <=
			self comparableTrueValue.
	self assert:
		self comparableNegativeZeroValue <=
			self comparableTrueValue.

	self deny:
		self comparableNumberValue <=
			self comparableFalseValue.
	self deny:
		self comparableInfinityValue <=
			self comparableFalseValue.
	self assert:
		self comparableNegativeInfinityValue <=
			self comparableFalseValue.
	self assert:
		self comparableZeroValue <=
			self comparableFalseValue.
	self assert:
		self comparableNegativeZeroValue <=
			self comparableFalseValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanOrEqualToNodeSet [
	self assert:
		self comparableNumberValue <=
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableDisjointNumberValue <=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNumberValue <=
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableDisjointNumberValue <=
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNumberValue <=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanOrEqualToNumber [
	self assert:
		self comparableNumberValue <=
			self comparableNumberValue.
	self deny:
		self comparableDisjointNumberValue <=
			self comparableNumberValue.
	self assert:
		self comparableNumberValue <=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanOrEqualToString [
	self assert:
		self comparableNumberValue <=
			self comparableNumberStringValue.
	self deny:
		self comparableDisjointNumberValue <=
			self comparableNumberStringValue.
	self assert:
		self comparableNumberValue <=
			self comparableDisjointNumberStringValue.
	self assert:
		self comparableDisjointNumberValue <=
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testLessThanString [
	self deny:
		self comparableNumberValue <
			self comparableNumberStringValue.
	self deny:
		self comparableDisjointNumberValue <
			self comparableNumberStringValue.
	self assert:
		self comparableNumberValue <
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableDisjointNumberValue <
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testNotEqualToBoolean [
	"from the spec:
			'a number is true if and only if it is neither positive or negative
		zero nor NaN'"
	self deny:
		self comparableNumberValue ~=
			self comparableTrueValue.
	self deny:
		self comparableInfinityValue ~=
			self comparableTrueValue.
	self deny:
		self comparableNegativeInfinityValue ~=
			self comparableTrueValue.
	self assert:
		self comparableZeroValue ~=
			self comparableTrueValue.
	self assert:
		self comparableNegativeZeroValue ~=
			self comparableTrueValue.
	self assert:
		self comparableNaNValue ~=
			self comparableTrueValue.

	self assert:
		self comparableNumberValue ~=
			self comparableFalseValue.
	self assert:
		self comparableInfinityValue ~=
			self comparableFalseValue.
	self assert:
		self comparableNegativeInfinityValue ~=
			self comparableFalseValue.
	self deny:
		self comparableZeroValue ~=
			self comparableFalseValue.
	self deny:
		self comparableNegativeZeroValue ~=
			self comparableFalseValue.
	self deny:
		self comparableNaNValue ~=
			self comparableFalseValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testNotEqualToNodeSet [
	self assert:
		self comparableNumberValue ~=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableDisjointNumberValue ~=
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNumberValue ~=
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableDisjointNumberValue ~=
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNumberValue ~=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathNumberComparableTest >> testNotEqualToNumber [
	self deny:
		self comparableNumberValue ~=
			self comparableNumberValue.
	self assert:
		self comparableDisjointNumberValue ~=
			self comparableNumberValue.
	self assert:
		self comparableNumberValue ~=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNumberComparableTest >> testNotEqualToString [
	self deny:
		self comparableNumberValue ~=
			self comparableNumberStringValue.
	self assert:
		self comparableDisjointNumberValue ~=
			self comparableNumberStringValue.
	self assert:
		self comparableNumberValue ~=
			self comparableEmptyStringValue.
]
