Trait {
	#name : #TFamixTFunctionTest,
	#instVars : [
		'functionOwner'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFunctionTest >> testFunctionOwner [
functionOwner := MooseEntity new copyWithTalent: FamixTWithFunctions. 
functionOwner class initializeSlots: functionOwner.
model add: functionOwner.
self entity functionOwner: functionOwner. 
self assert: (self entity functionOwner notNil).
self assert: self entity functionOwner equals: functionOwner.
self assertCollection: functionOwner functions hasSameElements: {self entity}
]
