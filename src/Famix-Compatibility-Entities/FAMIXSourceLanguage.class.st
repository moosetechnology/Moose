Class {
	#name : #FAMIXSourceLanguage,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-C' }
FAMIXSourceLanguage >> isC [ 
	^ false
]

{ #category : #accessing }
FAMIXSourceLanguage >> name [
	"The name of the language that is not modeled explicitly"
	
	<FMProperty: #name type: #String> <derived>
	<FMComment: 'The name of the language that is not modeled explicitly.'>
	
	^ (self class name removePrefix: 'FAMIX') removeSuffix: 'SourceLanguage'
]
