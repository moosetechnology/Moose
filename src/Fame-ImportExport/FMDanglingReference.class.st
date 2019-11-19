"
Description
--------------------

During the import of a model, each entity has an index.
References are made via the indexes in the export format.

During the loading, in case we have, in the values of a property, a reference to a class that is not yet loaded, I am instantiated to serve has a temporary reference until I am resolved.

 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	owner:			<aFMFutureAttribute>	The attribute whose I'll be the type.
	position:		<anInteger>				My position among the values contained by my parent property.

"
Class {
	#name : #FMDanglingReference,
	#superclass : #Object,
	#instVars : [
		'owner',
		'position'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMDanglingReference class >> with: aFutureAttribute [
	^ self new
		owner: aFutureAttribute;
		yourself
]

{ #category : #'initialize-release' }
FMDanglingReference >> owner: aFutureAttribute [
	owner := aFutureAttribute.
	owner count: owner count + 1.
	position := owner values size + 1
]

{ #category : #parsing }
FMDanglingReference >> resolve: element [
	self assert: element isNotNil.

	"Here I am replacing myself in the list of values by the resolved element."
	owner values at: position put: element.
	owner count: owner count - 1.
	owner maybeEnd
]
