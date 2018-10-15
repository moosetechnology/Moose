Class {
	#name : #FamixCombinedMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FamixCombinedMetamodelGenerator class >> resetMetamodel [

	| elements |
	
	super resetMetamodel.

	elements := self submetamodels flatCollect: [ :each | each metamodel elements ].

	elements do: [ :each |
		metamodel elementNamed: each fullName ifAbsent: [ metamodel add: each ] ].
		
	^ metamodel
]

{ #category : #accessing }
FamixCombinedMetamodelGenerator class >> submetamodels [ 

	self subclassResponsibility.
]
