Trait {
	#name : #TFamixTExceptionTest,
	#instVars : [
		'exceptionClass'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTExceptionTest >> testExceptionClass [
exceptionClass := MooseEntity new copyWithTalent: FamixTWithExceptions. 
exceptionClass class initializeSlots: exceptionClass.
model add: exceptionClass.
self entity exceptionClass: exceptionClass. 
self assert: (self entity exceptionClass notNil).
self assert: self entity exceptionClass equals: exceptionClass.
self assertCollection: exceptionClass exceptions hasSameElements: {self entity}
]
