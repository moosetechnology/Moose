Class {
	#name : #FAMIXParameterType,
	#superclass : #FAMIXType,
	#traits : 'FamixTParameterType',
	#classTraits : 'FamixTParameterType classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameterType class >> annotation [

	<FMClass: #ParameterType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXParameterType >> isParameterType [
	^ true
]
