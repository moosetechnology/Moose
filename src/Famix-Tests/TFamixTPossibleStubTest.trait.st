Trait {
	#name : #TFamixTPossibleStubTest,
	#instVars : [
		'isStub'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTPossibleStubTest >> testIsStub [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity isStub: 'aLiteral'. 
self assert: (self entity isStub notNil).
self assert: self entity isStub equals: 'aLiteral' .
]
