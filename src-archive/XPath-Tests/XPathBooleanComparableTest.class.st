Class {
	#name : #XPathBooleanComparableTest,
	#superclass : #XPathComparableTest,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathBooleanComparableTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XPathBooleanComparableTest >> defaultComparable [
	^ self comparableTrueValue
]

{ #category : #tests }
XPathBooleanComparableTest >> testEqualToBoolean [
	self assert:
		self comparableTrueValue =
			self comparableTrueValue.
	self deny:
		self comparableFalseValue =
			self comparableTrueValue.
	self deny:
		self comparableTrueValue =
			self comparableFalseValue.
	self assert:
		self comparableFalseValue =
			self comparableFalseValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testEqualToNodeSet [
	self assert:
		self comparableTrueValue =
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableFalseValue =
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableTrueValue =
			self comparableEmptyNodeSet.
	self assert:
		self comparableFalseValue =
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathBooleanComparableTest >> testEqualToNumber [
	self assert:
		self comparableTrueValue =
			self comparableNumberValue.
	self deny:
		self comparableFalseValue =
			self comparableNumberValue.
	self assert:
		self comparableTrueValue =
			self comparableInfinityValue.
	self deny:
		self comparableFalseValue =
			self comparableInfinityValue.
	self assert:
		self comparableTrueValue =
			self comparableNegativeInfinityValue.
	self deny:
		self comparableFalseValue =
			self comparableNegativeInfinityValue.

	self deny:
		self comparableTrueValue =
			self comparableZeroValue.
	self assert:
		self comparableFalseValue =
			self comparableZeroValue.
	self deny:
		self comparableTrueValue =
			self comparableNegativeZeroValue.
	self assert:
		self comparableFalseValue =
			self comparableNegativeZeroValue.
	self deny:
		self comparableTrueValue =
			self comparableNaNValue.
	self assert:
		self comparableFalseValue =
			self comparableNaNValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testEqualToString [
	self assert:
		self comparableTrueValue =
			self comparableStringValue.
	self deny:
		self comparableFalseValue =
			self comparableStringValue.
	self deny:
		self comparableTrueValue =
			self comparableEmptyStringValue.
	self assert:
		self comparableFalseValue =
			self comparableEmptyStringValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanBoolean [
	self deny:
		self comparableTrueValue >
			self comparableTrueValue.
	self deny:
		self comparableFalseValue >
			self comparableTrueValue.
	self assert:
		self comparableTrueValue >
			self comparableFalseValue.
	self deny:
		self comparableFalseValue >
			self comparableFalseValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanNodeSet [
	self deny:
		self comparableTrueValue >
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableFalseValue >
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableTrueValue >
			self comparableEmptyNodeSet.
	self deny:
		self comparableFalseValue >
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanNumber [
	self deny:
		self comparableTrueValue >
			self comparableNumberValue.
	self deny:
		self comparableFalseValue >
			self comparableNumberValue.
	self deny:
		self comparableTrueValue >
			self comparableInfinityValue.
	self deny:
		self comparableFalseValue >
			self comparableInfinityValue.
	self assert:
		self comparableTrueValue >
			self comparableNegativeInfinityValue.
	self assert:
		self comparableFalseValue >
			self comparableNegativeInfinityValue.

	self assert:
		self comparableTrueValue >
			self comparableZeroValue.
	self deny:
		self comparableFalseValue >
			self comparableZeroValue.
	self assert:
		self comparableTrueValue >
			self comparableNegativeZeroValue.
	self deny:
		self comparableFalseValue >
			self comparableNegativeZeroValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanOrEqualToBoolean [
	self assert:
		self comparableTrueValue >=
			self comparableTrueValue.
	self deny:
		self comparableFalseValue >=
			self comparableTrueValue.
	self assert:
		self comparableTrueValue >=
			self comparableFalseValue.
	self assert:
		self comparableFalseValue >=
			self comparableFalseValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanOrEqualToNodeSet [
	self assert:
		self comparableTrueValue >=
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableFalseValue >=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableTrueValue >=
			self comparableEmptyNodeSet.
	self assert:
		self comparableFalseValue >=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanOrEqualToNumber [
	self assert:
		self comparableTrueValue >=
			self comparableNumberValue.
	self deny:
		self comparableFalseValue >=
			self comparableNumberValue.
	self deny:
		self comparableTrueValue >=
			self comparableInfinityValue.
	self deny:
		self comparableFalseValue >=
			self comparableInfinityValue.
	self assert:
		self comparableTrueValue >=
			self comparableNegativeInfinityValue.
	self assert:
		self comparableFalseValue >=
			self comparableNegativeInfinityValue.

	self assert:
		self comparableTrueValue >=
			self comparableZeroValue.
	self assert:
		self comparableFalseValue >=
			self comparableZeroValue.
	self assert:
		self comparableTrueValue >=
			self comparableNegativeZeroValue.
	self assert:
		self comparableFalseValue >=
			self comparableNegativeZeroValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanOrEqualToString [
	self assert:
		self comparableTrueValue >=
			self comparableNumberStringValue.
	self deny:
		self comparableFalseValue >=
			self comparableNumberStringValue.
	self assert:
		self comparableTrueValue >=
			self comparableZeroStringValue.
	self assert:
		self comparableFalseValue >=
			self comparableZeroStringValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testGreaterThanString [
	self deny:
		self comparableTrueValue >
			self comparableNumberStringValue.
	self deny:
		self comparableFalseValue >
			self comparableNumberStringValue.
	self assert:
		self comparableTrueValue >
			self comparableZeroStringValue.
	self deny:
		self comparableFalseValue >
			self comparableZeroStringValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanBoolean [
	self deny:
		self comparableTrueValue <
			self comparableTrueValue.
	self assert:
		self comparableFalseValue <
			self comparableTrueValue.
	self deny:
		self comparableTrueValue <
			self comparableFalseValue.
	self deny:
		self comparableFalseValue <
			self comparableFalseValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanNodeSet [
	self deny:
		self comparableTrueValue <
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableFalseValue <
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableTrueValue <
			self comparableEmptyNodeSet.
	self deny:
		self comparableFalseValue <
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanNumber [
	self deny:
		self comparableTrueValue <
			self comparableNumberValue.
	self assert:
		self comparableFalseValue <
			self comparableNumberValue.
	self assert:
		self comparableTrueValue <
			self comparableInfinityValue.
	self assert:
		self comparableFalseValue <
			self comparableInfinityValue.
	self deny:
		self comparableTrueValue <
			self comparableNegativeInfinityValue.
	self deny:
		self comparableFalseValue <
			self comparableNegativeInfinityValue.

	self deny:
		self comparableTrueValue <
			self comparableZeroValue.
	self deny:
		self comparableFalseValue <
			self comparableZeroValue.
	self deny:
		self comparableTrueValue <
			self comparableNegativeZeroValue.
	self deny:
		self comparableFalseValue <
			self comparableNegativeZeroValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanOrEqualToBoolean [
	self assert:
		self comparableTrueValue <=
			self comparableTrueValue.
	self assert:
		self comparableFalseValue <=
			self comparableTrueValue.
	self deny:
		self comparableTrueValue <=
			self comparableFalseValue.
	self assert:
		self comparableFalseValue <=
			self comparableFalseValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanOrEqualToNodeSet [
	self assert:
		self comparableTrueValue <=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableFalseValue <=
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableTrueValue <=
			self comparableEmptyNodeSet.
	self assert:
		self comparableFalseValue <=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanOrEqualToNumber [
	self assert:
		self comparableTrueValue <=
			self comparableNumberValue.
	self assert:
		self comparableFalseValue <=
			self comparableNumberValue.
	self assert:
		self comparableTrueValue <=
			self comparableInfinityValue.
	self assert:
		self comparableFalseValue <=
			self comparableInfinityValue.
	self deny:
		self comparableTrueValue <=
			self comparableNegativeInfinityValue.
	self deny:
		self comparableFalseValue <=
			self comparableNegativeInfinityValue.

	self deny:
		self comparableTrueValue <=
			self comparableZeroValue.
	self assert:
		self comparableFalseValue <=
			self comparableZeroValue.
	self deny:
		self comparableTrueValue <=
			self comparableNegativeZeroValue.
	self assert:
		self comparableFalseValue <=
			self comparableNegativeZeroValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanOrEqualToString [
	self assert:
		self comparableTrueValue <=
			self comparableNumberStringValue.
	self assert:
		self comparableFalseValue <=
			self comparableNumberStringValue.
	self deny:
		self comparableTrueValue <=
			self comparableZeroStringValue.
	self assert:
		self comparableFalseValue <=
			self comparableZeroStringValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testLessThanString [
	self deny:
		self comparableTrueValue <
			self comparableNumberStringValue.
	self assert:
		self comparableFalseValue <
			self comparableNumberStringValue.
	self deny:
		self comparableTrueValue <
			self comparableZeroStringValue.
	self deny:
		self comparableFalseValue <
			self comparableZeroStringValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testNotEqualToBoolean [
	self deny:
		self comparableTrueValue ~=
			self comparableTrueValue.
	self assert:
		self comparableFalseValue ~=
			self comparableTrueValue.
	self assert:
		self comparableTrueValue ~=
			self comparableFalseValue.
	self deny:
		self comparableFalseValue ~=
			self comparableFalseValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testNotEqualToNodeSet [
	self deny:
		self comparableTrueValue ~=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableFalseValue ~=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableTrueValue ~=
			self comparableEmptyNodeSet.
	self deny:
		self comparableFalseValue ~=
			self comparableEmptyNodeSet.
]

{ #category : #tests }
XPathBooleanComparableTest >> testNotEqualToNumber [
	self deny:
		self comparableTrueValue ~=
			self comparableNumberValue.
	self assert:
		self comparableFalseValue ~=
			self comparableNumberValue.
	self deny:
		self comparableTrueValue ~=
			self comparableInfinityValue.
	self assert:
		self comparableFalseValue ~=
			self comparableInfinityValue.
	self deny:
		self comparableTrueValue ~=
			self comparableNegativeInfinityValue.
	self assert:
		self comparableFalseValue ~=
			self comparableNegativeInfinityValue.

	self assert:
		self comparableTrueValue ~=
			self comparableZeroValue.
	self deny:
		self comparableFalseValue ~=
			self comparableZeroValue.
	self assert:
		self comparableTrueValue ~=
			self comparableNegativeZeroValue.
	self deny:
		self comparableFalseValue ~=
			self comparableNegativeZeroValue.
	self assert:
		self comparableTrueValue ~=
			self comparableNaNValue.
	self deny:
		self comparableFalseValue ~=
			self comparableNaNValue.
]

{ #category : #tests }
XPathBooleanComparableTest >> testNotEqualToString [
	self deny:
		self comparableTrueValue ~=
			self comparableStringValue.
	self assert:
		self comparableFalseValue ~=
			self comparableStringValue.
	self assert:
		self comparableTrueValue ~=
			self comparableEmptyStringValue.
	self deny:
		self comparableFalseValue ~=
			self comparableEmptyStringValue.
]
