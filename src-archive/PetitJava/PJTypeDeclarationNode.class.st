Class {
	#name : #PJTypeDeclarationNode,
	#superclass : #PJAbstractTypeDeclarationNode,
	#instVars : [
		'isInterface',
		'superclassType',
		'superInterfaceTypes',
		'fieldDeclarations',
		'methodDeclarations'
	],
	#category : #'PetitJava-AST'
}

{ #category : #comparing }
PJTypeDeclarationNode >> = anotherNode [
	super = anotherNode ifFalse: [ ^ false ].
	^ self methodDeclarations = anotherNode methodDeclarations
]

{ #category : #visiting }
PJTypeDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitTypeDeclarationNode: self
]

{ #category : #accessing }
PJTypeDeclarationNode >> fieldDeclarations [
	^ fieldDeclarations
]

{ #category : #accessing }
PJTypeDeclarationNode >> fieldDeclarations: anObject [
	fieldDeclarations := anObject
]

{ #category : #comparing }
PJTypeDeclarationNode >> hash [
	^ super hash bitXor: [ self methodDeclarations hash ]
]

{ #category : #accessing }
PJTypeDeclarationNode >> isInterface [
	^ isInterface
]

{ #category : #accessing }
PJTypeDeclarationNode >> isInterface: anObject [
	isInterface := anObject
]

{ #category : #accessing }
PJTypeDeclarationNode >> methodDeclarations [
	^ methodDeclarations
]

{ #category : #accessing }
PJTypeDeclarationNode >> methodDeclarations: anObject [
	methodDeclarations := anObject
]

{ #category : #accessing }
PJTypeDeclarationNode >> superInterfaceTypes [
	^ superInterfaceTypes
]

{ #category : #accessing }
PJTypeDeclarationNode >> superInterfaceTypes: anObject [
	superInterfaceTypes := anObject
]

{ #category : #accessing }
PJTypeDeclarationNode >> superclassType [
	^ superclassType
]

{ #category : #accessing }
PJTypeDeclarationNode >> superclassType: anObject [
	superclassType := anObject
]
