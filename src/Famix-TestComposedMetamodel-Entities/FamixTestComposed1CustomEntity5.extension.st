Extension { #name : #FamixTestComposed1CustomEntity5 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity5 >> associations [

	<generated>
	<MSEProperty: #associations type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #associations ifAbsentPut: [ FMMultivalueLink on: self opposite: #c15: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity5 >> associations: anObject [

	<generated>
	self associations value: anObject
]
