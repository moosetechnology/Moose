"
I describe all objects which are kind of particular class.

	#string should beKindOf: String
"
Class {
	#name : #SpecOfObjectSuperclass,
	#superclass : #SpecOfObjectRelationship,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfObjectSuperclass >> basicMatches: anObject [ 
	| objectClass |
	objectClass := anObject retriveClassForStateSpecs.
	^objectClass == requiredClass or: [objectClass inheritsFrom: requiredClass]
]

{ #category : #testing }
SpecOfObjectSuperclass >> clauseKeyword [
	^'be a kind of'
]
