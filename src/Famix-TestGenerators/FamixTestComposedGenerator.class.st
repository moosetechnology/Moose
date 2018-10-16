Class {
	#name : #FamixTestComposedGenerator,
	#superclass : #FamixCombinedMetamodelGenerator,
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

	^ { FamixTest1Generator. FamixTest2Generator }
]

{ #category : #definition }
FamixTestComposedGenerator >> define [ 

	| test1Method |
	super define.
	
	entity := builder newClassNamed: #Entity.
	
	test1Method := (subbuilders at: #FamixTest1) ensureClassNamed: #Method.
	test1Method remote: true.
	
	test1Method - entity.
]
