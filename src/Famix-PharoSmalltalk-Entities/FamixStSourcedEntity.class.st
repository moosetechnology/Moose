Class {
	#name : #FamixStSourcedEntity,
	#superclass : #FamixStEntity,
	#traits : 'FamixTWithComments + FamixTWithSourceAnchor + FamixTWithSourceLanguage',
	#classTraits : 'FamixTWithComments classTrait + FamixTWithSourceAnchor classTrait + FamixTWithSourceLanguage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStSourcedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixStSourcedEntity >> isImplicitVariable [
	^false
]

{ #category : #accessing }
FamixStSourcedEntity >> sourceLanguage [
	^ self sourceLanguageOr: FamixStUnknownSourceLanguage
]
