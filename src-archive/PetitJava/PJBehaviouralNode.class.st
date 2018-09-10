"
Behavioural node is some entity which has a behavior in it. This reffers to methods in general, but can also reffer to a constructor
"
Class {
	#name : #PJBehaviouralNode,
	#superclass : #PJBodyDeclarationNode,
	#instVars : [
		'simpleName',
		'returnType',
		'parameters'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJBehaviouralNode class >> named: aString [ 

	^(self new) simpleName: aString ; yourself 
]

{ #category : #comparing }
PJBehaviouralNode >> = anotherNode [
	(self == anotherNode) ifTrue: [  ^ true ].
	(self class == anotherNode class) ifFalse: [ ^ false].

	(self returnType = anotherNode returnType) ifFalse: [ ^ false ].
	(self simpleName = anotherNode simpleName) ifFalse: [ ^ false ].
	"	
	Enable when PJParameterDeclarationNode comparison works
	(self parameters = anotherNode parameters) ifFalse: [ ^ false ].
	"

	^ true
]

{ #category : #comparing }
PJBehaviouralNode >> hash [
	^ self returnType hash bitXor: [ self simpleName hash bitXor: [ self parameters hash ] ]
]

{ #category : #accessing }
PJBehaviouralNode >> parameters [
	^ parameters
]

{ #category : #accessing }
PJBehaviouralNode >> parameters: anObject [
	parameters := anObject
]

{ #category : #accessing }
PJBehaviouralNode >> returnType [
	^ returnType
]

{ #category : #accessing }
PJBehaviouralNode >> returnType: anObject [
	returnType := anObject
]

{ #category : #accessing }
PJBehaviouralNode >> simpleName [
	^ simpleName
]

{ #category : #accessing }
PJBehaviouralNode >> simpleName: anObject [
	simpleName := anObject
]
