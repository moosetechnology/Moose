Class {
	#name : #FamixJavaReference,
	#superclass : #FamixJavaAssociation,
	#traits : 'FamixTReference',
	#classTraits : 'FamixTReference classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaReference class >> annotation [

	<FMClass: #Reference super: #FamixJavaAssociation>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> mooseNameOn: aStream [
	"aStream nextPutAll: 'Reference'."

	self from ifNotNil: [ aStream nextPutAll: self from name ].
	aStream nextPutAll: ' refers to '.
	self to ifNotNil: [ aStream nextPutAll: self to name ]
]

{ #category : #'as yet unclassified' }
FamixJavaReference >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (Reference)'
]
