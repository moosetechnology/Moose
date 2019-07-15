"
Abstract; do not run
"
Class {
	#name : #XPathComparableTest,
	#superclass : #TestCase,
	#category : #'XPath-Tests'
}

{ #category : #testing }
XPathComparableTest class >> isAbstract [
	^ true
]

{ #category : #testing }
XPathComparableTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XPathComparableTest >> comparableDisjointNumberStringValue [
	^ self disjointNumberValues first asString asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableDisjointNumberValue [
	^ self disjointNumberValues first asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableDisjointStringValue [
	^ self disjointStringValues first asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableEmptyNodeSet [
	^ self nodeSetClass new asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableEmptyStringValue [
	^ '' asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableFalseValue [
	^ false asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableInfinityValue [
	^ Float infinity asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNaNValue [
	^ Float nan asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNegativeInfinityValue [
	^ Float xpathNegativeInfinity asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNegativeZeroValue [
	^ Float xpathNegativeZero asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNodeSetWithDisjointNumberValues [
	^ (self nodeSetClass newFrom:
		(self disjointNumberValues collect: [:each | each asString asXMLStringNode]))
			asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNodeSetWithDisjointStringValues [
	^ (self nodeSetClass newFrom:
		(self disjointStringValues collect: [:each | each asXMLStringNode]))
			asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNodeSetWithNumberValues [
	^ (self nodeSetClass newFrom:
		(self numberValues collect: [:each | each asString asXMLStringNode]))
			asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNodeSetWithSameNumberValue [
	| nodeSet |

	nodeSet := self nodeSetClass new.
	self numberValues size timesRepeat: [
		nodeSet addLast:
			self numberValues first asString asXMLStringNode].
	^ nodeSet asXPathComparable.
]

{ #category : #accessing }
XPathComparableTest >> comparableNodeSetWithSameStringValue [
	| nodeSet |

	nodeSet := self nodeSetClass new.
	self stringValues size timesRepeat: [
		nodeSet addLast: self stringValues first asXMLStringNode].
	^ nodeSet asXPathComparable.
]

{ #category : #accessing }
XPathComparableTest >> comparableNodeSetWithStringValues [
	^ (self nodeSetClass newFrom:
		(self stringValues collect: [:each | each asXMLStringNode]))
			asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNumberStringValue [
	^ self numberValues first asString asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableNumberValue [
	^ self numberValues first asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableStringValue [
	^ self stringValues first asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableTrueValue [
	^ true asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableZeroStringValue [
	^ '0' asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> comparableZeroValue [
	^ 0 asXPathComparable
]

{ #category : #accessing }
XPathComparableTest >> defaultComparable [
	self subclassResponsibility
]

{ #category : #accessing }
XPathComparableTest >> disjointNumberValues [
	^ #(5 6 7 8)
]

{ #category : #accessing }
XPathComparableTest >> disjointStringValues [
	^ #('five' 'six' 'seven' 'eight')
]

{ #category : #accessing }
XPathComparableTest >> nodeSetClass [
	^ XPathNodeSet
]

{ #category : #accessing }
XPathComparableTest >> numberValues [
	^ #(1 2 3 4)
]

{ #category : #accessing }
XPathComparableTest >> stringValues [
	^ #('one' 'two' 'three' 'four')
]

{ #category : #tests }
XPathComparableTest >> testAsXPathComparable [
	| comparable |

	comparable := self defaultComparable.
	self assert: comparable asXPathComparable == comparable.
]
