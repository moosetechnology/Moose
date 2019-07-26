Class {
	#name : #FamixTest3Method,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Method class >> annotation [

	<MSEClass: #Method super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
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
