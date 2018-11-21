Extension { #name : #FamixTestComposed1Method }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1Method >> entity [

	<generated>
	<MSEProperty: #entity type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #entity ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1Method >> entity: anObject [

	<generated>
	(self privateState attributeAt: #entity ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #entity put: anObject.
	anObject method: self
]
