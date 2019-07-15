"
A class for wrapping XPath node sets to polymorphically implement XPath comparison operators.
"
Class {
	#name : #XPathNodeSetComparable,
	#superclass : #XPathComparable,
	#category : #'XPath-Core-Compilation'
}

{ #category : #comparing }
XPathNodeSetComparable >> < aComparable [
	^ aComparable greaterThanNodeSet: value
]

{ #category : #comparing }
XPathNodeSetComparable >> <= aComparable [
	^ aComparable greaterThanOrEqualToNodeSet: value
]

{ #category : #comparing }
XPathNodeSetComparable >> = aComparable [
	^ aComparable equalToNodeSet: value
]

{ #category : #comparing }
XPathNodeSetComparable >> > aComparable [
	^ aComparable lessThanNodeSet: value
]

{ #category : #comparing }
XPathNodeSetComparable >> >= aComparable [
	^ aComparable lessThanOrEqualToNodeSet: value
]

{ #category : #private }
XPathNodeSetComparable >> equalToBoolean: aBoolean [
	^ value asXPathBoolean = aBoolean
]

{ #category : #private }
XPathNodeSetComparable >> equalToNodeSet: aNodeSet [
	| smallerNodeSet largerNodeSet |

	"From the spec:
		'If both objects to be compared are node-sets, then the comparison
	will be true if and only if there is a node in the first node-set and
	a node in the second node-set such that the result of performing the
	comparison on the string-values of the two nodes is true.'"
	value size < aNodeSet size
		ifTrue: [
			smallerNodeSet := value.
			largerNodeSet := aNodeSet]
		ifFalse: [
			smallerNodeSet := aNodeSet.
			largerNodeSet := value].
	smallerNodeSet size > 0
		ifTrue: [| smallerNodeSetStringValues |
			smallerNodeSetStringValues := Set new: smallerNodeSet size.
			smallerNodeSet do: [:each |
				smallerNodeSetStringValues add: each stringValue].
			largerNodeSet do: [:each |
				(smallerNodeSetStringValues includes: each stringValue)
					ifTrue: [^ true]]].
	^ false.
]

{ #category : #private }
XPathNodeSetComparable >> equalToNumber: aNumber [
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber = aNumber]
]

{ #category : #private }
XPathNodeSetComparable >> equalToString: aString [
	^ value anySatisfy: [:each |
		each stringValue = aString]
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanBoolean: aBoolean [
	^ value asXPathBoolean asXPathNumber > aBoolean asXPathNumber
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanNodeSet: aNodeSet [
	^ aNodeSet minimumStringValueNumber
		ifNil: [false]
		ifNotNil: [:minimum |
			value anySatisfy: [:each |
				each stringValue asXPathNumber > minimum]]
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanNumber: aNumber [
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber > aNumber]
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanOrEqualToBoolean: aBoolean [
	^ value asXPathBoolean asXPathNumber >= aBoolean asXPathNumber
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanOrEqualToNodeSet: aNodeSet [
	^ aNodeSet minimumStringValueNumber
		ifNil: [false]
		ifNotNil: [:minimum |
			value anySatisfy: [:each |
				each stringValue asXPathNumber >= minimum]]
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanOrEqualToNumber: aNumber [
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber >= aNumber]
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanOrEqualToString: aString [
	| number |

	number := aString asXPathNumber.
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber >= number]
]

{ #category : #private }
XPathNodeSetComparable >> greaterThanString: aString [
	| number |

	number := aString asXPathNumber.
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber > number]
]

{ #category : #private }
XPathNodeSetComparable >> lessThanBoolean: aBoolean [
	^ value asXPathBoolean asXPathNumber < aBoolean asXPathNumber
]

{ #category : #private }
XPathNodeSetComparable >> lessThanNodeSet: aNodeSet [
	^ aNodeSet maximumStringValueNumber
		ifNil: [false]
		ifNotNil: [:maximum |
			value anySatisfy: [:each |
				each stringValue asXPathNumber < maximum]]
]

{ #category : #private }
XPathNodeSetComparable >> lessThanNumber: aNumber [
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber < aNumber]
]

{ #category : #private }
XPathNodeSetComparable >> lessThanOrEqualToBoolean: aBoolean [
	^ value asXPathBoolean asXPathNumber <= aBoolean asXPathNumber
]

{ #category : #private }
XPathNodeSetComparable >> lessThanOrEqualToNodeSet: aNodeSet [
	^ aNodeSet maximumStringValueNumber
		ifNil: [false]
		ifNotNil: [:maximum |
			value anySatisfy: [:each |
				each stringValue asXPathNumber <= maximum]]
]

{ #category : #private }
XPathNodeSetComparable >> lessThanOrEqualToNumber: aNumber [
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber <= aNumber]
]

{ #category : #private }
XPathNodeSetComparable >> lessThanOrEqualToString: aString [
	| number |

	number := aString asXPathNumber.
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber <= number]
]

{ #category : #private }
XPathNodeSetComparable >> lessThanString: aString [
	| number |

	number := aString asXPathNumber.
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber < number]
]

{ #category : #private }
XPathNodeSetComparable >> notEqualToBoolean: aBoolean [
	^ value asXPathBoolean ~= aBoolean
]

{ #category : #private }
XPathNodeSetComparable >> notEqualToNodeSet: aNodeSet [
	| smallerNodeSet largerNodeSet |

	"From the spec:
		'If both objects to be compared are node-sets, then the comparison
	will be true if and only if there is a node in the first node-set and
	a node in the second node-set such that the result of performing the
	comparison on the string-values of the two nodes is true.'"
	value size < aNodeSet size
		ifTrue: [
			smallerNodeSet := value.
			largerNodeSet := aNodeSet]
		ifFalse: [
			smallerNodeSet := aNodeSet.
			largerNodeSet := value].
	smallerNodeSet size > 0
		ifTrue: [| smallerNodeSetStringValues |
			smallerNodeSetStringValues :=
				smallerNodeSet collect: [:each | each stringValue].
			largerNodeSet do: [:node | | stringValue |
				stringValue := node stringValue.
				smallerNodeSetStringValues do: [:each |
					stringValue ~= each
						ifTrue: [^ true]]]].
	^ false.
]

{ #category : #private }
XPathNodeSetComparable >> notEqualToNumber: aNumber [
	^ value anySatisfy: [:each |
		each stringValue asXPathNumber ~= aNumber]
]

{ #category : #private }
XPathNodeSetComparable >> notEqualToString: aString [
	^ value anySatisfy: [:each |
		each stringValue ~= aString]
]

{ #category : #comparing }
XPathNodeSetComparable >> ~= aComparable [
	^ aComparable notEqualToNodeSet: value
]
