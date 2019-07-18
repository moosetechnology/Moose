Trait {
	#name : #TFamixTWithModifiersTest,
	#instVars : [
		'modifiers'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithModifiersTest >> testModifiers [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity modifiers: 'aLiteral'. 
self assert: (self entity modifiers notNil).
self assert: self entity modifiers equals: 'aLiteral' .
]
