"
builder := FamixMetamodelBuilder new.
builder 
	prefix: 'FamixTest';
	packageName: 'FamixTest'.

comment := builder newClassNamed: #Comment.
method := builder newClassNamed: #Method.
package := builder newClassNamed: #Package.

(package <>- comment)
	from
	




builder := FamixMetamodelBuilder new.

rel := builder newRelation 
	between: #TAccess and: #TWithAccesses;
	fromOne: #accessor toMany: #accesses.
	
	
rel := builder newRelation 
	between: #TAccess and: #TWithAccesses;
	fromOne: #accessor toMany: #accesses.
	
rel := builder newRelation
	from: [ :side |
		side name: #accessor;
			traitName: #TAccess;
			container;
			comment: 'some comment';
			one	 ];
	to: [ :opposite |
		opposite 	name: #accesses;
			traitName: #TWithAccesses;
			comment: 'ohter comment';
			many ].
		
	



"
Class {
	#name : #FamixMetamodelBuilder,
	#superclass : #Object,
	#instVars : [
		'environment',
		'classes',
		'traits',
		'relations',
		'generator',
		'testingSelectorsMapping',
		'configuration',
		'parentBuilder'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #'instance creation' }
FamixMetamodelBuilder class >> forGenerator: aGenerator [

	<ignoreForCoverage>
	^ self new
		generator: aGenerator;
		yourself.
]

{ #category : #visitor }
FamixMetamodelBuilder >> acceptVisitor: aVisitor [
	<ignoreForCoverage>
	^ aVisitor visitBuilder: self
]

{ #category : #accessing }
FamixMetamodelBuilder >> allSubBuilders [
	^ self generator ifNil: [ Set new ] ifNotNil: #allSubBuilders
]

{ #category : #accessing }
FamixMetamodelBuilder >> apply [
	self environment apply
]

{ #category : #accessing }
FamixMetamodelBuilder >> baseImportingContextName [
	^ #FmxImportingContext
]

{ #category : #accessing }
FamixMetamodelBuilder >> behaviorsCount [
	^ self traits size + self classes size
]

{ #category : #initialization }
FamixMetamodelBuilder >> classNamed: aClassName [

	<ignoreForMutations: #(ReplaceDetectIfNoneSecondBlockWithEmptyBlockOperator)>
	"empty block returns nil anyway"

	^ self classes detect: [ :each | each name = aClassName] ifNone: [ nil ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> classes [
	^ classes
]

{ #category : #accessing }
FamixMetamodelBuilder >> configuration [
	^ configuration
]

{ #category : #accessing }
FamixMetamodelBuilder >> configuration: anObject [

	<ignoreForCoverage>
	configuration := anObject
]

{ #category : #initialization }
FamixMetamodelBuilder >> ensureClassNamed: aString [
	^ self classes detect: [ :each | each name = aString ] ifNone: [ self newClassNamed: aString ]
]

{ #category : #initialization }
FamixMetamodelBuilder >> ensureLocalTraitNamed: aString [
	<ignoreForMutations: #(ReplaceAndWithEqvMutantOperator)>
	^ self traits detect: [ :each | each name = aString and: [ each prefix = self configuration prefix ] ] ifNone: [ self unsafeNewTraitNamed: aString ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> environment [
	^ environment
]

{ #category : #accessing }
FamixMetamodelBuilder >> environment: anObject [
	environment := anObject
]

{ #category : #generating }
FamixMetamodelBuilder >> generate [
	self prepareGeneration.
	self apply
]

{ #category : #generating }
FamixMetamodelBuilder >> generateImportIn: contextClass [
	self classes
		do: [ :each | 
			self environment
				compile:
					('import{1}
	<generated>
	^ self import: {2}' format: {each name . each fullName})
				in: contextClass
				classified: 'testing' ]
]

{ #category : #generating }
FamixMetamodelBuilder >> generateImportingContext [

	| contextClass |
	
	self configuration wantsToGenerateImportingContext ifFalse: [ ^ self ].

	contextClass := self environment createImportingcontextClassNamed: self importingContextName in: self configuration packageName.
	
	self generateShouldImportIn: contextClass.
	self generateImportIn: contextClass
]

{ #category : #generating }
FamixMetamodelBuilder >> generateMooseModel [
	self configuration mooseModelName
		ifNotNil: [ :mooseModelName | 
			| model |
			model := self environment
				createClassNamed: mooseModelName
				superclass: MooseModel
				traitNames: #()
				slots: #()
				in: configuration packageName
				overwrite: false.

			model tagWith: #Model.

			model classSide
				compile:
					('annotation
	<FMClass: #{1} super: #MooseModel>
	<package: {2}>
	<generated>' format: {mooseModelName . self safeAnnotationPackageName})
				classified: 'meta'.
			self allSubBuilders
				ifNotEmpty: [ :subBuilders | 
					model classSide
						compile:
							('allSubmetamodelsPackagesNames
	<generated>
	^ #({1})'
								format:
									{(String
										streamContents: [ :stream | 
											| packages |
											packages := (subBuilders collect: [ :builder | builder configuration packageName ]) asOrderedCollection.
											packages sort: #yourself descending.
											packages do: [ :package | stream print: package ] separatedBy: [ stream space ] ])})
						classified: 'accessing' ] ]
]

{ #category : #generating }
FamixMetamodelBuilder >> generateRemotes [
	self traits do: [ :each | each generateRemotes ].
	self classes do: [ :each | each generateRemotes ].

	self apply
]

{ #category : #generating }
FamixMetamodelBuilder >> generateShouldImportIn: contextClass [
	self classes
		do: [ :each | 
			self environment
				compile:
					('shouldImport{1}
	<generated>
	^ self shouldImport: {2}' format: {each name . each fullName})
				in: contextClass
				classified: 'testing' ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> generator [
	<ignoreForCoverage>
	^ generator
]

{ #category : #accessing }
FamixMetamodelBuilder >> generator: aGenerator [

	<ignoreForCoverage>
	generator := aGenerator.

]

{ #category : #initialization }
FamixMetamodelBuilder >> getTraitNamed: aSymbol [
	"Check if I contain a trait of this name. If yes, return it. 
	If I do not contain a trait of this name, check if one of my subMM has a trait of this name. If one is found, return it. If more is found raise an error. If non is found, create a new trait of this name and return it."

	| remoteTraits |
	self flag: #todo. "Maybe we could cache the sub MM entities."
	remoteTraits := Dictionary new.
	self allSubBuilders do: [ :builder | builder traits detect: [ :each | each name = aSymbol ] ifFound: [ :trait | remoteTraits at: builder put: trait ] ].
	remoteTraits size = 1
		ifTrue: [ ^ remoteTraits values anyOne
				isRemote: true;
				remoteBuilder: self;
				yourself ].
	remoteTraits size > 1
		ifTrue: [ self
				error:
					('Multiple remote traits named {1} where found in sub metamodels. Found in: {2}.
In order to fix the issue you should use #remoteTrait:withPrefix: in your generator to select yourself the right trait to use. If you want to create an entity of this name in your model and not use the trait of this name from a sub metamodel, declare this trait before referencing it.'
						format: {aSymbol . (', ' join: (remoteTraits keys collect: [ :builder | builder generator asString ]))}) ].
	
	self flag: #todo. "Later we should raise an error here. For local traits, they should be declared."
	self traits detect: [ :each | each name = aSymbol ] ifFound: [ :trait | ^ trait ].

	^ self traitNamed: aSymbol
]

{ #category : #accessing }
FamixMetamodelBuilder >> importingContextName [
	^ (self configuration prefix , 'ImportingContext') asSymbol
]

{ #category : #initialization }
FamixMetamodelBuilder >> initialize [
	super initialize.
	environment := FmxMBRealRingEnvironment for: self.

	configuration := FmxMBConfiguration new.

	classes := OrderedCollection new.
	traits := OrderedCollection new.
	relations := OrderedCollection new.
	testingSelectorsMapping := Dictionary new
]

{ #category : #initialization }
FamixMetamodelBuilder >> newClass [

	| aClass |
	
	aClass := FmxMBClass new.
	aClass builder: self.
	aClass prefix: self configuration prefix.
	aClass packageName: self configuration packageName.
	self classes add: aClass.
	^ aClass
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newClassNamed: aClassName [
	(self classes select: [ :each | each name = aClassName ]) ifNotEmpty: [ FmxMBEntityAlreadyExists signal ].

	^ self newClass name: aClassName
]

{ #category : #initialization }
FamixMetamodelBuilder >> newClassNamed: aClassName comment: aString [
	^ (self newClassNamed: aClassName)
		comment: aString;
		yourself
]

{ #category : #initialization }
FamixMetamodelBuilder >> newRelation [

	| aRelation |
	
	aRelation := FmxMBRelation new.
	aRelation builder: self.
	self relations add: aRelation.
	^ aRelation
]

{ #category : #initialization }
FamixMetamodelBuilder >> newTrait [ 

	| aTrait |
	
	aTrait := FmxMBTrait new.
	aTrait builder: self.
	aTrait prefix: self configuration prefix.
	aTrait packageName: self configuration packageName.
	self traits add: aTrait.
	^ aTrait
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newTraitNamed: aTraitName [
	(self traits select: [ :each | each fullName = (self configuration prefix , aTraitName) ]) ifNotEmpty: [ FmxMBEntityAlreadyExists signal ].

	^ self unsafeNewTraitNamed: aTraitName
]

{ #category : #initialization }
FamixMetamodelBuilder >> newTraitNamed: aClassName comment: aString [
	^ (self newTraitNamed: aClassName)
		comment: aString;
		yourself
]

{ #category : #accessing }
FamixMetamodelBuilder >> parentBuilder [
	<ignoreForCoverage>
	^ parentBuilder
]

{ #category : #accessing }
FamixMetamodelBuilder >> parentBuilder: anObject [

	parentBuilder := anObject.
	self environment: parentBuilder environment
]

{ #category : #'tests support' }
FamixMetamodelBuilder >> parentBuilderPackageName [

	"needed to know the package where extension methods of the composed metamodels should be placed"

	^ (parentBuilder ifNil: [ self ]) configuration packageName
]

{ #category : #generating }
FamixMetamodelBuilder >> prepareGeneration [
	self registerPackages.

	self traitsWithSubBuildersTraits do: [ :each | self testingSelectorsMapping at: each put: each testingSelectors ].
	self classes do: [ :each | self testingSelectorsMapping at: each put: each testingSelectors ].
	self traits do: [ :each | each generate ].
	self sortedClasses do: [ :each | each generate ].
	self behaviorsCount > 0 ifTrue: [ self generateImportingContext ].
	self generateMooseModel
]

{ #category : #printing }
FamixMetamodelBuilder >> printOn: aStream [
	super printOn: aStream.

	self generator
		ifNotNil: [ :g | 
			aStream
				nextPut: $(;
				print: g class;
				nextPut: $) ]
]

{ #category : #generating }
FamixMetamodelBuilder >> regenerationIsNeeded [
	self prepareGeneration.
	^ self environment regenerationIsNeeded
]

{ #category : #generating }
FamixMetamodelBuilder >> registerPackages [
	self environment registerPackage: self configuration packageName
]

{ #category : #accessing }
FamixMetamodelBuilder >> relations [
	^ relations
]

{ #category : #accessing }
FamixMetamodelBuilder >> relations: anObject [
	<ignoreForCoverage>
	relations := anObject
]

{ #category : #accessing }
FamixMetamodelBuilder >> safeAnnotationPackageName [
	^ self configuration packageNameForAnnotations asSymbol printString
]

{ #category : #accessing }
FamixMetamodelBuilder >> sortedClasses [
	<ignoreForMutations: #(ReplaceLessOrEqualWithLessMutantOperator)>
	^ self classes sorted: [ :class | class allClassGeneralizations size ] ascending
]

{ #category : #accessing }
FamixMetamodelBuilder >> sortedTraits [
	<ignoreForMutations: #(ReplaceAndWithEqvMutantOperator ReplaceLessOrEqualWithLessMutantOperator)>
	^ self traits sorted: [ :a :b | a allTraitGeneralizations size <= b allTraitGeneralizations size and: [ a name <= b name ] ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> subBuilders [
	^ self generator ifNil: [ #() ] ifNotNil: #subBuilders
]

{ #category : #'tests support' }
FamixMetamodelBuilder >> testingEnvironment [

	^ self environment ringEnvironment
]

{ #category : #accessing }
FamixMetamodelBuilder >> testingSelectorsMapping [
	^ testingSelectorsMapping
]

{ #category : #initialization }
FamixMetamodelBuilder >> traitNamed: aString [
	^ self traits
		detect: [ :each | each name = aString ]
		ifNone: [ FamixMetamodelGeneratorUnknownTrait signal: 'Trait ' , aString , ' not found in the metamodel. Please add it or refer to a submetamodel.' ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> traits [
	^ traits
]

{ #category : #accessing }
FamixMetamodelBuilder >> traitsWithSubBuildersTraits [
	^ (self allSubBuilders flatCollect: #traits)
		addAll: self traits;
		yourself
]

{ #category : #initialization }
FamixMetamodelBuilder >> unsafeNewTraitNamed: aTraitName [

	^ self newTrait name: aTraitName.

]

{ #category : #accessing }
FamixMetamodelBuilder >> withImportingContext [
	self configuration wantsToGenerateImportingContext: true
]
