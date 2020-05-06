Class {
	#name : #FAMIXReference,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXReference class >> annotation [

	<FMClass: #Reference super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self source ifNotNil: [ :s | aStream nextPutAll: s name ].
	aStream nextPutAll: ' refers to '.
	self target ifNotNil: [ :t | aStream nextPutAll: t name ]
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
