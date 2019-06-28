Trait {
	#name : #TFamixTFileAnchorTest,
	#instVars : [
		'correspondingFile',
		'encoding',
		'fileName'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFileAnchorTest >> testCorrespondingFile [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity correspondingFile: 'aLiteral'. 
self assert: (self entity correspondingFile notNil).
self assert: self entity correspondingFile equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTFileAnchorTest >> testEncoding [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity encoding: 'aLiteral'. 
self assert: (self entity encoding notNil).
self assert: self entity encoding equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTFileAnchorTest >> testFileName [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity fileName: 'aLiteral'. 
self assert: (self entity fileName notNil).
self assert: self entity fileName equals: 'aLiteral' .
]
