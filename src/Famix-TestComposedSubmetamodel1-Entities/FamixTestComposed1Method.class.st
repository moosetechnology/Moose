Class {
	#name : #FamixTestComposed1Method,
	#superclass : #FamixTestComposed1NamedEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #'as yet unclassified' }
FamixTestComposed1Method class >> annotation [

	<MSEClass: #Method super: #FamixTestComposed1NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
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
