Trait {
	#name : #TFamixTWithSignatureTest,
	#instVars : [
		'signature'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSignatureTest >> testSignature [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity signature: 'aLiteral'. 
self assert: (self entity signature notNil).
self assert: self entity signature equals: 'aLiteral' .
]
