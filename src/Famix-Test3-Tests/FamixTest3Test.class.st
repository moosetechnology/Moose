Class {
	#name : #FamixTest3Test,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'm1',
		'm2',
		'pt1',
		'pt2',
		'ref1',
		'ref2',
		'inv1'
	],
	#category : #'Famix-Test3-Tests'
}

{ #category : #running }
FamixTest3Test >> checkAtScopeWithNonMatchingEntitiesDoWith: aBehavior [

	| mooseQueryResult nonMatching |
	mooseQueryResult := MooseOutgoingQueryResult on: c1 withAll: { ref1. inv1 }.

	nonMatching := Set new.
	self assertCollection: (
		mooseQueryResult 
			atScope: aBehavior 
			withNonMatchingEntitiesDo: [ :entities :matchingAtTheScope | 
				nonMatching addAll: entities asCollection ]) hasSameElements: { c1. }.
	self assertCollection: nonMatching hasSameElements: { pt1 }.

]

{ #category : #running }
FamixTest3Test >> setUp [

	super setUp.

	model := FamixTest3MooseModel new.
	model metamodel: FamixTest3Class metamodel.
	c1 := FamixTest3Class named: 'Class1'.
	c2 := FamixTest3Class named: 'Class2'.
	
	m1 := FamixTest3Method named: 'm1'. 
	m2 := FamixTest3Method named: 'm2'. 

	pt1 := FamixTest3PrimitiveType named: 'int'. 
	pt2 := FamixTest3PrimitiveType named: 'float'. 
	
	ref1 := FamixTest3Reference new.
	ref2 := FamixTest3Reference new.
	inv1 := FamixTest3Invocation new.
	
	model addAll: { c1. c2. m1. m2. pt1. pt2 }.
	
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
]

{ #category : #running }
FamixTest3Test >> testAllClients [
	self assertCollection: pt1 allClients hasSameElements: {m1}
]

{ #category : #running }
FamixTest3Test >> testAllClientsAtScope [
	self assertCollection: (pt1 allClientsAtScope: FamixTClass) hasSameElements: {c1}.
	self assertCollection: (pt1 allClientsAtScope: FamixTest3Class) hasSameElements: {c1}
]

{ #category : #running }
FamixTest3Test >> testAllProviders [
	self assertCollection: m1 allProviders hasSameElements: {c1 . pt1}
]

{ #category : #running }
FamixTest3Test >> testAllProvidersAtScope [
	self assertCollection: (m1 allProvidersAtScope: FamixTClass) hasSameElements: {c1 . pt1}.
	self assertCollection: (m1 allProvidersAtScope: FamixTest3Class) hasSameElements: {c1 . pt1}
]

{ #category : #running }
FamixTest3Test >> testAtScope [
	self assertCollection: (m1 atScope: FamixTClass) hasSameElements: {c1}.
	self assertCollection: (m1 atScope: FamixTest3Class) hasSameElements: {c1}
]

{ #category : #running }
FamixTest3Test >> testAtScopeOnQueryResult [
	| mooseQueryResult |
	mooseQueryResult := MooseObjectQueryResult on: c1 withAll: {m1 . m2 . pt1 . pt2}.

	self assertCollection: (mooseQueryResult atScope: FamixTClass) hasSameElements: {c1 . c2}.
	self assertCollection: (mooseQueryResult atScope: FamixTest3Class) hasSameElements: {c1 . c2}
]

{ #category : #running }
FamixTest3Test >> testAtScopeWithNonMatchingEntitiesDo [
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTClass.
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTest3Class
]

{ #category : #running }
FamixTest3Test >> testIncomingReferences [
	self assertCollection: pt1 incomingReferences hasSameElements: {ref1}
]

{ #category : #running }
FamixTest3Test >> testQueryIncomingDependencies [
	self assertCollection: pt1 queryIncomingDependencies hasSameElements: {ref1}
]
