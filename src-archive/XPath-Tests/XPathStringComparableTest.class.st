Class {
	#name : #XPathStringComparableTest,
	#superclass : #XPathComparableTest,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathStringComparableTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XPathStringComparableTest >> defaultComparable [
	^ self comparableStringValue
]

{ #category : #tests }
XPathStringComparableTest >> testEqualToBoolean [
	"From the spec:
		'If at least one object to be compared is a boolean, then each object
	to be compared is converted to a boolean as if by applying the boolean
	function'"
	self assert:
		self comparableStringValue =
			self comparableTrueValue.
	self deny:
		self comparableStringValue =
			self comparableFalseValue.
	self deny:
		self comparableEmptyStringValue =
			self comparableTrueValue.
	self assert:
		self comparableEmptyStringValue =
			self comparableFalseValue.
]

{ #category : #tests }
XPathStringComparableTest >> testEqualToNodeSet [
	self assert:
		self comparableStringValue =
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableDisjointStringValue =
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableStringValue =
			self comparableNodeSetWithSameStringValue.
	self deny:
		self comparableDisjointStringValue =
			self comparableNodeSetWithSameStringValue.
	self deny:
		self comparableStringValue =
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathStringComparableTest >> testEqualToNumber [
	self assert:
		self comparableNumberStringValue =
			self comparableNumberValue.
	self deny:
		self comparableDisjointNumberStringValue =
			self comparableNumberValue.
	self deny:
		self comparableEmptyStringValue =
			self comparableNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testEqualToString [
	self assert:
		self comparableStringValue =
			self comparableStringValue.
	self deny:
		self comparableStringValue =
			self comparableDisjointStringValue.
	self deny:
		self comparableDisjointStringValue =
			self comparableStringValue.
	self deny:
		self comparableStringValue =
			self comparableEmptyStringValue.
	self deny:
		self comparableEmptyStringValue =
			self comparableStringValue.
	self assert:
		self comparableEmptyStringValue =
			self comparableEmptyStringValue.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanBoolean [
	self deny:
		self comparableNumberStringValue >
			self comparableTrueValue.
	self deny:
		self comparableZeroStringValue >
			self comparableTrueValue.
	self assert:
		self comparableNumberStringValue >
			self comparableFalseValue.
	self deny:
		self comparableZeroStringValue >
			self comparableFalseValue.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanNodeSet [
	self deny:
		self comparableNumberStringValue >
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableDisjointNumberStringValue >
			self comparableNodeSetWithNumberValues.

	self deny:
		self comparableNumberStringValue >
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableDisjointNumberStringValue >
			self comparableNodeSetWithSameNumberValue.

	self deny:
		self comparableNumberStringValue >
			self comparableNodeSetWithDisjointNumberValues.
	self deny:
		self comparableDisjointNumberStringValue >
			self comparableNodeSetWithDisjointNumberValues.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanNumber [
	self deny:
		self comparableNumberStringValue >
			self comparableNumberValue.
	self assert:
		self comparableDisjointNumberStringValue >
			self comparableNumberValue.
	self deny:
		self comparableNumberStringValue >
			self comparableDisjointNumberValue.
	self deny:
		self comparableDisjointNumberStringValue >
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanOrEqualToBoolean [
	self assert:
		self comparableNumberStringValue >=
			self comparableTrueValue.
	self deny:
		self comparableZeroStringValue >=
			self comparableTrueValue.
	self assert:
		self comparableNumberStringValue >=
			self comparableFalseValue.
	self assert:
		self comparableZeroStringValue >=
			self comparableFalseValue.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanOrEqualToNodeSet [
	self assert:
		self comparableNumberStringValue >=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableNodeSetWithNumberValues.

	self assert:
		self comparableNumberStringValue >=
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableNodeSetWithSameNumberValue.

	self deny:
		self comparableNumberStringValue >=
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableNodeSetWithDisjointNumberValues.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanOrEqualToNumber [
	self assert:
		self comparableNumberStringValue >=
			self comparableNumberValue.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableNumberValue.
	self deny:
		self comparableNumberStringValue >=
			self comparableDisjointNumberValue.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanOrEqualToString [
	self assert:
		self comparableNumberStringValue >=
			self comparableNumberStringValue.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableNumberStringValue.
	self deny:
		self comparableNumberStringValue >=
			self comparableDisjointNumberStringValue.
	self assert:
		self comparableDisjointNumberStringValue >=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testGreaterThanString [
	self deny:
		self comparableNumberStringValue >
			self comparableNumberStringValue.
	self assert:
		self comparableDisjointNumberStringValue >
			self comparableNumberStringValue.
	self deny:
		self comparableNumberStringValue >
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableDisjointNumberStringValue >
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanBoolean [
	self deny:
		self comparableNumberStringValue <
			self comparableTrueValue.
	self assert:
		self comparableZeroStringValue <
			self comparableTrueValue.
	self deny:
		self comparableNumberStringValue <
			self comparableFalseValue.
	self deny:
		self comparableZeroStringValue <
			self comparableFalseValue.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanNodeSet [
	self assert:
		self comparableNumberStringValue <
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableDisjointNumberStringValue <
			self comparableNodeSetWithNumberValues.

	self deny:
		self comparableNumberStringValue <
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableDisjointNumberStringValue <
			self comparableNodeSetWithSameNumberValue.

	self assert:
		self comparableNumberStringValue <
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableDisjointNumberStringValue <
			self comparableNodeSetWithDisjointNumberValues.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanNumber [
	self deny:
		self comparableNumberStringValue <
			self comparableNumberValue.
	self deny:
		self comparableDisjointNumberStringValue <
			self comparableNumberValue.
	self assert:
		self comparableNumberStringValue <
			self comparableDisjointNumberValue.
	self deny:
		self comparableDisjointNumberStringValue <
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanOrEqualToBoolean [
	self assert:
		self comparableNumberStringValue <=
			self comparableTrueValue.
	self assert:
		self comparableZeroStringValue <=
			self comparableTrueValue.
	self deny:
		self comparableNumberStringValue <=
			self comparableFalseValue.
	self assert:
		self comparableZeroStringValue <=
			self comparableFalseValue.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanOrEqualToNodeSet [
	self assert:
		self comparableNumberStringValue <=
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableDisjointNumberStringValue <=
			self comparableNodeSetWithNumberValues.

	self assert:
		self comparableNumberStringValue <=
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableDisjointNumberStringValue <=
			self comparableNodeSetWithSameNumberValue.

	self assert:
		self comparableNumberStringValue <=
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableDisjointNumberStringValue <=
			self comparableNodeSetWithDisjointNumberValues.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanOrEqualToNumber [
	self assert:
		self comparableNumberStringValue <=
			self comparableNumberValue.
	self deny:
		self comparableDisjointNumberStringValue <=
			self comparableNumberValue.
	self assert:
		self comparableNumberStringValue <=
			self comparableDisjointNumberValue.
	self assert:
		self comparableDisjointNumberStringValue <=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanOrEqualToString [
	self assert:
		self comparableNumberStringValue <=
			self comparableNumberStringValue.
	self deny:
		self comparableDisjointNumberStringValue <=
			self comparableNumberStringValue.
	self assert:
		self comparableNumberStringValue <=
			self comparableDisjointNumberStringValue.
	self assert:
		self comparableDisjointNumberStringValue <=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testLessThanString [
	self deny:
		self comparableNumberStringValue <
			self comparableNumberStringValue.
	self deny:
		self comparableDisjointNumberStringValue <
			self comparableNumberStringValue.
	self assert:
		self comparableNumberStringValue <
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableDisjointNumberStringValue <
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testNotEqualToBoolean [
	"From the spec:
		'If at least one object to be compared is a boolean, then each object
	to be compared is converted to a boolean as if by applying the boolean
	function'"
	self deny:
		self comparableStringValue ~=
			self comparableTrueValue.
	self assert:
		self comparableStringValue ~=
			self comparableFalseValue.
	self assert:
		self comparableEmptyStringValue ~=
			self comparableTrueValue.
	self deny:
		self comparableEmptyStringValue ~=
			self comparableFalseValue.
]

{ #category : #tests }
XPathStringComparableTest >> testNotEqualToNodeSet [
	self assert:
		self comparableStringValue ~=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableDisjointStringValue ~=
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableStringValue ~=
			self comparableNodeSetWithSameStringValue.
	self assert:
		self comparableDisjointStringValue ~=
			self comparableNodeSetWithSameStringValue.
	self deny:
		self comparableStringValue ~=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathStringComparableTest >> testNotEqualToNumber [
	self deny:
		self comparableNumberStringValue ~=
			self comparableNumberValue.
	self assert:
		self comparableDisjointNumberStringValue ~=
			self comparableNumberValue.
	self assert:
		self comparableEmptyStringValue ~=
			self comparableNumberValue.
]

{ #category : #tests }
XPathStringComparableTest >> testNotEqualToString [
	self deny:
		self comparableStringValue ~=
			self comparableStringValue.
	self assert:
		self comparableStringValue ~=
			self comparableDisjointStringValue.
	self assert:
		self comparableDisjointStringValue ~=
			self comparableStringValue.
	self assert:
		self comparableStringValue ~=
			self comparableEmptyStringValue.
	self assert:
		self comparableEmptyStringValue ~=
			self comparableStringValue.
	self deny:
		self comparableEmptyStringValue ~=
			self comparableEmptyStringValue.
]
