Class {
	#name : #MooseAbstractGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'group'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #testing }
MooseAbstractGroupTest class >> isAbstract [
	^ self = MooseAbstractGroupTest
]

{ #category : #testing }
MooseAbstractGroupTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
MooseAbstractGroupTest >> actualClass [
	^ MooseAbstractGroup
]

{ #category : #running }
MooseAbstractGroupTest >> setUp [
	super setUp.
	group := self actualClass new
]

{ #category : #tests }
MooseAbstractGroupTest >> testAdd [
	| entity |
	entity := MooseEntity new.
	group add: entity.
	self assert: group size equals: 1.
	self assert: group first identicalTo: entity
]

{ #category : #tests }
MooseAbstractGroupTest >> testAddLast [
	| entity class method |
	group addLast: (entity := FamixTest1Entity new).
	self assert: group last identicalTo: entity.

	group addLast: (class := FamixTest1Class new).
	self assert: group last identicalTo: class.

	group addLast: (method := FamixTest1Method new).
	self assert: group last identicalTo: method.

	self assert: (group at: 1) identicalTo: entity.
	self assert: (group at: 2) identicalTo: class.
	self assert: (group at: 3) identicalTo: method
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllSatisfy [
	3 timesRepeat: [ group add: MooseEntity new ].

	self assert: (group allSatisfy: [ :c | c class == MooseEntity ]).
	self deny: (group allSatisfy: [ :c | c = 10 ])
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllUsing [
	group addAll: {FamixTest3Class new . FamixTest3Type new}.
	self should: [ group allUsing: FamixTest3Type ] raise: MooseAllUsingOnClass.
	self assert: (group allUsing: FamixTClass) size equals: 1.
	self assert: (group allUsing: FamixTType) size equals: 2
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllWithSubTypesOf [
	group addAll: {FamixTest3Class new . FamixTest3Type new}.
	self assert: (group allWithSubTypesOf: FamixTest3Type) size equals: 2.
	self assert: (group allWithSubTypesOf: FamixTest3Class) size equals: 1.
	self assert: (group allWithSubTypesOf: MooseEntity) size equals: 2
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllWithSubTypesOfAny [
	group
		addAll:
			{FamixTest3Class new.
			FamixTest3Invocation new.
			FamixTest3PrimitiveType new}.
	self
		assert: (group allWithSubTypesOfAny: {FamixTest3NamedEntity}) size
		equals: 2.
		self
		assert: (group allWithSubTypesOfAny: {FamixTest3NamedEntity. FamixTest3Invocation}) size
		equals: 3
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllWithType [
	group addAll: {FamixTest3Class new . FamixTest3Type new}.
	self assert: (group allWithType: FamixTest3Class) size equals: 1.
	self assert: (group allWithType: FamixTest3Type) size equals: 1.
	self should: [ (group allWithType: FamixTClass) size ] raise: MooseAllWithTypeOnTrait.
	self assert: (group allWithType: Object) isEmpty
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllWithTypeAtRuntime [
	group addAll: {FamixTest3Class new . FamixTest3Method new}.
	group entityStorage forRuntime.
	self assert: (group allWithType: FamixTest3Class) size equals: 1.
	self assert: (group allWithType: FamixTest3Method) size equals: 1.
	self assert: (group allWithType: FamixTest3Invocation) isEmpty
]

{ #category : #tests }
MooseAbstractGroupTest >> testAllWithTypeAtSetup [
	group addAll: {FamixTest3Class new . FamixTest3Method new}.
	group entityStorage forSetup.
	self assert: (group allWithType: FamixTest3Class) size equals: 1.
	self assert: (group allWithType: FamixTest3Method) size equals: 1.
	self assert: (group allWithType: FamixTest3Invocation) isEmpty
]

{ #category : #tests }
MooseAbstractGroupTest >> testAnySatisfy [
	3 timesRepeat: [ group add: MooseEntity new ].

	self assert: (group anySatisfy: [ :c | c class == MooseEntity ]).
	self deny: (group anySatisfy: [ :c | c = 10 ])
]

{ #category : #tests }
MooseAbstractGroupTest >> testAverage [
	| classA classB |
	classA := FamixTest3Class new
		addMethod: FamixTest3Method new;
		yourself.
	classB := FamixTest3Class new
		addMethod: FamixTest3Method new;
		addMethod: FamixTest3Method new;
		yourself.
	group addAll: {classA . classB}.
	self assert: (group average: #numberOfMethods) equals: 1.5
]

{ #category : #tests }
MooseAbstractGroupTest >> testCollect [
	#('A' 'B' 'C') do: [ :each | group add: (FamixTest3Method named: each) ].
	self assertCollection: (group collect: #name) hasSameElements: #('A' 'B' 'C')
]

{ #category : #tests }
MooseAbstractGroupTest >> testContains [
	3 timesRepeat: [ group add: MooseEntity new ].

	self assert: (group contains: [ :c | c class == MooseEntity ]).
	self deny: (group contains: [ :c | c = 10 ])
]

{ #category : #tests }
MooseAbstractGroupTest >> testCopy [
	| copy |
	group := self actualClass with: FamixTest3Method new.
	copy := group copy.
	self deny: copy identicalTo: group.
	self deny: copy entities identicalTo: group entities.
	self assert: copy entities equals: group entities.
	self deny: copy entityStorage identicalTo: group entityStorage.
	copy add: FamixTest3Method new.
	self assert: copy size equals: 2.
	self assert: group size equals: 1
]

{ #category : #tests }
MooseAbstractGroupTest >> testCount [
	self assert: (self twoClasses count: [ :el | el class == FamixTest1Class ]) equals: 2
]

{ #category : #tests }
MooseAbstractGroupTest >> testDetect [
	| b |
	group add: (FamixTest3Method named: 'A').
	group add: (b := FamixTest3Method named: 'B').
	group add: (FamixTest3Method named: 'C').
	self assert: (group detect: [ :el | el name = 'B' ]) identicalTo: b
]

{ #category : #tests }
MooseAbstractGroupTest >> testDifference [
	| group2 el1 el2 el3 el4 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := self actualClass with: (el4 := MooseEntity new).
	self assertCollection: (group difference: group2) hasSameElements: group.
	self assertCollection: (group difference: self actualClass new) hasSameElements: group.
	self assertEmpty: (group difference: group).
	group2 add: el1.
	self assertCollection: (group difference: group2) hasSameElements: {el2 . el3}.
	self assertCollection: (group2 difference: group) hasSameElements: {el4}.
	group add: el1.
	self assertCollection: (group difference: group2) hasSameElements: {el2 . el3}
]

{ #category : #tests }
MooseAbstractGroupTest >> testDifferenceWithRealCollection [
	group addAll: #(1 2 3).
	self assertCollection: (group difference: #(2)) hasSameElements: #(1 3)
]

{ #category : #tests }
MooseAbstractGroupTest >> testDoSeparatedBy [
	| t el1 el2 el3 |
	t := OrderedCollection new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group do: [ :x | t add: x ] separatedBy: [ t add: 10 ].
	self assertCollection: t hasSameElements: {el1 . 10 . el2 . 10 . el3}
]

{ #category : #tests }
MooseAbstractGroupTest >> testDoWithIndex [
	| t el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	t := OrderedCollection new.
	group doWithIndex: [ :x :i | t add: {x . i} ].
	self assertCollection: t hasSameElements: {{el1 . 1} . {el2 . 2} . {el3 . 3}}
]

{ #category : #tests }
MooseAbstractGroupTest >> testEntitiesDo [
	| t el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	t := OrderedCollection new.
	group entitiesDo: [ :e | t add: e ].
	self assertCollection: t hasSameElements: {el1 . el2 . el3}
]

{ #category : #tests }
MooseAbstractGroupTest >> testEntityNamedIfAbsentIfPresent [
	| result class |
	group add: (class := FamixTest3Class named: 'A').
	result := group entityNamed: 'X' ifAbsent: [ 42 ] ifPresent: [ :i | self fail ].
	self assert: result equals: 42.
	result := group entityNamed: class mooseName ifAbsent: [ self fail ] ifPresent: [ :cls | cls name ].
	self assert: result equals: class mooseName
]

{ #category : #tests }
MooseAbstractGroupTest >> testEnumeration [
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
MooseAbstractGroupTest >> testFirst [
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
MooseAbstractGroupTest >> testGroupSize [
	| classes |
	classes := self twoClasses.
	group addAll: classes.
	self assert: group numberOfItems equals: classes size.
	self assert: group size equals: 2
]

{ #category : #tests }
MooseAbstractGroupTest >> testGroupedBy [
	| v |
	group addAll: ((1 to: 5) collect: [ :i | FamixTest3Class named: i asString ]).
	self assert: group size equals: 5.
	v := group groupedBy: [ :e | e name asNumber odd ].
	self assert: v isDictionary.
	self assert: v keys size equals: 2.
	self assert: (v values first isKindOf: self actualClass).
	self assert: (v values second isKindOf: self actualClass).
	self assertCollection: ((v at: true) collect: #name) hasSameElements: #('1' '3' '5').
	self assertCollection: ((v at: false) collect: #name) hasSameElements: #('2' '4')
]

{ #category : #tests }
MooseAbstractGroupTest >> testIndexOf [
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
MooseAbstractGroupTest >> testIntersection [
	| group2 el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := self actualClass with: MooseEntity new.
	self assertEmpty: (group intersection: group2).
	self assertEmpty: (group intersection: self actualClass new).
	self assertCollection: (group intersection: group) hasSameElements: {el1 . el2 . el3}.
	group2 add: el1.
	self assertCollection: (group intersection: group2) hasSameElements: {el1}.
	self assertCollection: (group2 intersection: group) hasSameElements: {el1}.
	group add: el1.
	self assertCollection: (group intersection: group2) hasSameElements: {el1}
]

{ #category : #tests }
MooseAbstractGroupTest >> testIntersectionWithRealCollection [
	group addAll: #(1 2 3).
	self assertCollection: (group intersection: #(2 3 4)) hasSameElements: #(2 3).
	self assertCollection: (#(2 3 4) intersection: group) hasSameElements: #(2 3)
]

{ #category : #tests }
MooseAbstractGroupTest >> testIsCollection [
	self assert: group isCollection
]

{ #category : #tests }
MooseAbstractGroupTest >> testLast [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: group last identicalTo: el3.
	self assertCollection: (group last: 2) hasSameElements: {el2 . el3}.
	self assertCollection: (group last: 4) hasSameElements: {el1 . el1 . el2 . el3}.
	self should: [ group last: 5 ] raise: Error
]

{ #category : #tests }
MooseAbstractGroupTest >> testNumberOfPackages [
	self assert: group numberOfPackages equals: 0
]

{ #category : #tests }
MooseAbstractGroupTest >> testOccurenceOf [
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
MooseAbstractGroupTest >> testPropertyNamed [
	self assert: (group propertyNamed: #UNKNOWN) isNil.
	group propertyNamed: 'UNKNOWN' put: 10.
	self assert: (group propertyNamed: #UNKNOWN) equals: 10
]

{ #category : #tests }
MooseAbstractGroupTest >> testReadStream [
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
MooseAbstractGroupTest >> testReject [
	| el1 el2 el3 v |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group reject: [ :el | el == el1 ].
	self assertCollection: v hasSameElements: {el2 . el3}
]

{ #category : #tests }
MooseAbstractGroupTest >> testRemoveAll [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	group removeAll: {el1 . el2 . el3}.
	self assertEmpty: group
]

{ #category : #tests }
MooseAbstractGroupTest >> testRemoveAll2 [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group removeAll: {el1 . el2 . el3}.
	self denyEmpty: group.
	self assertCollection: group entities hasSameElements: {el1}
]

{ #category : #tests }
MooseAbstractGroupTest >> testSelect [
	| el1 v |
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.
	v := group select: [ :el | el == el1 ].
	self assert: v size equals: 1.
	self assert: v first identicalTo: el1
]

{ #category : #tests }
MooseAbstractGroupTest >> testUnion [
	| group2 el1 el2 el3 el4 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := self actualClass with: (el4 := MooseEntity new).
	self assertCollection: (group union: group2) hasSameElements: {el1 . el2 . el3 . el4}.
	self assertCollection: (group2 union: group) hasSameElements: {el1 . el2 . el3 . el4}.
	self assert: (group2 union: group) ~= (group union: group2)
]

{ #category : #tests }
MooseAbstractGroupTest >> testUnionWithRealCollection [
	group addAll: #(1 2 3).
	self assertCollection: (group union: #(2 3 4)) hasSameElements: #(1 2 3 4).
	self assertCollection: (#(2 3 4) union: group) hasSameElements: #(1 2 3 4)
]

{ #category : #tests }
MooseAbstractGroupTest >> testWithIndexDo [
	| t el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	t := OrderedCollection new.
	group withIndexDo: [ :x :i | t add: {x . i} ].
	self assertCollection: t hasSameElements: {{el1 . 1} . {el2 . 2} . {el3 . 3}}
]

{ #category : #utility }
MooseAbstractGroupTest >> twoClasses [
	| classA classB |
	classA := FamixTest1Class new.
	classA addMethod: FamixTest1Method new.
	classB := FamixTest1Class new.
	classB addMethod: FamixTest1Method new.
	classB addMethod: FamixTest1Method new.
	^ self actualClass withAll: {classA . classB}
]
