Trait {
	#name : #TFamixTParameterizedTypeTest,
	#instVars : [
		'parameterizableClass'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTParameterizedTypeTest >> testParameterizableClass [
parameterizableClass := MooseEntity new copyWithTalent: FamixTWithParameterizedTypes. 
parameterizableClass class initializeSlots: parameterizableClass.
model add: parameterizableClass.
self entity parameterizableClass: parameterizableClass. 
self assert: (self entity parameterizableClass notNil).
self assert: self entity parameterizableClass equals: parameterizableClass.
self assertCollection: parameterizableClass parameterizedTypes hasSameElements: {self entity}
]
