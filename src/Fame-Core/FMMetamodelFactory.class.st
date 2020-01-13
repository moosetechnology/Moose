"
Description
--------------------

I am a general factory that is used to create meta-model entities independently on a particular meta-model.

I take as parameter a fm3Package and will look for the entities into it.

NOTE: (Cyril) This factory was done based on a FM3Package but maybe it should instead be based on a FMMetaModel? What if we have a composed MM and we need an entity from another package?
"
Class {
	#name : #FMMetamodelFactory,
	#superclass : #Object,
	#instVars : [
		'fm3Package'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #'instance creation' }
FMMetamodelFactory class >> fm3Package: aPackage [
	^ self new
		fm3Package: aPackage;
		yourself
]

{ #category : #accessing }
FMMetamodelFactory >> entityNamed: aString [

	^ self entityNamed: aString ifAbsent: [ nil ]
]

{ #category : #accessing }
FMMetamodelFactory >> entityNamed: aString ifAbsent: aBlock [
	self fm3Package ifNil: [ ^ aBlock value ].

	^ (self fm3Package classNamed: aString ifAbsent: aBlock) implementingClass
]

{ #category : #accessing }
FMMetamodelFactory >> fm3Package [
	^ fm3Package
]

{ #category : #accessing }
FMMetamodelFactory >> fm3Package: anObject [
	fm3Package := anObject
]
