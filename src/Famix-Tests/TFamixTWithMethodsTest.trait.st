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
	method1 := MooseEntity new copyWithTalent: FamixTMethod.
	method2 := MooseEntity new copyWithTalent: FamixTMethod.
	self entity addMethod: method1.
	self entity addMethod: method2.
	self assert: (self entity methods notEmpty).
	self assertCollection: self entity methods hasSameElements: { method1. method2 }
]

{ #category : #tests }
TFamixTWithMethodsTest >> testWithoutMethods [
	self assert: (self entity methods isNil).
]
