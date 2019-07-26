Trait {
	#name : #TFamixTDereferencedInvocationTest,
	#instVars : [
		'referencer'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTDereferencedInvocationTest >> testReferencer [
referencer := MooseEntity new copyWithTalent: FamixTWithDereferencedInvocations. 
referencer class initializeSlots: referencer.
model add: referencer.
self entity referencer: referencer. 
self assert: (self entity referencer notNil).
self assert: self entity referencer equals: referencer.
self assertCollection: referencer dereferencedInvocations hasSameElements: {self entity}
]
