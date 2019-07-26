Trait {
	#name : #TFamixTMultipleFileAnchorTest,
	#instVars : [
		'allFiles'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTMultipleFileAnchorTest >> testAllFiles [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity allFiles: 'aLiteral'. 
self assert: (self entity allFiles notNil).
self assert: self entity allFiles equals: 'aLiteral' .
]
