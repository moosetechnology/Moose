Extension { #name : #FamixTestComposed1CustomEntity3 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity3 >> c23 [

	<generated>
	<MSEProperty: #c23 type: #Object>
	^ self privateState attributeAt: #c23 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity3 >> c23: anObject [

	<generated>
	self privateState attributeAt: #c23 put: (FMMultivalueLink on: self update: #c13s from: self c23 to: anObject).
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity3 >> customEntity3s [

	<generated>
	<MSEProperty: #customEntity3s type: #Object>
	^ self privateState attributeAt: #customEntity3s ifAbsentPut: [ FMMultivalueLink on: self opposite: #customEntity3: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity3 >> customEntity3s: anObject [

	<generated>
	self customEntity3s value: anObject
]
