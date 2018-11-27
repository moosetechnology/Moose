"
This class specifies that the Smalltalk classes are identified using packages.



Implementation notes.

	Should check packageFrom: because it may be useless and has to be fixed anyway
	packageFrom: and namesString do not have a sender. -> get rid of them
"
Class {
	#name : #MoosePharoImporterTask,
	#superclass : #MooseCompositeImporterTask,
	#instVars : [
		'classes',
		'packages',
		'classExtensions'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #adding }
MoosePharoImporterTask >> addClass: aClass [
	classes add: aClass
]

{ #category : #adding }
MoosePharoImporterTask >> addClassExtensions: col [
	classExtensions addAll: col
]

{ #category : #adding }
MoosePharoImporterTask >> addClasses: col [
	classes addAll: col
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackage: aRPackage [

	"late-bound cache initialization for classes"
	"PackageOrganizerCache default addClassesFromPackage: aPackageInfo.
	packageDesc := PackageOrganizerCache default packageFor: aPackageInfo."
	"SIMD 23/11/2009: We reject trait as entities to import for now."
	self addClasses: aRPackage regularClasses.
	self addClassExtensions: aRPackage regularClassExtensions
	
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackageNamed: aPackageName [

	self addFromPackage: (RPackage organizer packageNamed: aPackageName asSymbol)
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackagesMatching: aBlock [

	RPackage organizer packages do: [:each |
		 (aBlock value: each) ifTrue: [self addFromPackage: each]]
]

{ #category : #adding }
MoosePharoImporterTask >> addFromPackagesNamed: aCollection [

	aCollection do: [:each| self addFromPackageNamed: each]
]

{ #category : #accessing }
MoosePharoImporterTask >> allClassExtensions [ 
	^classExtensions 
]

{ #category : #accessing }
MoosePharoImporterTask >> allClasses [ 
	^classes
]

{ #category : #enumerating }
MoosePharoImporterTask >> allClassesDo: aBlock [
	classes do: aBlock
]

{ #category : #enumerating }
MoosePharoImporterTask >> allPackagesDo: aBlock [
	packages do: aBlock
]

{ #category : #running }
MoosePharoImporterTask >> basicRun [
	| importerTask importer |
	"importerTask applies an import filter definition (context) on a set of classes (allClasses) and yields elements"
	importerTask := MooseImportClassesTask new importerClass: importerClass.
	importerTask factory: factory.
	importerTask importingContext: importingContext.
	importerTask addAll: self allClasses.
	importerTask addAllExtensions: self allClassExtensions.
	importer := importerTask runSelector: runSelector.
	"InstallElementsOperator populates a Moose model with (unary) elements"
	(InstallElementsOperator 
		with: importer
		on: self model) runSelector: runSelector.
	"CandidateListOperator populates a Moose model with (binary) element relations like: methodA invokes methodB"
	candidateOperator ifTrue: [(self candidateClass runOn: self model importer: importer) runSelector: runSelector].
	self model sourceLanguage: importer factory sourceLanguage new.
	^ self model
]

{ #category : #accessing }
MoosePharoImporterTask >> classes [
	^classes
]

{ #category : #accessing }
MoosePharoImporterTask >> description [

	^'Importing <1p> packages from Smalltalk' 
		expandMacrosWith: self packages size

]

{ #category : #'initialize-release' }
MoosePharoImporterTask >> initialize [

	super initialize.
	classes := OrderedCollection new.
	classExtensions := OrderedCollection new.
	packages := OrderedCollection new.
]

{ #category : #accessing }
MoosePharoImporterTask >> modelName [

	^'<1s> package<2#:s>' 
		expandMacrosWith: self packagesString 
		with: self packages size
]

{ #category : #accessing }
MoosePharoImporterTask >> packages [
	^packages
]

{ #category : #accessing }
MoosePharoImporterTask >> packagesString [ 
	 
	| stream | 
	stream := String new writeStream. 
	(self packages asOrderedCollection sorted: [:a :b | a name < b name]) 
		do: [:each | stream print: each] 
		separatedBy: 
			[stream 
				nextPut: $,; 
				space]. 
	^stream contents
]
