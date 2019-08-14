"
Use me to create a Moose model.
You should extend me and then redefine the methods: 

(see documentation https://github.com/SquareBracketAssociates/Booklet-FamixNG)

- defineClasses: to define the entities (can be instanciate)
- defineHierarchy: to define the hierarchy of class
- defineProperties: to define the properties (fields) of an Entity
- defineTraits: to define the Traits (can't be instanciate)
- defineRelations: to define the relations between entities.
	- oneToOne:
	-* oneToMany:
	*- manyToOne:
	*-* manyToMany:

	<>- containsOne:
	<>-* containsMany:
	-<> oneBelongsTo:
	*-<> manyBelongTo:


Once the metamodel is defined, use:
	MyModelGenerator generate.


You can also redefine #submetamodels 
to use entities from another generator
"
Class {
	#name : #FamixMetamodelGenerator,
	#superclass : #Object,
	#instVars : [
		'builder',
		'cleaningStrategy',
		'subBuildersMapByPrefix'
	],
	#classInstVars : [
		'metamodel'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #generation }
FamixMetamodelGenerator class >> addSubmetamodelsToGenerateFrom: aCollection to: metamodels [
	aCollection
		select: #isComposed
		thenDo: [ :mm | 
			mm submetamodels do: [ :smm | (metamodels includes: smm) ifFalse: [ metamodels add: smm before: mm ] ].
			self addSubmetamodelsToGenerateFrom: mm submetamodels to: metamodels ]
]

{ #category : #accessing }
FamixMetamodelGenerator class >> allSubmetamodels [

	^ {self submetamodels . self submetamodels collect: #allSubmetamodels} flattened
]

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
FamixMetamodelGenerator class >> composedMetaModels [
	^ self allSubclasses select: [ :mm | mm isAbstract not and: [ mm isComposed ] ]
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

{ #category : #generation }
FamixMetamodelGenerator class >> generate [

	<ignoreForCoverage>
	self new generate
]

{ #category : #generation }
FamixMetamodelGenerator class >> generateAllMetamodels [
	<script>
	self metamodelsToGenerate
		do: [ :mm | mm generate ]
		displayingProgress: [ :mm | 'Regenerate ' , mm name ]
]

{ #category : #generation }
FamixMetamodelGenerator class >> individualGenerators [
	^ self allSubclasses select: [ :c | c isRealMetamodel and: [ c isPartOfComposedMetaModel not ] ]
]

{ #category : #testing }
FamixMetamodelGenerator class >> isAbstract [
	^ self = FamixMetamodelGenerator
]

{ #category : #testing }
FamixMetamodelGenerator class >> isComposed [
	^ self submetamodels isNotEmpty
]

{ #category : #testing }
FamixMetamodelGenerator class >> isPartOfComposedMetaModel [
	^ FamixMetamodelGenerator composedMetaModels anySatisfy: [ :mm | mm submetamodels includes: self ]
]

{ #category : #testing }
FamixMetamodelGenerator class >> isRealMetamodel [
	"I should return false for MMs that are used for tests and that should not be generated all the time."

	^ self isAbstract not
]

{ #category : #'world menu' }
FamixMetamodelGenerator class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Regenerate all metamodels')
		order: 40;
		parent: #Moose;
		action: [ self generateAllMetamodels ].
	(aBuilder item: #'Reset metamodels')
		order: 45;
		parent: #Moose;
		action: [ self resetMetamodels ];
		withSeparatorAfter
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

{ #category : #generation }
FamixMetamodelGenerator class >> metamodelsToGenerate [
	"We add she submetamodels before the MM composing them because if we do the other way around it will cause trouble when we regenerate all because it will remove the glue added by the composed MM."

	| metamodels |
	metamodels := self individualGenerators.
	self addSubmetamodelsToGenerateFrom: metamodels to: metamodels.
	^ metamodels
]

{ #category : #accessing }
FamixMetamodelGenerator class >> modifyMetamodel: aMetamodel [
	self submetamodels ifNotEmpty: [ self fixRemoteMetamodelRelationsIn: aMetamodel ]
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
	self submetamodels do: #resetMetamodel.
	FMRelationSlot allSubInstancesDo: #resetMooseProperty.

	classes := self packageName asPackage definedClasses select: [ :each | each inheritsFrom: MooseEntity ].
	classes addAll: (self packageName asPackage definedClasses select: [ :class | class isTrait and: [ class isMetamodelEntity ] ]).

	classes addAll: self basicMetamodelClasses.

	classes addAll: (self submetamodels flatCollect: [ :submetamodel | submetamodel metamodel classes collect: #implementingClass ]).

	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.

	elements := self submetamodels flatCollect: [ :each | each metamodel elements ].

	elements do: [ :each | metamodel elementNamed: each fullName ifAbsent: [ metamodel add: each ] ].
	
	self allSubmetamodels do: [ :submetamodel | submetamodel modifyMetamodel: metamodel ].
	self modifyMetamodel: metamodel.

	metamodel additionalProperties at: #wantsAllEntitiesNavigation put: self wantsAllEntitiesNavigation.
	
	"MooseEntity has a cache for some infos. When we regenerate a MM we need to flush this cache."
	classes do: #resetMooseEntityCache.
	
	^ metamodel
]

{ #category : #accessing }
FamixMetamodelGenerator class >> resetMetamodels [
	<script>
	self metamodelsToGenerate do: #resetMetamodel
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

{ #category : #accessing }
FamixMetamodelGenerator >> allSubBuilders [
	| result |
	result := self subBuilders asSet.
	self subBuilders
		do: [ :subBuilder | subBuilder generator allSubBuilders
			do: [ :subSubBuilder | (result anySatisfy: [ :b | b generator class = subSubBuilder generator class ])
				ifFalse: [ result add: subSubBuilder ] ] ].
	^ result
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

{ #category : #accessing }
FamixMetamodelGenerator >> cleaningStrategy [
	^ cleaningStrategy
]

{ #category : #accessing }
FamixMetamodelGenerator >> cleaningStrategy: anObject [
	cleaningStrategy := anObject
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
	"Next step to improve the cleaning is to add a report. For example if we cannot migrate a method since its class was removed from the MM, we should get notified with a report object."

	EpMonitor
		disableDuring: [ self define.
			self cleaningStrategy
				withCleaningDo: [ self builder generate.
					self subBuilders do: #generateRemotes ]
				with: self ].
	self class resetMetamodel
]

{ #category : #generation }
FamixMetamodelGenerator >> generateWithCleaning [
	self withCleaning.
	self generate
]

{ #category : #generation }
FamixMetamodelGenerator >> generateWithoutCleaning [
	self withoutCleaning.
	self generate
]

{ #category : #generation }
FamixMetamodelGenerator >> generatedPackage [
	^ self packageName asPackageIfAbsent: [ nil ]
]

{ #category : #definition }
FamixMetamodelGenerator >> initialize [

	super initialize.
	
	self withoutCleaning.
	
	builder := self newBuilder.
	self adoptBuilder: builder.
	
	subBuildersMapByPrefix := Dictionary newFrom: (self class submetamodels collect: [ :each | 
		| subbuilder |
		subbuilder := each builderWithDefinitions.
		subbuilder parentBuilder: self builder.
		builder environment: builder environment.		
		each prefix -> subbuilder ]).

]

{ #category : #accessing }
FamixMetamodelGenerator >> mooseModelName [
	^ self prefix , 'MooseModel'
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

{ #category : #testing }
FamixMetamodelGenerator >> regenerationIsNeeded [
	self define.
	^ self builder regenerationIsNeeded
]

{ #category : #definition }
FamixMetamodelGenerator >> remoteEntity: anEntityName withPrefix: aPrefixName [
	^ ((subBuildersMapByPrefix at: aPrefixName) ensureClassNamed: anEntityName)
		isRemote: true;
		remoteBuilder: builder;
		yourself
]

{ #category : #definition }
FamixMetamodelGenerator >> remoteTrait: anEntityName withPrefix: aPrefixName [
	^ ((subBuildersMapByPrefix at: aPrefixName) ensureTraitNamed: anEntityName)
		isRemote: true;
		remoteBuilder: builder;
		yourself
]

{ #category : #accessing }
FamixMetamodelGenerator >> subBuilders [
	^ subBuildersMapByPrefix values
]

{ #category : #definition }
FamixMetamodelGenerator >> withCleaning [
	self cleaningStrategy: FamixMetamodelGeneratorTotalCleaningStrategy new
]

{ #category : #definition }
FamixMetamodelGenerator >> withoutCleaning [
	self cleaningStrategy: FamixMetamodelGeneratorNoCleaningStrategy new
]
