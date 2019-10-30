Class {
	#name : #FamixTestComposedMetamodelsWithMooseQuery,
	#superclass : #TestCase,
	#instVars : [
		'association',
		'c15',
		'c25',
		'model'
	],
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> setUp [
	super setUp.

	model := FamixTestComposedModel new.

	association := FamixTestComposedAssociation new.

	c15 := FamixTestComposed1CustomEntity5 new.
	c25 := FamixTestComposed2CustomEntity5 new.

	c15 associations add: association.
	c25 associations add: association.

	model addAll: {association . c15 . c25}
]

{ #category : #tests }
FamixTestComposedMetamodelsWithMooseQuery >> testAllIncomingAssociationTypes [
	self assertCollection: c15 allIncomingAssociationTypes hasSameElements: {FamixTestComposedAssociation}.

	self assertEmpty: c25 allIncomingAssociationTypes
]

{ #category : #tests }
FamixTestComposedMetamodelsWithMooseQuery >> testAllOutgoingAssociationTypes [
	self assertEmpty: c15 allOutgoingAssociationTypes.

	self assertCollection: c25 allOutgoingAssociationTypes hasSameElements: {FamixTestComposedAssociation}
]

{ #category : #tests }
FamixTestComposedMetamodelsWithMooseQuery >> testQueries [
	self assertCollection: (c15 queryAll: #in) hasSameElements: {association}.
	self assertEmpty: (c25 queryAll: #in).

	self assertEmpty: (c15 queryAll: #out).
	self assertCollection: (c25 queryAll: #out) hasSameElements: {association}.

	self assertCollection: (c15 queryAll: #in) opposites hasSameElements: {c25}.
	self assertCollection: (c25 queryAll: #out) opposites hasSameElements: {c15}
]

{ #category : #tests }
FamixTestComposedMetamodelsWithMooseQuery >> testSimpleAssociation [
	self assert: association c15 equals: c15.
	self assert: association c25 equals: c25
]
