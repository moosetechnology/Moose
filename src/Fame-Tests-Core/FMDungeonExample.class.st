Class {
	#name : #FMDungeonExample,
	#superclass : #TestCase,
	#instVars : [
		't'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #'as yet unclassified' }
FMDungeonExample class >> dungeonScript [

	^ [ :m | m package: 'RPG' with: [
			m class: 'Dragon' with: [
				m property: 'hoard' withMany: 'RPG.Treasure' opposite: 'keeper'.
				m property: 'killedBy' withMany: 'RPG.Hero' opposite: 'kills' ].
			m class: 'Treasure' with: [
				m property: 'keeper' with: 'RPG.Dragon' opposite: 'hoard'.
				m property: 'owner' with: 'RPG.Hero' opposite: 'talisman' ].
			m class: 'Hero' with: [
				m property: 'twin' with: 'RPG.Hero' opposite: 'twin'.
				m property: 'talisman' with: 'RPG.Treasure' opposite: 'owner'.
				m property: 'kills' withMany: 'RPG.Dragon' opposite: 'killedBy' ]]].
]

{ #category : #'as yet unclassified' }
FMDungeonExample class >> metamodelString [

	| m |
	m := FMMetamodelBuilder new.
	m client: FMMSEPrinter new onString.
	m document: self dungeonScript.
	^m client stream contents.
		
]

{ #category : #running }
FMDungeonExample >> setUp [

	super setUp.
	t := FMTower new.
	t metamodel addSmalltalkClasses: (Array
		with: RPGDragon
		with: RPGTreasure
		with: RPGHero)
]

{ #category : #running }
FMDungeonExample >> testDragonHoard [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	a hoard isCollection should beTrue.
	a hoard isEmpty should beTrue.
	b hoard isCollection should beTrue.
	b hoard isEmpty should beTrue.
	x keeper isCollection should beFalse.
	x keeper isNil should beTrue.
	y keeper isCollection should beFalse.
	y keeper isNil should beTrue.
	a hoard add: x.
	x keeper should = a.
	a hoard size should = 1.
	a hoard should include: x.
	a hoard add: y.
	y keeper should = a.
	a hoard size should = 2.
	a hoard should include: y.
	a hoard add: y.
	y keeper should = a.
	a hoard size should = 2.
	b hoard add: y.
	y keeper should = b.
	b hoard size should = 1.
	b hoard should include: y.
	a hoard size should = 1.
	a hoard should not include: y.
	b hoard remove: y.
	y keeper isNil should beTrue.
	b hoard size should = 0.
	b hoard should not include: y
]

{ #category : #running }
FMDungeonExample >> testDragonKilledBy [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	y := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	a killedBy isCollection should beTrue.
	a killedBy isEmpty should beTrue.
	b killedBy isCollection should beTrue.
	b killedBy isEmpty should beTrue.
	x kills isCollection should beTrue.
	x kills isEmpty should beTrue.
	y kills isCollection should beTrue.
	y kills isEmpty should beTrue.
	a killedBy add: x.
	a killedBy should include: x.
	a killedBy size should = 1.
	b killedBy size should = 0.
	x kills size should = 1.
	y kills size should = 0.
	a killedBy add: y.
	a killedBy should include: y.
	a killedBy size should = 2.
	b killedBy size should = 0.
	x kills size should = 1.
	y kills size should = 1.
	b killedBy add: x.
	b killedBy should include: x.
	a killedBy size should = 2.
	b killedBy size should = 1.
	x kills size should = 2.
	y kills size should = 1.
	b killedBy add: y.
	b killedBy should include: y.
	a killedBy size should = 2.
	b killedBy size should = 2.
	x kills size should = 2.
	y kills size should = 2.
	b killedBy add: y.	"repeated adding should not change anything"
	a killedBy size should = 2.
	b killedBy size should = 2.
	x kills size should = 2.
	y kills size should = 2.
	b killedBy remove: y.
	b killedBy should not include: y.
	a killedBy size should = 2.
	b killedBy size should = 1.
	x kills size should = 2.
	y kills size should = 1.
	a killedBy remove: y.
	a killedBy should not include: y.
	a killedBy size should = 1.
	b killedBy size should = 1.
	x kills size should = 2.
	y kills size should = 0
]

{ #category : #running }
FMDungeonExample >> testHeroKills [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	y := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	a killedBy isCollection should beTrue.
	a killedBy isEmpty should beTrue.
	b killedBy isCollection should beTrue.
	b killedBy isEmpty should beTrue.
	x kills isCollection should beTrue.
	x kills isEmpty should beTrue.
	y kills isCollection should beTrue.
	y kills isEmpty should beTrue.
	x kills add: a.
	a killedBy should include: x.
	a killedBy size should = 1.
	b killedBy size should = 0.
	x kills size should = 1.
	y kills size should = 0.
	y kills add: a.
	a killedBy should include: y.
	a killedBy size should = 2.
	b killedBy size should = 0.
	x kills size should = 1.
	y kills size should = 1.
	x kills add: b.
	b killedBy should include: x.
	a killedBy size should = 2.
	b killedBy size should = 1.
	x kills size should = 2.
	y kills size should = 1.
	y kills add: b.
	b killedBy should include: y.
	a killedBy size should = 2.
	b killedBy size should = 2.
	x kills size should = 2.
	y kills size should = 2.
	y kills add: b.	"repeated adding should not change anything"
	a killedBy size should = 2.
	b killedBy size should = 2.
	x kills size should = 2.
	y kills size should = 2.
	y kills remove: b.
	b killedBy should not include: y.
	a killedBy size should = 2.
	b killedBy size should = 1.
	x kills size should = 2.
	y kills size should = 1.
	y kills remove: a.
	a killedBy should not include: y.
	a killedBy size should = 1.
	b killedBy size should = 1.
	x kills size should = 2.
	y kills size should = 0
]

{ #category : #running }
FMDungeonExample >> testHeroTalisman [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	b := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	a talisman isCollection should beFalse.
	a talisman isNil should beTrue.
	b talisman isCollection should beFalse.
	b talisman isNil should beTrue.
	x owner isCollection should beFalse.
	x owner isNil should beTrue.
	y owner isCollection should beFalse.
	y owner isNil should beTrue.
	a talisman: x.
	a talisman should = x.
	b talisman isNil should beTrue.
	x owner should = a.
	y owner isNil should beTrue.
	a talisman: y.
	a talisman should = y.
	b talisman isNil should beTrue.
	x owner isNil should beTrue.
	y owner should = a.
	b talisman: y.
	a talisman isNil should beTrue.
	b talisman should = y.
	x owner isNil should beTrue.
	y owner should = b.
	b talisman: nil.
	a talisman isNil should beTrue.
	b talisman isNil should beTrue.
	x owner isNil should beTrue.
	y owner isNil should beTrue
]

{ #category : #running }
FMDungeonExample >> testHeroTwin [
	| a b c |
	a := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	b := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	c := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	a twin isCollection should beFalse.
	a twin isNil should beTrue.
	b twin isCollection should beFalse.
	b twin isNil should beTrue.
	c twin isCollection should beFalse.
	c twin isNil should beTrue.
	a twin: b.
	a twin should = b.
	b twin should = a.
	c twin isNil should beTrue.
	a twin: c.
	a twin should = c.
	b twin isNil should beTrue.
	c twin should = a.
	b twin: c.
	a twin isNil should beTrue.
	b twin should = c.
	c twin should = b.
	b twin: nil.
	a twin isNil should beTrue.
	b twin isNil should beTrue.
	c twin isNil should beTrue
]

{ #category : #running }
FMDungeonExample >> testTreasureKeeper [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	a hoard isCollection should beTrue.
	a hoard isEmpty should beTrue.
	b hoard isCollection should beTrue.
	b hoard isEmpty should beTrue.
	x keeper isCollection should beFalse.
	x keeper isNil should beTrue.
	y keeper isCollection should beFalse.
	y keeper isNil should beTrue.
	x keeper: a.
	x keeper should = a.
	a hoard size should = 1.
	a hoard should include: x.
	y keeper: a.
	y keeper should = a.
	a hoard size should = 2.
	a hoard should include: y.
	y keeper: a.
	y keeper should = a.
	a hoard size should = 2.
	y keeper: b.
	y keeper should = b.
	b hoard size should = 1.
	b hoard should include: y.
	a hoard size should = 1.
	a hoard should not include: y.
	y keeper: nil.
	y keeper isNil should beTrue.
	b hoard size should = 0.
	b hoard should not include: y
]

{ #category : #running }
FMDungeonExample >> testTreasureOwner [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	b := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	a talisman isCollection should beFalse.
	a talisman isNil should beTrue.
	b talisman isCollection should beFalse.
	b talisman isNil should beTrue.
	x owner isCollection should beFalse.
	x owner isNil should beTrue.
	y owner isCollection should beFalse.
	y owner isNil should beTrue.
	x owner: a.
	a talisman should = x.
	b talisman isNil should beTrue.
	x owner should = a.
	y owner isNil should beTrue.
	y owner: a.
	a talisman should = y.
	b talisman isNil should beTrue.
	x owner isNil should beTrue.
	y owner should = a.
	y owner: b.
	a talisman isNil should beTrue.
	b talisman should = y.
	x owner isNil should beTrue.
	y owner should = b.
	y owner: nil.
	a talisman isNil should beTrue.
	b talisman isNil should beTrue.
	x owner isNil should beTrue.
	y owner isNil should beTrue
]
