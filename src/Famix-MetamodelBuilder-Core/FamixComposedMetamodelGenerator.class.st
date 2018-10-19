Class {
	#name : #FamixComposedMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'subbuilders'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FamixComposedMetamodelGenerator class >> resetMetamodel [

	| elements |
	
	super resetMetamodel.

	elements := self submetamodels flatCollect: [ :each | each metamodel elements ].

	elements do: [ :each |
		metamodel elementNamed: each fullName ifAbsent: [ metamodel add: each ] ].
		
	^ metamodel
]

{ #category : #accessing }
FamixComposedMetamodelGenerator class >> submetamodels [ 

	self subclassResponsibility.
]

{ #category : #definition }
FamixComposedMetamodelGenerator >> generateWithoutCleaning [

	self define.
	self builder generate.

	subbuilders do: #generateRemotes
]

{ #category : #definition }
FamixComposedMetamodelGenerator >> initialize [ 
	
	super initialize.
	
	subbuilders := Dictionary newFrom: (self class submetamodels collect: [ :each | 
		| subbuilder |
		subbuilder := each builderWithDefinitions.
		subbuilder parentBuilder: self builder.
		builder environment: builder environment.		
		each prefix -> subbuilder ]).
	
]

{ #category : #definition }
FamixComposedMetamodelGenerator >> remoteEntity: anEntityName from: aPackageName [

	
]

{ #category : #definition }
FamixComposedMetamodelGenerator >> remoteEntity: anEntityName withPrefix: aPrefixName [

	| anEntity |
	
	anEntity := (subbuilders at: aPrefixName) ensureClassNamed: anEntityName.
	anEntity isRemote: true.
	
	^ anEntity.

	
]
