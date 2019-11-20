Class {
	#name : #FMDanglingReference,
	#superclass : #Object,
	#instVars : [
		'position',
		'parentProperty'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMDanglingReference class >> with: aFutureAttribute [
	^ self new
		parentProperty: aFutureAttribute;
		yourself
]

{ #category : #initialization }
FMDanglingReference >> parentProperty: aFutureProperty [
	parentProperty := aFutureProperty.
	position := parentProperty values size + 1
]

{ #category : #parsing }
FMDanglingReference >> resolve: element [
	self assert: element isNotNil.
	parentProperty replaceDanglingReferenceAt: position by: element
]
