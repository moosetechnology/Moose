Class {
	#name : #FamixTestComposedGenerator,
	#superclass : #FamixComposedMetamodelGenerator,
	#instVars : [
		'association',
		'entity'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTestComposedGenerator class >> packageName [ 

	^ 'Famix-TestComposedMetamodel-Entities'
]

{ #category : #accessing }
FamixTestComposedGenerator class >> prefix [

	^ #FamixTestComposed
]

{ #category : #accessing }
FamixTestComposedGenerator class >> submetamodels [

	^ { FamixTestComposedSubmetamodel1Generator. FamixTestComposedSubmetamodel2Generator }
]

{ #category : #definition }
FamixTestComposedGenerator >> define [ 

	| test1Method test2Class |
	
	super define.
	
	entity := builder newClassNamed: #Entity.
	
	test1Method := self remoteEntity: #Method withPrefix: #FamixTestComposed1.
	test2Class := self remoteEntity: #Class withPrefix: #FamixTestComposed2.
	
	entity - test1Method.
]
