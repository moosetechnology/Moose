Extension { #name : #FamixTestComposed2CustomEntity4 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c14s [

	<generated>
	<MSEProperty: #c14s type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c14s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c14s: anObject [

	<generated>
	self c14s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c4s [

	<generated>
	<MSEProperty: #c4s type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c4s: anObject [

	<generated>
	self c4s value: anObject
]
