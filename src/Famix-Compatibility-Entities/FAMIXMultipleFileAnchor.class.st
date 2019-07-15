Class {
	#name : #FAMIXMultipleFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTMultipleFileAnchor',
	#classTraits : 'FamixTMultipleFileAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXMultipleFileAnchor class >> annotation [

	<MSEClass: #MultipleFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXMultipleFileAnchor class >> generatedSlotNames [
	<generated>
	'FAMIXMultipleFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXMultipleFileAnchor class >> generatedTraitNames [
	<generated>
	^ #(FamixTMultipleFileAnchor)
]

{ #category : #meta }
FAMIXMultipleFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #public }
FAMIXMultipleFileAnchor >> addFileAnchorWithPath: aPath [
	self allFiles detect: [ :each | each fileName = aPath ] ifNone: [ self createAnchorWithPath: aPath ]
]

{ #category : #adding }
FAMIXMultipleFileAnchor >> createAnchorWithPath: aPath [
	self
		addSourceAnchor:
			(FAMIXFileAnchor new
				fileName: aPath;
				mooseModel: self mooseModel;
				yourself)
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> sourceText [
	^ String
		streamContents: [ :s | 
			self allFiles
				do: [ :file | 
					s
						<< '=======================';
						<< file fileName;
						<< '====================';
						lf;
						<< file sourceText ] ]
]
