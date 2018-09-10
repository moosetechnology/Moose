Class {
	#name : #FAMIXMultipleFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'allFiles'
	],
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
	^ #()
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
FAMIXMultipleFileAnchor >> addSourceAnchor: aSourceAnchor [
	self allFiles add: aSourceAnchor
]

{ #category : #'Famix-File' }
FAMIXMultipleFileAnchor >> addToFile: entity [
	^ self allFiles do: [ :each | each addToFile: entity ]
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> allFiles [
	<MSEProperty: #allFiles type: #FamixTFileAnchor>
	<multivalued>
	<MSEComment: 'All source code definition files'>
	^ allFiles
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> allFiles: aCollection [
	allFiles := aCollection
]

{ #category : #'Famix-File' }
FAMIXMultipleFileAnchor >> containerFiles [
	^ self propertyNamed: #containerFiles ifAbsentPut: [ self allFiles collect: #correspondingFile thenReject: #isNil ]
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
FAMIXMultipleFileAnchor >> fileName [
	"for compatibility with FAMIXFileAnchor, guard condition not needed: it has atleast one file anchor"
	^ self allFiles anyOne fileName
]

{ #category : #initialization }
FAMIXMultipleFileAnchor >> initialize [
	super initialize.
	allFiles := OrderedCollection new.
]

{ #category : #testing }
FAMIXMultipleFileAnchor >> isMultiple [
	^ true
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> lineCount [
	^ self allFiles inject: 0 into: [ :sum :each | sum + each lineCount  ]
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
