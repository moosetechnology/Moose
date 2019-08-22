Extension { #name : #FamixTestComposed2CustomEntity5 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity5 >> associations [
	"Relation named: #associations type: #FamixTestComposed2Association opposite: #c25"

	<generated>
	<MSEProperty: #associations type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #associations ifAbsentPut: [ FMMultivalueLink on: self opposite: #c25: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity5 >> associations: anObject [

	<generated>
	self associations value: anObject
]
