Trait {
	#name : #TFamixTWithMethodsTest,
	#instVars : [
		'method1',
		'method2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithMethodsTest >> testWithMethods [
	self assert: (self entity methods notEmpty).
	self assertCollection: self entity methods hasSameElements: { method1. method2 }
]
