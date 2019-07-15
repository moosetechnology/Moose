Class {
	#name : #FAMIXCompilationUnit,
	#superclass : #FAMIXCFile,
	#traits : 'FamixTCompilationUnit + FamixTDefinedInModule',
	#classTraits : 'FamixTCompilationUnit classTrait + FamixTDefinedInModule classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCompilationUnit class >> annotation [

	<MSEClass: #CompilationUnit super: #FAMIXCFile>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXCompilationUnit class >> generatedSlotNames [
	<generated>
	'FAMIXCompilationUnit class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXCompilationUnit class >> generatedTraitNames [
	<generated>
	^ #(FamixTCompilationUnit FamixTDefinedInModule)
]

{ #category : #meta }
FAMIXCompilationUnit class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXCompilationUnit >> isCompilationUnit [
	^ true
]

{ #category : #accessing }
FAMIXCompilationUnit >> module [

	^ self parentModule
]

{ #category : #accessing }
FAMIXCompilationUnit >> module: anObject [

	^ self module: anObject

]
