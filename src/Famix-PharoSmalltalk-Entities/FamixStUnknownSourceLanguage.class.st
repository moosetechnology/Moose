Class {
	#name : #FamixStUnknownSourceLanguage,
	#superclass : #FamixStSourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStUnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixStSourceLanguage>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #testing }
FamixStUnknownSourceLanguage >> isSmalltalk [
	^ false
]
