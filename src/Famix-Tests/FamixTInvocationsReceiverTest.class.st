Class {
	#name : #FamixTInvocationsReceiverTest,
	#superclass : #TestCase,
	#traits : 'TFamixTInvocationsReceiverTest',
	#classTraits : 'TFamixTInvocationsReceiverTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTInvocationsReceiverTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTInvocationsReceiver).
self entity class initializeSlots: self entity.
]
