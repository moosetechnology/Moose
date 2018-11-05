Class {
	#name : #FamixTestComposedMetamodelsWithMooseQuery,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'association',
		'c15',
		'c25'
	],
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> setUp [

	super setUp.
	
	model := MooseModel new.
	model metamodel: FamixTestComposedGenerator metamodel.
	
	association := FamixTestComposedAssociation new.

	c15 := FamixTestComposed1CustomEntity5 new.
	c25 := FamixTestComposed2CustomEntity5 new.

	c15 associations add: association.
	c25 associations add: association.

	model addAll: { association. c15. c25 }.

	
	
]

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> testAllIncomingAssociationTypes [

	self skip.
	self assert: association c15 allIncomingAssociationTypes equals: { FamixTestComposedAssociation }
]

{ #category : #running }
FamixTestComposedMetamodelsWithMooseQuery >> testSimpleAssociation [

	self assert: association c15 equals: c15.
	self assert: association c25 equals: c25.

]
