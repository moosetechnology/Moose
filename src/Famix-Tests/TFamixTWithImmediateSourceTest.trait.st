Trait {
	#name : #TFamixTWithImmediateSourceTest,
	#instVars : [
		'source'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithImmediateSourceTest >> testSource [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity source: 'aLiteral'. 
self assert: (self entity source notNil).
self assert: self entity source equals: 'aLiteral' .
]
