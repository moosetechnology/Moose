Class {
	#name : #FamixJavaAbstractFileAnchor,
	#superclass : #FamixJavaSourceAnchor,
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAbstractFileAnchor class >> annotation [

	<FMClass: #AbstractFileAnchor super: #FamixJavaSourceAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFileAnchor >> <= aFileAnchor [
	^ self fileName <= aFileAnchor fileName
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFileAnchor >> intervalAsCharPos [
	self subclassResponsibility
]
