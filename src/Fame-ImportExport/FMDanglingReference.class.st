"
Description
--------------------

During the import of a model, each entity has an index.
References are made via the indexes in the export format.

During the loading, in case we have, in the values of a property, a reference to a class that is not yet loaded, I am instantiated to serve has a temporary reference until I am resolved.

 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	parentProperty			<aFMFutureProperty>	The property whose values contain the entity I replace..
	position:					<anInteger>				My position among the values contained by my parent property.

"
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

{ #category : #testing }
FMDanglingReference >> isDanglingReference [
	^ true
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
