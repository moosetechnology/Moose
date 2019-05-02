Class {
	#name : #MooseSmalltalkCompatibilityImporterTask,
	#superclass : #MooseCompositeImporterTask,
	#instVars : [
		'classes',
		'packages',
		'classExtensions'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addClass: aClass [
	classes add: aClass
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addClassExtensions: col [
	classExtensions addAll: col
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addClasses: col [
	classes addAll: col
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addFromPackage: aRPackage [

	"late-bound cache initialization for classes"
	self addClasses: aRPackage definedClasses.
	self addClassExtensions: aRPackage extensionMethods
	
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addFromPackageNamed: aPackageName [

	self addFromPackage: (RPackage organizer packageNamed: aPackageName asSymbol)
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addFromPackagesMatching: aBlock [

	RPackage organizer packages do: [:each |
		 (aBlock value: each) ifTrue: [self addFromPackage: each]]
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> addFromPackagesNamed: aCollection [

	aCollection do: [:each| self addFromPackageNamed: each]
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> allClassExtensions [ 
	^classExtensions 
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> allClasses [ 
	^classes
]

{ #category : #enumerating }
MooseSmalltalkCompatibilityImporterTask >> allClassesDo: aBlock [
	classes do: aBlock
]

{ #category : #enumerating }
MooseSmalltalkCompatibilityImporterTask >> allPackagesDo: aBlock [
	packages do: aBlock
]

{ #category : #running }
MooseSmalltalkCompatibilityImporterTask >> basicRun [
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
	self model metamodel: FamixPharoSmalltalkGenerator metamodel.
	^ self model
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> classes [
	^classes
]

{ #category : #adding }
MooseSmalltalkCompatibilityImporterTask >> defaultImporterClass [
	 ^ SmalltalkCompatibilityImporter
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> description [

	^'Importing <1p> packages from Smalltalk' 
		expandMacrosWith: self packages size

]

{ #category : #'initialize-release' }
MooseSmalltalkCompatibilityImporterTask >> initialize [

	super initialize.
	classes := OrderedCollection new.
	classExtensions := OrderedCollection new.
	packages := OrderedCollection new.
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> modelName [

	^'<1s> package<2#:s>' 
		expandMacrosWith: self packagesString 
		with: self packages size
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> packages [
	^packages
]

{ #category : #accessing }
MooseSmalltalkCompatibilityImporterTask >> packagesString [ 
	 
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
