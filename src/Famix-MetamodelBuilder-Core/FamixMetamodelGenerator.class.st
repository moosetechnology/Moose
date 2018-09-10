"
FamixMetamodelGenerator
"
Class {
	#name : #FamixMetamodelGenerator,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#classInstVars : [
		'metamodel'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #'as yet unclassified' }
FamixMetamodelGenerator class >> builderWithDefinitions [

	^ self new define builder
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

	| classes tower |

	FMRelationSlot allSubInstancesDo: #resetMooseProperty.

	classes := self packageName asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ].
	classes addAll: (self packageName asPackage definedClasses select: #isTrait).
	classes addAll: #'Famix-Traits' asPackage definedClasses.
	{ Trait. 	Class. ClassDescription. Behavior. MooseModel. MooseAbstractGroup. MooseEntity. MooseGroup} 
		do: [ :each | classes add: each ].
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	
	^ metamodel
]

{ #category : #definition }
FamixMetamodelGenerator >> adoptBuilder: aBuilder [

	aBuilder 
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

]

{ #category : #definition }
FamixMetamodelGenerator >> initialize [

	super initialize.
	
	builder := self newBuilder.
	self adoptBuilder: builder.

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
