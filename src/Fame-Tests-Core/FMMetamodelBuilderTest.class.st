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
	metamodel classes size should = 3.
	(metamodel elementNamed: 'RPG.Dragon') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Dragon') isFM3Class should beTrue.
	(metamodel elementNamed: 'RPG.Treasure') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Treasure') isFM3Class should beTrue.
	(metamodel elementNamed: 'RPG.Hero') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Hero') isFM3Class should beTrue
]

{ #category : #running }
FMMetamodelBuilderTest >> testDragonHoardsTreasures [
	| a b |
	a := metamodel elementNamed: 'RPG.Dragon.hoard'.
	b := metamodel elementNamed: 'RPG.Treasure.keeper'.
	a opposite should = b.
	b opposite should = a.
	a type should = b mmClass.
	b type should = a mmClass.
	a isMultivalued should beTrue.
	b isMultivalued should beFalse
]

{ #category : #running }
FMMetamodelBuilderTest >> testDragonsKilledByHeros [
	| a b |
	a := metamodel elementNamed: 'RPG.Dragon.killedBy'.
	b := metamodel elementNamed: 'RPG.Hero.kills'.
	a opposite should = b.
	b opposite should = a.
	a type should = b mmClass.
	b type should = a mmClass.
	a isMultivalued should beTrue.
	b isMultivalued should beTrue
]

{ #category : #running }
FMMetamodelBuilderTest >> testHeroHasTwinHero [
	| a |
	a := metamodel elementNamed: 'RPG.Hero.twin'.
	a opposite should = a.
	a type should = a mmClass.
	a isMultivalued should beFalse
]

{ #category : #running }
FMMetamodelBuilderTest >> testHeroOwnsTalisman [
	| a b |
	a := metamodel elementNamed: 'RPG.Treasure.owner'.
	b := metamodel elementNamed: 'RPG.Hero.talisman'.
	a opposite should = b.
	b opposite should = a.
	a type should = b mmClass.
	b type should = a mmClass.
	a isMultivalued should beFalse.
	b isMultivalued should beFalse
]

{ #category : #running }
FMMetamodelBuilderTest >> testPackages [
	metamodel packages size should = 1.
	metamodel packages anyOne name isSymbol should beTrue.
	metamodel packages anyOne name should = #RPG
]

{ #category : #running }
FMMetamodelBuilderTest >> testProperties [
	metamodel properties size should = 7.
	(metamodel elementNamed: 'RPG.Dragon.hoard') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Dragon.hoard') isFM3Property should beTrue.
	(metamodel elementNamed: 'RPG.Dragon.killedBy') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Dragon.killedBy') isFM3Property should beTrue.
	(metamodel elementNamed: 'RPG.Treasure.keeper') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Treasure.keeper') isFM3Property should beTrue.
	(metamodel elementNamed: 'RPG.Treasure.owner') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Treasure.owner') isFM3Property should beTrue.
	(metamodel elementNamed: 'RPG.Hero.twin') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Hero.twin') isFM3Property should beTrue.
	(metamodel elementNamed: 'RPG.Hero.kills') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Hero.kills') isFM3Property should beTrue.
	(metamodel elementNamed: 'RPG.Hero.talisman') notNil should beTrue.
	(metamodel elementNamed: 'RPG.Hero.talisman') isFM3Property should beTrue
]
