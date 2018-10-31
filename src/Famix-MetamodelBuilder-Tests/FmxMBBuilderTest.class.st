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
FmxMBBuilderTest >> testChildBuildersGeneration [

	| parentBuilder childBuilder environment |
	
	parentBuilder := FamixMetamodelBuilder forTesting.
	parentBuilder configuration packageName: 'ParentBuilderPackage'.
	parentBuilder ensureClassNamed: 'ParentEntity'.
	
	childBuilder := FamixMetamodelBuilder new.
	childBuilder parentBuilder: parentBuilder.
	childBuilder configuration packageName: 'ChildBuilderPackage'.
	childBuilder ensureClassNamed: 'ChildEntity'.
	
	parentBuilder generate.
	parentBuilder generateRemotes.
	
	environment := parentBuilder environment ringEnvironment.
	
	self assert: (environment ask behaviorNamed: #TstParentEntity) notNil.
	self assert: (environment ask behaviorNamed: #TstParentEntity) package name equals: 'ParentBuilderPackage'. 
	self assert: (environment ask behaviorNamed: #TstChildEntity) isNil.
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testChildBuildersShareTheSameEnvironment [

	| parentBuilder childBuilder |
	
	parentBuilder := FamixMetamodelBuilder new.
	childBuilder := FamixMetamodelBuilder new.
	childBuilder parentBuilder: parentBuilder.

	self assert: childBuilder environment equals: parentBuilder environment.

]

{ #category : #tests }
FmxMBBuilderTest >> testClassNamed [

	| c1 |
	
	c1 := builder newClassNamed: 'C1'.

	self assert: (builder classNamed: #C1) equals: c1.
	self assert: (builder classNamed: #C2) isNil.
]

{ #category : #tests }
FmxMBBuilderTest >> testClassesThatDirectlyUse [

	"return only traits that are directly used by the trait"
	
	| c1 c2 c3 t1 t2 t3 |
	
	c1 := 	builder newClassNamed: #C1.
	c2 := 	builder newClassNamed: #C2.
	c3 := 	builder newClassNamed: #C3.
		
	t1 := 	builder newTraitNamed: #T1.
	t2 := 	builder newTraitNamed: #T2.
	t3 := 	builder newTraitNamed: #T3.
		
	c1 <|-- c2 <|-- c3.
	c1 --|> t1.
	c2 --|> t2.
	c3 --|> t3.
	
	self assertCollection: (builder classesThatDirectlyUse: t1) hasSameElements: { c1 }.
	self assertCollection: (builder classesThatDirectlyUse: t2) hasSameElements: { c2 }.
	self assertCollection: (builder classesThatDirectlyUse: t3) hasSameElements: { c3 }.
	
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testClassesThatUse [

	"return only traits that are directly used by the trait"
	
	| c1 c2 c3 t1 t2 t3 |
	
	c1 := 	builder newClassNamed: #C1.
	c2 := 	builder newClassNamed: #C2.
	c3 := 	builder newClassNamed: #C3.
		
	t1 := 	builder newTraitNamed: #T1.
	t2 := 	builder newTraitNamed: #T2.
	t3 := 	builder newTraitNamed: #T3.
		
	c1 <|-- c2 <|-- c3.
	c1 --|> t1.
	c2 --|> t2.
	c3 --|> t3.
	
	self assertCollection: (builder classesThatUse: t1) hasSameElements: { c1. c2. c3 }.
	self assertCollection: (builder classesThatUse: t2) hasSameElements: { c2. c3 }.
	self assertCollection: (builder classesThatUse: t3) hasSameElements: { c3 }.
	
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testContainerRequirementsOf [

	| class method function |
	
	class := 	builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	function := builder newClassNamed: #Function.
	
	class <>-* method.
	
	self assert: (builder containerRequirementsOf: class) isEmpty.	
	self assert: (builder containerRequirementsOf: function) isEmpty.
	self assert: (builder containerRequirementsOf: method) asArray equals: { class }.	
]

{ #category : #tests }
FmxMBBuilderTest >> testContainerRequirementsOfTrait [

	| class tClass method |
	
	class := 	builder newClassNamed: #Class.
	tClass := builder newTraitNamed: #TClass.
	method := builder newClassNamed: #Method.
	
	class --|> tClass.
	tClass <>-* method.

	self assert: (builder containerRequirementsOf: method) asArray equals: { class }.	
]

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
FmxMBBuilderTest >> testEnsureLocalTraitNamed [

	| t0 t1 |

	t0 := builder unsafeNewTraitNamed: #T1.	
	t0 prefix: 'Another'.
	t1 := builder unsafeNewTraitNamed: #T1.
	
	self assert: (builder ensureLocalTraitNamed: #T1) equals: t1.
]

{ #category : #tests }
FmxMBBuilderTest >> testEnsureLocalTraitNamedExisting [

	| aTrait |

	aTrait := builder unsafeNewTraitNamed: #T1.	
	aTrait prefix: 'Another'.

	self deny: (builder ensureLocalTraitNamed: #T1) equals: aTrait.

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

	| c1 aClass |
	
	aClass := builder newClassNamed: #C1 comment: 'comment'.
	self assert: aClass comment equals: 'comment'.
	self assert: aClass isMetamodelClass.
	
	builder generate.
	
	c1 := builder testingEnvironment ask classNamed: 'TstC1'.
	self assert: c1 comment content equals: 'comment'
	
]

{ #category : #tests }
FmxMBBuilderTest >> testNewTraitNamedComment [

	| t1 aTrait |
	
	aTrait := builder newTraitNamed: #T1 comment: 'comment'.
	self assert: aTrait comment equals: 'comment'.
	self assert: aTrait isMetamodelTrait.
	
	builder generate.
	
	t1 := builder testingEnvironment ask traitNamed: 'TstT1'.
	self assert: t1 comment content equals: 'comment'
	
]

{ #category : #tests }
FmxMBBuilderTest >> testParentBuilder [

	| parentBuilder childBuilder |
	
	parentBuilder := FamixMetamodelBuilder new.
	childBuilder := FamixMetamodelBuilder new.
	
	parentBuilder configuration packageName: 'ParentBuilderPackage'.
	childBuilder configuration packageName: 'ChildBuilderPackage'.
	
	childBuilder parentBuilder: parentBuilder.
	self assert: childBuilder parentBuilderPackageName equals: 'ParentBuilderPackage'

]

{ #category : #tests }
FmxMBBuilderTest >> testResolveRequirementsFromContainers [

	| class method function |
	
	class := 	builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	function := builder newClassNamed: #Function.
	
	class <>-* method.
	
	builder resolveRequirementsFromContainers.
	
	self assert: (class requirements) isEmpty.	
	self assert: (function requirements) isEmpty.
	self assert: (method requirements) asArray equals: { class }.	
]

{ #category : #tests }
FmxMBBuilderTest >> testSafeAnnotationPackageName [

	builder configuration packageName: 'Package'.
	self assert: builder safeAnnotationPackageName equals: '#Package'.

	builder configuration packageName: 'Package-Core'.
	self assert: builder safeAnnotationPackageName equals: '#''Package-Core'''.	
]

{ #category : #tests }
FmxMBBuilderTest >> testSortedClasses [

	"test class sorting by their hierarchy"

	| c1 c2 c3 |
	
	c1 := builder newClassNamed: 'C1'.
	c2 := builder newClassNamed: 'C2'.
	c3 := builder newClassNamed: 'C3'.
	
	c3 <|-- c1 <|-- c2.
	
	self assert: builder sortedClasses asArray equals: { c3. c1. c2 }
]

{ #category : #tests }
FmxMBBuilderTest >> testSortedTraits [

	"traits should be sorted by name and by their hierarchy"

	| t1 t2 t3 |
	
	t1 := builder newTraitNamed: 'T1'.
	t2 := builder newTraitNamed: 'T2'.
	t3 := builder newTraitNamed: 'T3'.
	
	t3 <|-- t2.
	
	self assert: builder sortedTraits asArray equals: { t1. t3. t2 }
]

{ #category : #tests }
FmxMBBuilderTest >> testSortedTratis [

	| t1 t2 t3 |
	
	t2 := builder ensureTraitNamed: #T2.
	t1 := builder ensureTraitNamed: #T1.
	t3 := builder ensureTraitNamed: #T3.

	self assertCollection: builder sortedTraits asArray equals: { t1. t2. t3 }.
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testTraitNamed [

	| t c |
	
	t := builder ensureTraitNamed: #T1.
	c := builder ensureClassNamed: #C1.	
	
	self assert: (builder traitNamed: #T1) equals: t.
	self should: [ builder traitNamed: #C1 ] raise: NotFound.

	
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
