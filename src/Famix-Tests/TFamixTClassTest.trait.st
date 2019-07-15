Trait {
	#name : #TFamixTClassTest,
	#instVars : [
		'method1',
		'method2',
		'subInheritance1',
		'subInheritance2',
		'superInheritance1',
		'superInheritance2',
		'attribute1',
		'attribute2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTClassTest >> testAttributes [
attribute1 := MooseEntity new copyWithTalent: FamixTAttribute.
attribute1 class initializeSlots: attribute1.
attribute2 := MooseEntity new copyWithTalent: FamixTAttribute.
attribute2 class initializeSlots: attribute2.
self entity addAttribute: attribute1.
self entity addAttribute: attribute2.
self assert: (self entity attributes notEmpty).
self assertCollection: self entity attributes hasSameElements: {  attribute1. attribute2 }.
self assert: attribute1 parentType equals: self entity
]

{ #category : #tests }
TFamixTClassTest >> testMethods [
method1 := MooseEntity new copyWithTalent: FamixTMethod.
method1 class initializeSlots: method1.
method2 := MooseEntity new copyWithTalent: FamixTMethod.
method2 class initializeSlots: method2.
self entity addMethod: method1.
self entity addMethod: method2.
self assert: (self entity methods notEmpty).
self assertCollection: self entity methods hasSameElements: {  method1. method2 }.
self assert: method1 parentType equals: self entity
]

{ #category : #tests }
TFamixTClassTest >> testSubInheritances [
superInheritance1 := MooseEntity new copyWithTalent: FamixTSuperInheritance.
superInheritance1 class initializeSlots: superInheritance1.
superInheritance2 := MooseEntity new copyWithTalent: FamixTSuperInheritance.
superInheritance2 class initializeSlots: superInheritance2.
self entity addSubInheritance: superInheritance1.
self entity addSubInheritance: superInheritance2.
self assert: (self entity subInheritances notEmpty).
self assertCollection: self entity subInheritances hasSameElements: {  superInheritance1. superInheritance2 }.
self assert: superInheritance1 superclass equals: self entity
]

{ #category : #tests }
TFamixTClassTest >> testSuperInheritances [
subInheritance1 := MooseEntity new copyWithTalent: FamixTSubInheritance.
subInheritance1 class initializeSlots: subInheritance1.
subInheritance2 := MooseEntity new copyWithTalent: FamixTSubInheritance.
subInheritance2 class initializeSlots: subInheritance2.
self entity addSuperInheritance: subInheritance1.
self entity addSuperInheritance: subInheritance2.
self assert: (self entity superInheritances notEmpty).
self assertCollection: self entity superInheritances hasSameElements: {  subInheritance1. subInheritance2 }.
self assert: subInheritance1 subclass equals: self entity
]
