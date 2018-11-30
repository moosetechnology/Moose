Class {
	#name : #MooseGroupTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
MooseGroupTest >> testAddLast [
	| group |
	group := MooseGroup new.
	group addLast: MooseEntity new.
	group addLast: MooseEntity new.
	group addLast: MooseEntity new.
	self assert: (group allSatisfy: [ :c | c class == MooseEntity ]).
	self deny: (group allSatisfy: [ :c | c = 10 ])
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

	| group |
	group := MooseGroup new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.

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

	| group |
	group := MooseGroup new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.

	self assert: (group anySatisfy: [ :c | c class == MooseEntity ] ).
	self deny: (group anySatisfy: [ :c | c = 10 ] ).
]

{ #category : #tests }
MooseGroupTest >> testAsMooseGroup [
	| group |
	group := MooseGroup new.
	self assert: group asMooseGroup == group
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
MooseGroupTest >> testCollect [
	| group |
	group := MooseGroup new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	self assert: (group collect: #name) entities asArray equals: #(#noname #noname #noname)
]

{ #category : #tests }
MooseGroupTest >> testContains [
	| group el1 el2 |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: MooseEntity new.

	self assert: (group anySatisfy: [ :el | el1 == el ]).
	self assert: (group anySatisfy: [ :el | el2 == el ]).
	self deny: (group anySatisfy: [ :el | 100 == el ])
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
	| group el1 v |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.
	
	v := group detect: [ :el | el == el1 ].
	self assert: v == el1
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

	| t group |
	t := OrderedCollection new.
	group := MooseGroup new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.
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
	| group el1 el2 el3 |
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
MooseGroupTest >> testGroupSize [
	| group classes |
	classes := self twoClasses.
	group := MooseGroup withAll: classes.
	self assert: group numberOfItems equals: classes size.
	self assert: group size equals: 2
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
	| group el1 el2 el3 |
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
	| group el1 el2 |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: MooseEntity new.
	self assert: (group occurrencesOf: el1) equals: 2.
	self assert: (group occurrencesOf: el2) equals: 1.
	self assert: (group occurrencesOf: MooseEntity new) isZero
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
	| group el1 v |
	group := MooseGroup new.
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.
	v := group select: [ :el | el == el1 ].
	self assert: v size equals: 1.
	self assert: v first == el1.
	self assert: v entities equals: (group selectByExpression: [ :el | el == el1 ]) entities
]

{ #category : #tests }
MooseGroupTest >> testSort [
	| sorted group |
	group := MooseGroup withAll: #(4 3 1 2).
	sorted := group sorted: [ :a :b | a < b ].
	self assert: sorted entities asArray equals: #(1 2 3 4)
]

{ #category : #tests }
MooseGroupTest >> testUnion [
	| group1 group2 group3 el1 el2 el3 el4 |
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
