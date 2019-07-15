"
A node representing a block of java code.

A block begins with: { ends with: } and has statement in between.
"
Class {
	#name : #PJBlockNode,
	#superclass : #PJASTNode,
	#instVars : [
		'statements'
	],
	#category : #'PetitJava-AST'
}

{ #category : #accessing }
PJBlockNode >> acceptVisitor: aVisitor [

	^ aVisitor visitStatementBlockNode: self
]

{ #category : #accessing }
PJBlockNode >> addStatement: aStatement [
	statements add: aStatement
]

{ #category : #'initialize-release' }
PJBlockNode >> initialize [
	statements := OrderedCollection new
]

{ #category : #accessing }
PJBlockNode >> statements [
	^ statements
]

{ #category : #accessing }
PJBlockNode >> statements: aCollection [
	statements := OrderedCollection withAll: aCollection
]
