"
MooseModel is a special group that is used for manipulating an entire model.
"
Class {
	#name : #MooseModel,
	#superclass : #MooseAbstractGroup,
	#instVars : [
		'sourceLanguage',
		'name',
		'metamodel'
	],
	#classVars : [
		'MostRecentOwner'
	],
	#classInstVars : [
		'rootModel',
		'metaTower'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseModel class >> annotation [
	<MSEClass: #Model super: #MooseAbstractGroup>
	<package: #Moose>

]

{ #category : #'import-export' }
MooseModel class >> export: aModel to: aStream [ 
	aModel exportTo: aStream
]

{ #category : #'import-export' }
MooseModel class >> export: aModel withMetamodel: aMetamodel to: aStream [
	aModel exportWithMetamodel: aMetamodel to: aStream
]

{ #category : #'import-export' }
MooseModel class >> exportMetamodel: aMetamodel to: aStream [ 

	aMetamodel exportOn: aStream
]

{ #category : #'import-export' }
MooseModel class >> exportMetamodelTo: aStream [
	self deprecated: 'Use exportMetamodelTo: in instance side'.
	self exportMetamodel: self meta to: aStream
]

{ #category : #meta }
MooseModel class >> generateClassesFrom: aCollection [
	"I generate the implementation for some meta-described classes. aCollection need to contain the full set of meta-described classes so that the metamodel is complete. Warning, part of classes will be overwritten."

	| tower generator |
	tower := self metaBuilder: aCollection withProcessor: self newPragmaProcessor.
	generator := FMDefaultCodeGenerator new.
	generator visit: tower metamodel.
	generator previewChanges
]

{ #category : #meta }
MooseModel class >> generateClassesFrom: aCollection inPackage: aString [
	"I generate the implementation for some meta-described classes. aCollection need to contain the full set of meta-described classes so that the metamodel is complete. aString is the name of the FM3 package for which elements should be generated. In other words, only elements belonging to FM3 package 'aString' will be generated, not all elements of the metamodel in aCollection.

	This method is for incremental generation of metamodels, especially Famix extensions.
	MooseModel generateClassesFrom: MooseModel metamodelClasses inPackage: 'NewExtension'
	"

	| tower generator fm3Package |
	tower := self metaBuilder: aCollection withProcessor: self newPragmaProcessor.
	generator := FMDefaultCodeGenerator new.
	fm3Package := tower metamodel packageNamed: aString.
	generator acceptFamePackage: fm3Package.
	self flag: #classExtensionNotSupported.	"currently the generator does not handle extension to other packages - cf #acceptFamePackage:"
	generator previewChanges
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream [
	^ self importFrom: aStream withMetamodel: self meta
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream filteredBy: anImportingContext [ 
	^self 
		importFrom: aStream
		withMetamodel: self meta
		filteredBy: anImportingContext
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel [

	| tower importer |
	tower := FMCompleteTower new.
	tower metamodel addAll: aMetamodel elements.
	importer := MSEImporter new.
	importer repository: tower model.
	importer stream: aStream.
	importer run.
	tower model updateCache.
	^ tower model
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel filteredBy: anImportingContext [

	| tower importer famixElementNames importerFilter |
	
	famixElementNames := OrderedCollection new.
	anImportingContext entityKindsToBeExtracted do: [:each | famixElementNames add: 'FAMIX.',each asString ].
	"anImportingContext  shouldImportMethodBody 
		ifTrue: [famixElementNames add: 'FAMIX.Parameter'.
			anImportingContext shouldImportAccess ifTrue:[famixElementNames add:'FAMIX.Reference']]."
	
	"famixElementNames := anImportingContext fullNamesOfEntitiesToBeExtracted ."
	
	tower := FMCompleteTower new.
	tower metamodel addAll: aMetamodel elements.
	importer := MSEImporter new.
	importer repository: tower model.
	importer stream: aStream.
	importerFilter := FMImporterFilter onClient: importer withFilter: famixElementNames.
	importerFilter  run.
	tower model updateCache.
	^ tower model
]

{ #category : #'import-export' }
MooseModel class >> importFrom: aStream withMetamodel: aMetamodel translationDictionary: translationDict [

	| tower importer |
	tower := FMCompleteTower new.
	tower metamodel addAll: aMetamodel elements.
	importer := MSEImporter new.
	importer repository: tower model.
	importer stream: aStream.
	importer nameTranslator: translationDict.
	importer run.
	tower model updateCache.
	^ tower model
]

{ #category : #'import-export' }
MooseModel class >> importFromMSEStream: aStream [
	^ self new
		importFromMSEStream: aStream;
		yourself
]

{ #category : #'import-export' }
MooseModel class >> importMetamodelFrom: aStream [

	| tower generator |
	tower := FMCompleteTower new.
	tower metamodel importStream: aStream.
	generator := FMDefaultCodeGenerator new.
	generator visit: tower metamodel.
	generator previewChanges. "keep shift pressed to see the changes"

]

{ #category : #meta }
MooseModel class >> metaBuilder: aCollectionOfClasses [
	"I take as parameter a collection of classes described with Fame pragmas"

	^ self
		metaBuilder: aCollectionOfClasses
		withProcessor: self newPragmaProcessor
]

{ #category : #meta }
MooseModel class >> metaBuilder: aCollectionOfClasses withProcessor: aPragmaProcessor [
	"I take as parameters a collection of classes described with Fame pragmas and a processor for Fame pragmas"

	aPragmaProcessor queue: aCollectionOfClasses; run.
	^ aPragmaProcessor asTower
]

{ #category : #meta }
MooseModel class >> metaTower [

	^metaTower ifNil: [
		metaTower := self metaBuilder: self metamodelClasses ]
]

{ #category : #meta }
MooseModel class >> metamodelClasses [

	^ MooseEntity withAllSubclasses
]

{ #category : #'import-export' }
MooseModel class >> metamodelComposedOf: aCollectionOfMetamodels [
	
	| elements  builder repo |
	
	elements := aCollectionOfMetamodels flatCollect: #elements.

	builder := FMPragmaProcessor new.
	builder buildFM3.
	repo := FMMetaRepository basicNew.
	repo initialize: repo.
	repo addAll: elements.

	^ repo
]

{ #category : #meta }
MooseModel class >> newPragmaProcessor [
	^ MoosePragmaProcessor new
]

{ #category : #'private-instance creation' }
MooseModel class >> newWithDefaultModels [ 
	 
	| result | 
	result := self new. 
	(Pragma 
		allNamed: #defaultModel 
		in: self class) 
		do: [:pragma | result add: (self perform: pragma selector)]. 
	^result
]

{ #category : #accessing }
MooseModel class >> ownerOf: element [
	"Answer the MooseModel which includes element.   
 
	We used to store the owning model in an instance variable, but benchmarks 
	have shown that this solution is fast enough. With the new implementation, 
	MooseModel uses a dedicated data-structure to keep track of its element's 
	IDs, see DictionaryStorage>>computeRanges. The main bottleneck as of now 
	is the enumeration if all instances, hence, as a work around, we keep 
	track of the most recent owner."

	^ element mooseID
		ifNotNil: [ :elementID | 
			MostRecentOwner ifNotNil: [ :model | (model includesID: elementID) ifTrue: [ ^ model ] ].
			self allInstances detect: [ :model | model includesID: elementID ] ifFound: [ :model | MostRecentOwner := model ] ifNone: [ nil ] ]
]

{ #category : #'root model' }
MooseModel class >> resetRoot [

	rootModel := nil
]

{ #category : #'root model' }
MooseModel class >> root [ 
	 
	^ rootModel 
		ifNil: 
			[ rootModel := (self new) 
				name: 'Root'; 
				yourself ]
]

{ #category : #'entity collection' }
MooseModel >> add: anElement [ 
	 
	super add: anElement.
	anElement privateSetMooseModel: self.
	self announcer announce: (MooseEntityAdded new entity: anElement).
	^anElement
]

{ #category : #'entity collection' }
MooseModel >> add: aBookmarkedGroup asBookmark: aString [
	 
	self privateState cacheAt: aString put: aBookmarkedGroup.
	self announcer announce: (MooseEntityAdded new entity: aBookmarkedGroup).
	^ aBookmarkedGroup
]

{ #category : #'entity collection' }
MooseModel >> addAll: entities [ 
	 
	entities do: [:each | self add: each]. 
	^entities
]

{ #category : #'entity collection' }
MooseModel >> addNoAnnounce: anElement [ 
	self entityStorage add: anElement.
	self privateState flushGroups. 
	anElement privateSetMooseModel: self.
	^anElement
]

{ #category : #accessing }
MooseModel >> allBookmarks [
	<navigation: 'All bookmarks'>
	^ MooseGroup withAll: (self entityCache select: [ :group | group asMooseGroup isBookmarked ]) withDescription: 'Bookmarks'
]

{ #category : #actions }
MooseModel >> asMSEString [
	| stream |
	stream := (String new: 1024) writeStream.
	self exportToMSEStream: stream.
	^ stream contents
]

{ #category : #groups }
MooseModel >> cacheMooseGroups [
	<menuItem: 'Cache groups' category: 'Utilities'>

	| selectors |
	self privateState flushGroups.
	selectors := self navigationSelectors.
	MooseCustomTask
		runWithProgress: [:bar|
			selectors do: [:sel|
				self perform: sel.
				bar increment]
			]
		description: ('Caching <1p> groups in Moose model' expandMacrosWith: selectors size)
		length: selectors size
]

{ #category : #actions }
MooseModel >> detectEncodingOfAllFileAnchors [
	"I can be execute to reduce the time of detection of the encoding of each file anchor because multiple file anchor can point to the same file."

	(((self allUsing: FamixTFileAnchor) asOrderedCollection reject: #privateHasEncoding) groupedBy: #fileName)
		valuesDo: [ :anchors | 
			| encoding |
			encoding := anchors anyOne detectEncoding.
			anchors do: [ :anchor | anchor encoding: encoding ] ]
]

{ #category : #'set operations' }
MooseModel >> difference: aGroup [ 
	 
	| result | 
	result := MooseGroup withAll: (self entities difference: aGroup entities). 
	result description: self description , '  subtracted with ' , aGroup description. 
	^result
]

{ #category : #'import-export' }
MooseModel >> exportMetamodel: aMetamodel to: aStream [

	self class exportMetamodel: aMetamodel to: aStream
]

{ #category : #'import-export' }
MooseModel >> exportMetamodelTo: aStream [
	self exportMetamodel: self metamodel to: aStream
]

{ #category : #'import-export' }
MooseModel >> exportTo: aStream [
	self exportWithMetamodel: self metamodel to: aStream
]

{ #category : #actions }
MooseModel >> exportToMSEStream: aStream [
	"Benchmarks on Network packages
		Time millisecondsToRun: [ self exportToMSEStream: (StandardFileStream forceNewFileNamed: 'network.mse') ]
		34408ms -> simon.denier 9/11/2009 11:12 - initial run
		35527ms -> simon.denier 9/11/2009 11:51 - IdentityHashSet in FMRepository#elements, worse?
		rewind
		32236ms -> simon.denier 9/11/2009 17:46 - IdentityHashTable in FMRepositoryVisitor, a bit better but not much
		30963ms -> simon.denier 9/15/2009 12:28 - cache for roots (UI process)
		24661ms -> simon_denier 9/21/2009 22:32 - removing metrics from MSE
	"

	self detectEncodingOfAllFileAnchors.
	self exportTo: aStream
]

{ #category : #'import-export' }
MooseModel >> exportWithMetamodel: aMetamodel to: aStream [ 
	| tower repository |
	tower := FMCompleteTower new.
	tower metaMetamodel: aMetamodel metamodel.
	tower metamodel: aMetamodel.
	tower model: (repository := (FMRepository with: aMetamodel) addAll: self entities).
	tower model exportOn: aStream
]

{ #category : #actions }
MooseModel >> flushGroups [
	self entities do: [ :entity | entity privateState flushGroups ] displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #actions }
MooseModel >> flushPrivateState [
	"Clean the private state caches of all the entities of the model. This will not impact attributes in the private state (informations you cannot derive)"
	self flushProperties.
	self flushGroups
]

{ #category : #actions }
MooseModel >> flushProperties [
	self entities do: [ :entity | entity privateState flushProperties ] displayingProgress: [ :entity | 'Cleaning cache of ' , entity mooseName ]
]

{ #category : #actions }
MooseModel >> importFromMSEStream: aStream [
	"Benchmarks
	Time millisecondsToRun: [ MooseModel new importFromMSEStream: (StandardFileStream readOnlyFileNamed: 'network3.mse') ].
	Time millisecondsToRun: [ MooseModel new importFromMSEStream: (StandardFileStream readOnlyFileNamed: 'moose.mse') ]. 178163 simon.denier 9/11/2009 12:29
	 23678 -> simon.denier 9/11/2009 11:36 - initial run
 	 21551 -> simon.denier 9/11/2009 12:18 - IdentityHashSet (reverted)
	 17560 -> simon_denier 9/21/2009 22:34 - removing metrics from MSE
	"

	| repository |
	repository := self class importFrom: aStream.
	self silentlyAddAll: repository elements.
	self entityStorage forRuntime.
	self name: (aStream localName removeSuffix: '.mse').
	"aStream isFileStream
		ifTrue: [ self rootFolder: aStream fullName asFileReference parent ]"
]

{ #category : #actions }
MooseModel >> importFromMSEStream: aStream filteredBy: anImportingContext [
	
	| repository |
	repository := self class importFrom: aStream filteredBy: anImportingContext.
	repository elements do: [ :e | self add: e ].
	self entityStorage forRuntime
]

{ #category : #testing }
MooseModel >> includes: anItem [ 
	anItem ifNil: [^ false].
	^ self includesID: anItem mooseID
]

{ #category : #'Moose-DistributionMap' }
MooseModel >> includesElementsOfType: aClass [

	"self entities detect: [:each | each class = aClass] ifNone: [^ false].
	^true" 
	^ (self allWithType: aClass) isEmpty not
]

{ #category : #'initialize-release' }
MooseModel >> initialize [ 
	 
	super initialize. 
	name := #noname
]

{ #category : #actions }
MooseModel >> install [ 

	^ self installWithCache: true
]

{ #category : #actions }
MooseModel >> installWithCache: aBoolean [

	aBoolean
		ifTrue: [	self cacheMooseGroups ].
	^ MooseModel root add: self
]

{ #category : #'set operations' }
MooseModel >> intersection: aGroup [ 
	 
	| result | 
	result := MooseGroup withAll: (self entities intersection: aGroup entities). 
	result description: self description , '  intersected with ' , aGroup description. 
	^result
]

{ #category : #'Famix-Extensions' }
MooseModel >> isSmalltalk [
	^ self sourceLanguage notNil and: [self sourceLanguage isSmalltalk]
]

{ #category : #accessing }
MooseModel >> localMooseModel [ 
	 
	^self
]

{ #category : #accessing }
MooseModel >> metamodel [
	^ metamodel ifNil: [ MooseModel meta ]
]

{ #category : #accessing }
MooseModel >> metamodel: anObject [
	metamodel := anObject
]

{ #category : #accessing }
MooseModel >> mooseDescription [
	^ self mooseDescriptionFor: self class
]

{ #category : #accessing }
MooseModel >> mooseDescriptionFor: class [
	^ self metamodel descriptionOf: class instanceSide
]

{ #category : #accessing }
MooseModel >> mooseDescriptionIn: aMetamodel [

	^ aMetamodel descriptionOf: self class instanceSide
]

{ #category : #printing }
MooseModel >> mooseDisplayStringOn: stream [
	stream nextPutAll: self name
]

{ #category : #accessing }
MooseModel >> mooseModel [
	"Answer the containing moose model of self, if any."
	^ self privateState model
]

{ #category : #accessing }
MooseModel >> name [ 
	 
	^name
]

{ #category : #accessing }
MooseModel >> name: aStringOrSymbol [
	| oldName |
	oldName := name.
	name := aStringOrSymbol.
	(oldName notNil and: [oldName ~= name]) ifTrue: [ 
		self announcer announce: (MooseEntityRenamed new oldName: oldName) ]
]

{ #category : #'Famix-Extensions' }
MooseModel >> numberOfClasses [
	<MSEProperty: #numberOfClasses type: #Number>
	<MSEComment: 'The number of classes'>
	
	^self
		lookUpPropertyNamed: #numberOfClasses
		computedAs: [ self allClasses size ]
]

{ #category : #'Famix-Extensions' }
MooseModel >> numberOfLinesOfCodePerClass [
	<MSEProperty: #numberOfLinesOfCodePerClass type: #Number>
	<MSEComment: 'The number of lines of code per class in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodePerClass
		computedAs: [ self numberOfLinesOfCode / self numberOfClasses ]
]

{ #category : #actions }
MooseModel >> remove [

	^ MooseModel root remove: self
]

{ #category : #'entity collection' }
MooseModel >> remove: anElement [
	self entityStorage remove: anElement. 
	anElement privateSetMooseModel: nil. 
	self privateState flushGroups. 
	self announcer announce: (MooseEntityRemoved new entity: anElement).
	^anElement
]

{ #category : #'entity collection' }
MooseModel >> removeAll: collection [ 
	 collection do: [:each | self remove: each]. 
]

{ #category : #'entity collection' }
MooseModel >> removeModelNamed: aStringOrSymbol [

	| el |
	el := self entityStorage elements detect: [:each | each name = aStringOrSymbol asSymbol] ifNone: [nil].
	el ifNotNil: [self entityStorage remove: el.
				el privateSetMooseModel: nil.].
	^el
]

{ #category : #accessing }
MooseModel >> rootFolder [
	^ self privateState 	
		attributeAt: #rootFolder 
		ifAbsent: [	Smalltalk imageDirectory asFileReference  / 'src' / self name]
]

{ #category : #accessing }
MooseModel >> rootFolder: aString [

	^ self privateState attributeAt: #rootFolder put: aString
]

{ #category : #'entity collection' }
MooseModel >> silentlyAdd: anElement [ 
	 
	self suspendAllAnnouncementsDuring: [^self add: anElement].
]

{ #category : #'entity collection' }
MooseModel >> silentlyAddAll: entities [ 
	 
	entities do: [:each | self addNoAnnounce: each].
	^entities
]

{ #category : #'entity collection' }
MooseModel >> silentlyRemove: anElement [ 
	
	self suspendAllAnnouncementsDuring: [^self remove: anElement].
]

{ #category : #'entity collection' }
MooseModel >> silentlyRemoveAll: collection [ 
	
	collection do: [:each | self silentlyRemove: each].
	^collection
	
]

{ #category : #accessing }
MooseModel >> size [
	^ self entityStorage size
]

{ #category : #'Famix-Extensions' }
MooseModel >> sourceLanguage [
	<MSEProperty: #sourceLanguage type: #FamixTSourceLanguage>
	<MSEComment: 'Source of the Language to which the model corresponds'>
	^ sourceLanguage
		ifNil: [ sourceLanguage := self allSourceLanguages
				detect: [ :each | each isAttached not ]
				ifNone: [ nil ] ]
]

{ #category : #'Famix-Extensions' }
MooseModel >> sourceLanguage: aSymbol [
	sourceLanguage := aSymbol
]

{ #category : #'set operations' }
MooseModel >> union: aGroup [ 
	 
	| result | 
	result := MooseGroup withAll: (self entities asSet union: aGroup entities asSet). 
	result description: self description , '  and ' , aGroup description. 
	^result
]

{ #category : #testing }
MooseModel >> wantsAllEntitiesNavigation [

	^ self propertyNamed: #wantsAllEntitiesNavigation ifAbsent: [ 
		self metamodel metamodel additionalProperties at: #wantsAllEntitiesNavigation ifAbsent: [ true ] ]
]
