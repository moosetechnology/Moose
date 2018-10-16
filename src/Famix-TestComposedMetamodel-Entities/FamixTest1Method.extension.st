Extension { #name : #FamixTest1Method }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-Test1-Entities' }
FamixTest1Method >> entity [

	<generated>
	<MSEProperty: #entity type: #Object>
	^ self privateState attributeAt: #entity ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-Test1-Entities' }
FamixTest1Method >> entity: anObject [

	<generated>
	(self privateState attributeAt: #entity ifAbsent: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #entity put: anObject.
	anObject method: self
]
