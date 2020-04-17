Class {
	#name : #FamixTest1Association,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Association class >> annotation [

	<FMClass: #Association super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
