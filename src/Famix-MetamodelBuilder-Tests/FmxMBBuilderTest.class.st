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
	
	t2 := builder newTraitNamed: #T2.
	t1 := builder newTraitNamed: #T1.
	t3 := builder newTraitNamed: #T3.

	self assertCollection: builder sortedTraits asArray equals: { t1. t2. t3 }.
	
	
]

{ #category : #tests }
FmxMBBuilderTest >> testTraitNamed [

	| c |
	self should: [ builder traitNamed: #T1 ] raise: FamixMetamodelGeneratorUnknownTrait.
	
	c := builder ensureClassNamed: #C1.	
	self should: [ builder traitNamed: #C1 ] raise: FamixMetamodelGeneratorUnknownTrait.

	
]
