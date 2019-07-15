Class {
	#name : #FAMIXModule,
	#superclass : #FAMIXScopingEntity,
	#traits : 'FamixTModule + FamixTWithCompilationUnit + FamixTWithHeader',
	#classTraits : 'FamixTModule classTrait + FamixTWithCompilationUnit classTrait + FamixTWithHeader classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXModule class >> annotation [

	<MSEClass: #Module super: #FAMIXScopingEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXModule class >> generatedSlotNames [
	<generated>
	'FAMIXModule class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXModule class >> generatedTraitNames [
	<generated>
	^ #(FamixTModule FamixTWithCompilationUnit FamixTWithHeader)
]

{ #category : #meta }
FAMIXModule class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FAMIXModule >> classes [ 
	^ #()
]
