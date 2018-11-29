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
FamixMetamodelGenerator class >> basicFamixTraits [

	^ #'Famix-Traits' asPackage definedClasses.
	
]

{ #category : #accessing }
FamixMetamodelGenerator class >> basicMetamodelClasses [

	^ ({ Trait. 	Class. ClassDescription. Behavior. MooseEntity. FmxImportingContext. FamixTSourceLanguage. FamixTWithSourceLanguage}, MooseAbstractGroup withAllSubclasses) asOrderedCollection.
]

{ #category : #accessing }
FamixMetamodelGenerator class >> builderWithDefinitions [

	^ self new define builder
]

{ #category : #accessing }
FamixMetamodelGenerator class >> fixRemoteMetamodelRelationsIn: aMetamodel [

	"Description of relations that are created between composed meta-models are not 
	correct because they are created only from the information that the describing 
	method provide. It needs to be fixed using the information that the builder 
	provides."

	| remoteRelations aBuilder |
	
	aBuilder := self builderWithDefinitions.
	remoteRelations := aBuilder relations select: [ :aRelation | aRelation sides anySatisfy: #isRemote ].
	
	remoteRelations do: [ :aRelation |
		| class1 class2 property1 property2 |
		
		class1 := Smalltalk globals at: aRelation side relatedEntity fullName.
		class2 := Smalltalk globals at: aRelation oppositeSide relatedEntity fullName.
			
		property1 := (aMetamodel descriptionOf: class1) attributeNamed: aRelation side name.
		property2 := (aMetamodel descriptionOf: class2) attributeNamed: aRelation oppositeSide name.
		property1 opposite: property2.
		property2 opposite: property1.
		property1 type setImplementingClass: class2.	
		property2 type setImplementingClass: class1.
	]
	


]

{ #category : #'as yet unclassified' }
FamixMetamodelGenerator class >> generate [

	<ignoreForCoverage>
	self new generate
]

{ #category : #accessing }
FamixMetamodelGenerator class >> metamodel [
	^ metamodel ifNil: [ metamodel := self resetMetamodel ]
]

{ #category : #accessing }
FamixMetamodelGenerator class >> metamodel: anObject [

	<ignoreForCoverage>
	metamodel := anObject
]

{ #category : #accessing }
FamixMetamodelGenerator class >> modifyMetamodel: aMetamodel [

	"override this method to do some additional modificatoins of the metamodel"
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

	<ignoreForCoverage>
	self subclassResponsibility
]

{ #category : #accessing }
FamixMetamodelGenerator class >> packageNameForAnnotations [

	<ignoreForCoverage>
	^ self packageName
]

{ #category : #accessing }
FamixMetamodelGenerator class >> prefix [

	<ignoreForCoverage>
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
	
	classes addAll: self basicMetamodelClasses.
	
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	
	elements := self submetamodels flatCollect: [ :each | each metamodel elements ].

	elements do: [ :each |
		metamodel elementNamed: each fullName ifAbsent: [ metamodel add: each ] ].
	
	self modifyMetamodel: metamodel.
	
	metamodel additionalProperties at: #wantsAllEntitiesNavigation put: self wantsAllEntitiesNavigation.
	
	^ metamodel
]

{ #category : #accessing }
FamixMetamodelGenerator class >> submetamodels [ 

	^ OrderedCollection new
]

{ #category : #accessing }
FamixMetamodelGenerator class >> wantsAllEntitiesNavigation [

	"I want to display all model entities in the navigation by default"

	^ true
]

{ #category : #definition }
FamixMetamodelGenerator >> adoptBuilder: aBuilder [

	aBuilder configuration 
		prefix: self prefix;
		packageName: self packageName;
		packageNameForAnnotations: self packageNameForAnnotations.

]

{ #category : #definition }
FamixMetamodelGenerator >> beForTesting [

	builder environment: (FmxMBRingEnvironment for: builder).

]

{ #category : #accessing }
FamixMetamodelGenerator >> builder [
	^ builder
]

{ #category : #accessing }
FamixMetamodelGenerator >> builder: anObject [
	builder := anObject
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
	anEntity remoteBuilder: builder.
	
	^ anEntity.
]
