Class {
	#name : #MooseModelDistributionMapRenderingTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #'Moose-DistributionMap-Tests'
}

{ #category : #running }
MooseModelDistributionMapRenderingTest >> tearDown [
	window ifNotNil: [ window delete. window := nil ].
	super tearDown.
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderEmpty [

	| dm |
	dm := MooseDistributionMap new.
	window := dm open
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderingFromExample [

	window := (MooseDistributionMap new
		           containers: DistributionMap withAllSubclasses
		           getElements: #methods
		           property: #isAbstract) open
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderingFromExample3ShowingContainer [

	window := (MooseDistributionMap new
		           containers: Collection withAllSubclasses
		           getElements: #allInstVarNames
		           property: [ :element | element size > 5 ]) open.
	window setLabel: 'Collection subclasses and their instance variables'
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderingFromExampleOpening [

	window := (MooseDistributionMap new
		           containers: DistributionMap withAllSubclasses
		           getElements: #methods
		           property: #isAbstract) open
]
