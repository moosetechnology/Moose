Extension { #name : #FamixTestComposed1CustomEntity5 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity5 >> associations [
	"Relation named: #associations type: #FamixTestComposedAssociation opposite: #c15"

	<generated>
	<derived>
	<FMProperty: #associations type: #FamixTestComposedAssociation opposite: #c15>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #associations ifAbsentPut: [ FMMultivalueLink on: self opposite: #c15: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity5 >> associations: anObject [

	<generated>
	self associations value: anObject
]
