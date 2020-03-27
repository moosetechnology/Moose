Class {
	#name : #FamixTest3Class,
	#superclass : #FamixTest3Type,
	#traits : 'FamixTClass',
	#classTraits : 'FamixTClass classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Class class >> annotation [

	<FMClass: #Class super: #FamixTest3Type>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #groups }
FamixTest3Class class >> annotationFamixTest3ClassGroup [
	<generated>
	<mooseGroup>
	^ FamixTest3ClassGroup
]
