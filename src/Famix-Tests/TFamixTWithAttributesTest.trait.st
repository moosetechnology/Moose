Trait {
	#name : #TFamixTWithAttributesTest,
	#instVars : [
		'attribute1',
		'attribute2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithAttributesTest >> testWithAttributes [
attribute1:= MooseEntity new copyWithTalent: FamixTAttribute.
attribute2:= MooseEntity new copyWithTalent: FamixTAttribute.
self entity addAttribute: attribute1.
self entity addAttribute: attribute2.
self assert: (self entity attributes notEmpty).
	self assertCollection: self entity attributes hasSameElements: { attribute1. attribute2 }.
self assert: attribute1 parentType equals: entity
]

{ #category : #tests }
TFamixTWithAttributesTest >> testWithoutAttributes [
			self assert: (self entity attributes isEmpty)
]
