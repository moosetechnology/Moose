Trait {
	#name : #TFamixTIndexedFileNavigationTest,
	#instVars : [
		'endPos',
		'startPos'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTIndexedFileNavigationTest >> testEndPos [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity endPos: 'aLiteral'. 
self assert: (self entity endPos notNil).
self assert: self entity endPos equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTIndexedFileNavigationTest >> testStartPos [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity startPos: 'aLiteral'. 
self assert: (self entity startPos notNil).
self assert: self entity startPos equals: 'aLiteral' .
]
