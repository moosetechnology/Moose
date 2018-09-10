"
This is a base class for absolute or relative location path AST nodes. Each path can have any number of step nodes.
"
Class {
	#name : #XPathASTLocationPathNode,
	#superclass : #XPathASTNode,
	#instVars : [
		'steps'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTLocationPathNode class >> steps: aStepCollection [
	^ self new steps: aStepCollection
]

{ #category : #visiting }
XPathASTLocationPathNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitLocationPath: self
]

{ #category : #adding }
XPathASTLocationPathNode >> addStep: aStep [
	^ self steps addLast: (self beParentOf: aStep)
]

{ #category : #defaults }
XPathASTLocationPathNode >> defaultTypeClass [
	^ XPathNodeSetValueType
]

{ #category : #testing }
XPathASTLocationPathNode >> hasSteps [
	^ steps notNil
		and: [steps notEmpty]
]

{ #category : #testing }
XPathASTLocationPathNode >> isLocationPath [
	^ true
]

{ #category : #testing }
XPathASTLocationPathNode >> isPredicateLocationPath [
	^ self hasParent
		and: [self parent isPredicate]
]

{ #category : #removing }
XPathASTLocationPathNode >> removeStep: aStep [
	^ self steps remove: aStep
]

{ #category : #removing }
XPathASTLocationPathNode >> removeSteps [
	^ self steps removeAll
]

{ #category : #accessing }
XPathASTLocationPathNode >> steps [
	^ steps ifNil: [steps := OrderedCollection new]
]

{ #category : #accessing }
XPathASTLocationPathNode >> steps: aStepCollection [
	steps := self beParentOfAll: aStepCollection asOrderedCollection
]

{ #category : #enumerating }
XPathASTLocationPathNode >> stepsDo: aBlock [
	steps
		ifNotNil: [steps do: aBlock]
]

{ #category : #accessing }
XPathASTLocationPathNode >> totalSteps [
	^ steps
		ifNil: [0]
		ifNotNil: [steps size]
]
