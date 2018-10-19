Extension { #name : #FamixTestComposed1CustomEntity4 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity4 >> c24s [

	<generated>
	<MSEProperty: #c24s type: #Object>
	^ self privateState attributeAt: #c24s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c14s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity4 >> c24s: anObject [

	<generated>
	self c24s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity4 >> customEntity4s [

	<generated>
	<MSEProperty: #customEntity4s type: #Object>
	^ self privateState attributeAt: #customEntity4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntity4s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity4 >> customEntity4s: anObject [

	<generated>
	self customEntity4s value: anObject
]
