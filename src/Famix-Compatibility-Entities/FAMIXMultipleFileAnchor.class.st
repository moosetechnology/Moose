Class {
	#name : #FAMIXMultipleFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#traits : 'FamixTMultipleFileAnchor',
	#classTraits : 'FamixTMultipleFileAnchor classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXMultipleFileAnchor class >> annotation [

	<FMClass: #MultipleFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #public }
FAMIXMultipleFileAnchor >> addFileAnchorWithPath: aPath [
	self allFiles detect: [ :each | each fileName = aPath ] ifNone: [ self createAnchorWithPath: aPath ]
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> allFiles [

	<FMProperty: #allFiles type: #FamixTFileAnchor>
	<multivalued>
	<FMComment: 'All source code definition files'>
	^ allFiles ifNil: [ allFiles := OrderedCollection new. ]
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
