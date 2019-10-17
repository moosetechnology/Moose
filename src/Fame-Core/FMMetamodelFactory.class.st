"
I am a general factory that is used to create meta-model entities independently on a particular meta-model.
"
Class {
	#name : #FMMetamodelFactory,
	#superclass : #Object,
	#instVars : [
		'fm3Package'
	],
	#category : #'Fame-Core'
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
