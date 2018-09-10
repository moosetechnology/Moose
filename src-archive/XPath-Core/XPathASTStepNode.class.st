"
This is a base class for AST location path step nodes.
"
Class {
	#name : #XPathASTStepNode,
	#superclass : #XPathASTNode,
	#instVars : [
		'nodeTest',
		'predicates'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTStepNode class >> nodeTest: aNodeTest [
	^ self new nodeTest: aNodeTest
]

{ #category : #'instance creation' }
XPathASTStepNode class >> nodeTest: aNodeTest predicates: aPredicateCollection [
	^ (self nodeTest: aNodeTest)
		predicates: aPredicateCollection
]

{ #category : #visiting }
XPathASTStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitStep: self
]

{ #category : #adding }
XPathASTStepNode >> addPredicate: aPredicate [
	^ self predicates addLast: (self beParentOf: aPredicate)
]

{ #category : #accessing }
XPathASTStepNode >> axisName [
	self subclassResponsibility
]

{ #category : #testing }
XPathASTStepNode >> hasPredicates [
	^ predicates notNil
		and: [predicates notEmpty]
]

{ #category : #testing }
XPathASTStepNode >> isFilterable [
	^ true
]

{ #category : #testing }
XPathASTStepNode >> isForwardAxisStep [
	^ false
]

{ #category : #testing }
XPathASTStepNode >> isPredicateLocationPathStep [
	"returns true if the step is part of a location path that is the
	expression of a predicate node"
	^ self hasParent
		and: [self parent isPredicateLocationPath]
]

{ #category : #testing }
XPathASTStepNode >> isReverseAxisStep [
	^ false
]

{ #category : #testing }
XPathASTStepNode >> isStep [
	^ true
]

{ #category : #accessing }
XPathASTStepNode >> nodeTest [
	^ nodeTest ifNil: [nodeTest := XPathASTNullNode new]
]

{ #category : #accessing }
XPathASTStepNode >> nodeTest: aNode [
	nodeTest := self beParentOf: aNode
]

{ #category : #accessing }
XPathASTStepNode >> predicates [
	^ predicates ifNil: [predicates := OrderedCollection new]
]

{ #category : #accessing }
XPathASTStepNode >> predicates: aPredicateCollection [
	predicates := self beParentOfAll: aPredicateCollection asOrderedCollection
]

{ #category : #enumerating }
XPathASTStepNode >> predicatesDo: aBlock [
	predicates
		ifNotNil: [predicates do: aBlock]
]

{ #category : #accessing }
XPathASTStepNode >> principalNodeType [
	^ XPathElementNodeType new
]

{ #category : #removing }
XPathASTStepNode >> removePredicate: aPredicate [
	^ self predicates remove: aPredicate
]

{ #category : #removing }
XPathASTStepNode >> removePredicates [
	^ self predicates removeAll
]

{ #category : #accessing }
XPathASTStepNode >> totalPredicates [
	^ predicates
		ifNil: [0]
		ifNotNil: [predicates size]
]
