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
	self assert: tower model isEmpty.
	self assert: tower metamodel isEmpty.
	self deny: tower metaMetamodel isEmpty
]

{ #category : #running }
FMTowerTest >> testIsMetaMetamodel [
	self deny: tower model isMetaMetamodel.
	self deny: tower metamodel isMetaMetamodel.
	self assert: tower metaMetamodel isMetamodel
]

{ #category : #running }
FMTowerTest >> testIsMetamodel [
	self deny: tower model isMetamodel.
	self assert: tower metamodel isMetamodel.
	self assert: tower metaMetamodel isMetamodel
]
