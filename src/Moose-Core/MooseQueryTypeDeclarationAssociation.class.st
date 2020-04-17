"
MooseQueryInstanciationAssociation is a fake FamixAssociation to handle Instanciations between FamixStructuralEntities and their FamixType in MooseQuery (MooseIncoming/OutgoingQueryResult)

Instance Variables:
	from	the Famixentity that is typed
	to	      the FamixType
"
Class {
	#name : #MooseQueryTypeDeclarationAssociation,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #'Moose-Core'
}

{ #category : #'instance creation' }
MooseQueryTypeDeclarationAssociation class >> newFrom: varOrBehavior to: aType [
	"some syntactic sugar"

	^ self new
		from: varOrBehavior ;
		to: aType ;
		yourself
]

{ #category : #converting }
MooseQueryTypeDeclarationAssociation >> asString [

	^ self from asString , ' -> ' , self to asString
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> from [
	^ from
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> from: anObject [
	from := anObject
]

{ #category : #converting }
MooseQueryTypeDeclarationAssociation >> printOn: aStream [

	aStream nextPutAll: self from asString.
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: self to asString
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> source [
	self flag: 'https://github.com/moosetechnology/Moose/issues/2092'.
	^ self from
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> source: anObject [
	self flag: 'https://github.com/moosetechnology/Moose/issues/2092'.
	self from: anObject
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> target [
	self flag: 'https://github.com/moosetechnology/Moose/issues/2092'.
	^ self to
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> target: anObject [
	self flag: 'https://github.com/moosetechnology/Moose/issues/2092'.
	self to: anObject
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> to [
	^ to
]

{ #category : #accessing }
MooseQueryTypeDeclarationAssociation >> to: anObject [
	to := anObject
]
