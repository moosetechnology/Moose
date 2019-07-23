Trait {
	#name : #TFamixTMethodTest,
	#instVars : [
		'isAbstract',
		'isClassSide',
		'kind',
		'parentType'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTMethodTest >> testIsAbstract [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity isAbstract: 'aLiteral'. 
self assert: (self entity isAbstract notNil).
self assert: self entity isAbstract equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTMethodTest >> testIsClassSide [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity isClassSide: 'aLiteral'. 
self assert: (self entity isClassSide notNil).
self assert: self entity isClassSide equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTMethodTest >> testKind [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity kind: 'aLiteral'. 
self assert: (self entity kind notNil).
self assert: self entity kind equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTMethodTest >> testParentType [
parentType := MooseEntity new copyWithTalent: FamixTWithMethods. 
parentType class initializeSlots: parentType.
model add: parentType.
self entity parentType: parentType. 
self assert: (self entity parentType notNil).
self assert: self entity parentType equals: parentType.
self assertCollection: parentType methods hasSameElements: {self entity}
]
