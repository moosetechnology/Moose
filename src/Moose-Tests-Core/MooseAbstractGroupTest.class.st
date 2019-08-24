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
	self assertCollection: (group collect: #name) entities hasSameElements: #('A' 'B' 'C')
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
	group addAll: #(1 2 3).
	self assertCollection: (group difference: (self actualClass withAll: #(2 4))) hasSameElements: #(1 3).
	self assertCollection: ((self actualClass withAll: #(2 4)) difference: group) hasSameElements: #(4)
]

{ #category : #tests }
MooseAbstractGroupTest >> testDifferenceWithRealCollection [
	group addAll: #(1 2 3).
	self assertCollection: (group difference: #(2)) hasSameElements: #(1 3)
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
MooseAbstractGroupTest >> testEntityNamedIfAbsentPut [
	| class result |
	class := FamixTest3Class named: 'A'.
	result := group entityNamed: 'X' ifAbsentPut: class.
	self assert: group size equals: 1.
	self assert: group first identicalTo: class.
	self assert: result equals: class.
	self flag: #todo. "The logic of this method is really weird. We should see what to do... https://github.com/moosetechnology/Moose/issues/1808"
	"result := group entityNamed: 'X' ifAbsentPut: class.
	self assert: group size equals: 1.
	self assert: group first identicalTo: class.
	self assert: result equals: class."
]

{ #category : #tests }
MooseAbstractGroupTest >> testNumberOfPackages [
	self assert: group numberOfPackages equals: 0
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
