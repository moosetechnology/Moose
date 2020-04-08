Class {
	#name : #FAMIXAbstractFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAbstractFileAnchor class >> annotation [

	<FMClass: #AbstractFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXAbstractFileAnchor class >> isAbstract [
	^ self = FAMIXAbstractFileAnchor
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> <= aFileAnchor [
	^ self fileName <= aFileAnchor fileName
]
