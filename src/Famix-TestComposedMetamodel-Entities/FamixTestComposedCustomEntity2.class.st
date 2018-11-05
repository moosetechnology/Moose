Class {
	#name : #FamixTestComposedCustomEntity2,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedCustomEntity2 class >> annotation [

	<MSEClass: #CustomEntity2 super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposedCustomEntity2 class >> generatedSlotNames [
	<generated>
	'FamixTestComposedCustomEntity2 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposedCustomEntity2 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposedCustomEntity2 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #meta }
FamixTestComposedCustomEntity2 class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTestComposedCustomEntity2 >> c22s [

	<generated>
	<MSEProperty: #c22s type: #Object>
	^ self privateState attributeAt: #c22s ifAbsentPut: [ FMMultivalueLink on: self opposite: #c2: ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity2 >> c22s: anObject [

	<generated>
	self c22s value: anObject
]

{ #category : #accessing }
FamixTestComposedCustomEntity2 >> customEntities2 [

	<generated>
	<MSEProperty: #customEntities2 type: #Object>
	^ self privateState attributeAt: #customEntities2 ifAbsentPut: [ FMMultivalueLink on: self opposite: #customEntity2: ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity2 >> customEntities2: anObject [

	<generated>
	self customEntities2 value: anObject
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedCustomEntity2 >> isType [

	<generated>
	^ false
]
