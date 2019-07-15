Class {
	#name : #FMTowerTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMTowerTest >> setUp [

	super setUp.
	tower := FMTower new
]

{ #category : #running }
FMTowerTest >> testIsEmpty [
	tower model isEmpty should beTrue.
	tower metamodel isEmpty should beTrue.
	tower metaMetamodel isEmpty should beFalse
]

{ #category : #running }
FMTowerTest >> testIsMetaMetamodel [
	tower model isMetaMetamodel should beFalse.
	tower metamodel isMetaMetamodel should beFalse.
	tower metaMetamodel isMetamodel should beTrue
]

{ #category : #running }
FMTowerTest >> testIsMetamodel [
	tower model isMetamodel should beFalse.
	tower metamodel isMetamodel should beTrue.
	tower metaMetamodel isMetamodel should beTrue
]
