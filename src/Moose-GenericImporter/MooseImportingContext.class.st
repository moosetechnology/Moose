"
I represent the context of import (reification level) for an importer: been it a fact extractor (only for Smalltalk in this version of Moose), or an MSE or other format importing. 
The idea is that given a graph dependencies between metamodel entities, I help to decide whether certain information should be extracted or kept in a model.

For example, since to get inheritance, classes are needed (such dependency is expressed on my class side), then when we model inheritance, my instance encapsulate that fact extractor or importers should also consider classes. Similar dependencies exist between an access and a instance variable and a method. 

My main API is
	
	- importXXX to declare what we want.
		importClass
		importInheritance
	- shouldImportXXXX to query what we should do.
		shouldImportAccess
		shouldImportInheritance
	- mergeClassAndMetaclass, and other helper. 
 
My class side implements a semantically coherent graph of dependency.


"
Class {
	#name : #MooseImportingContext,
	#superclass : #Object,
	#instVars : [
		'entityKindsToBeExtracted',
		'mergeClassAndMetaclass',
		'importSubclasses',
		'computeAttributeTypes'
	],
	#classVars : [
		'DefaultMergeClassAndMetaclass'
	],
	#classInstVars : [
		'entityDependencies'
	],
	#category : #'Moose-GenericImporter'
}

