"
I am a general factory that is used to create meta-model entities independently on a particular meta-model
"
Class {
	#name : #FMMetamodelFactory,
	#superclass : #Object,
	#instVars : [
		'metamodelClass'
	],
	#category : #'Fame-Core'
}

{ #category : #'instance creation' }
FMMetamodelFactory class >> on: aMetamodelClass [

	^ self new metamodelClass: aMetamodelClass
]

{ #category : #accessing }
FMMetamodelFactory >> entityNamed: aString [

	^ self entityNamed: aString ifAbsent: [ nil ]
]

{ #category : #accessing }
FMMetamodelFactory >> entityNamed: aString ifAbsent: aBlock [

	| aMetamodel fullEntityName |
	
	self metamodelClass ifNil: [ ^ aBlock value ].
	aMetamodel := self metamodelClass metamodel.
	aMetamodel ifNil: [ ^ aBlock value ].
	fullEntityName := metamodelClass packageNameForAnnotations, '.', aString.
	^ (aMetamodel elementNamed: fullEntityName ifAbsent: aBlock) implementingClass.

]

{ #category : #accessing }
FMMetamodelFactory >> metamodelClass [
	^ metamodelClass
]

{ #category : #accessing }
FMMetamodelFactory >> metamodelClass: anObject [
	metamodelClass := anObject
]
