Class {
	#name : #FamixTestTagsGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'testTagEntity'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestTagsGenerator class >> packageName [
	^ 'Famix-TestTags'
]

{ #category : #accessing }
FamixTestTagsGenerator class >> prefix [
	^ #FamixTestTags
]

{ #category : #accessing }
FamixTestTagsGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
FamixTestTagsGenerator >> defineClasses [
	super defineClasses.
	testTagEntity := builder newClassNamed: #Entity.
	self remoteEntity: #Tag withPrefix: #Famix
]

{ #category : #definition }
FamixTestTagsGenerator >> defineHierarchy [
	super defineHierarchy.
	testTagEntity --|> #TWithTags
]
