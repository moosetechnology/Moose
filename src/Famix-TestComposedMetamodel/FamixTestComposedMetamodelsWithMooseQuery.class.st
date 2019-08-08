Class {
	#name : #FamixTestComposedMetamodelsWithMooseQuery,
	#superclass : #TestCase,
	#instVars : [
		'model1',
		'metamodel1',
		'model2',
		'metamodel2',
		'association',
		'c15',
		'c25'
	],
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> setUp [

	super setUp.
	
	model1 := MooseModel new.
	metamodel1 := FamixTestComposedGenerator metamodel.
	model1 metamodel: metamodel1.
	
	association := FamixTestComposedAssociation new.

	c15 := FamixTestComposed1CustomEntity5 new.
	c25 := FamixTestComposed2CustomEntity5 new.

	c15 associations add: association.
	c25 associations add: association.

	model1 addAll: { association. c15. c25 }.

	metamodel2 := FamixTestComposedSubmetamodel1Generator metamodel.
	
	
]

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> testAllIncomingAssociationTypes [
	self assertCollection: c15 allIncomingAssociationTypes hasSameElements: {FamixTestComposedAssociation}.

	self assert: c25 allIncomingAssociationTypes isEmpty
]

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> testAllOutgoingAssociationTypes [
	self assert: c15 allOutgoingAssociationTypes isEmpty.

	self assertCollection: c25 allOutgoingAssociationTypes hasSameElements: {FamixTestComposedAssociation}
]

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> testQueries [

	self assertCollection: (c15 queryAll: #in) hasSameElements: { association }.
	self assert: (c25 queryAll: #in) isEmpty.
	
	self assert: (c15 queryAll: #out) isEmpty.
	self assertCollection: (c25 queryAll: #out) hasSameElements: { association }.

	self assertCollection: (c15 queryAll: #in) opposites hasSameElements: { c25 }.
	self assertCollection: (c25 queryAll: #out) opposites hasSameElements: { c15 }.

]

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> testSimpleAssociation [

	self assert: association c15 equals: c15.
	self assert: association c25 equals: c25.

]
