Class {
	#name : #FamixTest3Package,
	#superclass : #FamixTest3Entity,
	#traits : 'FamixTPackage',
	#classTraits : 'FamixTPackage classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Package class >> annotation [

	<FMClass: #Package super: #FamixTest3Entity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]
