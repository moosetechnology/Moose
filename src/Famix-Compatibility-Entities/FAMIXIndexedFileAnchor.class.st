Class {
	#name : #FAMIXIndexedFileAnchor,
	#superclass : #FAMIXAbstractFileAnchor,
	#traits : 'FamixTIndexedFileNavigation',
	#classTraits : 'FamixTIndexedFileNavigation classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXIndexedFileAnchor class >> annotation [

	<MSEClass: #IndexedFileAnchor super: #FAMIXAbstractFileAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXIndexedFileAnchor class >> generatedSlotNames [
	<generated>
	'FAMIXIndexedFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXIndexedFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTIndexedFileNavigation)
]

{ #category : #meta }
FAMIXIndexedFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FAMIXIndexedFileAnchor >> lineCount [

	^ self lineCountFromFileReference: self fileReference
]

{ #category : #accessing }
FAMIXIndexedFileAnchor >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream
		nextPut: $(;
		nextPut: $(;
		nextPutAll: self startPos asString;
		nextPut: $-;
		nextPutAll: self endPos asString;
		nextPut: $).

]
