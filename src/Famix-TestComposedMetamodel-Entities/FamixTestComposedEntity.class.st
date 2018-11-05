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

{ #category : #testing }
FamixTestComposedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposedEntity >> isType [

	<generated>
	^ false
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
