Class {
	#name : #FAMIXHeader,
	#superclass : #FAMIXCFile,
	#traits : 'FamixTHeader',
	#classTraits : 'FamixTHeader classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXHeader class >> annotation [

	<MSEClass: #Header super: #FAMIXCFile>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXHeader >> isHeader [
	^ true
]
