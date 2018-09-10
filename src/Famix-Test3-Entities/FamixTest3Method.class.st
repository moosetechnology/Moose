Class {
	#name : #FamixTest3Method,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTInvocable + FamixTMethod + FamixTWithInvocations + FamixTWithReferences + FamixTWithTypes',
	#classTraits : 'FamixTInvocable classTrait + FamixTMethod classTrait + FamixTWithInvocations classTrait + FamixTWithReferences classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Method class >> annotation [

	<MSEClass: #Method super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Method class >> generatedSlotNames [
	<generated>
	'FamixTest3Method class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Method class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocable FamixTMethod FamixTWithInvocations FamixTWithReferences FamixTWithTypes)
]

{ #category : #meta }
FamixTest3Method class >> requirements [

	<generated>
	^ { FamixTest3Class }
]

{ #category : #accessing }
FamixTest3Method >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixTest3Method >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]