{ #category : #'importing-filters' }
MooseImportingContext class >> allDependentsOf: aKey [
	
	^self
		allDependentsOf: aKey
		alreadyIn: Set new
]

{ #category : #'importing-filters' }
MooseImportingContext class >> allDependentsOf: aKey alreadyIn: aSet [
	
	(self entityDependencies at: aKey)
		do:
			[:each | 
			(aSet includes: each)
				ifFalse:
					[aSet add: each.
					aSet addAll: (self allDependentsOf: each alreadyIn: aSet)]].
	^aSet
]

{ #category : #defaults }
MooseImportingContext class >> defaultMergeClassAndMetaclass [
	
	DefaultMergeClassAndMetaclass isNil
		ifTrue: [DefaultMergeClassAndMetaclass := false].
	^DefaultMergeClassAndMetaclass
]

{ #category : #defaults }
MooseImportingContext class >> defaultMergeClassAndMetaclass: aBoolean [
	"self defaultHaveExplicitMetaClasses: false"
	"self defaultHaveExplicitMetaClasses: true"
	
	DefaultMergeClassAndMetaclass := aBoolean
]

{ #category : #initialize }
MooseImportingContext class >> defineEntityDependencies [
	"self initialize"
	"when we extract literals extract  methods"
	
	self entityDependencies
		at: self importingLiteral
		put:
			((Set new)
				add: self importingLiteral;
				add: self importingMethod;
				yourself).	"when we extract comments do not extract anything else per default "
	self entityDependencies
		at: self importingComment
		put:
			((Set new)
				add: self importingComment;
				add: self importingMethod;
				yourself).	"when we extract files do not extract anything else per default "
	self entityDependencies
		at: self importingFolder
		put:
			((Set new)
				add: self importingFolder;
				yourself).	"when we extract files do not extract anything else per default "
	self entityDependencies
		at: self importingFile
		put:
			((Set new)
				add: self importingFile;
				yourself).	"when we extract namespace do not extract anything else per default "
	self entityDependencies
		at: self importingNamespace
		put:
			((Set new)
				add: self importingNamespace;
				yourself).	"when we extract package do not extract anything else per default "
	self entityDependencies
		at: self importingPackage
		put:
			((Set new)
				add: self importingPackage;
				yourself).
	self entityDependencies
		at: self importingClass
		put:
			((Set new)
				add: self importingClass;
				add: self importingNamespace;
				yourself).	"when we extract inheritance we extract classes"
	self entityDependencies
		at: self importingInheritance
		put:
			((Set new)
				add: self importingClass;
				add: self importingInheritance;
				yourself).	"when we extract inheritance we extract classes"
	self entityDependencies
		at: self importingMethod
		put:
			((Set new)
				add: self importingMethod;
				add: self importingClass;
				yourself).
	self entityDependencies
		at: self importingClassExtension 
		put:
			((Set new)
				add: self importingClassExtension;
				add: self importingMethod;
				add: self importingPackage;
				yourself).
	"when we extract implicit variable we extract also method"
	self entityDependencies
		at: self importingImplicitVariable
		put:
			((Set new)
				add: self importingMethod;
				add: self importingImplicitVariable;
				yourself).	"when we extract local variable we extract also method"
	self entityDependencies
		at: self importingLocalVariable
		put:
			((Set new)
				add: self importingMethod;
				add: self importingLocalVariable;
				yourself).
	self entityDependencies
		at: self importingAttribute
		put:
			((Set new)
				add: self importingAttribute;
				add: self importingClass;
				yourself).
	self entityDependencies
		at: self importingInvocation
		put:
			((Set new)
				add: self importingInvocation;
				add: self importingMethod;
				yourself).
	self entityDependencies
		at: self importingFormalParameter
		put:
			((Set new)
				add: self importingMethod;
				add: self importingFormalParameter;
				yourself).
	self entityDependencies
		at: self importingArgument
		put:
			((Set new)
				add: self importingMethod;
				add: self importingArgument;
				yourself).
	self entityDependencies
		at: self importingGlobalVariable
		put:
			((Set new)
				add: self importingArgument;
				add: self importingArgument;
				yourself).
	self entityDependencies
		at: self importingAccess
		put:
			((Set new)
				add: self importingMethod;
				add: self importingImplicitVariable;
				add: self importingLocalVariable;
				add: self importingAccess;
				add: self importingGlobalVariable;
				add: self importingArgument;
				add: self importingFormalParameter;
				yourself)
]

{ #category : #initialize }
MooseImportingContext class >> entityDependencies [
	
	^entityDependencies
]

{ #category : #initialize }
MooseImportingContext class >> entityDependencies: aDictionary [
	
	entityDependencies := aDictionary
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importAccessAndDependents [
	
	^self allDependentsOf: self importingAccess
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importArgumentAndDependents [
	
	^self allDependentsOf: self importingArgument
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importAttributeAndDependents [
	
	^self allDependentsOf: self importingAttribute
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importClassAndDependents [
	
	^self allDependentsOf: self importingClass
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importClassExtensionAndDependents [
	
	^self allDependentsOf: self importingClassExtension 
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importComment [
	
	^ self allDependentsOf:  self importingComment
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importFileAndDependents [
	
	^self allDependentsOf: self importingFile
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importFolderAndDependents [
	
	^self allDependentsOf: self importingFolder
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importFormalParameterAndDependents [
	
	^self allDependentsOf: self importingFormalParameter
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importGlobalVariableAndDependents [
	
	^self allDependentsOf: self importingGlobalVariable
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importImplicitVariableAndDependents [
	
	^self allDependentsOf: self importingImplicitVariable
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importInheritanceAndDependents [
	
	^self allDependentsOf: self importingInheritance
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importInvocationAndDependents [
	
	^self allDependentsOf: self importingInvocation
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importLiteralAndDependents [
	
	^self allDependentsOf: self importingLiteral
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importLocalVariableAndDependents [
	
	^self allDependentsOf: self importingLocalVariable
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importMethodAndDependents [
	"self importMethodAndDependents"
	
	^self allDependentsOf: self importingMethod
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importNamespace [
	"self importNamespace"
	
	^self allDependentsOf: self importingNamespace
]

{ #category : #'importing-filters' }
MooseImportingContext class >> importPackage [
	
	^ Set with: self importingPackage
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingAccess [
	
	^#Access
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingArgument [
	
	^#Argument
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingAttribute [
	
	^#Attribute
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingClass [
	
	^#Class
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingClassExtension [
	
	^#ClassExtension
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingComment [
	
	^#Comment
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingFile [
	
	^#File
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingFolder [
	
	^#Folder
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingFormalParameter [
	
	^#FormalParameter
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingFunction [
	
	^#Function
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingGlobalVariable [
	
	^#GlobalVariable
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingImplicitVariable [
	
	^#ImplicitVariable
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingInheritance [
	
	^#Inheritance
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingInvocation [
	
	^#Invocation
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingLiteral [
	
	^#Literal
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingLocalVariable [
	
	^#LocalVariable
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingMethod [
	
	^#Method
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingNamespace [
	
	^#Namespace
]

{ #category : #'basic representation' }
MooseImportingContext class >> importingPackage [
	
	^#Package
]

{ #category : #initialize }
MooseImportingContext class >> initialize [
	"self initialize"
	
	self entityDependencies: IdentityDictionary new.
	self defineEntityDependencies
]

{ #category : #'import options' }
MooseImportingContext >> computeTypeOfAttributes [

	"use this method to tell the importer that it should compute the type of attributes (using RoelType). By default this not the case, because computing types can take some time "
	computeAttributeTypes := true.
]

{ #category : #'import options' }
MooseImportingContext >> distinguishClassAndMetaclass [
	
	mergeClassAndMetaclass := false
]

{ #category : #'import options' }
MooseImportingContext >> doNotComputeTypeOfAttributes [

	computeAttributeTypes := false.
]

{ #category : #'import options' }
MooseImportingContext >> doNotImportSubclasses [
	
	importSubclasses := false
]

{ #category : #accessing }
MooseImportingContext >> entityKindsToBeExtracted [
	
	^entityKindsToBeExtracted
]

{ #category : #accessing }
MooseImportingContext >> entityKindsToBeExtracted: anObject [
	
	entityKindsToBeExtracted := anObject
]

{ #category : #'importing-filters' }
MooseImportingContext >> importAccess [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted addAll: self class importAccessAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importArgument [
	
	self entityKindsToBeExtracted
		addAll: self class importArgumentAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importAttribute [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importAttributeAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClass [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted addAll: self class importClassAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClassExtension [
	
	self entityKindsToBeExtracted addAll: self class importClassExtensionAndDependents 
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClassMethodInheritance [
	
	self entityKindsToBeExtracted addAll: self class importClassAndDependents.
	self entityKindsToBeExtracted addAll: self class importMethodAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importInheritanceAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClassMethodInheritanceAttribute [
	
	self entityKindsToBeExtracted addAll: self class importClassAndDependents.
	self entityKindsToBeExtracted addAll: self class importMethodAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importInheritanceAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importAttributeAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClassMethodInheritanceAttributeAccess [
	
	self entityKindsToBeExtracted addAll: self class importClassAndDependents.
	self entityKindsToBeExtracted addAll: self class importMethodAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importInheritanceAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importAttributeAndDependents.
	self entityKindsToBeExtracted addAll: self class importAccessAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importClassMethodInheritanceAttributeAccessInvocation [
	
	self entityKindsToBeExtracted addAll: self class importClassAndDependents.
	self entityKindsToBeExtracted addAll: self class importMethodAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importInheritanceAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importAttributeAndDependents.
	self entityKindsToBeExtracted addAll: self class importAccessAndDependents.
	self entityKindsToBeExtracted
		addAll: self class importInvocationAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importComment [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted addAll: self class importComment
]

{ #category : #'importing-filters' }
MooseImportingContext >> importFile [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted addAll: self class importFileAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importFolder [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted addAll: self class importFolderAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importFormalParameter [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importFormalParameterAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importGlobalVariable [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importGlobalVariableAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importImplicitVariable [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importImplicitVariableAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importInheritance [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importInheritanceAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importInvocation [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importInvocationAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importLiteral [
	
	self entityKindsToBeExtracted addAll: self class importLiteralAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importLocalVariable [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted
		addAll: self class importLocalVariableAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importMaximum [
	
	self entityKindsToBeExtracted: self maximum
]

{ #category : #'importing-filters' }
MooseImportingContext >> importMaximumExceptLiteral [
	" self new importMaximumExceptLiteral "
	
	| set |
	set := self maximum.
	set remove: self class importingLiteral.
	self entityKindsToBeExtracted: set
]

{ #category : #'importing-filters' }
MooseImportingContext >> importMethod [
	"in fact you check the dependents of the dependents"
	
	self entityKindsToBeExtracted addAll: self class importMethodAndDependents
]

{ #category : #'importing-filters' }
MooseImportingContext >> importNamespace [
	"just import a package and nothing else"
	
	self entityKindsToBeExtracted addAll: self class importNamespace
]

{ #category : #'importing-filters' }
MooseImportingContext >> importPackage [
	"just import a package and nothing else"
	
	self entityKindsToBeExtracted addAll: self class importPackage
]

{ #category : #'import options' }
MooseImportingContext >> importSubclasses [
	"When a class is created, we automatically import all its subclasses"
	importSubclasses := true
]

{ #category : #'basic representation' }
MooseImportingContext >> importingAccess [
	
	^self class importingAccess
]

{ #category : #'basic representation' }
MooseImportingContext >> importingArgument [
	
	^self class importingArgument
]

{ #category : #'basic representation' }
MooseImportingContext >> importingAttribute [
	
	^self class importingAttribute
]

{ #category : #'basic representation' }
MooseImportingContext >> importingClass [
	
	^self class importingClass
]

{ #category : #'basic representation' }
MooseImportingContext >> importingClassExtension [
	
	^self class importingClassExtension
]

{ #category : #'basic representation' }
MooseImportingContext >> importingFormalParameter [
	
	^self class importingFormalParameter
]

{ #category : #'basic representation' }
MooseImportingContext >> importingFunction [
	
	^self class importingFunction
]

{ #category : #'basic representation' }
MooseImportingContext >> importingGlobalVariable [
	
	^self class importingGlobalVariable
]

{ #category : #'basic representation' }
MooseImportingContext >> importingImplicitVariable [
	
	^self class importingImplicitVariable
]

{ #category : #'basic representation' }
MooseImportingContext >> importingInheritance [
	
	^self class importingInheritance
]

{ #category : #'basic representation' }
MooseImportingContext >> importingInvocation [
	
	^self class importingInvocation
]

{ #category : #'basic representation' }
MooseImportingContext >> importingLiteral [
	
	^self class importingLiteral
]

{ #category : #'basic representation' }
MooseImportingContext >> importingLocalVariable [
	
	^self class importingLocalVariable
]

{ #category : #'basic representation' }
MooseImportingContext >> importingMethod [
	
	^self class importingMethod
]

{ #category : #'basic representation' }
MooseImportingContext >> importingNamespace [
	
	^self class importingNamespace
]

{ #category : #'basic representation' }
MooseImportingContext >> importingPackage [
	
	^self class importingPackage
]

{ #category : #initialization }
MooseImportingContext >> initialize [
	super initialize.
	self entityKindsToBeExtracted: Set new.
	mergeClassAndMetaclass := self class defaultMergeClassAndMetaclass.
	computeAttributeTypes := false.
	"for subclasses import for the moment we just do the same as before but it should be discussed and probably should be set to false"
	importSubclasses := true
]

{ #category : #'importing-filters' }
MooseImportingContext >> maximum [
	
	| all |
	all := Set new.
	self class entityDependencies
		keysAndValuesDo: [:key :value | all addAll: value].
	^all
]

{ #category : #'import options' }
MooseImportingContext >> mergeClassAndMetaclass [
	
	mergeClassAndMetaclass := true
]

{ #category : #'import options' }
MooseImportingContext >> shouldComputeTypeOfAttributes [
	"return true if the importer has to compute the type of attributes. False if not. "

	^ computeAttributeTypes
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImport: aSymbol [
	
	^self entityKindsToBeExtracted includes: aSymbol
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportAccess [
	
	^self shouldImport: self class importingAccess
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportArgument [
	
	^self shouldImport: self class importingArgument
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportAttribute [
	
	^self shouldImport: self class importingAttribute
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportClass [
	
	^self shouldImport: self class importingClass
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportClassExtension [
	
	^self shouldImport: self class importingClassExtension
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportComment [
	
	^self shouldImport: self class importingComment
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportFormalParameter [
	
	^self shouldImport: self class importingFormalParameter
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportGlobalVariable [
	
	^self shouldImport: self class importingGlobalVariable
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportImplicitVariable [
	
	^self shouldImport: self class importingImplicitVariable
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportInheritance [
	
	^self shouldImport: self class importingInheritance
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportInvocation [
	
	^self shouldImport: self class importingInvocation
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportLiteral [
	
	^self shouldImport: self class importingLiteral
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportLocalVariable [
	
	^self shouldImport: self class importingLocalVariable
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportMethod [
	
	^self shouldImport: self class importingMethod
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportMethodBody [
	
	^self shouldImportAccess
		or:
			[self shouldImportImplicitVariable
				or:
					[self shouldImportLocalVariable
						or: [self shouldImportInvocation or: [self shouldImportArgument]]]]
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportNamespace [
	
	^self shouldImport: self class importingNamespace
]

{ #category : #'importing queries' }
MooseImportingContext >> shouldImportPackage [
	
	^self shouldImport: self class importingPackage
]

{ #category : #'import options' }
MooseImportingContext >> shouldImportSubclasses [
	
	^importSubclasses
]

{ #category : #'import options' }
MooseImportingContext >> shouldMergeClassAndMetaclass [
	
	^mergeClassAndMetaclass
]
