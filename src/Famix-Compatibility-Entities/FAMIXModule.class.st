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

{ #category : #accessing }
FAMIXModule >> classes [ 
	^ #()
]
