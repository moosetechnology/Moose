Class {
	#name : #FMMetamodelScripterTest,
	#superclass : #TestCase,
	#instVars : [
		'metamodel'
	],
	#category : #'Fame-Tests'
}

{ #category : #running }
FMMetamodelScripterTest >> setUp [
	super setUp.
	metamodel := FMMetaModel new.
	metamodel document: FMDungeonExample dungeonScript
]

{ #category : #tests }
FMMetamodelScripterTest >> testClasses [
	self assert: metamodel classes size equals: 3.
	self assert: (metamodel elementNamed: 'RPG.Dragon') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Dragon') isFM3Class.
	self assert: (metamodel elementNamed: 'RPG.Treasure') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Treasure') isFM3Class.
	self assert: (metamodel elementNamed: 'RPG.Hero') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Hero') isFM3Class
]

{ #category : #tests }
FMMetamodelScripterTest >> testDragonHoardsTreasures [
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

{ #category : #tests }
FMMetamodelScripterTest >> testDragonsKilledByHeros [
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

{ #category : #tests }
FMMetamodelScripterTest >> testHeroHasTwinHero [
	| a |
	a := metamodel elementNamed: 'RPG.Hero.twin'.
	self assert: a opposite equals: a.
	self assert: a type equals: a mmClass.
	self deny: a isMultivalued
]

{ #category : #tests }
FMMetamodelScripterTest >> testHeroOwnsTalisman [
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

{ #category : #tests }
FMMetamodelScripterTest >> testPackages [
	self assert: metamodel packages size equals: 1.
	self assert: metamodel packages anyOne name isSymbol.
	self assert: metamodel packages anyOne name equals: #RPG
]

{ #category : #tests }
FMMetamodelScripterTest >> testProperties [
	self assert: metamodel properties size equals: 7.
	self assert: (metamodel elementNamed: 'RPG.Dragon.hoard') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Dragon.hoard') isFM3Property.
	self assert: (metamodel elementNamed: 'RPG.Dragon.killedBy') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Dragon.killedBy') isFM3Property.
	self assert: (metamodel elementNamed: 'RPG.Treasure.keeper') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Treasure.keeper') isFM3Property.
	self assert: (metamodel elementNamed: 'RPG.Treasure.owner') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Treasure.owner') isFM3Property.
	self assert: (metamodel elementNamed: 'RPG.Hero.twin') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Hero.twin') isFM3Property.
	self assert: (metamodel elementNamed: 'RPG.Hero.kills') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Hero.kills') isFM3Property.
	self assert: (metamodel elementNamed: 'RPG.Hero.talisman') isNotNil.
	self assert: (metamodel elementNamed: 'RPG.Hero.talisman') isFM3Property
]
