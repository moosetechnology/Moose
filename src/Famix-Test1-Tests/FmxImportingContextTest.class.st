Class {
	#name : #FmxImportingContextTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #resources }
FmxImportingContextTest >> modelMSE [
	^ '(
	(Famix-Test1-Entities.SourceTextAnchor (id: 1)
		(element (ref: 2))
		(source ''method1
source1''))
	(Famix-Test1-Entities.Method (id: 3)
		(name ''method2'')
		(cyclomaticComplexity -1)
		(isStub false)
		(numberOfLinesOfCode 3)
		(parentType (ref: 4)))
	(Famix-Test1-Entities.SourceTextAnchor (id: 5)
		(element (ref: 3))
		(source ''method2
source2a
source2b''))
	(Famix-Test1-Entities.Method (id: 2)
		(name ''method1'')
		(cyclomaticComplexity -1)
		(isStub false)
		(numberOfLinesOfCode 2)
		(parentType (ref: 6)))
	(Famix-Test1-Entities.Class (id: 6)
		(name ''Class1'')
		(isStub false)
		(numberOfLinesOfCode 2))
	(Famix-Test1-Entities.Method (id: 7)
		(name ''method3'')
		(cyclomaticComplexity -1)
		(isStub false)
		(numberOfLinesOfCode -1)
		(parentType (ref: 4)))
	(Famix-Test1-Entities.Class (id: 4)
		(name ''Class2'')
		(isStub false)
		(numberOfLinesOfCode 2)))'
]

{ #category : #tests }
FmxImportingContextTest >> testImportingClasses [
	self modelMSE
		readStreamDo: [ :s | 
			model := FamixTest1Model
				importFromMSEStream: s
				filteredBy:
					(FamixTest1ImportingContext new
						importClass;
						yourself) ].
	self assert: model entities size equals: 2.
	self assert: (model allUsing: FamixTClass) size equals: 2.
	self assertEmpty: (model allUsing: FamixTMethod).
	self assertEmpty: (model allUsing: FamixTHasImmediateSource)
]

{ #category : #tests }
FmxImportingContextTest >> testImportingClassesAndMethods [
	self modelMSE
		readStreamDo: [ :s | 
			model := FamixTest1Model
				importFromMSEStream: s
				filteredBy:
					(FamixTest1ImportingContext new
						importClass;
						importMethod;
						yourself) ].
	self assert: model entities size equals: 5.
	self assert: (model allUsing: FamixTClass) size equals: 2.
	self assert: (model allUsing: FamixTMethod) size equals: 3.
	self assertEmpty: (model allUsing: FamixTHasImmediateSource)
]

{ #category : #tests }
FmxImportingContextTest >> testImportingMethodsBringClassesAsRequirement [
	self modelMSE
		readStreamDo: [ :s | 
			model := FamixTest1Model
				importFromMSEStream: s
				filteredBy:
					(FamixTest1ImportingContext new
						importMethod;
						yourself) ].
	self assert: model entities size equals: 5.
	self assert: (model allUsing: FamixTClass) size equals: 2.
	self assert: (model allUsing: FamixTMethod) size equals: 3.
	self assertEmpty: (model allUsing: FamixTHasImmediateSource)
]

{ #category : #tests }
FmxImportingContextTest >> testModelWithoutImportingContext [
	self modelMSE readStreamDo: [ :s | model := FamixTest1Model importFromMSEStream: s ].
	self assert: model entities size equals: 7.
	self assert: (model allUsing: FamixTClass) size equals: 2.
	self assert: (model allUsing: FamixTMethod) size equals: 3.
	self assert: (model allUsing: FamixTHasImmediateSource) size equals: 2
]
