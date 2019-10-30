Class {
	#name : #FamixTest3Test,
	#superclass : #TestCase,
	#traits : 'TFamixWithMSEExportTestCase',
	#classTraits : 'TFamixWithMSEExportTestCase classTrait',
	#category : #'Famix-Test3-Tests'
}

{ #category : #accessing }
FamixTest3Test >> c1 [
	^ model entityNamed: #Class1
]

{ #category : #accessing }
FamixTest3Test >> c2 [
	^ model entityNamed: #Class2
]

{ #category : #running }
FamixTest3Test >> checkAtScopeWithNonMatchingEntitiesDoWith: aBehavior [

	| mooseQueryResult nonMatching |
	mooseQueryResult := MooseOutgoingQueryResult on: self c1 withAll: { self ref1. self inv1 }.

	nonMatching := Set new.
	self assertCollection: (
		mooseQueryResult 
			atScope: aBehavior 
			withNonMatchingEntitiesDo: [ :entities :matchingAtTheScope | 
				nonMatching addAll: entities asCollection ]) hasSameElements: { self c1. }.
	self assertCollection: nonMatching hasSameElements: { self pt1 }.

]

{ #category : #accessing }
FamixTest3Test >> inv1 [
	^ (model allUsing: FamixTInvocation) anyOne
]

{ #category : #accessing }
FamixTest3Test >> m1 [
	^ model entityNamed: 'Class1.m1'
]

{ #category : #accessing }
FamixTest3Test >> m2 [
	^ model entityNamed: 'Class2.m2'
]

{ #category : #accessing }
FamixTest3Test >> pt1 [
	^ model entityNamed: #int
]

{ #category : #accessing }
FamixTest3Test >> pt2 [
	^ model entityNamed: #float
]

{ #category : #accessing }
FamixTest3Test >> ref1 [
	^ (model allUsing: FamixTReference) detect: [ :ref | ref source = self m1 and: [ ref target = self pt1 ] ]
]

{ #category : #running }
FamixTest3Test >> setUp [
	| c1 c2 m1 m2 pt1 pt2 ref1 ref2 inv1 |
	super setUp.

	model := FamixTest3Model new.

	c1 := FamixTest3Class named: 'Class1'.
	c2 := FamixTest3Class named: 'Class2'.

	m1 := FamixTest3Method named: 'm1'.
	m2 := FamixTest3Method named: 'm2'.

	pt1 := FamixTest3PrimitiveType named: 'int'.
	pt2 := FamixTest3PrimitiveType named: 'float'.

	ref1 := FamixTest3Reference new.
	ref2 := FamixTest3Reference new.
	inv1 := FamixTest3Invocation new.

	c1 addMethod: m1.
	c2 addMethod: m2.

	ref1
		source: m1;
		target: pt1.
	ref2
		source: m1;
		target: c1.
	inv1
		from: m1;
		to: {m1}.

	model addAll: {c1 . c2 . m1 . m2 . pt1 . pt2. ref1. ref2. inv1}
]

{ #category : #tests }
FamixTest3Test >> testAllClients [
	self assertCollection: self pt1 allClients hasSameElements: {self m1}
]

{ #category : #tests }
FamixTest3Test >> testAllClientsAtScope [
	self assertCollection: (self pt1 allClientsAtScope: FamixTClass) hasSameElements: {self c1}.
	self assertCollection: (self pt1 allClientsAtScope: FamixTest3Class) hasSameElements: {self c1}
]

{ #category : #tests }
FamixTest3Test >> testAllProviders [
	self assertCollection: self m1 allProviders hasSameElements: {self c1 . self pt1}
]

{ #category : #tests }
FamixTest3Test >> testAllProvidersAtScope [
	self assertCollection: (self m1 allProvidersAtScope: FamixTClass) hasSameElements: {self c1 . self pt1}.
	self assertCollection: (self m1 allProvidersAtScope: FamixTest3Class) hasSameElements: {self c1 . self pt1}
]

{ #category : #tests }
FamixTest3Test >> testAtScope [
	self assertCollection: (self m1 atScope: FamixTClass) hasSameElements: {self c1}.
	self assertCollection: (self m1 atScope: FamixTest3Class) hasSameElements: {self c1}
]

{ #category : #tests }
FamixTest3Test >> testAtScopeOnQueryResult [
	| mooseQueryResult |
	mooseQueryResult := MooseObjectQueryResult on: self c1 withAll: {self m1 . self m2 . self pt1 . self pt2}.

	self assertCollection: (mooseQueryResult atScope: FamixTClass) hasSameElements: {self c1 . self c2}.
	self assertCollection: (mooseQueryResult atScope: FamixTest3Class) hasSameElements: {self c1 . self c2}
]

{ #category : #tests }
FamixTest3Test >> testAtScopeWithNonMatchingEntitiesDo [
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTClass.
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTest3Class
]

{ #category : #tests }
FamixTest3Test >> testChildrenTypes [
	self assertCollection: self c1 childrenTypes hasSameElements: {FamixTAttribute . FamixTMethod. FamixTest3Method}
]

{ #category : #tests }
FamixTest3Test >> testIncomingReferences [
	self assertCollection: self pt1 incomingReferences hasSameElements: {self ref1}
]

{ #category : #tests }
FamixTest3Test >> testParentTypes [
	self assertCollection: self m1 parentTypes hasSameElements: {FamixTWithMethods . FamixTest3Class}
]

{ #category : #tests }
FamixTest3Test >> testQueryIncomingDependencies [
	self assertCollection: self pt1 queryIncomingDependencies hasSameElements: {self ref1}
]
