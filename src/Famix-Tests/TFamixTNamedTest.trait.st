"
This trait aims to test the elementary trait FamixTNamed.
"
Trait {
	#name : #TFamixTNamedTest,
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTNamedTest >> testSetName [
	self entity name: 'aName'.
	self assert: self entity name equals: 'aName'.
	
]
