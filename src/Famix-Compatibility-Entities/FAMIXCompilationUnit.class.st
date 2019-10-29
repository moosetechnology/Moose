Class {
	#name : #FAMIXCompilationUnit,
	#superclass : #FAMIXCFile,
	#traits : 'FamixTCompilationUnit + FamixTDefinedInModule',
	#classTraits : 'FamixTCompilationUnit classTrait + FamixTDefinedInModule classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXCompilationUnit class >> annotation [

	<FMClass: #CompilationUnit super: #FAMIXCFile>
	<package: #FAMIX>
	<generated>
	^self
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
