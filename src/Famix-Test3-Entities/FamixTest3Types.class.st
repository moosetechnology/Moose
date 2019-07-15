Class {
	#name : #FamixTest3Types,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Types class >> annotation [

	<MSEClass: #Types super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Types class >> generatedSlotNames [
	<generated>
	'FamixTest3Types class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Types class >> generatedTraitNames [
	<generated>
	^ #(FamixTType)
]

{ #category : #meta }
FamixTest3Types class >> requirements [

	<generated>
	^ { FamixTest3Method. FamixTest3PrimitiveType }
]

{ #category : #accessing }
FamixTest3Types >> belongsTo [

	<generated>
	^ self typeContainer

]

{ #category : #accessing }
FamixTest3Types >> belongsTo: anObject [

	<generated>
	self typeContainer: anObject

]
