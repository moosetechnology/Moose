Class {
	#name : #FAMIXFile,
	#superclass : #FAMIXAbstractFile,
	#traits : 'FamixTFile',
	#classTraits : 'FamixTFile classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFile class >> annotation [

	<MSEClass: #File super: #FAMIXAbstractFile>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #properties }
FAMIXFile >> averageNumberOfCharactersPerLine [
	<MSEProperty: #averageNumberOfCharactersPerLine type: #Number>
	<MSEComment: 'Average number of characters per lline of text in a file.'>
	<derived>
	^ self
		lookUpPropertyNamed: #averageNumberOfCharactersPerLine
		computedAs: [ 
			self numberOfLinesOfText isZero
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

{ #category : #accessing }
FAMIXFile >> sourceText [
	^ self
		lookUpPropertyNamed: #sourceText
		computedAs: [ self fileExists
				ifTrue: [ | stream source |
					stream := self readStream.
					source := [ stream contents asString ]
						ensure: [ stream ifNotNil: [ stream close ] ].
					source ]
				ifFalse: [ '' ] ]
]

{ #category : #accessing }
FAMIXFile >> sourceText: aString [
	^self
		propertyNamed: #sourceText
		put: aString
]
