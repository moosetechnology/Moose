Class {
	#name : #FamixJavaReference,
	#superclass : #FamixJavaEntity,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaReference class >> annotation [

	<FMClass: #Reference super: #FamixJavaEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #printing }
FamixJavaReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self source ifNotNil: [ aStream nextPutAll: self source name ].
	aStream nextPutAll: ' refers to '.
	self target ifNotNil: [ aStream nextPutAll: self target name ]
]

{ #category : #printing }
FamixJavaReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
