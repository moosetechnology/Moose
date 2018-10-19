Extension { #name : #FamixTestComposed1CustomEntity2 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity2 >> c22s [

	<generated>
	<MSEProperty: #c22s type: #Object>
	^ self privateState attributeAt: #c22s ifAbsentPut: [ FMMultivalueLink on: self opposite: #c12: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity2 >> c22s: anObject [

	<generated>
	self c22s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity2 >> customEntity2 [

	<generated>
	<MSEProperty: #customEntity2 type: #Object>
	^ self privateState attributeAt: #customEntity2 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity2 >> customEntity2: anObject [

	<generated>
	self privateState attributeAt: #customEntity2 put: (FMMultivalueLink on: self update: #customEntity2s from: self customEntity2 to: anObject).
]
