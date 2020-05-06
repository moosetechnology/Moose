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
	dm := DistributionMap new.
	self shouldnt: [ window := dm open ] raise: Error 
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderingFromExample [

	self shouldnt: 
		[ window :=  
			(DistributionMap 
				onContainers: DistributionMap  withAllSubclasses  
				elements: #methods 
				properties: #isAbstract) open ] raise: Error 
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderingFromExample3ShowingContainer [

	self shouldnt: 
		[ window := (DistributionMap 
							onContainers: Collection withAllSubclasses  
							elements: #allInstVarNames 
							properties: [:element | element size > 5])
							title: 'Collection subclasses and their instance variables';
							 open ] raise: Error 
]

{ #category : #tests }
MooseModelDistributionMapRenderingTest >> testRenderingFromExampleOpening [

	self shouldnt: 
		[ window := (DistributionMap 
							onContainers: DistributionMap  withAllSubclasses  
							elements: #methods 
							properties: #isAbstract) open ] raise: Error.
	
]
