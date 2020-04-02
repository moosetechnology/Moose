Class {
	#name : #FamixTest3Type,
	#superclass : #FamixTest3NamedEntity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Type class >> annotation [

	<FMClass: #Type super: #FamixTest3NamedEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #groups }
FamixTest3Type class >> annotationFamixTest3TypeGroup [
	<generated>
	<mooseGroup>
	^ FamixTest3TypeGroup
]
