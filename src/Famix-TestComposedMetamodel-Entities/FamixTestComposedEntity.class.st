Class {
	#name : #FamixTestComposedEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposedEntity class >> generatedSlotNames [
	<generated>
	'FamixTestComposedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposedEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #meta }
FamixTestComposedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTestComposedEntity >> method [

	<generated>
	<MSEProperty: #method type: #Object>
	^ self privateState attributeAt: #method ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedEntity >> method: anObject [

	<generated>
	(self privateState attributeAt: #method ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #method put: anObject.
	anObject entity: self
]
