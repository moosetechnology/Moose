"
MooseMonticelloImporter is a dedicated Smalltalk importer that extends the default Smalltalk importer to deal with classes and methods that are not loaded in memory but contained in Monticello packages.

Instance Variables:
	repositoryCache	<MCFileBasedRepository>
"
Class {
	#name : #MooseMonticelloImporter,
	#superclass : #SmalltalkImporter,
	#instVars : [
		'repositoryCache'
	],
	#category : #'Moose-MonticelloImporter'
}

{ #category : #assertion }
MooseMonticelloImporter >> assertMCZFileName: mczFilename [
	"a mcz file name should ends with '.mcz' and include a $-"
	
	self assert: [ (mczFilename includes: $. ) ].
	self assert: [ mczFilename first isUppercase ].
	self assert: [ (mczFilename endsWith: '.mcz') ].
]

{ #category : #assertion }
MooseMonticelloImporter >> assertPackageName: packageName [
	"a package should not include a dot. It also should start with a capitalized letter"
	
	self assert: [ (packageName includes: $. ) not ].
	self assert: [ packageName first isUppercase ].
	self assert: [ (packageName endsWith: '.mcz') not ].
]

{ #category : #populating }
MooseMonticelloImporter >> createClassNamed: classNameSymbol ivs: varNameStrings superclassName: superclassName [
	"The superclass is not set here. This is done later"
	| famixClass |
	famixClass := self factory classEntity new name: classNameSymbol asSymbol.
	varNameStrings do: [:varName | 
		famixClass addAttribute: (FAMIXAttribute new name: varName asSymbol)].
	self targetModel add: famixClass.
	famixClass propertyNamed: #superclassName put: superclassName.						
	^ famixClass
]

{ #category : #populating }
MooseMonticelloImporter >> ensureClassNamed: classNameSymbol [
	| cls |
	cls := self targetModel allClasses detect: [:each | each name == classNameSymbol] ifNone: [nil].
	cls ifNotNil: [ ^ cls ].
	
	cls := self createClassNamed: classNameSymbol ivs: #() superclassName: nil.
	cls isStub: true.
	
	^ cls 
]

{ #category : #public }
MooseMonticelloImporter >> fileNames [
	^ self repository readableFileNames
]

{ #category : #'compatibility with visitor' }
MooseMonticelloImporter >> globals [
	^ globals ifNil: [ globals := Dictionary new ]
]

{ #category : #public }
MooseMonticelloImporter >> import [
	"Import all files found in the repository"
	| names |
	self setRepository.
	self setMooseModel.
	names := self fileNames.
	names do: [ :name | self importFileNamed: name ].
	^ targetModel
]

{ #category : #public }
MooseMonticelloImporter >> importFileNamed: name [ 
	"This is a public method. It loads a particular package into the moose model"

	| version definitions visitor |
	self setMooseModel.
	
	[ version := self repository versionFromFileNamed: name. ]
		on: Error 
		do: [:ex | self inform: 'Package ', name, ' not accessible from the file system?'. ^ self targetModel].
		
	definitions := version snapshot definitions.
	
	
	MooseCustomTask runWithProgress: [:bar |
		visitor := MooseMonticelloClassPopulator new importer: self.
		definitions do: [ :def | def accept: visitor.
			bar increment].
	] description: 'Importing classes' length: (definitions size).

	self setSuperclassesAndCreateStubs.

	"create a scope, this is necessary for the method visitor which is VW aware"
	self targetModel allClasses do: [:famixClass | 
		famixClass attributes do: [:famixAttribute | 
			(self scopeOfClass: famixClass) at: famixAttribute name bind: famixAttribute]].


	MooseCustomTask runWithProgress: [:bar |
		"import methods"
		definitions do: [ :def | 
			(def isKindOf: MCMethodDefinition)
			ifTrue: [
				visitor := MooseMonticelloMethodPopulator new importer: self.
				def accept: visitor.
				self targetModel addAll: visitor entities]].
			bar increment.
		] description: 'Importing methods' length: (definitions size).


	^ self targetModel
]

{ #category : #public }
MooseMonticelloImporter >> importLastVersionOf: projectName [ 
	^ self importFileNamed: (self lastVersionOf: projectName)
]

{ #category : #'initialize-release' }
MooseMonticelloImporter >> initialize [
	super initialize.
	importingContext := MooseImportingContext new importMaximum; mergeClassAndMetaclass; yourself.
]

{ #category : #public }
MooseMonticelloImporter >> lastVersionOf: packageName [ 
	"Return the most recent version of an .mcz file based on the packageName"
	
	| versions sortedNames |
	
	self assertPackageName: packageName.
	
	versions := self fileNames select: [ :f | f beginsWith: packageName , '-' ].
	
	sortedNames := versions asSortedCollection: 
		[ :v1 :v2 | 
		(v1 
			copyFrom: (v1 indexOf: $.) + 1
			to: (v1 lastIndexOf: $.)) asInteger < (v2 
				copyFrom: (v2 indexOf: $.) + 1
				to: (v2 lastIndexOf: $.)) asInteger ].
	sortedNames ifEmpty: [ self error: 'No file was found for ', packageName ].

	self assertMCZFileName: sortedNames last.
	^ sortedNames last
]

{ #category : #public }
MooseMonticelloImporter >> repository [
	^ repositoryCache ifNil: [ self setRepository. ^ repositoryCache ]
]

{ #category : #'compatibility with visitor' }
MooseMonticelloImporter >> scope [

	^ nil
]

{ #category : #public }
MooseMonticelloImporter >> setMooseModel [
	self targetModel: MooseModel new.
	self targetModel sourceLanguage: FAMIXSmalltalkMonticelloSourceLanguage new
]

{ #category : #'hook - private' }
MooseMonticelloImporter >> setRepository [
	"Must be called before importing"
	self subclassResponsibility
]

{ #category : #private }
MooseMonticelloImporter >> setSuperclassesAndCreateStubs [
	| famixInheritance superclass |
	self targetModel allClasses do: 
		[ :famixClass | 
		superclass := self ensureClassNamed: (famixClass propertyNamed: #superclassName).
		famixInheritance := FAMIXInheritance new
			subclass: famixClass;
			superclass: superclass.
		famixClass addSuperInheritance: famixInheritance.
		superclass addSubInheritance: famixInheritance ]
]
