Class {
	#name : #FamixJavaFileAnchor,
	#superclass : #FamixJavaAbstractFileAnchor,
	#traits : 'FamixTFileNavigation',
	#classTraits : 'FamixTFileNavigation classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaFileAnchor class >> annotation [

	<MSEClass: #FileAnchor super: #FamixJavaAbstractFileAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaFileAnchor class >> generatedSlotNames [
	<generated>
	'FamixJavaFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileNavigation)
]

{ #category : #meta }
FamixJavaFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixJavaFileAnchor >> mooseNameOn: aStream [
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
