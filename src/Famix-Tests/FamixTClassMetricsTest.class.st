Class {
	#name : #FamixTClassMetricsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassMetricsTest',
	#classTraits : 'TFamixTClassMetricsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassMetricsTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTClassMetrics).
self entity class initializeSlots: self entity.
]
