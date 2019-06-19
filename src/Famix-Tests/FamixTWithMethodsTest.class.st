Class {
	#name : #FamixTWithMethodsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithMethodsTest',
	#classTraits : 'TFamixTWithMethodsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #running }
FamixTWithMethodsTest >> setUp [ 	
	self entity: (MooseEntity new copyWithTalent: FamixTWithMethods).
	self entity class initializeSlots: self entity.  
]
