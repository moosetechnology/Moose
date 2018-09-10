Class {
	#name : #PJTypeNode,
	#superclass : #PJASTNode,
	#instVars : [
		'type'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJTypeNode class >> type: aString [

	^(self new) type: aString; yourself
]

{ #category : #comparing }
PJTypeNode >> = anotherNode [
	(self == anotherNode) ifTrue: [  ^ true ].
	(anotherNode class == self class) ifFalse: [ ^ false].
	
	^ self type = anotherNode type
]

{ #category : #comparing }
PJTypeNode >> hash [
	^ self type hash
]

{ #category : #accessing }
PJTypeNode >> type [
	^ type
]

{ #category : #accessing }
PJTypeNode >> type: anObject [
	type := anObject
]

{ #category : #accessing }
PJTypeNode >> value [
	^ self type
]
