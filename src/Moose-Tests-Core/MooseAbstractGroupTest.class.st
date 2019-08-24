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
