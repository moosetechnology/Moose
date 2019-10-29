Class {
	#name : #FAMIXFile,
	#superclass : #FAMIXNamedEntity,
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFile class >> annotation [

	<FMClass: #File super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXFile >> averageNumberOfCharactersPerLine [
	<FMProperty: #averageNumberOfCharactersPerLine type: #Number>
	<FMComment: 'Average number of characters per line of text in a file.'>
	<derived>
	^ self
		lookUpPropertyNamed: #averageNumberOfCharactersPerLine
		computedAs: [ self numberOfLinesOfText isZero
			ifFalse: [ (self numberOfCharacters / self numberOfLinesOfText) asFloat ]
			ifTrue: [ 0 ] ]
]

{ #category : #'Famix-C-testing' }
FAMIXFile >> isCompilationUnit [
	^ false
]

{ #category : #'Famix-C-testing' }
FAMIXFile >> isHeader [
	^ false
]

{ #category : #accessing }
FAMIXFile >> isSourceCodeLoaded [
	self propertyNamed: #sourceText ifAbsentPut: [ ^ false].
	^ true
]

{ #category : #properties }
FAMIXFile >> numberOfBytes [
	<FMProperty: #numberOfBytes type: #Number>
	<FMComment: 'Number of bytes in a file.'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfBytes
		computedAs: [ self fileExists
				ifTrue: [ self fileReference size ]
				ifFalse: [ 0 ] ]
]

{ #category : #properties }
FAMIXFile >> numberOfCharacters [
	<FMProperty: #numberOfCharacters type: #Number>
	<FMComment: 'Number of characters in a file.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfCharacters computedAs: [ self sourceText size ]
]

{ #category : #properties }
FAMIXFile >> numberOfEmptyLinesOfText [
	<FMProperty: #numberOfEmptyLinesOfText type: #Number>
	<FMComment: 'Number of empty lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfEmptyLinesOfText
		computedAs: [ self fileExists
				ifTrue: [ (self sourceText lines select: #isEmpty) size ]
				ifFalse: [ 0 ] ]
]

{ #category : #properties }
FAMIXFile >> numberOfKiloBytes [
	<FMProperty: #numberOfKiloBytes type: #Number>
	<FMComment: 'Number of kilo bytes in a file.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfKiloBytes computedAs: [ (self numberOfBytes / 1024) asFloat ]
]

{ #category : #accessing }
FAMIXFile >> numberOfLinesOfText [
	<FMProperty: #numberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text which are not empty in a file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfLinesOfText computedAs: [ self totalNumberOfLinesOfText - self numberOfEmptyLinesOfText ]
]

{ #category : #properties }
FAMIXFile >> totalNumberOfLinesOfText [
	<FMProperty: #totalNumberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ self sourceText isEmpty
				ifFalse: [ self sourceText lineCount ]
				ifTrue: [ (self name isNotNil and: [ self exists ])
					ifTrue: [ (self sourceText select: [ :each | each = Character cr ]) size + 1 ]
					ifFalse: [ 0 ] ] ]
]
