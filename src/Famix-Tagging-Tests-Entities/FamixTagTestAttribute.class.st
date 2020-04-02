Class {
	#name : #FamixTagTestAttribute,
	#superclass : #FamixTagTestEntity,
	#traits : 'FamixTAttribute',
	#classTraits : 'FamixTAttribute classTrait',
	#category : #'Famix-Tagging-Tests-Entities-Entities'
}

{ #category : #meta }
FamixTagTestAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixTagTestEntity>
	<package: #'Famix-Tagging-Tests-Entities'>
	<generated>
	^self
]

{ #category : #printing }
FamixTagTestAttribute >> mooseNameOn: aStream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ]
]
