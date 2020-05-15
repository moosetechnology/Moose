Class {
	#name : #FamixTest3MooseQueryTest,
	#superclass : #FamixTest3SimpleModelTest,
	#category : #'Famix-Test3-Tests'
}

{ #category : #running }
FamixTest3MooseQueryTest >> checkAtScopeWithNonMatchingEntitiesDoWith: aBehavior [
	| mooseQueryResult nonMatching |
	mooseQueryResult := MooseOutgoingQueryResult on: self c1 withAll: {self ref1 . self inv1}.

	nonMatching := Set new.
	self
		assertCollection: (mooseQueryResult atScope: aBehavior withNonMatchingEntitiesDo: [ :entities :matchingAtTheScope | nonMatching addAll: entities asCollection ])
		hasSameElements: {self c1}.
	self assertCollection: nonMatching hasSameElements: {self pt1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAllClients [
	self assertCollection: self pt1 allClients hasSameElements: {self m1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAllClientsAtScope [
	self assertCollection: (self pt1 allClientsAtScope: FamixTClass) hasSameElements: {self c1}.
	self assertCollection: (self pt1 allClientsAtScope: FamixTest3Class) hasSameElements: {self c1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAllProviders [
	self assertCollection: self m1 allProviders hasSameElements: {self c1 . self pt1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAllProvidersAtScope [
	self assertCollection: (self m1 allProvidersAtScope: FamixTClass) hasSameElements: {self c1 . self pt1}.
	self assertCollection: (self m1 allProvidersAtScope: FamixTest3Class) hasSameElements: {self c1 . self pt1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAtScope [
	self assertCollection: (self m1 atScope: FamixTClass) hasSameElements: {self c1}.
	self assertCollection: (self m1 atScope: FamixTest3Class) hasSameElements: {self c1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAtScopeOnQueryResult [
	| mooseQueryResult |
	mooseQueryResult := MooseObjectQueryResult on: self c1 withAll: {self m1 . self m2 . self pt1 . self pt2}.

	self assertCollection: (mooseQueryResult atScope: FamixTClass) hasSameElements: {self c1 . self c2}.
	self assertCollection: (mooseQueryResult atScope: FamixTest3Class) hasSameElements: {self c1 . self c2}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testAtScopeWithNonMatchingEntitiesDo [
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTClass.
	self checkAtScopeWithNonMatchingEntitiesDoWith: FamixTest3Class
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testChildrenTypes [
	self assertCollection: self c1 childrenTypes hasSameElements: {FamixTAttribute . FamixTMethod . FamixTest3Attribute . FamixTest3Method}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testIncomingReferences [
	self assertCollection: self pt1 incomingReferences hasSameElements: {self ref1}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testParentTypes [
	self assertCollection: self m1 parentTypes hasSameElements: {FamixTWithMethods . FamixTest3Class}
]

{ #category : #tests }
FamixTest3MooseQueryTest >> testQueryIncomingDependencies [
	self assertCollection: self pt1 queryIncomingDependencies hasSameElements: {self ref1}
]
