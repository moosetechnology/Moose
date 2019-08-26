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
MooseGroupTest >> testDefaultStorage [
	self assert: (group entityStorage isKindOf: MooseGroupRuntimeStorage)
]

{ #category : #tests }
MooseGroupTest >> testDistribution [
	| referenceGroupOfGroups |
	referenceGroupOfGroups := self actualClass new.
	referenceGroupOfGroups add: (self actualClass withAll: #(1 2 3)).
	referenceGroupOfGroups add: (self actualClass withAll: #(4 5 6 7 8)).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 0.
	group := self actualClass withAll: #(1 2 3).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 1.
	group := self actualClass withAll: #(1 2).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3.
	group := self actualClass withAll: #(1 2 4 5).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3 + (2 / 5)
]

{ #category : #tests }
MooseGroupTest >> testDistributionAndEncapsulation [
	| referenceGroupOfGroups |
	referenceGroupOfGroups := self actualClass new.
	referenceGroupOfGroups add: (self actualClass withAll: #(1 2 3)).
	referenceGroupOfGroups add: (self actualClass withAll: #(4 5 6 7 8)).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 0.
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 0.
	group := self actualClass withAll: #(1 2 3).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 1.
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 1.
	group := self actualClass withAll: #(1 2).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3.
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3.
	group := self actualClass withAll: #(1 2 4 5).
	self assert: (group distributionOverAGroupOfGroups: referenceGroupOfGroups) equals: 2 / 3 + (2 / 5).
	self assert: (group encapsulationOfAGroupOfGroups: referenceGroupOfGroups) equals: 4 / 12 + (4 / 20)
]

{ #category : #tests }
MooseGroupTest >> testExplicitEmptyCreation [
	self assert: ((FAMIXTypeGroup withAll: #()) isKindOf: FAMIXTypeGroup)
]

{ #category : #tests }
MooseGroupTest >> testInitialization [
	| group1 group2 |
	group1 := self actualClass with: 1.
	group2 := self actualClass with: 1 withDescription: 'Group number 2'.
	self assert: group1 entities equals: group2 entities.
	self assert: group2 description equals: 'Group number 2'.
	self assert: group1 description equals: 'Group'
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
