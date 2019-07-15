Class {
	#name : #PJSimpleNameNode,
	#superclass : #PJNameNode,
	#instVars : [
		'isDeclaration',
		'identifier'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJSimpleNameNode class >> identifier: aString [ 
	
	^(self new) identifier: aString; yourself
]

{ #category : #accessing }
PJSimpleNameNode >> fullyQualifiedName [
	^ self identifier value
]

{ #category : #accessing }
PJSimpleNameNode >> identifier [
	^ identifier
]

{ #category : #accessing }
PJSimpleNameNode >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
PJSimpleNameNode >> isDeclaration [
	^ isDeclaration
]

{ #category : #accessing }
PJSimpleNameNode >> isDeclaration: anObject [
	isDeclaration := anObject
]
