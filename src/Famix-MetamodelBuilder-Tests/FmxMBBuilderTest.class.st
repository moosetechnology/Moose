"
coverage:

blacklistClasses := { FamixMetamodelBuilderRealEnvironment. FamixMetamodelGenerator }.
methods := 'Famix-MetamodelBuilder-Core' asPackage methods copyWithoutAll: (blacklistClasses flatCollect: #localMethods).

testRunner := TestRunner new.
testRunner instVarNamed: #packagesSelected put: #('Famix-MetamodelBuilder-Tests').
testRunner selectSubclasses.
testRunner collectCoverageFor: (methods collect: #asRingDefinition)
"
Class {
	#name : #FmxMBBuilderTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBBuilderTest >> testDoNotGenerateCurrent [
	
	builder newClassNamed: #Behavior.	
	builder newTraitNamed: #TBehavior.

	builder doNotGenerateCurrent.
	
	builder newClassNamed: #Class.
	builder newTraitNamed: #TClass.
	
	builder generate.
	
	self deny: (builder testingEnvironment ask includesClassNamed: 'TstBehavior').
	self deny: (builder testingEnvironment ask includesClassNamed: 'TstTBehavior').
	self assert: (builder testingEnvironment ask includesClassNamed: 'TstClass').
	self assert: (builder testingEnvironment ask includesClassNamed: 'TstTClass').

]

{ #category : #tests }
FmxMBBuilderTest >> testEmptyBuilder [

	| classesCount |
	classesCount := builder testingEnvironment ask allClasses size.
	builder generate.
	self assert: builder testingEnvironment ask allClasses size equals: classesCount.

]

{ #category : #tests }
FmxMBBuilderTest >> testEnsureClassNamed [

	| c1 |
	
	c1 := builder ensureClassNamed: #C1.
	self assert: c1 isMetamodelClass.
	self assert: (builder ensureClassNamed: #C1) identicalTo: c1.
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testEnsureTraitNamed [

	| t1 |
	
	t1 := builder ensureTraitNamed: #T1.
	self assert: t1 isMetamodelTrait.
	self assert: (builder ensureTraitNamed: #T1) identicalTo: t1.
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testMultipleClassesCreation [

	"it should not be possible to create two classes with the same name"

	builder newClassNamed: #C1.
	self should: [ builder newClassNamed: #C1 ] raise: FmxMBEntityAlreadyExists.	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testMultipleTraitsCreation [

	"it should not be possible to create two traits with the same name"

	builder newTraitNamed: #T1.
	self should: [ builder newTraitNamed: #T1 ] raise: FmxMBEntityAlreadyExists.	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testNewClassNamedComment [

	| c1 |
	
	builder newClassNamed: #C1 comment: 'comment'.
	builder generate.
	
	c1 := builder testingEnvironment ask classNamed: 'TstC1'.
	self assert: c1 comment content equals: 'comment'
	
]

{ #category : #tests }
FmxMBBuilderTest >> testNewTraitNamedComment [

	| t1 |
	
	builder newTraitNamed: #T1 comment: 'comment'.
	builder generate.
	
	t1 := builder testingEnvironment ask traitNamed: 'TstT1'.
	self assert: t1 comment content equals: 'comment'
	
]

{ #category : #tests }
FmxMBBuilderTest >> testWillGenerate [

	"test blocking of generation"

	| c1 t1 c2 t2 |
	
	c1 := builder newClassNamed: #C1.
	t1 := builder newTraitNamed: #T1.
	self assert: c1 willGenerate.
	self assert: t1 willGenerate.
	builder doNotGenerateCurrent.
	self deny: c1 willGenerate.
	self deny: t1 willGenerate.
	c2 := builder newClassNamed: #C2.
	t2 := builder newTraitNamed: #T2.
	self assert: c2 willGenerate.
	self assert: t2 willGenerate.
	
	self assertCollection: builder classesToGenerate hasSameElements: { c2 }.
	self assertCollection: builder traitsToGenerate hasSameElements: { t2 }
	
	
]
