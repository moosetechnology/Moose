"
FamixMetamodelGenerator
"
Class {
	#name : #FamixMetamodelGenerator,
	#superclass : #Object,
	#instVars : [
		'builder',
		'subbuilders'
	],
	#classInstVars : [
		'metamodel'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #accessing }
FamixMetamodelGenerator class >> builderWithDefinitions [

	^ self new define builder
]

{ #category : #'as yet unclassified' }
FamixMetamodelGenerator class >> generate [

	self new generate
]

{ #category : #accessing }
FamixMetamodelGenerator class >> metamodel [
	^ metamodel ifNil: [ metamodel := self resetMetamodel ]
]

{ #category : #accessing }
FamixMetamodelGenerator class >> metamodel: anObject [
	metamodel := anObject
]

{ #category : #accessing }
FamixMetamodelGenerator class >> newRepository [

	| tower |
	
	tower := FMCompleteTower new.
	tower metamodel addAll: self metamodel elements.
	^ tower model.
]

{ #category : #accessing }
FamixMetamodelGenerator class >> packageName [

	self subclassResponsibility
]

{ #category : #accessing }
FamixMetamodelGenerator class >> packageNameForAnnotations [

	^ self packageName
]

{ #category : #accessing }
FamixMetamodelGenerator class >> prefix [

	^ self packageName
]

{ #category : #accessing }
FamixMetamodelGenerator class >> resetMetamodel [

	" self resetMetamodel"

	| classes tower elements |

	FMRelationSlot allSubInstancesDo: #resetMooseProperty.

	classes := self packageName asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ].
	classes addAll: (self packageName asPackage definedClasses select: #isTrait).
	classes addAll: #'Famix-Traits' asPackage definedClasses.
	{ Trait. 	Class. ClassDescription. Behavior. MooseModel. MooseAbstractGroup. MooseEntity. MooseGroup} 
		do: [ :each | classes add: each ].
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	
	elements := self submetamodels flatCollect: [ :each | each metamodel elements ].

	elements do: [ :each |
		metamodel elementNamed: each fullName ifAbsent: [ metamodel add: each ] ].
		
	^ metamodel
]

{ #category : #accessing }
FamixMetamodelGenerator class >> submetamodels [ 

	^ OrderedCollection new
]

{ #category : #definition }
FamixMetamodelGenerator >> adoptBuilder: aBuilder [

	aBuilder configuration 
		prefix: self prefix;
		packageName: self packageName;
		packageNameForAnnotations: self packageNameForAnnotations.

]

{ #category : #accessing }
FamixMetamodelGenerator >> builder [
	^ builder
]

{ #category : #accessing }
FamixMetamodelGenerator >> builder: anObject [
	builder := anObject
]

{ #category : #definition }
FamixMetamodelGenerator >> builderWithStandardTraits [

	| standardBuilder mooseGenerator |
	
	standardBuilder := FamixGenerator builderWithDefinitions.

	"add Moose-Query"
	mooseGenerator := FamixMooseQueryGenerator new.
	mooseGenerator builder: standardBuilder.
	mooseGenerator adoptBuilder: standardBuilder.
	standardBuilder generator: mooseGenerator.
	mooseGenerator define.
	
	self adoptBuilder: standardBuilder.

	^ standardBuilder
		doNotGenerateCurrent;
		generator: self;
		yourself.
]

{ #category : #generation }
FamixMetamodelGenerator >> cleanPackage [

	(self packageName asPackageIfAbsent: [ nil ]) 
		ifNotNil: [:aPackage | aPackage removeFromSystem ].
]

{ #category : #definition }
FamixMetamodelGenerator >> define [

	self defineTraits.
	self defineClasses.
	self defineHierarchy.
	self defineProperties.
	self defineRelations.
	
]

{ #category : #definition }
FamixMetamodelGenerator >> defineClasses [
]

{ #category : #definition }
FamixMetamodelGenerator >> defineHierarchy [
]

{ #category : #definition }
FamixMetamodelGenerator >> defineProperties [
]

{ #category : #definition }
FamixMetamodelGenerator >> defineRelations [
]

{ #category : #definition }
FamixMetamodelGenerator >> defineTraits [
]

{ #category : #generation }
FamixMetamodelGenerator >> generate [

	self generateWithoutCleaning.
	self class resetMetamodel.
]

{ #category : #generation }
FamixMetamodelGenerator >> generateWithCleaning [

	self cleanPackage.
	self define.
	self builder generate.
]

{ #category : #generation }
FamixMetamodelGenerator >> generateWithoutCleaning [

	self define.
	self builder generate.
	
	subbuilders do: #generateRemotes

]

{ #category : #definition }
FamixMetamodelGenerator >> initialize [

	super initialize.
	
	builder := self newBuilder.
	self adoptBuilder: builder.
	
	subbuilders := Dictionary newFrom: (self class submetamodels collect: [ :each | 
		| subbuilder |
		subbuilder := each builderWithDefinitions.
		subbuilder parentBuilder: self builder.
		builder environment: builder environment.		
		each prefix -> subbuilder ]).

]

{ #category : #definition }
FamixMetamodelGenerator >> newBuilder [

	| aBuilder |
	
	aBuilder := FamixMetamodelBuilder new.
	aBuilder generator: self.
	
	^ aBuilder
]

{ #category : #definition }
FamixMetamodelGenerator >> packageName [

	^ self class packageName

]

{ #category : #definition }
FamixMetamodelGenerator >> packageNameForAnnotations [

	^ self class packageNameForAnnotations

]

{ #category : #definition }
FamixMetamodelGenerator >> prefix [

	^ self class prefix
]

{ #category : #'as yet unclassified' }
FamixMetamodelGenerator >> remoteEntity: anEntityName withPrefix: aPrefixName [ 

	| anEntity |
	
	anEntity := (subbuilders at: aPrefixName) ensureClassNamed: anEntityName.
	anEntity isRemote: true.
	
	^ anEntity.
]
