Class {
	#name : #FAMIXFolder,
	#superclass : #FAMIXAbstractFile,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFolder class >> annotation [

	<MSEClass: #Folder super: #FAMIXAbstractFile>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXFolder >> isFolder [
	^ true
]
