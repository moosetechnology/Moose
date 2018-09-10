Class {
	#name : #MooseMonticelloImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'importer'
	],
	#category : #'Moose-Tests-MonticelloImporter'
}

{ #category : #accessing }
MooseMonticelloImporterTest class >> resources [
	^ Array with: GoferResource
]

{ #category : #running }
MooseMonticelloImporterTest >> packageToTest [
	^ 'MonticelloImporterResourcePackage'
]

{ #category : #running }
MooseMonticelloImporterTest >> setUp [
	super setUp.
	importer := MooseMonticelloCacheImporter new.
	self settingUpTestPackageIfNecessary
]

{ #category : #running }
MooseMonticelloImporterTest >> settingUpTestPackageIfNecessary [

	(MooseMonticelloCacheImporter new fileNames includes: self packageToTest)
		ifFalse: [ 
			| cls1 cls2 workingCopy |
			cls1 := Object subclass: #Class1ForMonticelloCacheImporter
				instanceVariableNames: ''
				classVariableNames: ''
				poolDictionaries: ''
				category: self packageToTest.
			cls1 compile: 'foo', String cr, '	"hello"', String cr, '	^ 10'.
			cls1 compile: 'bar', String cr, '	"hello"', String cr, '	^ 10'.
					
			cls2 := Object subclass: #Class2ForMonticelloCacheImporter
				instanceVariableNames: ''
				classVariableNames: ''
				poolDictionaries: ''
				category: self packageToTest.
			cls2 compile: 'foo', String cr, '	Class1ForMonticelloCacheImporter new foo'.

			workingCopy := MCWorkingCopy forPackage: (MCPackage new name: self packageToTest).
			workingCopy newVersionWithName: self packageToTest, '-FooBar-1' message: 'test' in: workingCopy repositoryGroup.
			cls1 removeFromSystem.
			cls2 removeFromSystem.

		]
]

{ #category : #tests }
MooseMonticelloImporterTest >> testAssertion [

	"Package names"
	self shouldnt: [ importer assertPackageName: 'Mondrian' ] raise: AssertionFailure.
	self shouldnt: [ importer assertPackageName: 'Mondrian-Core' ] raise: AssertionFailure.
	
	self should: [ importer assertPackageName: 'mondrian-Core' ] raise: AssertionFailure.
	self should: [ importer assertPackageName: 'Mondrian-Core.mcz' ] raise: AssertionFailure.
	
	"MCZfile name"

	self should: [ importer assertMCZFileName: 'Mondrian' ] raise: AssertionFailure.
	self should: [ importer assertMCZFileName: 'Mondrian-Core' ] raise: AssertionFailure.
	self should: [ importer assertMCZFileName: 'mondrian-Core-ab.mcz' ] raise: AssertionFailure.
	
	self shouldnt: [ importer assertMCZFileName: 'Mondrian-Core-AB.mcz' ] raise: AssertionFailure.
	self shouldnt: [ importer assertMCZFileName: 'Mondrian-AB.mcz' ] raise: AssertionFailure.
	
]

{ #category : #tests }
MooseMonticelloImporterTest >> testImporting [
	| mooseModel noStubClasses allClasses objectClass class1 classWithIncomingAccess |
	mooseModel := importer importLastVersionOf: self packageToTest.
	allClasses := mooseModel allClasses.
	self assert: mooseModel class == MooseModel.
	noStubClasses := allClasses reject: #isStub.
	self assert: noStubClasses size equals: 2.
	self assert: allClasses size equals: 3.
	class1 := allClasses entityNamed: #Class1ForMonticelloCacheImporter.
	self assert: class1 methods size > 0.
	self assert: (class1 methods allSatisfy: [ :each | each parentType == class1 ]).	"number of lines of code"
	self assert: class1 numberOfLinesOfCode > 1.
	objectClass := allClasses entityNamed: #Object.
	self assert: objectClass isStub.
	self assert: objectClass methods isEmpty.
	self assert: (mooseModel allMethods allSatisfy: [ :each | each mooseModel == mooseModel ]).	"incoming access group"
	classWithIncomingAccess := mooseModel allClasses detect: [ :cls | cls outgoingInvocationsGroup notEmpty ] ifNone: nil.
	self assert: classWithIncomingAccess notNil
]

{ #category : #tests }
MooseMonticelloImporterTest >> testLastVersionOf [
	| file projectName mczFile |
	
	"We first check if there are some packages in the local repository. If none, then nothing can be tested"
	importer fileNames ifEmpty: [ ^ self ].
	
	file := importer fileNames first.
	projectName := file copyUpToLast: $-.
	mczFile := importer lastVersionOf: projectName.
	self assert: (mczFile notEmpty).
	
	self should: [importer lastVersionOf: file] raise: Exception.
]

{ #category : #utility }
MooseMonticelloImporterTest >> workingCopies [
	^ MCWorkingCopy allManagers asSortedCollection: [ :a :b | a name <= b name]
]
