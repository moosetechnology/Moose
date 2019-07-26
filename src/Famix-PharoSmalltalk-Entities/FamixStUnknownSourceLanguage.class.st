Class {
	#name : #FamixStUnknownSourceLanguage,
	#superclass : #FamixStEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixStEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixStUnknownSourceLanguage >> isUnknown [
	^true
]
