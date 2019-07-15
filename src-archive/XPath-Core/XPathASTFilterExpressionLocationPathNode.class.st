"
This is an AST node class for filter expression location paths, where the root of the location path is some type of expression that evaluates to a node (if it's a varaible bound to one) or a node set.
"
Class {
	#name : #XPathASTFilterExpressionLocationPathNode,
	#superclass : #XPathASTNodeWithExpression,
	#instVars : [
		'steps'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTFilterExpressionLocationPathNode class >> expression: anExpression steps: aStepCollection [
	^ (self expression: anExpression)
		steps: aStepCollection
]

{ #category : #visiting }
XPathASTFilterExpressionLocationPathNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitFilterExpressionLocationPath: self
]

{ #category : #adding }
XPathASTFilterExpressionLocationPathNode >> addStep: aStep [
	^ self steps addLast: (self beParentOf: aStep)
]

{ #category : #defaults }
XPathASTFilterExpressionLocationPathNode >> defaultTypeClass [
	^ XPathNodeSetValueType
]

{ #category : #testing }
XPathASTFilterExpressionLocationPathNode >> hasSteps [
	^ steps notNil
		and: [steps notEmpty]
]

{ #category : #testing }
XPathASTFilterExpressionLocationPathNode >> isFilterExpressionLocationPath [
	^ true
]

{ #category : #testing }
XPathASTFilterExpressionLocationPathNode >> isLocationPath [
	^ true
]

{ #category : #testing }
XPathASTFilterExpressionLocationPathNode >> isPredicateLocationPath [
	^ self hasParent
		and: [self parent isPredicate]
]

{ #category : #removing }
XPathASTFilterExpressionLocationPathNode >> removeStep: aStep [
	^ self steps remove: aStep
]

{ #category : #removing }
XPathASTFilterExpressionLocationPathNode >> removeSteps [
	^ self steps removeAll
]

{ #category : #accessing }
XPathASTFilterExpressionLocationPathNode >> steps [
	^ steps ifNil: [steps := OrderedCollection new]
]

{ #category : #accessing }
XPathASTFilterExpressionLocationPathNode >> steps: aStepCollection [
	steps := self beParentOfAll: aStepCollection asOrderedCollection
]

{ #category : #enumerating }
XPathASTFilterExpressionLocationPathNode >> stepsDo: aBlock [
	steps
		ifNotNil: [steps do: aBlock]
]

{ #category : #accessing }
XPathASTFilterExpressionLocationPathNode >> totalSteps [
	^ steps
		ifNil: [0]
		ifNotNil: [steps size]
]
