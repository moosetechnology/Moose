"
A FAMIXMultipleFileAnchor is  source anchor that connects a sourced entity to several source files anchors like in the case of .c and .h files
"
Class {
	#name : #FAMIXMultipleFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'allFiles'
	],
	#category : #'Famix-SourceAnchor'
}

{ #category : #meta }
FAMIXMultipleFileAnchor class >> annotation [
	<MSEClass: #MultipleFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
]

{ #category : #public }
FAMIXMultipleFileAnchor >> addFileAnchorWithPath: aPath [
	self allFiles detect: [ :each | each fileName = aPath ] ifNone: [ self createAnchorWithPath: aPath ]
]

{ #category : #adding }
FAMIXMultipleFileAnchor >> addSourceAnchor: aSourceAnchor [
	self allFiles add: aSourceAnchor
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> allFiles [
	<MSEProperty: #allFiles type: #FAMIXAbstractFileAnchor>
	<multivalued>
	<MSEComment: 'All source code definition files'>
	^ allFiles
]

{ #category : #accessing }
FAMIXMultipleFileAnchor >> allFiles: aCollection [
	allFiles := aCollection
]

{ #category : #adding }
FAMIXMultipleFileAnchor >> createAnchorWithPath: aPath [
	self
		addSourceAnchor:
			(FamixFileAnchor new
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
