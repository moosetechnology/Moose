Class {
	#name : #FamixTestComposedComposedGenerator,
	#superclass : #FamixMetamodelGenerator,
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestComposedComposedGenerator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

{ #category : #accessing }
FamixTestComposedComposedGenerator class >> packageName [ 

	^ 'Famix-TestComposedComposedMetamodel-Entities'
]

{ #category : #accessing }
FamixTestComposedComposedGenerator class >> prefix [

	^ #FamixTestComposedComposed
]

{ #category : #accessing }
FamixTestComposedComposedGenerator class >> submetamodels [

	^ { FamixTestComposedGenerator }
]
