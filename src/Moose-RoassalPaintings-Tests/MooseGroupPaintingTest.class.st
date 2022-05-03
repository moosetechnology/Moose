Class {
	#name : #MooseGroupPaintingTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #'Moose-RoassalPaintings-Tests'
}

{ #category : #running }
MooseGroupPaintingTest >> tearDown [
	window ifNotNil: [ window close ].
	super tearDown
]

{ #category : #tests }
MooseGroupPaintingTest >> testBasic [
	| nameCloud |
	nameCloud := MooseGroup new nameCloud.
	self assertEmpty: nameCloud keywordsInGroupEntitiesNames.
	window := nameCloud open.
	self assert: window isNotNil
]

{ #category : #tests }
MooseGroupPaintingTest >> testBasic02 [

	| m nameCloud |
	m := MooseGroup new.
	m add: (FamixStClass new name: 'Hello').
	m add: (FamixStClass new name: 'World').
	nameCloud := m nameCloud.
	self assert: nameCloud keywordsInGroupEntitiesNames size equals: 1.
	window := nameCloud open.
	self assert: window isNotNil
]

{ #category : #tests }
MooseGroupPaintingTest >> testSymbolsUsedInName [
	| group class1 class2 keywoardsAndEntities |
	group := MooseGroup new.
	class1 := FamixStClass named: 'ClassWithSimpleName'.
	class2 := FamixStClass named: 'Class_With_Complex_Name'.
	group add: class1.
	group add: class2.
	group add: (FamixStClass named: 'short-name-method').
	group add: (FamixStClass named: 'spaces in method name').
	
	keywoardsAndEntities := group nameCloud keywordsInGroupEntitiesNames.
	
	self
		assertCollection: (keywoardsAndEntities collect: #key)
		hasSameElements: {'class' . 'simpl' . 'complex' . 'short' . 'method' . 'space'}.
	
	self
		assertCollection:
			(keywoardsAndEntities
				detect: [ :association | association key = 'class' ]) value
		hasSameElements:
			{class1.
			class2}
]
