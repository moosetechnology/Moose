Class {
	#name : #FAMIXFolder,
	#superclass : #FAMIXNamedEntity,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFolder class >> annotation [

	<MSEClass: #Folder super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXFolder >> isFolder [
	^ true
]
