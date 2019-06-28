Trait {
	#name : #TFamixTNamedTest,
	#instVars : [
		'name'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTNamedTest >> testName [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity name: 'aLiteral'. 
self assert: (self entity name notNil).
self assert: self entity name equals: 'aLiteral' .
]
