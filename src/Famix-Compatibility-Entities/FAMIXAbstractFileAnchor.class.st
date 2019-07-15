Class {
	#name : #FAMIXAbstractFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTFileAnchor',
	#classTraits : 'FamixTFileAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAbstractFileAnchor class >> annotation [

	<MSEClass: #AbstractFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXAbstractFileAnchor class >> generatedSlotNames [
	<generated>
	'FAMIXAbstractFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXAbstractFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileAnchor)
]

{ #category : #meta }
FAMIXAbstractFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> <= aFileAnchor [
	^ self fileName <= aFileAnchor fileName
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> correspondingFile [
	"file pointed to by this source anchor, ideally this value should never be nil for file-based systems"
	<MSEProperty: #correspondingFile type: #FAMIXFile>
	<MSEComment: 'File associated to this source anchor'>
	^ self privateState attributeAt: #correspondingFile ifAbsent: [ nil ]
]

{ #category : #'Famix-File' }
FAMIXAbstractFileAnchor >> correspondingFile: aFAMIXFile [
	self privateState attributeAt: #correspondingFile put: aFAMIXFile
]

{ #category : #'Moose-Finder' }
FAMIXAbstractFileAnchor >> intervalAsCharPos [
	self subclassResponsibility
]

{ #category : #printing }
FAMIXAbstractFileAnchor >> mooseNameOn: aStream [
	aStream nextPutAll: self fileName asString
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> sourceText [
	self subclassResponsibility
]
