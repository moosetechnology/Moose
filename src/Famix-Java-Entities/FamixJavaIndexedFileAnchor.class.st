Class {
	#name : #FamixJavaIndexedFileAnchor,
	#superclass : #FamixJavaAbstractFileAnchor,
	#traits : 'FamixTIndexedFileNavigation',
	#classTraits : 'FamixTIndexedFileNavigation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaIndexedFileAnchor class >> annotation [

	<MSEClass: #IndexedFileAnchor super: #FamixJavaAbstractFileAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaIndexedFileAnchor class >> generatedSlotNames [
	<generated>
	'FamixJavaIndexedFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaIndexedFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTIndexedFileNavigation)
]

{ #category : #meta }
FamixJavaIndexedFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaIndexedFileAnchor >> lineCount [

	^ self lineCountFromFileReference: self fileReference
]

{ #category : #'as yet unclassified' }
FamixJavaIndexedFileAnchor >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream
		nextPut: $(;
		nextPut: $(;
		nextPutAll: self startPos asString;
		nextPut: $-;
		nextPutAll: self endPos asString;
		nextPut: $).

]
