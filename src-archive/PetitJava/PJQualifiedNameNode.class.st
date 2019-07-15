Class {
	#name : #PJQualifiedNameNode,
	#superclass : #PJNameNode,
	#instVars : [
		'qualifier',
		'simpleName'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJQualifiedNameNode class >> name: aPJSimpleName qualifier: aPJName [

	^(self new) simpleName: aPJSimpleName ; qualifier: aPJName; yourself
]

{ #category : #accessing }
PJQualifiedNameNode >> fullyQualifiedName [
	^ (self qualifier fullyQualifiedName ) , '.' , self simpleName fullyQualifiedName
]

{ #category : #accessing }
PJQualifiedNameNode >> qualifier [
	^ qualifier
]

{ #category : #accessing }
PJQualifiedNameNode >> qualifier: anObject [
	qualifier := anObject
]

{ #category : #accessing }
PJQualifiedNameNode >> simpleName [
	^ simpleName
]

{ #category : #accessing }
PJQualifiedNameNode >> simpleName: anObject [
	simpleName := anObject
]
