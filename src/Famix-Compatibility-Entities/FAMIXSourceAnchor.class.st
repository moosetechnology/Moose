Class {
	#name : #FAMIXSourceAnchor,
	#superclass : #FAMIXEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FAMIXEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXSourceAnchor >> belongsTo [ 
		
	"define container relationship on element (compatibility)"
	^ self element
]
