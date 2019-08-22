Extension { #name : #FamixTestComposed1Method }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1Method >> entity [
	"Relation named: #entity type: #FamixTestComposed1Entity opposite: #method"

	<generated>
	<MSEProperty: #entity type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #entity ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1Method >> entity: anObject [

	<generated>
	(self privateState attributeAt: #entity ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self entity.
		self privateState attributeAt: #entity put: anObject.
		otherSide method: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #entity put: anObject.
		anObject method: self ]
]
