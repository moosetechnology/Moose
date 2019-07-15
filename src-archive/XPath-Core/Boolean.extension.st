Extension { #name : #Boolean }

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathBoolean [
	^ self
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathComparable [
	^ XPathBooleanComparable value: self
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathFilterExpressionLocationPathRoot [
	XPathTypeException signal: 'Cannot use booleans as location path roots'
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathFilterExpressionPredicateRoot [
	XPathTypeException signal: 'Cannot filter booleans'
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathNodeSet [
	XPathTypeException signal: 'Cannot convert booleans to node sets'
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathNumber [
	"Gemstone has TrueClass/FalseClass instead of True/False subclasses,
	so this is implemented in the superclass for portability"
	^ self
		ifTrue: [1.0]
		ifFalse: [0.0]
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathString [
	"Gemstone has TrueClass/FalseClass instead of True/False subclasses,
	so this is implemented in the superclass for portability"
	^ self
		ifTrue: ['true']
		ifFalse: ['false']
]

{ #category : #'*XPath-Core-converting' }
Boolean >> asXPathUnionable [
	XPathTypeException signal: 'Cannot union booleans'
]
