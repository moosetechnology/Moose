Class {
	#name : #HismoTest,
	#superclass : #TestCase,
	#instVars : [
		'testData'
	],
	#category : #'Moose-Tests-Hismo'
}

{ #category : #resources }
HismoTest class >> resources [
	^ Array with: MooseHismoSampleData
]

{ #category : #setup }
HismoTest >> expectedFailures [
	^ #(testYesterdaysWeather)
]

{ #category : #'testing - simple scenario' }
HismoTest >> readme [
	"These tests were added by Alexandre.Bergel 3/27/2009 21:55
	They may be trivial, but they provide simple scenarios"
]

{ #category : #setup }
HismoTest >> setUp [
	MooseModel resetMeta.
	testData := MooseHismoSampleData current
]

{ #category : #'testing - model history' }
HismoTest >> testAttributeAndMethodHistoriesBelongsTo [
	testData simpleHistory allClassHistories
		do: [ :eachHistory | 
			eachHistory attributeHistories do: [ :each | self assert: each belongsTo equals: eachHistory ].
			eachHistory methodHistories do: [ :each | self assert: each belongsTo equals: eachHistory ] ]
]

{ #category : #'testing - model history' }
HismoTest >> testAttributeHistoriesCreation [
	self assert: testData simpleHistory allAttributeHistories size equals: 8.
	self
		assert:
			(testData simpleHistory allAttributeHistories entityNamed: #'aNamespace::ClassC.attributeC1') first versionEntity
				mooseModel
		equals: testData simpleModel3.
	self
		assert:
			(testData simpleHistory allAttributeHistories entityNamed: #'aNamespace::ClassC.attributeC1') last versionEntity
				mooseModel
		equals: testData simpleModel4
]

{ #category : #'testing - history group' }
HismoTest >> testBasicGroupEquality [
	self assert: HismoHistoryGroup new equals: HismoHistoryGroup new.
	self deny: HismoHistoryGroup new = MooseGroup new
]

{ #category : #'testing - class history' }
HismoTest >> testClassEvery2VersionsHistoryDo [
	(testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA)
		every2VersionsHistoryDo: [ :each | 
			self assert: each size equals: 2.
			self assert: each first < each last ]
]

{ #category : #'testing - model history' }
HismoTest >> testClassHistoriesCreation [
	self assert: testData simpleHistory allClassHistories size equals: 6.
	self
		assert: (testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA) first versionEntity mooseModel
		equals: testData simpleModel1.
	self
		assert: (testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA) last versionEntity mooseModel
		equals: testData simpleModel5
]

{ #category : #'testing - namespace history' }
HismoTest >> testClassInNamespaceHistories [
	self assert: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) classHistories size equals: 5.
	(testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) classHistories
		do: [ :each | self assert: each belongsTo equals: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) ]
]

{ #category : #'testing - package history' }
HismoTest >> testClassInPackageHistories [
	self assert: (testData simpleHistory allPackageHistories entityNamed: #aPackage) classHistories size equals: 2.
	(testData simpleHistory allPackageHistories entityNamed: #aPackage) classHistories
		do: [ :each | self assert: each parentPackage equals: (testData simpleHistory allPackageHistories entityNamed: #aPackage) ]
]

{ #category : #'testing - statistics' }
HismoTest >> testCorrelation [

	| classHistories v classHistoryA |
	classHistories := testData simpleHistory allClassHistories.
	classHistoryA := classHistories entityNamed: #'aNamespace::ClassC'.
	self assert: ((v := classHistoryA correlationOf: #numberOfLinesOfCode and: #numberOfMethods) closeTo: 0.9948).
	
	self assert: ((classHistoryA correlationOf: #numberOfMethods and: #numberOfLinesOfCode) closeTo: v).
	
	self assert: ((classHistoryA correlationOf: #numberOfMethods and: #numberOfMethods) closeTo: 1).
	
	self assert: ((classHistoryA correlationOf: #numberOfMethods and: [ :c | c numberOfMethods negated ]) closeTo: -1)
]

{ #category : #'testing - statistics' }
HismoTest >> testCorrelation2 [

	| packageHistories |
	packageHistories := testData simpleHistory allPackageHistories.
	
	"Raise en error since the number of classes and methods are 0"
	self 
		should: [(packageHistories at: 1) correlationOf: #numberOfClasses and: #numberOfMethods] 
		raise: Error.
]

{ #category : #'testing - model history' }
HismoTest >> testDayFly [
	
	self
		assert:
			(testData simpleHistory allClassHistories entityNamed:
					#'aNamespace::anotherNamespace::ClassA') isDayFly.
	self
		assert:
			(testData simpleHistory allAttributeHistories entityNamed:
					#'aNamespace::ClassC.attributeC2') isDayFly.
	self
		assert:
			(testData simpleHistory allMethodHistories entityNamed:
					#'aNamespace::ClassC.methodC3()') isDayFly.
	self
		assert:
			(testData simpleHistory allNamespaceHistories entityNamed:
					#'aNamespace::anotherNamespace') isDayFly.
	^testData simpleHistory
]

{ #category : #'testing - model history' }
HismoTest >> testEvery2VersionsHistoryDo [
	testData simpleHistory
		every2VersionsHistoryDo: [ :each | 
			self assert: each size equals: 2.
			self assert: each first < each last.
			self assert: each last > each first ]
]

{ #category : #'testing - history group' }
HismoTest >> testGroupHistory [
	"This test checks that all the group are from the right type of group"
	
	self assert: testData simpleHistory allClassHistories class equals: HismoClassHistoryGroup.
	self assert: testData simpleHistory allMethodHistories class equals:  HismoMethodHistoryGroup.
	self assert: testData simpleHistory allNamespaceHistories class equals:  HismoNamespaceHistoryGroup.
	self assert: testData simpleHistory allPackageHistories class equals: HismoHistoryGroup.
	self assert: testData simpleHistory allAttributeHistories class equals: HismoHistoryGroup
]

{ #category : #'testing - model history' }
HismoTest >> testInheritanceHistoriesCreation [
	self assert: testData simpleHistory allInheritanceDefinitionHistories size equals: 5.
	self
		assert: testData simpleHistory allInheritanceDefinitionHistories printString
		equals: 'All Inheritance Definition Histories (5 HismoInheritanceDefinitionHistories)'.
	testData simpleHistory allInheritanceDefinitionHistories
		do: [ :each | 
			self assert: (testData simpleHistory allClassHistories includes: each superHistory).
			self assert: (testData simpleHistory allClassHistories includes: each subHistory) ]
]

{ #category : #'testing - class history' }
HismoTest >> testMethodInClassHistories [
	self assert: (testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA) methodHistories size equals: 2
]

{ #category : #'testing - model history' }
HismoTest >> testMethodsHistoriesCreation [
	self assert: testData simpleHistory allMethodHistories size equals: 8.
	self
		assert:
			(testData simpleHistory allMethodHistories entityNamed: #'aNamespace::ClassA.methodA1()') first versionEntity mooseModel
		equals: testData simpleModel1.
	self
		assert:
			(testData simpleHistory allMethodHistories entityNamed: #'aNamespace::ClassA.methodA1()') last versionEntity mooseModel
		equals: testData simpleModel5
]

{ #category : #'testing - model history' }
HismoTest >> testModelHistoryCreation [
	self assert: testData simpleHistory versions size equals: 5.
	self assert: testData simpleHistory versions first versionEntity == testData simpleModel1.
	self assert: testData simpleHistory versions first referenceVersion == testData simpleHistory versions first.
	self assert: testData simpleHistory versions last versionEntity == testData simpleModel5.
	self assert: testData simpleHistory versions last referenceVersion == testData simpleHistory versions last.
	^ testData simpleHistory
]

{ #category : #'testing - model history' }
HismoTest >> testNamespaceHistoriesCreation [
	self assert: testData simpleHistory allNamespaceHistories size equals: 2.
	self
		assert: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) first versionEntity mooseModel
		equals: testData simpleModel1.
	self
		assert: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) last versionEntity mooseModel
		equals: testData simpleModel5.
	self
		assert:
			(testData simpleHistory allNamespaceHistories entityNamed: #aNamespace::anotherNamespace) first versionEntity mooseModel
		equals: testData simpleModel4.
	self
		assert:
			(testData simpleHistory allNamespaceHistories entityNamed: #aNamespace::anotherNamespace) last versionEntity mooseModel
		equals: testData simpleModel4
]

{ #category : #'testing - namespace history' }
HismoTest >> testNamespaceInNamespaceHistories [
	self assert: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) namespaceHistories size equals: 1.
	self assert: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace) belongsTo isNil.
	self
		assert: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace::anotherNamespace) belongsTo
		equals: (testData simpleHistory allNamespaceHistories entityNamed: #aNamespace)
]

{ #category : #'testing - model history' }
HismoTest >> testPackageHistoriesCreation [
	self assert: testData simpleHistory allPackageHistories size equals: 4.
	self
		assert: testData simpleHistory allPackageHistories printString
		equals: 'All Package Histories (4 HismoPackageHistories)'.
	self
		assert: (testData simpleHistory allPackageHistories entityNamed: #aPackage) first versionEntity mooseModel
		equals: testData simpleModel1.
	self
		assert: (testData simpleHistory allPackageHistories entityNamed: #aPackage) last versionEntity mooseModel
		equals: testData simpleModel5.
	self
		assert: (testData simpleHistory allPackageHistories entityNamed: #anotherPackage) first versionEntity mooseModel
		equals: testData simpleModel2.
	self
		assert: (testData simpleHistory allPackageHistories entityNamed: #anotherPackage) last versionEntity mooseModel
		equals: testData simpleModel3
]

{ #category : #'testing - package history' }
HismoTest >> testPackageInPackageHistories [
	self assert: (testData simpleHistory allPackageHistories entityNamed: #aPackage) packageHistories size equals: 2.
	self
		assert: (testData simpleHistory allPackageHistories entityNamed: #'aPackage.yetAnotherPackage') parentPackage
		equals: (testData simpleHistory allPackageHistories entityNamed: #aPackage)
]

{ #category : #'testing - model history' }
HismoTest >> testPersistent [
	
	self
		assert:
			(testData simpleHistory allClassHistories entityNamed:
					#'aNamespace::ClassA') isPersistent.
	self
		assert:
			(testData simpleHistory allMethodHistories entityNamed:
					#'aNamespace::ClassA.methodA1()') isPersistent.
	self
		assert:
			(testData simpleHistory allAttributeHistories entityNamed:
					#'aNamespace::ClassA.attributeA1') isPersistent.
	self
		assert:
			(testData simpleHistory allNamespaceHistories entityNamed: #aNamespace)
				isPersistent
]

{ #category : #'testing - history group' }
HismoTest >> testPrintOn [
	self assert: HismoHistoryGroup new printString equals: 'Group (0 entities)'
]

{ #category : #'testing - model history' }
HismoTest >> testReferenceHistory [
	self assert: testData simpleHistory referenceHistory == testData simpleHistory.
	self assert: testData simpleHistory referenceHistory printString equals: 'Sample history (5)'.
	testData simpleHistory allClassHistories
		do: [ :each | self assert: each referenceHistory equals: testData simpleHistory ]
]

{ #category : #'testing - model history' }
HismoTest >> testReferenceVersion [
	self
		assert: (testData simpleHistory atReferenceVersion: testData simpleModel1) versionEntity
		equals: testData simpleModel1
]

{ #category : #'testing - class history' }
HismoTest >> testSelectBornIn [
	self assert: (testData simpleHistory allClassHistories selectBornIn: testData simpleHistory first) size equals: 2.
	self assert: (testData simpleHistory allClassHistories selectBornIn: testData simpleHistory last) size equals: 1
]

{ #category : #'testing - class history' }
HismoTest >> testSelectBornLaterThan [
	self
		assert: (testData simpleHistory allClassHistories selectBornLaterThan: testData simpleHistory first) size
		equals: 4.
	self assert: (testData simpleHistory allClassHistories selectBornLaterThan: testData simpleHistory last) size equals: 0
]

{ #category : #'testing - class history' }
HismoTest >> testSelectBornLaterThanOrIn [
	self
		assert: (testData simpleHistory allClassHistories selectBornLaterThanOrIn: testData simpleHistory first) size
		equals: 6.
	self
		assert: (testData simpleHistory allClassHistories selectBornLaterThanOrIn: testData simpleHistory last) size
		equals: 1
]

{ #category : #'testing - class history' }
HismoTest >> testSelectBornPriorTo [
	self assert: (testData simpleHistory allClassHistories selectBornPriorTo: testData simpleHistory first) size equals: 0.
	self assert: (testData simpleHistory allClassHistories selectBornPriorTo: testData simpleHistory last) size equals: 5
]

{ #category : #'testing - class history' }
HismoTest >> testSelectBornPriorToOrIn [
	self
		assert: (testData simpleHistory allClassHistories selectBornPriorToOrIn: testData simpleHistory first) size
		equals: 2.
	self
		assert: (testData simpleHistory allClassHistories selectBornPriorToOrIn: testData simpleHistory last) size
		equals: 6
]

{ #category : #'testing - class history' }
HismoTest >> testSelectByExpression [
	self
		assert: (testData simpleHistory allClassHistories select: [ :each | each evolutionOfNumberOfMethods > 0 ]) size
		equals: 3
]

{ #category : #'testing - class history' }
HismoTest >> testSelectLastSeenIn [
	self assert: (testData simpleHistory allClassHistories selectLastSeenIn: testData simpleHistory first) size equals: 0.
	self assert: (testData simpleHistory allClassHistories selectLastSeenIn: testData simpleHistory last) size equals: 4
]

{ #category : #'testing - class history' }
HismoTest >> testSelectLastSeenLaterThan [
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenLaterThan: testData simpleHistory first) size
		equals: 6.
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenLaterThan: testData simpleHistory last) size
		equals: 0
]

{ #category : #'testing - class history' }
HismoTest >> testSelectLastSeenLaterThanOrIn [
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenLaterThanOrIn: testData simpleHistory first) size
		equals: 6.
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenLaterThanOrIn: testData simpleHistory last) size
		equals: 4
]

{ #category : #'testing - class history' }
HismoTest >> testSelectLastSeenPriorTo [
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenPriorTo: testData simpleHistory first) size
		equals: 0.
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenPriorTo: testData simpleHistory last) size
		equals: 2
]

{ #category : #'testing - class history' }
HismoTest >> testSelectLastSeenPriorToOrIn [
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenPriorToOrIn: testData simpleHistory first) size
		equals: 0.
	self
		assert: (testData simpleHistory allClassHistories selectLastSeenPriorToOrIn: testData simpleHistory last) size
		equals: 6
]

{ #category : #'testing - simple scenario' }
HismoTest >> testSimple1 [
	| history entityVersion1 entityVersion2 model1 model2 classHistories classAHistory |
	history := testData simpleHistory.	"We deal here with an history of models"
	self assert: history class == HismoModelHistory.
	self assert: history printString equals: 'Sample history (5)'.	"The number between () in the history names says the number of versions it contains"
	self assert: history size equals: 5.
	self assert: history versions size equals: 5.
	self assert: history age equals: 5.	"Test of firstVersionOfPropertyNamed:"
	self assert: (history versions first propertyNamed: #NOM) equals: (history firstVersionOfPropertyNamed: #NOM).
	entityVersion1 := history versions first.
	entityVersion2 := history versions second.
	model1 := entityVersion1 versionEntity.
	model2 := entityVersion2 versionEntity.
	self assert: (model1 entityNamed: 'aNamespace::ClassA') methods size equals: 1.
	self assert: (model2 entityNamed: 'aNamespace::ClassA') methods size equals: 2.
	classHistories := history allClassHistories.
	classAHistory := classHistories entityNamed: #aNamespace::ClassA.
	self assert: classAHistory stabilityOfNumberOfMethods equals: 75.0
]

{ #category : #'testing - simple scenario' }
HismoTest >> testSimple2 [
	| model1 cls1 model2 |
	model1 := MooseModel new.
	cls1 := FamixClass new name: #ClassA.
	cls1 addMethod: (FamixMethod new name: 'method1()').
	cls1 addMethod: (FamixMethod new name: 'method2()').
	model1 add: cls1.
	
	model2 := MooseModel new.
	cls1 := FamixClass new name: #ClassA.
	cls1 addMethod: (FamixMethod new name: 'method1()').
	cls1 addMethod: (FamixMethod new name: 'method2()').
	cls1 addMethod: (FamixMethod new name: 'method3()').
	model2 add: cls1.
]

{ #category : #'testing - class history' }
HismoTest >> testSubHistories [
	self
		assert: (testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA) directSubHistories size
		equals: 3
]

{ #category : #'testing - class history' }
HismoTest >> testVersionsThatChanged [
	self
		assert:
			((testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA)
				select: [ :each | each changedFromPrevious: #numberOfMethods ]) size
		equals: 1.
	self
		assert:
			((testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassC)
				select: [ :each | each changedFromPrevious: #numberOfMethods ]) size
		equals: 2.
	self
		assert:
			((testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA)
				versionsThatChangedPropertyNamed: #numberOfMethods) size
		equals: 1.
	self
		assert:
			((testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassC)
				versionsThatChangedPropertyNamed: #numberOfMethods) size
		equals: 2.
	self
		assert:
			((testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassA)
				referenceVersionsInWhichChangeOccured: #numberOfMethods) size
		equals: 1.
	self
		assert:
			((testData simpleHistory allClassHistories entityNamed: #aNamespace::ClassC)
				referenceVersionsInWhichChangeOccured: #numberOfMethods) size
		equals: 2
]

{ #category : #'testing - class history' }
HismoTest >> testViewEvolution [
	
	self shouldnt: [ testData simpleHistory allClassHistories do: [:each | each viewEvolution delete ]] raise: Error.
	
]

{ #category : #'testing - class history' }
HismoTest >> testViewEvolution2 [
	testData simpleHistory allClassHistories
		do: [ :each | 
			| view |
			view := RTMondrian new.
			self assert: view view numberOfElements equals: 0.
			self shouldnt: [ each viewEvolutionOn: view ] raise: Error.
			self assert: view view numberOfElements > 0 ]
]

{ #category : #'testing - ui' }
HismoTest >> testViewEvolutionMatrix [
	
	| classHistories history |
	history := testData simpleHistory.
	classHistories := history allClassHistories.
	self shouldnt: [ classHistories viewEvolutionMatrix delete ] raise: Error
]

{ #category : #'testing - ui' }
HismoTest >> testViewHierarchyEvolution [
	
	| classHistories history |
	history := testData simpleHistory.
	classHistories := history allClassHistories.
	self shouldnt: [ classHistories viewHierarchyEvolution delete ] raise: Error
]

{ #category : #'testing - class history' }
HismoTest >> testViewSimpleEvolutionMatrix [
	
	self shouldnt: [ testData simpleHistory viewSimpleEvolutionMatrix delete ] raise: Error.
	
]

{ #category : #'testing - class history' }
HismoTest >> testViewSimpleEvolutionMatrix2 [
	| view |
	view := RTMondrian new.
	self assert: view view numberOfElements equals: 0.
	self shouldnt: [ testData simpleHistory viewSimpleEvolutionMatrixIn: view ] raise: Error.
	self assert: view view numberOfElements > 0
]
