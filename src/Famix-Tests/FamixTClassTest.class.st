Class {
	#name : #FamixTClassTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithMethodsTest + TFamixTWithSuperInheritancesTest + TFamixTWithSubInheritancesTest + TFamixTNamedTest + TFamixTClassTest + TFamixTWithCommentsTest + TFamixTReferenceableTest + TFamixTest + TFamixTPackageableTest + TFamixTInvocationsReceiverTest + TFamixTWithAttributesTest + TFamixTTypeTest',
	#classTraits : 'TFamixTWithMethodsTest classTrait + TFamixTWithSuperInheritancesTest classTrait + TFamixTWithSubInheritancesTest classTrait + TFamixTNamedTest classTrait + TFamixTClassTest classTrait + TFamixTWithCommentsTest classTrait + TFamixTReferenceableTest classTrait + TFamixTest classTrait + TFamixTPackageableTest classTrait + TFamixTInvocationsReceiverTest classTrait + TFamixTWithAttributesTest classTrait + TFamixTTypeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTClass).
self entity class initializeSlots: self entity.
model add: entity. 
]
