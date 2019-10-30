Class {
	#name : #FamixTest1SourceAnchor,
	#superclass : #FamixTest1Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixTest1Entity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTest1SourceAnchor >> sourceText [

	"I should be overriden in my users"
	^ nil
]
