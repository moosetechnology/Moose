Class {
	#name : #FamixTestComposed3Generator,
	#superclass : #FamixMetamodelGenerator,
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestComposed3Generator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

{ #category : #accessing }
FamixTestComposed3Generator class >> packageName [ 

	^ 'Famix-TestComposed3Metamodel-Entities'
]

{ #category : #accessing }
FamixTestComposed3Generator class >> prefix [

	^ #FamixTestComposed3
]

{ #category : #accessing }
FamixTestComposed3Generator class >> submetamodels [

	^ { FamixTestComposedComposedGenerator }
]
