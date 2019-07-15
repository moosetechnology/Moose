Class {
	#name : #FamixTestComposed1Method,
	#superclass : #FamixTestComposed1NamedEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Method class >> annotation [

	<MSEClass: #Method super: #FamixTestComposed1NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1Method class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1Method class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1Method class >> generatedTraitNames [
	<generated>
	^ #(FamixTMethod)
]

{ #category : #meta }
FamixTestComposed1Method class >> requirements [

	<generated>
	^ { FamixTestComposed1Class }
]

{ #category : #accessing }
FamixTestComposed1Method >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixTestComposed1Method >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]
