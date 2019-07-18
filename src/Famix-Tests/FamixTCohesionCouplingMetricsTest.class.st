Class {
	#name : #FamixTCohesionCouplingMetricsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTCohesionCouplingMetricsTest',
	#classTraits : 'TFamixTCohesionCouplingMetricsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTCohesionCouplingMetricsTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTCohesionCouplingMetrics).
self entity class initializeSlots: self entity.
]
