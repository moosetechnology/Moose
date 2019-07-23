Class {
	#name : #FamixTLCOMMetricsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTLCOMMetricsTest',
	#classTraits : 'TFamixTLCOMMetricsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTLCOMMetricsTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTLCOMMetrics).
self entity class initializeSlots: self entity.
model add: entity. 
]
