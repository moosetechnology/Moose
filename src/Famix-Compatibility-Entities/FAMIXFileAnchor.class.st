Class {
	#name : #FAMIXFileAnchor,
	#superclass : #FAMIXAbstractFileAnchor,
	#traits : 'FamixTFileNavigation',
	#classTraits : 'FamixTFileNavigation classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFileAnchor class >> annotation [

	<MSEClass: #FileAnchor super: #FAMIXAbstractFileAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXFileAnchor class >> generatedSlotNames [
	<generated>
	'FAMIXFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileNavigation)
]

{ #category : #meta }
FAMIXFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FAMIXFileAnchor >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self startLine asString;
		nextPut: $@;
		nextPutAll: self startColumn asString;
		nextPut: $-;
		nextPutAll: self endLine asString;
		nextPut: $@;
		nextPutAll: self endColumn asString;
		nextPut: $).

]
