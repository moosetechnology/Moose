Class {
	#name : #MooseGroupTest,
	#superclass : #MooseAbstractGroupTest,
	#category : #'Moose-Tests-Core'
}

{ #category : #helpers }
MooseGroupTest >> actualClass [
	^ MooseGroup
]

{ #category : #tests }
MooseGroupTest >> testAllModelMethod [
	| model |
	model := self twoClasses.
	self assert: model allModelMethods entities size equals: 3.
	self assert: (model allModelMethods entities includesAll: model allMethods entities).
	self flag: #todo. "Once this bug will be fixed, we should add an assertion with stubs methods.https://github.com/moosetechnology/Moose/issues/1800"
]

{ #category : #tests }
MooseGroupTest >> testAnySatisfy [
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.

	self assert: (group anySatisfy: [ :c | c class == MooseEntity ]).
	self deny: (group anySatisfy: [ :c | c = 10 ])
]

{ #category : #tests }
MooseGroupTest >> testAsMooseGroup [
	group := #(1 2 3) asMooseGroup.
	self assert: (group isKindOf: MooseGroup).
	self assert: group size equals: 3
]

{ #category : #tests }
MooseGroupTest >> testAsMooseGroupDoNotCopy [
	self assert: group asMooseGroup identicalTo: group
]

{ #category : #tests }
MooseGroupTest >> testAsMooseGroupWithClasses [
	"Non regression test of issue https://github.com/moosetechnology/Moose/issues/1486"

	self shouldnt: [ group := {Object} asMooseGroup ] raise: Error.
	self assert: group size equals: 1.
	self assert: group anyOne equals: Object
]

{ #category : #tests }
MooseGroupTest >> testAtIfAbsentIfPresent [
	| result |
	group add: (FAMIXClass new name: 'A').
	result := group entityNamed: 'X' ifAbsent: [ 42 ] ifPresent: [ :i |  ].
	self assert: result equals: 42.
	result := group entityNamed: 'A' ifAbsent: [ nil ] ifPresent: [ :cls | cls name ].
	self assert: result equals: 'A'
]

{ #category : #tests }
MooseGroupTest >> testAtIfAbsentPut [
	| classA |
	classA := FAMIXClass new name: 'A'.
	group entityNamed: 'X' ifAbsentPut: classA.
	self assert: group size equals: 1.
	self assert: group first identicalTo: classA
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
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	self assert: (group collect: #name) entities asArray equals: #(#noname #noname #noname)
]

{ #category : #tests }
MooseGroupTest >> testContains [
	| el1 el2 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: MooseEntity new.

	self assert: (group anySatisfy: [ :el | el1 == el ]).
	self assert: (group anySatisfy: [ :el | el2 == el ]).
	self deny: (group anySatisfy: [ :el | 100 == el ])
]

{ #category : #tests }
MooseGroupTest >> testCopy [
	| copy |
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
	self assert: (self twoClasses count: [ :el | el class == FamixTest1Class ]) equals: 2
]

{ #category : #tests }
MooseGroupTest >> testDefaultStorage [
	self assert: (MooseGroup new entityStorage isKindOf: MooseGroupRuntimeStorage)
]

{ #category : #tests }
MooseGroupTest >> testDetect [
	| el1 v |
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.

	v := group detect: [ :el | el == el1 ].
	self assert: v == el1
]

{ #category : #tests }
MooseGroupTest >> testDifference [
	group := #(1 2 3) asMooseGroup.
	self assertCollection: (group difference: #(2 4) asMooseGroup) hasSameElements: #(1 3).
	self assertCollection: (#(2 4) asMooseGroup difference: group) hasSameElements: #(4)
]

{ #category : #tests }
MooseGroupTest >> testDifferenceWithRealCollection [
	group := #(1 2 3) asMooseGroup.
	self assertCollection: (group difference: #(2)) hasSameElements: #(1 3)
]

{ #category : #tests }
MooseGroupTest >> testDistribution [
	| referenceGroupOfGroups |
	referenceGroupOfGroups := MooseGroup new.
	referenceGroupOfGroups add: (MooseGroup withAll: #(1 2 3)).
	referenceGroupOfGroups add: (MooseGroup withAll: #(4 5 6 7 8)).
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
	| referenceGroupOfGroups |
	referenceGroupOfGroups := MooseGroup new.
	referenceGroupOfGroups add: (MooseGroup withAll: #(1 2 3)).
	referenceGroupOfGroups add: (MooseGroup withAll: #(4 5 6 7 8)).
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
	| t el1 el2 el3 |
	t := OrderedCollection new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group doWithIndex: [ :x :i | t add: {x . i} ].
	self assert: t asArray equals: {{el1 . 1} . {el2 . 2} . {el3 . 3}}
]

{ #category : #tests }
MooseGroupTest >> testDoWithIndexAndWithIndexDo [
	"Isn't that odd? Legacy method?"

	| t |
	t := OrderedCollection new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	self
		assert: (group doWithIndex: [ :x :i | t add: {x . i} ])
		equals: (group withIndexDo: [ :x :i | t add: {x . i} ])
]

{ #category : #tests }
MooseGroupTest >> testEntitiesDo [
	| t el1 el2 el3 |
	t := OrderedCollection new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group entitiesDo: [ :e | t add: e ].
	self assert: t asArray equals: {el1 . el2 . el3}
]

{ #category : #tests }
MooseGroupTest >> testEnumeration [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	self assert: group first identicalTo: el1.
	self assert: group second identicalTo: el2.
	self assert: group third identicalTo: el3.

	self assert: group first identicalTo: (group at: 1).
	self assert: group second identicalTo: (group at: 2).
	self assert: group third identicalTo: (group at: 3)
]

{ #category : #tests }
MooseGroupTest >> testExplicitEmptyCreation [
	self assert: ((FAMIXTypeGroup withAll: #()) isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
MooseGroupTest >> testFirst [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: group first identicalTo: el1.
	self assert: (group first: 2) asArray equals: {el1 . el1}.
	self assert: (group first: 4) asArray equals: {el1 . el1 . el2 . el3}.
	self should: [ group first: 5 ] raise: Error
]

{ #category : #tests }
MooseGroupTest >> testGroupSize [
	| classes |
	classes := self twoClasses.
	group addAll: classes.
	self assert: group numberOfItems equals: classes size.
	self assert: group size equals: 2
]

{ #category : #tests }
MooseGroupTest >> testGroupedBy [
	| v |
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
	| el1 el2 el3 |
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
MooseGroupTest >> testIntersection [
	group := #(1 2 3) asMooseGroup.
	self assertCollection: (group intersection: #(2 3 4) asMooseGroup) hasSameElements: #(2 3).
	self assertCollection: (#(2 3 4) asMooseGroup intersection: group) hasSameElements: #(2 3)
]

{ #category : #tests }
MooseGroupTest >> testIntersectionWithRealCollection [
	group := #(1 2 3) asMooseGroup.
	self assertCollection: (group intersection: #(2 3 4)) hasSameElements: #(2 3).
	self assertCollection: (#(2 3 4) intersection: group) hasSameElements: #(2 3)
]

{ #category : #tests }
MooseGroupTest >> testIsCollection [
	self assert: group isCollection
]

{ #category : #tests }
MooseGroupTest >> testLast [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: group last identicalTo: el3.
	self assert: (group last: 2) asArray equals: {el2 . el3}.
	self assert: (group last: 4) asArray equals: {el1 . el1 . el2 . el3}.
	self should: [ group last: 5 ] raise: Error
]

{ #category : #tests }
MooseGroupTest >> testNumberOfPackages [
	self assert: group numberOfPackages equals: 0.
	group add: FAMIXPackage new.
	group add: FAMIXPackage new.
	self assert: group numberOfPackages equals: 2.
	group := MooseModel new.
	group add: FAMIXNamespace new.
	group add: FAMIXNamespace new.
	self assert: group numberOfPackages equals: 0
]

{ #category : #tests }
MooseGroupTest >> testObjectAsMooseGroup [
	group := 42 asMooseGroup.
	self assert: (group isKindOf: MooseGroup).
	self assert: group size equals: 1.
	self assert: group first equals: 42
]

{ #category : #tests }
MooseGroupTest >> testOccurenceOf [
	| el1 el2 |
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
	| el1 el2 el3 stream |
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	stream := group readStream.
	self assert: stream isStream.
	self assert: stream next identicalTo: el1.
	self assert: stream next identicalTo: el1.
	self assert: stream next identicalTo: el2.
	self assert: stream next identicalTo: el3
]

{ #category : #tests }
MooseGroupTest >> testReject [
	| el1 el2 el3 v |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group reject: [ :el | el == el1 ].
	self assert: v size equals: 2.
	self assert: (v entities includesAll: {el2 . el3})
]

{ #category : #tests }
MooseGroupTest >> testSelect [
	| el1 v |
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.
	v := group select: [ :el | el == el1 ].
	self assert: v size equals: 1.
	self assert: v first identicalTo: el1.
	self assert: v entities equals: (group selectByExpression: [ :el | el == el1 ]) entities
]

{ #category : #tests }
MooseGroupTest >> testSort [
	| sorted |
	group := MooseGroup withAll: #(4 3 1 2).
	sorted := group sorted: [ :a :b | a < b ].
	self assert: sorted entities asArray equals: #(1 2 3 4)
]

{ #category : #tests }
MooseGroupTest >> testUnion [
	| group2 group3 el1 el2 el3 el4 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := MooseGroup new.
	group2 add: (el4 := MooseEntity new).
	group3 := group union: group2.
	self assert: (group3 includesAll: {el1 . el2 . el3 . el4}).
	self assert: group3 size equals: 4.
	self assert: ((group2 union: group) includesAll: {el1 . el2 . el3 . el4}).
	self assert: (group2 union: group) ~= (group union: group2)
]

{ #category : #tests }
MooseGroupTest >> testUnionWithRealCollection [
	group := #(1 2 3) asMooseGroup.
	self assertCollection: (group union: #(2 3 4)) hasSameElements: #(1 2 3 4).
	self assertCollection: (#(2 3 4) union: group) hasSameElements: #(1 2 3 4)
]

{ #category : #tests }
MooseGroupTest >> testWithIndexDo [
	| t el1 el2 el3 |
	t := OrderedCollection new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group withIndexDo: [ :x :i | t add: {x . i} ].
	self assert: t asArray equals: {{el1 . 1} . {el2 . 2} . {el3 . 3}}
]

{ #category : #utility }
MooseGroupTest >> twoClasses [
	| classA classB |
	classA := FamixTest1Class new.
	classA addMethod: FamixTest1Method new.
	classB := FamixTest1Class new.
	classB addMethod: FamixTest1Method new.
	classB addMethod: FamixTest1Method new.
	^ FAMIXClassGroup withAll: {classA . classB}
]
