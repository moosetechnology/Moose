Class {
	#name : #FamixTMethodTest,
	#superclass : #TestCase,
	#traits : 'TFamixTMethodTest + TFamixTWithParametersTest + TFamixTInvocableTest + ((TFamixTWithInvocationsTest -- #invocation1) -- #invocation2) + TFamixTWithReferencesTest + TFamixTWithAccessesTest + TFamixTWithLocalVariablesTest + TFamixTWithImplicitVariablesTest + TFamixTWithSignatureTest + TFamixTWithClassScopeTest + TFamixTTypedStructureTest + TFamixTWithModifiersTest + TFamixTNamedTest + TFamixTWithCommentsTest',
	#classTraits : 'TFamixTMethodTest classTrait + TFamixTWithParametersTest classTrait + TFamixTInvocableTest classTrait + TFamixTWithInvocationsTest classTrait + TFamixTWithReferencesTest classTrait + TFamixTWithAccessesTest classTrait + TFamixTWithLocalVariablesTest classTrait + TFamixTWithImplicitVariablesTest classTrait + TFamixTWithSignatureTest classTrait + TFamixTWithClassScopeTest classTrait + TFamixTTypedStructureTest classTrait + TFamixTWithModifiersTest classTrait + TFamixTNamedTest classTrait + TFamixTWithCommentsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTMethodTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTMethod).
self entity class initializeSlots: self entity.
model add: entity. 
]
