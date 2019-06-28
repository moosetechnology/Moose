Class {
	#name : #FAMIXParameterType,
	#superclass : #FAMIXType,
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameterType class >> annotation [

	<MSEClass: #ParameterType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXParameterType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXParameterType >> isParameterType [
	^ true
]
