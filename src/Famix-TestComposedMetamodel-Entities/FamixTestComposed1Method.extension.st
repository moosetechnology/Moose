Extension { #name : #FamixTestComposed1Method }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1Method >> entity [

	<generated>
	<MSEProperty: #entity type: #Object>
	^ self privateState attributeAt: #entity ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1Method >> entity: anObject [

	<generated>
	"o-o" (self privateState attributeAt: #entity ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #entity put: anObject.
	anObject method: self
]
