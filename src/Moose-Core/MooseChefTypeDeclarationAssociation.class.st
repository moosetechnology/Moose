"
MooseChefInstanciationAssociation is a fake FamixAssociation to handle Instanciations between FamixStructuralEntities and their FamixType in MooseChef (MooseIncoming/OutgoingQueryResult)

Instance Variables:
	from	the Famixentity that is typed
	to	      the FamixType
"
Class {
	#name : #MooseChefTypeDeclarationAssociation,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseChefTypeDeclarationAssociation class >> newFrom: varOrBehavior to: aType [
	"some syntactic sugar"

	^ self new
		from: varOrBehavior ;
		to: aType ;
		yourself
]

{ #category : #converting }
MooseChefTypeDeclarationAssociation >> asString [

	^ self from asString , ' -> ' , self to asString
]

{ #category : #accessing }
MooseChefTypeDeclarationAssociation >> from [
	^ from
]

{ #category : #accessing }
MooseChefTypeDeclarationAssociation >> from: anObject [
	from := anObject
]

{ #category : #converting }
MooseChefTypeDeclarationAssociation >> printOn: aStream [

	aStream nextPutAll: self from asString.
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: self to asString
]

{ #category : #accessing }
MooseChefTypeDeclarationAssociation >> to [
	^ to
]

{ #category : #accessing }
MooseChefTypeDeclarationAssociation >> to: anObject [
	to := anObject
]
