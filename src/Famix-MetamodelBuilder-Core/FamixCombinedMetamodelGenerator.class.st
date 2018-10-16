Class {
	#name : #FamixCombinedMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'subbuilders'
	],
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

{ #category : #definition }
FamixCombinedMetamodelGenerator >> generateWithoutCleaning [

	self define.
	self builder generate.

	subbuilders do: #generateRemotes
]

{ #category : #definition }
FamixCombinedMetamodelGenerator >> initialize [ 
	
	super initialize.
	
	subbuilders := Dictionary newFrom: (self class submetamodels collect: [ :each | 
		| subbuilder |
		subbuilder := each builderWithDefinitions.
		builder environment: builder environment.		
		each prefix -> subbuilder ]).
	
]
