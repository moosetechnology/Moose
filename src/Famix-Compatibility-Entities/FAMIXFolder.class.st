Class {
	#name : #FAMIXFolder,
	#superclass : #FAMIXNamedEntity,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFolder class >> annotation [

	<FMClass: #Folder super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #testing }
FAMIXFolder >> isFolder [
	^ true
]

{ #category : #properties }
FAMIXFolder >> numberOfEmptyLinesOfText [
	<FMProperty: #numberOfEmptyLinesOfText type: #Number>
	<FMComment: 'Number of empty lines of text'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfEmptyLinesOfText computedAs: [ 
		self files, self folders sumNumbers: #numberOfEmptyLinesOfText
	]
]

{ #category : #properties }
FAMIXFolder >> numberOfFiles [
	<FMProperty: #numberOfFiles type: #Number>
	<FMComment: 'The number of files in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFiles
		computedAs: [self files size]
]

{ #category : #properties }
FAMIXFolder >> numberOfFolders [
	<FMProperty: #numberOfFolders type: #Number>
	<FMComment: 'The number of folders in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFolders
		computedAs: [self folders size]
]

{ #category : #accessing }
FAMIXFolder >> numberOfLinesOfText [
	<FMProperty: #numberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text which are not empty in a file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfLinesOfText computedAs: [ self totalNumberOfLinesOfText - self numberOfEmptyLinesOfText ]
]

{ #category : #properties }
FAMIXFolder >> totalNumberOfLinesOfText [
	<FMProperty: #totalNumberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ self files , self folders sumNumbers: #totalNumberOfLinesOfText ]
]
