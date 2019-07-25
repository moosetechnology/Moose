Class {
	#name : #FmxMBImportingContextTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'access',
		'variable',
		'generatedAccess',
		'generatedVariable',
		'generatedMethod',
		'method',
		'generatedContext'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBImportingContextTest >> setUp [

	super setUp.

	builder withImportingContext.

	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	
	method := builder newClassNamed: #Method.	
		
	access requires: { method. variable }.

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: #TstAccess.
	generatedVariable := builder testingEnvironment ask classNamed: #TstVariable.
	generatedMethod := builder testingEnvironment ask classNamed: #TstMethod.

	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.

]

{ #category : #initialization }
FmxMBImportingContextTest >> testDefineImport [

	| localMethod |
	
	localMethod := generatedContext methodNamed: #importMethod.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self import: TstMethod').

]

{ #category : #initialization }
FmxMBImportingContextTest >> testGeneratedContextClass [

	self assert: generatedContext notNil.
	self assert: generatedContext superclass name = #FmxImportingContext.
]

{ #category : #initialization }
FmxMBImportingContextTest >> testNotGenerated [

	builder := FamixMetamodelBuilder forTesting.

	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	
	method := builder newClassNamed: #Method.	
		
	access requires: { method. variable }.

	builder generate.
		
	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.
	self assert: generatedContext isNil.

]

{ #category : #initialization }
FmxMBImportingContextTest >> testNotGeneratedForEmptyBuilder [

	builder := FamixMetamodelBuilder forTesting.
	builder withImportingContext.

	builder generate.
		
	generatedContext := builder testingEnvironment ask classNamed: #TstImportingContext.
	self assert: generatedContext isNil.

]

{ #category : #initialization }
FmxMBImportingContextTest >> testRequirements [
	| localMethod |
	self assert: (generatedVariable classSide methodNamed: #requirements) isNil.
	self assert: (generatedMethod classSide methodNamed: #requirements) isNil.

	localMethod := generatedAccess classSide methodNamed: #requirements.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ { TstMethod. TstVariable }')
]

{ #category : #initialization }
FmxMBImportingContextTest >> testShouldImport [

	| localMethod |
	
	localMethod := generatedContext methodNamed: #shouldImportMethod.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self shouldImport: TstMethod').
	
	localMethod := generatedContext methodNamed: #shouldImportAccess.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self shouldImport: TstAccess').
	
	localMethod := generatedContext methodNamed: #shouldImportVariable.
	self assert: (localMethod sourceCode includesSubstring: '<generated>').
	self assert: (localMethod sourceCode includesSubstring: '^ self shouldImport: TstVariable').

]
