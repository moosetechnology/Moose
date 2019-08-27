Class {
	#name : #MooseScripts,
	#superclass : #Object,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #'loading scripts' }
MooseScripts class >> createLightModelForLAN [
	"
	Time millisecondsToRun: [self createLightModelForLAN]
	 934 => simon.denier 5/16/2009 12:15 - initial run
	 201 => simon.denier 5/16/2009 12:44 - with PackageOrganizerCache
	"
	
	| model importer |
	model := MooseModel new.
	model name: 'lightLAN'.
	importer := MoosePharoImporterTask new.
	importer factory: SmalltalkMetamodelFactory.
	importer importingContext: (MooseImportingContext new 
									importClassMethodInheritanceAttribute; 
									importPackage;
									mergeClassAndMetaclass;
									yourself).
	importer doNotRunCandidateOperator.
	importer model: model; addFromPackagesNamed: (self packageNamesFor: 'Moose-LAN*'); run.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createLightModelForMorphic [
	"
	Time millisecondsToRun: [self createLightModelForMorphic]
	109888 => simon.denier 5/16/2009 12:18 - initial run
	 11974 - simon.denier 5/16/2009 12:51 - with cache
	 7455 - simon.denier 5/16/2009 12:55 - remove Transcript trace
	"
	
	| model importer |
	model := MooseModel new.
	model name: 'lightMorphic'.
	importer := MoosePharoImporterTask new.
	importer factory: SmalltalkMetamodelFactory.
	importer importingContext: (MooseImportingContext new 
									importClassMethodInheritanceAttribute; 
									importPackage;
									mergeClassAndMetaclass;
									yourself).
	importer doNotRunCandidateOperator.
	importer model: model; addFromPackagesNamed: (self packageNamesFor: 'Morphic*'); runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createLightModelForNetwork [
	"
	Time millisecondsToRun: [self createLightModelForNetwork] 
	 15050 => simon.denier 5/16/2009 12:22 - initial run
	 1602 - simon.denier 5/16/2009 12:52 - with cache
	 503 - simon.denier 5/16/2009 12:55 - remove Transcript trace
	 806 - simon.denier 5/20/2009 10:49 - cache non-initialized
	 373 - simon.denier 5/20/2009 10:52 - cache initialited
	"
	
	| model importer |
	model := MooseModel new.
	model name: 'lightNetwork'.
	importer := MoosePharoImporterTask new.
	importer factory: SmalltalkMetamodelFactory.
	importer importingContext: (MooseImportingContext new 
									importClassMethodInheritanceAttribute; 
									importPackage;
									mergeClassAndMetaclass;
									yourself).
	importer doNotRunCandidateOperator.
	importer model: model; addFromPackagesNamed: (self packageNamesFor: 'Network*'); runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createLightModelForPharo [
	"
	MessageTally spyOn: [self createLightModelForPharo]
	Time millisecondsToRun: [self createLightModelForPharo]
	607701 - simon.denier 5/16/2009 13:30 - with cache !?!
	 42921 - simon.denier 5/16/2009 13:53 - with cache (first run was buggy because cache not initialized)
	 35584 - simon.denier 5/16/2009 13:57 - without candidate invocation ?!?
	"
	
	| model importer |
	model := MooseModel new.
	model name: 'lightPharo'.
	importer := MoosePharoImporterTask new.
	importer importingContext: (MooseImportingContext new 
									importClassMethodInheritanceAttribute; 
									importPackage;
									mergeClassAndMetaclass;
									yourself)..
	importer doNotRunCandidateOperator.
	importer model: model; addFromPackagesNamed: self pharoPackageNames; runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createMediumModelForNetwork [
	"
	Time millisecondsToRun: [self createMediumModelForNetwork] 
	 5485 - simon.denier 5/24/2009 00:22
	"
	
	| model importer |
	model := MooseModel new.
	model name: 'mediumNetwork'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer doNotRunCandidateOperator.
	importer model: model; addFromPackagesNamed: (self packageNamesFor: 'Network*'); runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createModelForMorphic [
	"
	MessageTally spyOn: [self createModelForMorphic]
	Time millisecondsToRun: [self createModelForMorphic] 
	 89583 - simon.denier 5/23/2009 21:45 - double registration for invocation#candidates in CandidateListOperator
	 77117 - simon.denier 5/23/2009 21:48 - avoid double registration because of bidirectional multivalue links
	 61751 - simon.denier 9/18/2009 16:23 - PackageOrganizerCache in addFromPackage:
	"
	
	| model importer |
	model := MooseModel new.
	model name: 'Morphic'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model; addFromPackagesNamed: (self packageNamesFor: 'Morphic*'); runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createModelForNetwork [
	"
	MessageTally spyOn: [self createModelForNetwork]
	Time millisecondsToRun: [self createModelForNetwork]
	25847 => simon.denier 5/16/2009 12:25 - initial run
	 8716 - simon.denier 5/16/2009 12:52 - with cache
	 5932 - simon.denier 5/16/2009 12:55 - remove Transcript trace
	 7300 - simon.denier 5/23/2009 21:56 - ? perhaps due to memory/gc
	 6900 - simon.denier 5/23/2009 21:51 - removing double registration fo bi link in CandidateListOperator
	 6146 - simon.denier 9/18/2009 16:20 - use PackageOrganizerCache in #addFromPackage:
		"
	
	| model importer |
	model := MooseModel new.
	model name: 'Network'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model; addFromPackagesNamed: (self packageNamesFor: 'Network*') ; runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createModelForPharo [
	"self createModelForPharo"
	
	| model importer |
	model := MooseModel new.
	model name: 'Pharo'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model; addFromPackagesNamed: self pharoPackageNames; runWithProgress.
	model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createModelNamed: modelName with: aCollectionOfPackageNames [
	
	| model importer |
	model := MooseModel new.
	model name: modelName.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model; addFromPackagesNamed: aCollectionOfPackageNames; runWithProgress.
	^ model install.
]

{ #category : #'loading scripts' }
MooseScripts class >> createModelNamed: modelName withPackages: packages importer: importClass candidateClass: candidates mergeClassMetaClass: merge contextItems: context [

	| mooseModel importer importingContext |
	
	mooseModel := MooseModel new.
	mooseModel name: modelName.
	
	importingContext := MooseImportingContext new.
	(context select: [:anAssoc | anAssoc value = true] thenCollect: [:each | each key]) do: [ :each | importingContext perform: (#import , each) asSymbol ].
	merge ifTrue: [ importingContext mergeClassAndMetaclass ].
	
	importer := importClass new.
	importer
		importingContext: importingContext;
		model: mooseModel;
		addFromPackagesNamed: packages;
		candidateClass: candidates;
		runWithProgress.

	mooseModel install.
]

{ #category : #private }
MooseScripts class >> extractPackageNameOutOfMetacelloFile: filename [
	 ^ (filename includes: $.) 
		ifTrue: [	filename copyUpToLast: $- ]
		ifFalse: [ filename ]
]

{ #category : #workspace }
MooseScripts class >> fixFileAnchorsForCurrentSystemForType: aFileAnchorClass [ 
	aFileAnchorClass allInstances do: [:each | 
		each fileName: (each fileName copyReplaceAll: '\' with: FileSystem disk delimiter asString).
		each fileName: (each fileName copyReplaceAll: '/' with: FileSystem disk delimiter asString). ]
]

{ #category : #'loading scripts' }
MooseScripts class >> packageNamesFor: aMatchingString [
	
	^ self packageNamesFor: aMatchingString withTestPackages: true
]

{ #category : #'loading scripts' }
MooseScripts class >> packageNamesFor: aPrefixString withTestPackages: aBoolean [
	"Retrieve a list of packages based on a prefix. This method can filter (or not) test packages from the results provided they follow the Seaside convetion of <aPrefixString>-Tests*.
	self packageNamesFor: 'Network*' withTestPackages: false.
	self packageNamesFor: 'Network*' withTestPackages: true
	"
	
	| packages packageNames aTestPrefixString |
	RPackage organizer unregisterPackageNamed: aPrefixString. 
	packages := RPackage organizer packages select: [:each | aPrefixString match: each name ].
	packageNames := packages collect: [:pak | pak name].
	aBoolean ifFalse: [
		aTestPrefixString := aPrefixString, 'Tests*'.
		packageNames := packageNames reject: [ :pakName | aTestPrefixString match: pakName] ].
	^ packageNames
]

{ #category : #private }
MooseScripts class >> packagesForConfigurationVersion: aConfiguration [
	"self packagesForConfigurationVersion: (ConfigurationOfRPackage new project version: #stable)"

	| version directive packages |
	version := aConfiguration.
	version ignoreImage: true.
	directive := version record loadDirective.
	packages := OrderedCollection new.
	directive versionDirectivesDo: [:vrsnDirective | | spec |
	spec := vrsnDirective spec.
	(spec notNil and: [spec project = aConfiguration spec project ])
		ifTrue: [ 
			vrsnDirective packagesDo: [:pkgDirective | 
				packages add: (self extractPackageNameOutOfMetacelloFile: pkgDirective file) ]]].
	^ packages asSet reject: [ :each | each beginsWith: 'ConfigurationOf' ]
]

{ #category : #'loading scripts' }
MooseScripts class >> pharoPackageNames [
	"self pharoPackageNames"
	
	| packages packageNames |
	packages := (RPackage organizer packages select:[:each | each class = RPackage])
									  asSortedCollection: [:a :b | a name <= b name].
	packageNames := packages collect: [:pak | pak name].
	^ packageNames
]

{ #category : #notes }
MooseScripts >> seeClassSide [
]
