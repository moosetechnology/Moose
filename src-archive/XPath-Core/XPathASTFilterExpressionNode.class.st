"
This is an AST node class for filter expressions with a subexpression and zero or more predicates to filter the expression with.
"
Class {
	#name : #XPathASTFilterExpressionNode,
	#superclass : #XPathASTNodeWithExpression,
	#instVars : [
		'predicates'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTFilterExpressionNode class >> expression: anExpression predicates: aPredicateCollection [
	^ (self expression: anExpression)
		predicates: aPredicateCollection
]

{ #category : #visiting }
XPathASTFilterExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitFilterExpression: self
]

{ #category : #adding }
XPathASTFilterExpressionNode >> addPredicate: aPredicate [
	^ self predicates addLast: (self beParentOf: aPredicate)
]

{ #category : #defaults }
XPathASTFilterExpressionNode >> defaultTypeClass [
	^ XPathNodeSetValueType
]

{ #category : #testing }
XPathASTFilterExpressionNode >> hasPredicates [
	^ predicates notNil
		and: [predicates notEmpty]
]

{ #category : #testing }
XPathASTFilterExpressionNode >> isFilterExpression [
	^ true
]

{ #category : #testing }
XPathASTFilterExpressionNode >> isFilterable [
	^ true
]

{ #category : #accessing }
XPathASTFilterExpressionNode >> predicates [
	^ predicates ifNil: [predicates := OrderedCollection new]
]

{ #category : #accessing }
XPathASTFilterExpressionNode >> predicates: aPredicateCollection [
	predicates := self beParentOfAll: aPredicateCollection asOrderedCollection
]

{ #category : #enumerating }
XPathASTFilterExpressionNode >> predicatesDo: aBlock [
	predicates
		ifNotNil: [predicates do: aBlock]
]

{ #category : #removing }
XPathASTFilterExpressionNode >> removePredicate: aPredicate [
	^ self predicates remove: aPredicate
]

{ #category : #removing }
XPathASTFilterExpressionNode >> removePredicates [
	^ self predicates removeAll
]

{ #category : #accessing }
XPathASTFilterExpressionNode >> totalPredicates [
	^ predicates
		ifNil: [0]
		ifNotNil: [predicates size]
]
