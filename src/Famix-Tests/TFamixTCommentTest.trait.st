Trait {
	#name : #TFamixTCommentTest,
	#instVars : [
		'container',
		'content'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTCommentTest >> testContainer [
container := MooseEntity new copyWithTalent: FamixTWithComments. 
container class initializeSlots: container.
model add: container.
self entity container: container. 
self assert: (self entity container notNil).
self assert: self entity container equals: container.
self assertCollection: container comments hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTCommentTest >> testContent [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity content: 'aLiteral'. 
self assert: (self entity content notNil).
self assert: self entity content equals: 'aLiteral' .
]
