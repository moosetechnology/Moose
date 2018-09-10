"
An identifier node. Variable name is identifier
"
Class {
	#name : #PJIdentifierNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'name'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance-creation' }
PJIdentifierNode class >> newWithName: aString [
	^ super new name: aString; yourself
]

{ #category : #comparing }
PJIdentifierNode >> = anotherNode [
	(self == anotherNode) ifTrue: [  ^ true ].
	(anotherNode class == self class) ifFalse: [ ^ false].

	^ (self name = anotherNode name)
]

{ #category : #accessing }
PJIdentifierNode >> acceptVisitor: aVisitor [

	^ aVisitor visitIdentifierNode: self
]

{ #category : #comparing }
PJIdentifierNode >> hash [
	^ self name hash
]

{ #category : #accessing }
PJIdentifierNode >> name [
	^ name
]

{ #category : #accessing }
PJIdentifierNode >> name: aString [
	name := aString
]

{ #category : #accessing }
PJIdentifierNode >> type [
	^ self name
]

{ #category : #evaluating }
PJIdentifierNode >> value [
	^ self name
]
