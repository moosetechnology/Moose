Class {
	#name : #MooseGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #utility }
MooseGroupTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #tests }
MooseGroupTest >> testAdd [
	self
		assert: (self model allClasses copy , self model allMethods copy) size
		equals: self model allClasses size + self model allMethods size
]

{ #category : #tests }
MooseGroupTest >> testAddLast [
	| group el1 el2 el3 |
	group := MooseGroup new.
	group addLast: (el1 := MooseEntity new).
	group addLast: (el2 := MooseEntity new).
	group addLast: (el3 := MooseEntity new).
	self assert: (group allSatisfy: [ :c | c class == MooseEntity ]).
	self deny: (group allSatisfy: [ :c | c = 10 ])
]

{ #category : #tests }
MooseGroupTest >> testAllLikeSelectors [
	self assert: self model allClasses size equals: self model allClasses allClasses size.
	self model allClasses allMethods size = 57.
	self assert: (self model allClasses , self model allMethods) allClasses size equals: self model allClasses size.
	self assert: (self model allClasses , self model allMethods) allMethods size equals: self model allMethods size.
	self assert: ((self model allClasses , self model allMethods) allClasses isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
MooseGroupTest >> testAllModelMethod [
	| model |
	model := self twoClasses.
	self assert: model allModelMethods entities size equals: 3.
	self
		assert:
			(model allModelMethods entities includesAll: model allMethods entities)
]

{ #category : #tests }
MooseGroupTest >> testAllSatisfy [

	| group el1 el2 el3 |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	self assert: (group allSatisfy: [ :c | c class == MooseEntity ] ).
	self deny: (group allSatisfy: [ :c | c = 10 ] ).
]

{ #category : #tests }
MooseGroupTest >> testAllWithTypeAtRuntime [
	| group |
	group := MooseGroup withAll: #(42 #fortytwo).
	group entityStorage forRuntime.
	self assert: (group allWithType: SmallInteger) size equals: 1.
	self assert: (group allWithType: ByteSymbol) size equals: 1.
	self assert: (group allWithType: Object) isEmpty
]

{ #category : #tests }
MooseGroupTest >> testAllWithTypeAtSetup [
	| group |
	group := MooseGroup withAll: #(42 #fortytwo).
	group entityStorage forSetup.
	self assert: (group allWithType: SmallInteger) size equals: 1.
	self assert: (group allWithType: ByteSymbol) size equals: 1.
	self assert: (group allWithType: Object) isEmpty
]

{ #category : #tests }
MooseGroupTest >> testAnySatisfy [

	| group el1 el2 el3 |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	self assert: (group anySatisfy: [ :c | c class == MooseEntity ] ).
	self deny: (group anySatisfy: [ :c | c = 10 ] ).
]

{ #category : #tests }
MooseGroupTest >> testAsArray [
	self assert: (self model allClasses asArray isKindOf: Array)
]

{ #category : #tests }
MooseGroupTest >> testAsMooseGroup [
	| group |
	group := MooseGroup new.
	self assert: group asMooseGroup == group
]

{ #category : #tests }
MooseGroupTest >> testAsOrderedCollection [
	self assert: (self model allClasses asOrderedCollection isKindOf: OrderedCollection)
]

{ #category : #tests }
MooseGroupTest >> testAtIfAbsentIfPresent [
	| group result |
	group := MooseGroup new.
	group add: (FAMIXClass new name: 'A').
	result := group entityNamed: 'X' ifAbsent: [ 42 ] ifPresent: [ :i |  ].
	self assert: result equals: 42.
	result := group entityNamed: 'A' ifAbsent: [ nil ] ifPresent: [ :cls | cls name ].
	self assert: result equals: 'A'
]

{ #category : #tests }
MooseGroupTest >> testAtIfAbsentPut [
	| group classA |
	group := MooseGroup new.
	classA := FAMIXClass new name: 'A'.
	group entityNamed: 'X' ifAbsentPut: classA.
	self assert: group size equals: 1.
	self assert: group first == classA
]

{ #category : #tests }
MooseGroupTest >> testAverage [
	| classes classA classB |
	classA := FAMIXClass new.
	classA addMethod: FAMIXMethod new.
	classB := FAMIXClass new.
	classB addMethod: FAMIXMethod new.
	classB addMethod: FAMIXMethod new.
	classes := FAMIXTypeGroup
		withAll:
			{classA.
			classB}.
	self assert: (classes average: #numberOfMethods) equals: 1.5
]

{ #category : #tests }
MooseGroupTest >> testClassGroupType [
	| group aCollection numberOfClasses |
	aCollection := self model allClasses asOrderedCollection.
	numberOfClasses := aCollection size.
	group := MooseGroup withAll: aCollection.
	self assert: (group isMemberOf: FAMIXClassGroup).
	self assert: self model allClasses size equals: numberOfClasses
]

{ #category : #tests }
MooseGroupTest >> testCollect [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: (group collect: #name) entities asArray equals: #(#noname #noname #noname)
]

{ #category : #tests }
MooseGroupTest >> testCollectGroupType [
	| collectedClasses |
	collectedClasses := self model allMethods collect: #parentType.
	self assert: (collectedClasses isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
MooseGroupTest >> testContains [

	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	self assert: (group contains: [:el| el1== el]).
	self assert: (group contains: [:el| el2== el]).
	self deny: (group contains: [:el| 100 == el]).

]

{ #category : #tests }
MooseGroupTest >> testCopy [
	| group copy |
	group := MooseGroup with: 1.
	copy := group copy.
	self assert: copy ~~ group.
	self assert: copy entities ~~ group entities.
	self assert: copy entities equals: group entities.
	self assert: copy entityStorage ~~ group entityStorage.
	copy add: 2.
	self assert: copy size equals: 2.
	self assert: group size equals: 1
]

{ #category : #tests }
MooseGroupTest >> testCount [
	self assert: (self twoClasses count: [ :el | el class == FAMIXClass ]) equals: 2
]

{ #category : #tests }
MooseGroupTest >> testDefaultStorage [
	self assert: (MooseGroup new entityStorage isKindOf: MooseGroupRuntimeStorage)
]

{ #category : #tests }
MooseGroupTest >> testDetect [

	| t group el1 el2 el3 v |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	v := group detect: [ :el | el == el1 ].
	self assert: (v == el1)
]

{ #category : #tests }
MooseGroupTest >> testDistribution [
	| referenceGroupOfGroups group |
	referenceGroupOfGroups := MooseGroup new.
	referenceGroupOfGroups add: (MooseGroup withAll: #(1 2 3)).
	referenceGroupOfGroups add: (MooseGroup withAll: #(4 5 6 7 8)).
	group := MooseGroup new.
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 0.
	group := MooseGroup withAll: #(1 2 3).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 1.
	group := MooseGroup withAll: #(1 2).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3.
	group := MooseGroup withAll: #(1 2 4 5).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3 + (2 / 5)
]

{ #category : #tests }
MooseGroupTest >> testDistributionAndEncapsulation [
	| referenceGroupOfGroups group |
	referenceGroupOfGroups := MooseGroup new.
	referenceGroupOfGroups add: (MooseGroup withAll: #(1 2 3)).
	referenceGroupOfGroups add: (MooseGroup withAll: #(4 5 6 7 8)).
	group := MooseGroup new.
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 0.
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 0.
	group := MooseGroup withAll: #(1 2 3).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 1.
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 1.
	group := MooseGroup withAll: #(1 2).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3.
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3.
	group := MooseGroup withAll: #(1 2 4 5).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3 + (2 / 5).
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 4 / 12 + (4 / 20)
]

{ #category : #tests }
MooseGroupTest >> testDoWithIndex [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group
		doWithIndex: [ :x :i | 
			t
				add:
					{x.
					i} ].
	self
		assert: t asArray
		equals:
			{{el1.
			1}.
			{el2.
			2}.
			{el3.
			3}}
]

{ #category : #tests }
MooseGroupTest >> testDoWithIndexAndWithIndexDo [
	"Isn't that odd? Legacy method?"

	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self
		assert:
			(group
				doWithIndex: [ :x :i | 
					t
						add:
							{x.
							i} ])
		equals:
			(group
				withIndexDo: [ :x :i | 
					t
						add:
							{x.
							i} ])
]

{ #category : #tests }
MooseGroupTest >> testEntitiesDo [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group entitiesDo: [ :e | t add: e ].
	self
		assert: t asArray
		equals:
			{el1.
			el2.
			el3}
]

{ #category : #tests }
MooseGroupTest >> testEntityNamed [
	
	self model allClasses
		do:
			[:each | self assert: (self model allClasses entityNamed: each mooseName) notNil].
	self model allMethods
		do:
			[:each | self assert: (self model allMethods entityNamed: each mooseName) notNil]
]

{ #category : #tests }
MooseGroupTest >> testEntityNamedWithType [
	| group result c n |
	group := MooseGroup new.
	c := FAMIXClass new name: 'A'.
	n := FAMIXNamespace new name: 'A'.
	group add: c.
	group add: n.
	result := group entityNamed: 'A'.
	self assert: result equals: n.
	result := group entityNamed: 'A' withType: FAMIXNamespace.
	self assert: result equals: n.
	result := group entityNamed: 'A' withType: FAMIXClass.
	self assert: result equals: c
]

{ #category : #tests }
MooseGroupTest >> testEntityUniquelyNamed [
	
	| classes |
	classes := self model allClasses.
	self
		assert: (classes entityNamed: classes first mooseName) == classes first.
	self assert: (classes entityNamed: classes last mooseName) == classes last.
	self
		assert: (classes entityNamed: LANNode mooseName) isNil not.
	self
		assert:
			(classes entityNamed: LANNode class mooseName) isNil not
]

{ #category : #tests }
MooseGroupTest >> testEnumeration [

	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	self assert: group first == el1.
	self assert: group second == el2.
	self assert: group third == el3.
	
	self assert: group first == (group at: 1).
	self assert: group second ==  (group at: 2).
	self assert: group third ==  (group at: 3).
]

{ #category : #tests }
MooseGroupTest >> testExplicitEmptyCreation [
	self assert: ((FAMIXTypeGroup withAll: #()) isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
MooseGroupTest >> testFirst [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: group first == el1.
	self
		assert: (group first: 2) asArray
		equals:
			{el1.
			el1}.
	self
		assert: (group first: 4) asArray
		equals:
			{el1.
			el1.
			el2.
			el3}.
	self should: [ group first: 5 ] raise: Error
]

{ #category : #tests }
MooseGroupTest >> testFlatCollect [
	| allMethods |
	allMethods := self model allClasses flatCollect: [ :each | each methods asMooseGroup ].
	self assert: allMethods asSet equals: self model allMethods asSet
]

{ #category : #tests }
MooseGroupTest >> testFlatCollectType [
	| allMethods |
	allMethods := self model allClasses flatCollect: [:each | each methods ].
	self assert: (allMethods isKindOf: FAMIXMethodGroup)
]

{ #category : #tests }
MooseGroupTest >> testGroupInsideGroup [
	| group1 classes methods group2 group3 numberOfClasses |
	classes := self model allClasses copy.
	numberOfClasses := classes size.
	group1 := MooseGroup withAll: classes.
	methods := self model allMethods.
	group2 := MooseGroup withAll: methods.
	group3 := MooseGroup withAll: (OrderedCollection with: group1 with: group2).
	self assert: (group3 select: [ :each | each mooseID = group2 mooseID ]) isEmpty not.
	self assert: (self model allClasses isMemberOf: FAMIXClassGroup).
	self assert: self model allClasses size equals: numberOfClasses
]

{ #category : #tests }
MooseGroupTest >> testGroupSize [
	| group classes |
	classes := self twoClasses.
	group := MooseGroup withAll: classes.
	self assert: group numberOfItems equals: classes size.
	self assert: group size equals: 2
]

{ #category : #tests }
MooseGroupTest >> testGroupType [
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
MooseGroupTest >> testGroupedBy [
	| group v |
	group := MooseGroup new.
	group addAll: (1 to: 5).
	self assert: group size equals: 5.
	v := group groupedBy: #odd.
	self assert: v isDictionary.
	self assert: v keys size equals: 2.
	self assert: (v values first isKindOf: MooseGroup).
	self assert: (v values second isKindOf: MooseGroup).
	self assert: (v at: true) asArray equals: #(1 3 5).
	self assert: (v at: false) asArray equals: #(2 4)
]

{ #category : #tests }
MooseGroupTest >> testHeterogeneousGroupType [
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
MooseGroupTest >> testIcon [
	self assert: MooseGroup new mooseIcon isForm
]

{ #category : #tests }
MooseGroupTest >> testIncludes [
	self assert:	(self model allClasses includes: self model allClasses first)
]

{ #category : #tests }
MooseGroupTest >> testIncludesAllOf [
	self assert:	(self model allClasses includesAllOf: self model allClasses)
]

{ #category : #tests }
MooseGroupTest >> testIndexOf [
	| group el1 el2 el3 |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: (group indexOf: el1) equals: 1.
	self assert: (group indexOf: el2) equals: 3.
	self assert: (group indexOf: el3) equals: 4
]

{ #category : #tests }
MooseGroupTest >> testInitialization [
	| group1 group2 |
	group1 := MooseGroup with: 1.
	group2 := MooseGroup with: 1 withDescription: 'Group number 2'.
	self assert: group1 entities equals: group2 entities.
	self assert: group2 description equals: 'Group number 2'.
	self assert: group1 description equals: 'Group'
]

{ #category : #tests }
MooseGroupTest >> testIsCollection [
	self assert: MooseGroup new isCollection
]

{ #category : #tests }
MooseGroupTest >> testLast [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: group last == el3.
	self
		assert: (group last: 2) asArray
		equals:
			{el2.
			el3}.
	self
		assert: (group last: 4) asArray
		equals:
			{el1.
			el1.
			el2.
			el3}.
	self should: [ group last: 5 ] raise: Error
]

{ #category : #tests }
MooseGroupTest >> testMax [
	| classes |
	classes := self model allClasses.
	self assert: (classes max: #numberOfMethods) equals: 32 "was 15 before stateful traits conversion"
]

{ #category : #tests }
MooseGroupTest >> testMinimumOfPropertyNamed [
	| classes |
	classes := self model allClasses.
	self assert: (classes min: #numberOfMethods) equals: 0
]

{ #category : #tests }
MooseGroupTest >> testNumberOfPackages [
	| model |
	model := MooseModel new.
	self assert: model numberOfPackages equals: 0.
	model := MooseModel new.
	model add: FAMIXPackage new.
	model add: FAMIXPackage new.
	self assert: model numberOfPackages equals: 2.
	model := MooseModel new.
	model add: FAMIXNamespace new.
	model add: FAMIXNamespace new.
	self assert: model numberOfPackages equals: 0
]

{ #category : #tests }
MooseGroupTest >> testObjectAsMooseGroup [
	| group |
	group := 42 asMooseGroup.
	self assert: (group isKindOf: MooseGroup).
	self assert: group size equals: 1.
	self assert: group first equals: 42
]

{ #category : #tests }
MooseGroupTest >> testOccurenceOf [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: (group occurrencesOf: el1) equals: 2.
	self assert: (group occurrencesOf: el2) equals: 1.
	self assert: (group occurrencesOf: MooseEntity new) isZero
]

{ #category : #tests }
MooseGroupTest >> testPrintOn [
	| printOn |
	printOn := String streamContents: [ :stream | self model allTypes printOn: stream ].
	self assert: printOn equals: 'All famixttypes (' , self model allTypes size asString , ' FAMIXTypes)'
]

{ #category : #tests }
MooseGroupTest >> testReadStream [

	| group el1 el2 el3 stream |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	stream := group readStream.
	self assert: stream isStream.
	self assert: (stream next == el1).
	self assert: (stream next == el1).
	self assert: (stream next == el2).
	self assert: (stream next == el3).


]

{ #category : #tests }
MooseGroupTest >> testReject [
	| t group el1 el2 el3 v |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group reject: [ :el | el == el1 ].
	self assert: v size equals: 2.
	self
		assert:
			(v entities
				includesAll:
					{el2.
					el3})
]

{ #category : #tests }
MooseGroupTest >> testSelect [
	| t group el1 el2 el3 v |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group select: [ :el | el == el1 ].
	self assert: v size equals: 1.
	self assert: v first == el1.
	self assert: v entities equals: (group selectByExpression: [ :el | el == el1 ]) entities
]

{ #category : #tests }
MooseGroupTest >> testSelectEightyCoverForMetric [
	| top |
	top := self model allMethods selectEightyCoverForMetric: #numberOfLinesOfCode.
	self assert: (top notEmpty)
]

{ #category : #tests }
MooseGroupTest >> testSelectEmptyGroupType [
	| selected |
	selected := self model allMethods select: [ :each | each parentType isStub ].
	self assert: (selected isKindOf: MooseGroup)
]

{ #category : #tests }
MooseGroupTest >> testSelectFirst [
	| group |
	group := self model allClasses.
	self assert: (group selectFirst: 10) size equals: 10.
	self assert: (group selectFirst: 5) size equals: 5.
]

{ #category : #tests }
MooseGroupTest >> testSelectGroupType [
	| selected |
	selected := self model allMethods select: [ :each | each cyclomaticComplexity  = 1 ].
	self assert: (selected isKindOf: MooseGroup)
]

{ #category : #tests }
MooseGroupTest >> testSelectTopTwentyForMetric [
	| top remaining |
	top := self model allMethods selectTopTwentyForMetric: #numberOfLinesOfCode.
	remaining := self model allMethods entities copyWithoutAll: top.  
	self assert: (remaining allSatisfy: [ :m | top noneSatisfy: [ :m2 | m2 numberOfLinesOfCode <= m numberOfLinesOfCode] ]) 
	

]

{ #category : #tests }
MooseGroupTest >> testSort [
	| sorted group |
	group := MooseGroup withAll: #(4 3 1 2).
	sorted := group sorted: [ :a :b | a < b ].
	self assert: sorted entities asArray equals: #(1 2 3 4)
]

{ #category : #tests }
MooseGroupTest >> testSum [
	| classes |
	classes := self model allClasses.
	self assert: (classes sumNumbers: #numberOfMethods) equals: 84 "was 54 before traits classes inclusion"
]

{ #category : #tests }
MooseGroupTest >> testUnion [
	| t group1 group2 group3 el1 el2 el3 el4 |
	t := OrderedCollection new.
	group1 := MooseGroup new.
	group1 add: (el1 := MooseEntity new).
	group1 add: (el2 := MooseEntity new).
	group1 add: (el3 := MooseEntity new).
	group2 := MooseGroup new.
	group2 add: (el4 := MooseEntity new).
	group3 := group1 union: group2.
	self
		assert:
			(group3 entities
				includesAll:
					{el1.
					el2.
					el3.
					el4}).
	self assert: group3 entities size equals: 4.
	self
		assert:
			((group2 union: group1) entities
				includesAll:
					{el1.
					el2.
					el3.
					el4}).
	self assert: (group2 union: group1) ~= (group1 union: group2)
]

{ #category : #tests }
MooseGroupTest >> testWithIndexDo [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group
		withIndexDo: [ :x :i | 
			t
				add:
					{x.
					i} ].
	self
		assert: t asArray
		equals:
			{{el1.
			1}.
			{el2.
			2}.
			{el3.
			3}}
]

{ #category : #utility }
MooseGroupTest >> twoClasses [
	| classA classB |
	classA := FAMIXClass new.
	classA addMethod: FAMIXMethod new.
	classB := FAMIXClass new.
	classB addMethod: FAMIXMethod new.
	classB addMethod: FAMIXMethod new.
	^ FAMIXTypeGroup withAll: {classA . classB}.
]
