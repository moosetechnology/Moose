Class {
	#name : #PJNameNode,
	#superclass : #PJExpressionNode,
	#category : #'PetitJava-AST'
}

{ #category : #comparing }
PJNameNode >> = anotherNode [
	(self == anotherNode) ifTrue: [  ^ true ].
	(self class == anotherNode class) ifFalse: [ ^ false].
	
	^ self fullyQualifiedName = anotherNode fullyQualifiedName 
]

{ #category : #visiting }
PJNameNode >> acceptVisitor: aVisitor [

	aVisitor visitNameNode: self
]

{ #category : #accessing }
PJNameNode >> fullyQualifiedName [
	^ self subclassResponsibility 
]

{ #category : #comparing }
PJNameNode >> hash [
	^ self fullyQualifiedName hash
]
