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
	self assert: a hoard isCollection.
	self assertEmpty: a hoard.
	self assert: b hoard isCollection.
	self assertEmpty: b hoard.
	self deny: x keeper isCollection.
	self assert: x keeper isNil.
	self deny: y keeper isCollection.
	self assert: y keeper isNil.
	a hoard add: x.
	self assert: x keeper equals: a.
	self assert: a hoard size equals: 1.
	self assert: (a hoard includes: x).
	a hoard add: y.
	self assert: y keeper equals: a.
	self assert: a hoard size equals: 2.
	self assert: (a hoard includes: y).
	a hoard add: y.
	self assert: y keeper equals: a.
	self assert: a hoard size equals: 2.
	b hoard add: y.
	self assert: y keeper equals: b.
	self assert: b hoard size equals: 1.
	self assert: (b hoard includes: y).
	self assert: a hoard size equals: 1.
	self deny: (a hoard includes: y).
	b hoard remove: y.
	self assert: y keeper isNil.
	self assertEmpty: b hoard.
	self deny: (b hoard includes: y)
]

{ #category : #running }
FMDungeonExample >> testDragonKilledBy [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	y := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	self assert: a killedBy isCollection.
	self assertEmpty: a killedBy.
	self assert: b killedBy isCollection.
	self assertEmpty: b killedBy.
	self assert: x kills isCollection.
	self assertEmpty: x kills.
	self assert: y kills isCollection.
	self assertEmpty: y kills.
	a killedBy add: x.
	self assert: (a killedBy includes: x).
	self assert: a killedBy size equals: 1.
	self assert: b killedBy size equals: 0.
	self assert: x kills size equals: 1.
	self assert: y kills size equals: 0.
	a killedBy add: y.
	self assert: (a killedBy includes: y).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 0.
	self assert: x kills size equals: 1.
	self assert: y kills size equals: 1.
	b killedBy add: x.
	self assert: (b killedBy includes: x).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 1.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 1.
	b killedBy add: y.
	self assert: (b killedBy includes: y).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 2.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 2.
	b killedBy add: y.	"repeated adding should not change anything"
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 2.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 2.
	b killedBy remove: y.
	self deny: (b killedBy includes: y).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 1.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 1.
	a killedBy remove: y.
	self deny: (a killedBy includes: y).
	self assert: a killedBy size equals: 1.
	self assert: b killedBy size equals: 1.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 0
]

{ #category : #running }
FMDungeonExample >> testHeroKills [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	y := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	self assert: a killedBy isCollection.
	self assertEmpty: a killedBy.
	self assert: b killedBy isCollection.
	self assertEmpty: b killedBy.
	self assert: x kills isCollection.
	self assertEmpty: x kills.
	self assert: y kills isCollection.
	self assertEmpty: y kills.
	x kills add: a.
	self assert: (a killedBy includes: x).
	self assert: a killedBy size equals: 1.
	self assert: b killedBy size equals: 0.
	self assert: x kills size equals: 1.
	self assert: y kills size equals: 0.
	y kills add: a.
	self assert: (a killedBy includes: y).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 0.
	self assert: x kills size equals: 1.
	self assert: y kills size equals: 1.
	x kills add: b.
	self assert: (b killedBy includes: x).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 1.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 1.
	y kills add: b.
	self assert: (b killedBy includes: y).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 2.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 2.
	y kills add: b.	"repeated adding should not change anything"
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 2.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 2.
	y kills remove: b.
	self deny: (b killedBy includes: y).
	self assert: a killedBy size equals: 2.
	self assert: b killedBy size equals: 1.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 1.
	y kills remove: a.
	self deny: (a killedBy includes: y).
	self assert: a killedBy size equals: 1.
	self assert: b killedBy size equals: 1.
	self assert: x kills size equals: 2.
	self assert: y kills size equals: 0
]

{ #category : #running }
FMDungeonExample >> testHeroTalisman [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	b := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	self deny: a talisman isCollection.
	self assert: a talisman isNil.
	self deny: b talisman isCollection.
	self assert: b talisman isNil.
	self deny: x owner isCollection.
	self assert: x owner isNil.
	self deny: y owner isCollection.
	self assert: y owner isNil.
	a talisman: x.
	self assert: a talisman equals: x.
	self assert: b talisman isNil.
	self assert: x owner equals: a.
	self assert: y owner isNil.
	a talisman: y.
	self assert: a talisman equals: y.
	self assert: b talisman isNil.
	self assert: x owner isNil.
	self assert: y owner equals: a.
	b talisman: y.
	self assert: a talisman isNil.
	self assert: b talisman equals: y.
	self assert: x owner isNil.
	self assert: y owner equals: b.
	b talisman: nil.
	self assert: a talisman isNil.
	self assert: b talisman isNil.
	self assert: x owner isNil.
	self assert: y owner isNil
]

{ #category : #running }
FMDungeonExample >> testHeroTwin [
	| a b c |
	a := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	b := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	c := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	self deny: a twin isCollection.
	self assert: a twin isNil.
	self deny: b twin isCollection.
	self assert: b twin isNil.
	self deny: c twin isCollection.
	self assert: c twin isNil.
	a twin: b.
	self assert: a twin equals: b.
	self assert: b twin equals: a.
	self assert: c twin isNil.
	a twin: c.
	self assert: a twin equals: c.
	self assert: b twin isNil.
	self assert: c twin equals: a.
	b twin: c.
	self assert: a twin isNil.
	self assert: b twin equals: c.
	self assert: c twin equals: b.
	b twin: nil.
	self assert: a twin isNil.
	self assert: b twin isNil.
	self assert: c twin isNil
]

{ #category : #running }
FMDungeonExample >> testTreasureKeeper [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	b := (t metamodel elementNamed: 'RPG.Dragon') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	self assert: a hoard isCollection.
	self assertEmpty: a hoard.
	self assert: b hoard isCollection.
	self assertEmpty: b hoard.
	self deny: x keeper isCollection.
	self assert: x keeper isNil.
	self deny: y keeper isCollection.
	self assert: y keeper isNil.
	x keeper: a.
	self assert: x keeper equals: a.
	self assert: a hoard size equals: 1.
	self assert: (a hoard includes: x).
	y keeper: a.
	self assert: y keeper equals: a.
	self assert: a hoard size equals: 2.
	self assert: (a hoard includes: y).
	y keeper: a.
	self assert: y keeper equals: a.
	self assert: a hoard size equals: 2.
	y keeper: b.
	self assert: y keeper equals: b.
	self assert: b hoard size equals: 1.
	self assert: (b hoard includes: y).
	self assert: a hoard size equals: 1.
	self deny: (a hoard includes: y).
	y keeper: nil.
	self assert: y keeper isNil.
	self assert: b hoard size equals: 0.
	self deny: (b hoard includes: y)
]

{ #category : #running }
FMDungeonExample >> testTreasureOwner [
	| a b x y |
	a := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	b := (t metamodel elementNamed: 'RPG.Hero') createInstance.
	x := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	y := (t metamodel elementNamed: 'RPG.Treasure') createInstance.
	self deny: a talisman isCollection.
	self assert: a talisman isNil.
	self deny: b talisman isCollection.
	self assert: b talisman isNil.
	self deny: x owner isCollection.
	self assert: x owner isNil.
	self deny: y owner isCollection.
	self assert: y owner isNil.
	x owner: a.
	self assert: a talisman equals: x.
	self assert: b talisman isNil.
	self assert: x owner equals: a.
	self assert: y owner isNil.
	y owner: a.
	self assert: a talisman equals: y.
	self assert: b talisman isNil.
	self assert: x owner isNil.
	self assert: y owner equals: a.
	y owner: b.
	self assert: a talisman isNil.
	self assert: b talisman equals: y.
	self assert: x owner isNil.
	self assert: y owner equals: b.
	y owner: nil.
	self assert: a talisman isNil.
	self assert: b talisman isNil.
	self assert: x owner isNil.
	self assert: y owner isNil
]
