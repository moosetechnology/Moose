Class {
	#name : #FAMIXFile,
	#superclass : #FAMIXNamedEntity,
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFile class >> annotation [

	<FMClass: #File super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-C-testing' }
FAMIXFile >> isCompilationUnit [
	^ false
]

{ #category : #'Famix-C-testing' }
FAMIXFile >> isHeader [
	^ false
]

{ #category : #accessing }
FAMIXFile >> isSourceCodeLoaded [
	self propertyNamed: #sourceText ifAbsentPut: [ ^ false].
	^ true
]
