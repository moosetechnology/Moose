Class {
	#name : #XPathNodeSetComparableTest,
	#superclass : #XPathComparableTest,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathNodeSetComparableTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XPathNodeSetComparableTest >> defaultComparable [
	^ self comparableNodeSetWithStringValues
]

{ #category : #tests }
XPathNodeSetComparableTest >> testEqualToBoolean [
	self assert:
		self comparableNodeSetWithStringValues =
			self comparableTrueValue.
	self deny:
		self comparableEmptyNodeSet =
			self comparableTrueValue.
	self deny:
		self comparableNodeSetWithStringValues =
			self comparableFalseValue.
	self assert:
		self comparableEmptyNodeSet =
			self comparableFalseValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testEqualToNodeSet [
	"From the spec:
			'If both objects to be compared are node-sets, then the comparison will
		be true if and only if there is a node in the first node-set and a node in
		the second node-set such that the result of performing the comparison on
		the string-values of the two nodes is true'"

	"as long as two node sets have one string value in common, they are equal"
	self assert:
		self comparableNodeSetWithStringValues =
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableNodeSetWithStringValues =
			self comparableNodeSetWithSameStringValue.
	self assert:
		self comparableNodeSetWithSameStringValue =
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableNodeSetWithSameStringValue =
			self comparableNodeSetWithSameStringValue.

	"if they don't have at least one string value in common, they aren't equal"
	self deny:
		self comparableNodeSetWithStringValues =
			self comparableNodeSetWithDisjointStringValues.
	self deny:
		self comparableNodeSetWithDisjointStringValues =
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableNodeSetWithSameStringValue =
			self comparableNodeSetWithDisjointStringValues.
	self deny:
		self comparableNodeSetWithDisjointStringValues =
			self comparableNodeSetWithSameStringValue.

	"no node set equals the empty node set, even itself"
	self deny:
		self comparableEmptyNodeSet =
			self comparableEmptyNodeSet.
	self deny:
		self comparableNodeSetWithStringValues =
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet =
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableNodeSetWithSameStringValue =
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet =
			self comparableNodeSetWithSameStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testEqualToNumber [
	self assert:
		self comparableNodeSetWithNumberValues =
			self comparableNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue =
			self comparableNumberValue.
	self deny:
		self comparableEmptyNodeSet =
			self comparableNumberValue.

	self deny:
		self comparableNodeSetWithNumberValues =
			self comparableDisjointNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue =
			self comparableDisjointNumberValue.
	self deny:
		self comparableEmptyNodeSet =
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testEqualToString [
	"From the spec: 
			'If one object to be compared is a node-set and the other is a string,
		then the comparison will be true if and only if there is a node in the
		node-set such that the result of performing the comparison on the
		string-value of the node and the other string is true.'"
	self assert:
		self comparableNodeSetWithStringValues =
			self comparableStringValue.
	self assert:
		self comparableNodeSetWithSameStringValue =
			self comparableStringValue.
	self deny:
		self comparableNodeSetWithDisjointStringValues =
			self comparableStringValue.
	self deny:
		self comparableEmptyNodeSet =
			self comparableStringValue.
	self deny:
		self comparableEmptyNodeSet =
			self comparableEmptyStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanBoolean [
	self deny:
		self comparableNodeSetWithStringValues >
			self comparableTrueValue.
	self deny:
		self comparableEmptyNodeSet >
			self comparableTrueValue.
	self assert:
		self comparableNodeSetWithStringValues >
			self comparableFalseValue.
	self deny:
		self comparableEmptyNodeSet >
			self comparableFalseValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanNodeSet [
	"From the spec:
			'If both objects to be compared are node-sets, then the comparison will
		be true if and only if there is a node in the first node-set and a node in
		the second node-set such that the result of performing the comparison on
		the string-values of the two nodes is true'"

	self assert:
		self comparableNodeSetWithNumberValues >
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithNumberValues >
			self comparableNodeSetWithSameNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableNodeSetWithSameNumberValue.

	"the disjoint values are all greater than"
	self deny:
		self comparableNodeSetWithNumberValues >
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableNodeSetWithDisjointNumberValues >
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableNodeSetWithDisjointNumberValues >
			self comparableNodeSetWithSameNumberValue.

	self deny:
		self comparableEmptyNodeSet >
			self comparableEmptyNodeSet.
	self deny:
		self comparableNodeSetWithNumberValues >
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet >
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet >
			self comparableNodeSetWithSameNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanNumber [
	self assert:
		self comparableNodeSetWithNumberValues >
			self comparableNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableNumberValue.
	self deny:
		self comparableEmptyNodeSet >
			self comparableNumberValue.

	self deny:
		self comparableNodeSetWithNumberValues >
			self comparableDisjointNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableDisjointNumberValue.
	self deny:
		self comparableEmptyNodeSet >
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanOrEqualToBoolean [
	self assert:
		self comparableNodeSetWithStringValues >=
			self comparableTrueValue.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableTrueValue.
	self assert:
		self comparableNodeSetWithStringValues >=
			self comparableFalseValue.
	self assert:
		self comparableEmptyNodeSet >=
			self comparableFalseValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanOrEqualToNodeSet [
	"From the spec:
			'If both objects to be compared are node-sets, then the comparison will
		be true if and only if there is a node in the first node-set and a node in
		the second node-set such that the result of performing the comparison on
		the string-values of the two nodes is true'"

	self assert:
		self comparableNodeSetWithNumberValues >=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithNumberValues >=
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue >=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithSameNumberValue >=
			self comparableNodeSetWithSameNumberValue.

	"the disjoint values are all greater than"
	self deny:
		self comparableNodeSetWithNumberValues >=
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableNodeSetWithDisjointNumberValues >=
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue >=
			self comparableNodeSetWithDisjointNumberValues.
	self assert:
		self comparableNodeSetWithDisjointNumberValues >=
			self comparableNodeSetWithSameNumberValue.

	self deny:
		self comparableEmptyNodeSet >=
			self comparableEmptyNodeSet.
	self deny:
		self comparableNodeSetWithNumberValues >=
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue >=
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableNodeSetWithSameNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanOrEqualToNumber [
	self assert:
		self comparableNodeSetWithNumberValues >=
			self comparableNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue >=
			self comparableNumberValue.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableNumberValue.

	self deny:
		self comparableNodeSetWithNumberValues >=
			self comparableDisjointNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >=
			self comparableDisjointNumberValue.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanOrEqualToString [
	self assert:
		self comparableNodeSetWithNumberValues >=
			self comparableNumberStringValue.
	self assert:
		self comparableNodeSetWithSameNumberValue >=
			self comparableNumberStringValue.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableNumberStringValue.

	self deny:
		self comparableNodeSetWithNumberValues >=
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >=
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableEmptyNodeSet >=
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testGreaterThanString [
	self assert:
		self comparableNodeSetWithNumberValues >
			self comparableNumberStringValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableNumberStringValue.
	self deny:
		self comparableEmptyNodeSet >
			self comparableNumberStringValue.

	self deny:
		self comparableNodeSetWithNumberValues >
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableNodeSetWithSameNumberValue >
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableEmptyNodeSet >
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanBoolean [
	self deny:
		self comparableNodeSetWithStringValues <
			self comparableTrueValue.
	self assert:
		self comparableEmptyNodeSet <
			self comparableTrueValue.
	self deny:
		self comparableNodeSetWithStringValues <
			self comparableFalseValue.
	self deny:
		self comparableEmptyNodeSet <
			self comparableFalseValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanNodeSet [
	"From the spec:
			'If both objects to be compared are node-sets, then the comparison will
		be true if and only if there is a node in the first node-set and a node in
		the second node-set such that the result of performing the comparison on
		the string-values of the two nodes is true'"

	self assert:
		self comparableNodeSetWithNumberValues <
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithNumberValues <
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue <
			self comparableNodeSetWithSameNumberValue.

	"the disjoint values are all greater than"
	self assert:
		self comparableNodeSetWithNumberValues <
			self comparableNodeSetWithDisjointNumberValues.
	self deny:
		self comparableNodeSetWithDisjointNumberValues <
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithSameNumberValue <
			self comparableNodeSetWithDisjointNumberValues.
	self deny:
		self comparableNodeSetWithDisjointNumberValues <
			self comparableNodeSetWithSameNumberValue.

	self deny:
		self comparableEmptyNodeSet <
			self comparableEmptyNodeSet.
	self deny:
		self comparableNodeSetWithNumberValues <
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet <
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue <
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet <
			self comparableNodeSetWithSameNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanNumber [
	self deny:
		self comparableNodeSetWithNumberValues <
			self comparableNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue <
			self comparableNumberValue.
	self deny:
		self comparableEmptyNodeSet <
			self comparableNumberValue.

	self assert:
		self comparableNodeSetWithNumberValues <
			self comparableDisjointNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <
			self comparableDisjointNumberValue.
	self deny:
		self comparableEmptyNodeSet <
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanOrEqualToBoolean [
	self assert:
		self comparableNodeSetWithStringValues <=
			self comparableTrueValue.
	self assert:
		self comparableEmptyNodeSet <=
			self comparableTrueValue.
	self deny:
		self comparableNodeSetWithStringValues <=
			self comparableFalseValue.
	self assert:
		self comparableEmptyNodeSet <=
			self comparableFalseValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanOrEqualToNodeSet [
	"From the spec:
			'If both objects to be compared are node-sets, then the comparison will
		be true if and only if there is a node in the first node-set and a node in
		the second node-set such that the result of performing the comparison on
		the string-values of the two nodes is true'"

	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableNodeSetWithSameNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableNodeSetWithSameNumberValue.

	"the disjoint values are all greater than"
	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableNodeSetWithDisjointNumberValues.
	self deny:
		self comparableNodeSetWithDisjointNumberValues <=
			self comparableNodeSetWithNumberValues.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableNodeSetWithDisjointNumberValues.
	self deny:
		self comparableNodeSetWithDisjointNumberValues <=
			self comparableNodeSetWithSameNumberValue.

	self deny:
		self comparableEmptyNodeSet <=
			self comparableEmptyNodeSet.
	self deny:
		self comparableNodeSetWithNumberValues <=
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet <=
			self comparableNodeSetWithNumberValues.
	self deny:
		self comparableNodeSetWithSameNumberValue <=
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet <=
			self comparableNodeSetWithSameNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanOrEqualToNumber [
	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableNumberValue.
	self deny:
		self comparableEmptyNodeSet <=
			self comparableNumberValue.

	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableDisjointNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableDisjointNumberValue.
	self deny:
		self comparableEmptyNodeSet <=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanOrEqualToString [
	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableNumberStringValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableNumberStringValue.
	self deny:
		self comparableEmptyNodeSet <=
			self comparableNumberStringValue.

	self assert:
		self comparableNodeSetWithNumberValues <=
			self comparableDisjointNumberStringValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <=
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableEmptyNodeSet <=
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testLessThanString [
	self deny:
		self comparableNodeSetWithNumberValues <
			self comparableNumberStringValue.
	self deny:
		self comparableNodeSetWithSameNumberValue <
			self comparableNumberStringValue.
	self deny:
		self comparableEmptyNodeSet <
			self comparableNumberStringValue.

	self assert:
		self comparableNodeSetWithNumberValues <
			self comparableDisjointNumberStringValue.
	self assert:
		self comparableNodeSetWithSameNumberValue <
			self comparableDisjointNumberStringValue.
	self deny:
		self comparableEmptyNodeSet <
			self comparableDisjointNumberStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testNotEqualToBoolean [
	self deny:
		self comparableNodeSetWithStringValues ~=
			self comparableTrueValue.
	self assert:
		self comparableEmptyNodeSet ~=
			self comparableTrueValue.
	self assert:
		self comparableNodeSetWithStringValues ~=
			self comparableFalseValue.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableFalseValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testNotEqualToNodeSet [
	"From the spec:
			'If both objects to be compared are node-sets, then the comparison will
		be true if and only if there is a node in the first node-set and a node in
		the second node-set such that the result of performing the comparison on
		the string-values of the two nodes is true'"

	"as long as two node sets have more than one string value, even if they have
	the same string values, they are not equal"
	self assert:
		self comparableNodeSetWithStringValues ~=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableNodeSetWithStringValues ~=
			self comparableNodeSetWithSameStringValue.
	self assert:
		self comparableNodeSetWithSameStringValue ~=
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableNodeSetWithSameStringValue ~=
			self comparableNodeSetWithSameStringValue.

	"if they are non empty and have no string values in common, they are
	not equal"
	self assert:
		self comparableNodeSetWithStringValues ~=
			self comparableNodeSetWithDisjointStringValues.
	self assert:
		self comparableNodeSetWithDisjointStringValues ~=
			self comparableNodeSetWithStringValues.
	self assert:
		self comparableNodeSetWithSameStringValue ~=
			self comparableNodeSetWithDisjointStringValues.
	self assert:
		self comparableNodeSetWithDisjointStringValues ~=
			self comparableNodeSetWithSameStringValue.

	"no node is not equal to the empty node set, even itself"
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableEmptyNodeSet.
	self deny:
		self comparableNodeSetWithStringValues ~=
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableNodeSetWithStringValues.
	self deny:
		self comparableNodeSetWithSameStringValue ~=
			self comparableEmptyNodeSet.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableNodeSetWithSameStringValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testNotEqualToNumber [
	self assert:
		self comparableNodeSetWithNumberValues ~=
			self comparableNumberValue.
	self deny:
		self comparableNodeSetWithSameNumberValue ~=
			self comparableNumberValue.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableNumberValue.

	self assert:
		self comparableNodeSetWithNumberValues ~=
			self comparableDisjointNumberValue.
	self assert:
		self comparableNodeSetWithSameNumberValue ~=
			self comparableDisjointNumberValue.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableDisjointNumberValue.
]

{ #category : #tests }
XPathNodeSetComparableTest >> testNotEqualToString [
	"From the spec: 
			'If one object to be compared is a node-set and the other is a string,
		then the comparison will be true if and only if there is a node in the
		node-set such that the result of performing the comparison on the
		string-value of the node and the other string is true.'"
	self assert:
		self comparableNodeSetWithStringValues ~=
			self comparableStringValue.
	self deny:
		self comparableNodeSetWithSameStringValue ~=
			self comparableStringValue.
	self assert:
		self comparableNodeSetWithDisjointStringValues ~=
			self comparableStringValue.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableStringValue.
	self deny:
		self comparableEmptyNodeSet ~=
			self comparableEmptyStringValue.
]
