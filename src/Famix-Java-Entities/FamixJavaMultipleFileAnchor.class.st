Class {
	#name : #FamixJavaMultipleFileAnchor,
	#superclass : #FamixJavaSourceAnchor,
	#instVars : [
		'allFiles'
	],
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaMultipleFileAnchor class >> annotation [

	<MSEClass: #MultipleFileAnchor super: #FamixJavaSourceAnchor>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaMultipleFileAnchor class >> generatedSlotNames [
	<generated>
	'FamixJavaMultipleFileAnchor class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaMultipleFileAnchor class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixJavaMultipleFileAnchor class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> addFileAnchorWithPath: aPath [
	self allFiles detect: [ :each | each fileName = aPath ] ifNone: [ self createAnchorWithPath: aPath ]
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> addSourceAnchor: aSourceAnchor [
	self allFiles add: aSourceAnchor
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> addToFile: entity [
	^ self allFiles do: [ :each | each addToFile: entity ]
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> allFiles [
	<MSEProperty: #allFiles type: #FamixTFileAnchor>
	<multivalued>
	<MSEComment: 'All source code definition files'>
	^ allFiles
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> allFiles: aCollection [
	allFiles := aCollection
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> containerFiles [
	^ self propertyNamed: #containerFiles ifAbsentPut: [ self allFiles collect: #correspondingFile thenReject: #isNil ]
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> createAnchorWithPath: aPath [
	self
		addSourceAnchor:
			(FamixJavaFileAnchor new
				fileName: aPath;
				mooseModel: self mooseModel;
				yourself)
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> fileName [
	"for compatibility with FAMIXFileAnchor, guard condition not needed: it has atleast one file anchor"
	^ self allFiles anyOne fileName
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> initialize [
	super initialize.
	allFiles := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> isMultiple [
	^ true
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> lineCount [
	^ self allFiles inject: 0 into: [ :sum :each | sum + each lineCount  ]
]

{ #category : #'as yet unclassified' }
FamixJavaMultipleFileAnchor >> sourceText [
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
