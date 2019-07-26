Class {
	#name : #FAMIXInclude,
	#superclass : #FAMIXAssociation,
	#traits : 'FamixTFileInclude',
	#classTraits : 'FamixTFileInclude classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXInclude class >> annotation [

	<MSEClass: #Include super: #FAMIXAssociation>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXInclude >> from [	
	^ self source
]

{ #category : #accessing }
FAMIXInclude >> to [
	^ self target
]
