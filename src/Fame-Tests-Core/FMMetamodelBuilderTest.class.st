Class {
	#name : #FMMetamodelBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'metamodel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMMetamodelBuilderTest >> setUp [

	| t |
	super setUp.
	t := FMTower new.
	t metamodel document: FMDungeonExample dungeonScript. 
	metamodel := t metamodel.
]

{ #category : #running }
FMMetamodelBuilderTest >> testClasses [
	self assert: metamodel classes size equals: 3.
	self assert: (metamodel elementNamed: 'RPG.Dragon') notNil.
	self assert: (metamodel elementNamed: 'RPG.Dragon') isFM3Class.
	self assert: (metamodel elementNamed: 'RPG.Treasure') notNil.
	self assert: (metamodel elementNamed: 'RPG.Treasure') isFM3Class.
	self assert: (metamodel elementNamed: 'RPG.Hero') notNil.
	self assert: (metamodel elementNamed: 'RPG.Hero') isFM3Class
]

{ #category : #running }
FMMetamodelBuilderTest >> testDragonHoardsTreasures [
	| a b |
	a := metamodel elementNamed: 'RPG.Dragon.hoard'.
	b := metamodel elementNamed: 'RPG.Treasure.keeper'.
	self assert: a opposite equals: b.
	self assert: b opposite equals: a.
	self assert: a type equals: b mmClass.
	self assert: b type equals: a mmClass.
	self assert: a isMultivalued.
	self deny: b isMultivalued
]

{ #category : #running }
FMMetamodelBuilderTest >> testDragonsKilledByHeros [
	| a b |
	a := metamodel elementNamed: 'RPG.Dragon.killedBy'.
	b := metamodel elementNamed: 'RPG.Hero.kills'.
	self assert: a opposite equals: b.
	self assert: b opposite equals: a.
	self assert: a type equals: b mmClass.
	self assert: b type equals: a mmClass.
	self assert: a isMultivalued.
	self assert: b isMultivalued
]

{ #category : #running }
FMMetamodelBuilderTest >> testHeroHasTwinHero [
	| a |
	a := metamodel elementNamed: 'RPG.Hero.twin'.
	self assert: a opposite equals: a.
	self assert: a type equals: a mmClass.
	self deny: a isMultivalued
]

{ #category : #running }
FMMetamodelBuilderTest >> testHeroOwnsTalisman [
	| a b |
	a := metamodel elementNamed: 'RPG.Treasure.owner'.
	b := metamodel elementNamed: 'RPG.Hero.talisman'.
	self assert: a opposite equals: b.
	self assert: b opposite equals: a.
	self assert: a type equals: b mmClass.
	self assert: b type equals: a mmClass.
	self deny: a isMultivalued.
	self deny: b isMultivalued
]

{ #category : #running }
FMMetamodelBuilderTest >> testPackages [
	self assert: metamodel packages size equals: 1.
	self assert: metamodel packages anyOne name isSymbol.
	self assert: metamodel packages anyOne name equals: #RPG
]

{ #category : #running }
FMMetamodelBuilderTest >> testProperties [
	self assert: metamodel properties size equals: 7.
	#(hoard killedBy keeper owner twin kills talisman)
		do: [ :propertyName | 
			| property |
			property := metamodel elementNamed: 'RPG.Dragon.' , propertyName.
			self assert: property isNotNil.
			self assert: property isFM3Property ]
]
