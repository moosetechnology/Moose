Trait {
	#name : #TFamixTFileNavigationTest,
	#instVars : [
		'endColumn',
		'endLine',
		'startColumn',
		'startLine'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTFileNavigationTest >> testEndColumn [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity endColumn: 'aLiteral'. 
self assert: (self entity endColumn notNil).
self assert: self entity endColumn equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTFileNavigationTest >> testEndLine [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity endLine: 'aLiteral'. 
self assert: (self entity endLine notNil).
self assert: self entity endLine equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTFileNavigationTest >> testStartColumn [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity startColumn: 'aLiteral'. 
self assert: (self entity startColumn notNil).
self assert: self entity startColumn equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTFileNavigationTest >> testStartLine [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity startLine: 'aLiteral'. 
self assert: (self entity startLine notNil).
self assert: self entity startLine equals: 'aLiteral' .
]
