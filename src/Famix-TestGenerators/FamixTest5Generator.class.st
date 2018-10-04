Class {
	#name : #FamixTest5Generator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'tbook',
		'tperson'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest5Generator class >> packageName [

	^ #'Famix-Test5-Entities'
]

{ #category : #accessing }
FamixTest5Generator class >> prefix [

	^ #'FamixTest5'
]

{ #category : #definition }
FamixTest5Generator >> defineClasses [

	super defineClasses.

	tbook := builder newTraitNamed: #Book.
	tperson := builder newTraitNamed: #Person.

]

{ #category : #definition }
FamixTest5Generator >> defineHierarchy [

	super defineHierarchy.

]

{ #category : #definition }
FamixTest5Generator >> defineProperties [

	super defineProperties.


]

{ #category : #definition }
FamixTest5Generator >> defineRelations [

	super defineRelations.

	tbook *-<> tperson.

]
