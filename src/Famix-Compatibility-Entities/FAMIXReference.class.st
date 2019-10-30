Class {
	#name : #FAMIXReference,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXReference class >> annotation [

	<FMClass: #Reference super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self from ifNotNil: [ aStream nextPutAll: self from name ].
	aStream nextPutAll: ' refers to '.
	self to ifNotNil: [ aStream nextPutAll: self to name ]
]

{ #category : #'Famix-Implementation' }
FAMIXReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
