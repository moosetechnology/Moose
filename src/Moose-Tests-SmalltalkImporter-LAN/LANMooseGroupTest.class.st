Class {
	#name : #LANMooseGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #utility }
LANMooseGroupTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model .
]

{ #category : #tests }
LANMooseGroupTest >> testAdd [
	self assert: (self model allClasses copy , self model allMethods copy) size equals: self model allClasses size + self model allMethods size
]

{ #category : #tests }
LANMooseGroupTest >> testAllLikeSelectors [
	self assert: self model allClasses size equals: self model allClasses allClasses size.
	self assert: (self model allClasses , self model allMethods) allClasses size equals: self model allClasses size.
	self assert: (self model allClasses , self model allMethods) allMethods size equals: self model allMethods size.
	self assert: ((self model allClasses , self model allMethods) allClasses isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
LANMooseGroupTest >> testAsArray [
	self assert: (self model allClasses asArray isKindOf: Array)
]

{ #category : #tests }
LANMooseGroupTest >> testAsOrderedCollection [
	self assert: (self model allClasses asOrderedCollection isKindOf: OrderedCollection)
]

{ #category : #tests }
LANMooseGroupTest >> testClassGroupType [
	| group aCollection numberOfClasses |
	aCollection := self model allClasses asOrderedCollection.
	numberOfClasses := aCollection size.
	group := MooseGroup withAll: aCollection.
	self assert: (group isMemberOf: FAMIXClassGroup).
	self assert: self model allClasses size equals: numberOfClasses
]

{ #category : #tests }
LANMooseGroupTest >> testCollectGroupType [
	| collectedClasses |
	collectedClasses := self model allMethods collect: #parentType.
	self assert: (collectedClasses isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
LANMooseGroupTest >> testEntityNamed [
	self model allClasses do: [ :each | self assert: (self model allClasses entityNamed: each mooseName) isNotNil ].
	self model allMethods do: [ :each | self assert: (self model allMethods entityNamed: each mooseName) isNotNil ]
]

{ #category : #tests }
LANMooseGroupTest >> testEntityUniquelyNamed [
	| classes |
	classes := self model allClasses.
	self assert: (classes entityNamed: classes first mooseName) identicalTo: classes first.
	self assert: (classes entityNamed: classes last mooseName) identicalTo: classes last
]

{ #category : #tests }
LANMooseGroupTest >> testFlatCollect [
	| allMethods |
	allMethods := self model allClasses flatCollect: [ :each | each methods asMooseGroup ].
	self assert: allMethods asSet equals: self model allMethods asSet
]

{ #category : #tests }
LANMooseGroupTest >> testFlatCollectType [
	| allMethods |
	allMethods := self model allClasses flatCollect: [:each | each methods ].
	self assert: (allMethods isKindOf: FAMIXMethodGroup)
]

{ #category : #tests }
LANMooseGroupTest >> testGroupInsideGroup [
	| group1 classes methods group2 group3 numberOfClasses |
	classes := self model allClasses copy.
	numberOfClasses := classes size.
	group1 := MooseGroup withAll: classes.
	methods := self model allMethods.
	group2 := MooseGroup withAll: methods.
	group3 := MooseGroup withAll: (OrderedCollection with: group1 with: group2).
	self assert: (group3 select: [ :each | each == group2 ]) isNotEmpty.
	self assert: (self model allClasses isMemberOf: FAMIXClassGroup).
	self assert: self model allClasses size equals: numberOfClasses
]

{ #category : #tests }
LANMooseGroupTest >> testGroupType [
	| group numberOfClasses numberOfMethods |
	numberOfClasses := self model allClasses size.
	numberOfMethods := self model allMethods size.
	group := MooseGroup withAll: self model allClasses entities.
	self assert: (group isMemberOf: FAMIXClassGroup).
	group addAll: self model allMethods.
	self assert: (group isMemberOf: MooseGroup).
	group removeAll: self model allMethods.
	self assert: (group isMemberOf: FAMIXClassGroup).
	group add: self model allMethods first.
	self assert: (group isMemberOf: MooseGroup).
	group remove: self model allMethods first.
	self assert: (group isMemberOf: FAMIXClassGroup).
	group := MooseGroup withAll: self model allMethods entities.
	self assert: (group isMemberOf: FAMIXMethodGroup).
	self assert: self model allClasses size equals: numberOfClasses.
	self assert: self model allMethods size equals: numberOfMethods
]

{ #category : #tests }
LANMooseGroupTest >> testHeterogeneousGroupType [
	| group aCollection numberOfClasses numberOfMethods |
	numberOfClasses := self model allClasses size.
	numberOfMethods := self model allMethods size.
	aCollection := self model allClasses asOrderedCollection.
	self assert: self model allClasses size equals: numberOfClasses.
	group := MooseGroup withAll: aCollection.
	self deny: (group isMemberOf: MooseGroup).
	self assert: (group isMemberOf: FAMIXClassGroup).
	group addAll: self model allMethods asOrderedCollection.
	self assert: self model allMethods size equals: numberOfMethods.
	self assert: (group isMemberOf: MooseGroup).
	aCollection := self model allMethods asOrderedCollection.
	aCollection addAll: self model allClasses asOrderedCollection.
	group := MooseGroup withAll: aCollection.
	self assert: (group isMemberOf: MooseGroup).
	self assert: self model allClasses size equals: numberOfClasses.
	self assert: self model allMethods size equals: numberOfMethods
]

{ #category : #tests }
LANMooseGroupTest >> testIncludes [
	self assert:	(self model allClasses includes: self model allClasses first)
]

{ #category : #tests }
LANMooseGroupTest >> testIncludesAllOf [
	self assert:	(self model allClasses includesAllOf: self model allClasses)
]

{ #category : #tests }
LANMooseGroupTest >> testMax [
	self assert: (self model allClasses detectMax: #numberOfMethods) equals: (self model entityNamed: #Smalltalk::LANInterface_class)
]

{ #category : #tests }
LANMooseGroupTest >> testMinimumOfPropertyNamed [
	| classes |
	classes := self model allClasses.
	self assert: (classes min: #numberOfMethods) equals: 0
]

{ #category : #tests }
LANMooseGroupTest >> testPrintOn [
	| printOn |
	printOn := String streamContents: [ :stream | self model allTypes printOn: stream ].
	self assert: (printOn beginsWith: 'All famixttypes (' , self model allTypes size asString)
]

{ #category : #tests }
LANMooseGroupTest >> testSelectEightyCoverForMetric [
	| top |
	top := self model allMethods selectEightyCoverForMetric: #numberOfLinesOfCode.
	self assert: top isNotEmpty
]

{ #category : #tests }
LANMooseGroupTest >> testSelectEmptyGroupType [
	| selected |
	selected := self model allMethods select: [ :each | each parentType isStub ].
	self assert: (selected isKindOf: MooseGroup)
]

{ #category : #tests }
LANMooseGroupTest >> testSelectFirst [
	| group |
	group := self model allClasses.
	self assert: (group selectFirst: 10) size equals: 10.
	self assert: (group selectFirst: 5) size equals: 5.
]

{ #category : #tests }
LANMooseGroupTest >> testSelectGroupType [
	| selected |
	selected := self model allMethods select: [ :each | each cyclomaticComplexity = 1 ].
	self assert: (selected isKindOf: MooseGroup)
]

{ #category : #tests }
LANMooseGroupTest >> testSelectTopTwentyForMetric [
	| top remaining |
	top := self model allMethods selectTopTwentyForMetric: #numberOfLinesOfCode.
	remaining := self model allMethods entities copyWithoutAll: top.
	self assert: (remaining allSatisfy: [ :m | top noneSatisfy: [ :m2 | m2 numberOfLinesOfCode <= m numberOfLinesOfCode ] ])
]

{ #category : #tests }
LANMooseGroupTest >> testSum [
	self assert: (self model allModelClasses sumNumbers: #numberOfAttributes) equals: 16
]
