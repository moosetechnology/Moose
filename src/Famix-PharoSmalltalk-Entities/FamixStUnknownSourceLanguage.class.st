Class {
	#name : #FamixStUnknownSourceLanguage,
	#superclass : #FamixStSourceLanguage,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStUnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #FamixStSourceLanguage>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixStUnknownSourceLanguage >> isSmalltalk [
	^ false
]
