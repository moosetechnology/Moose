Class {
	#name : #FamixStUnknownSourceLanguage,
	#superclass : #FamixStSourceLanguage,
	#traits : 'FamixTSourceLanguage + FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait + FamixTUnknownSourceLanguage classTrait',
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

{ #category : #testing }
FamixStUnknownSourceLanguage >> isUnknown [
	^ true
]
