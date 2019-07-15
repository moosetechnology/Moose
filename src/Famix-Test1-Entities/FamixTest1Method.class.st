Class {
	#name : #FamixTest1Method,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTMethod',
	#classTraits : 'FamixTMethod classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Method class >> annotation [

	<MSEClass: #Method super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1Method class >> generatedSlotNames [
	<generated>
	'FamixTest1Method class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1Method class >> generatedTraitNames [
	<generated>
	^ #(FamixTMethod)
]

{ #category : #meta }
FamixTest1Method class >> requirements [

	<generated>
	^ { FamixTest1Class }
]

{ #category : #accessing }
FamixTest1Method >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixTest1Method >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #printing }
FamixTest1Method >> mooseNameOn: stream [  

	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
		self name ifNotNil: [ stream nextPutAll: self name]
]
