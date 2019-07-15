"
It represents a file in the file system.
"
Trait {
	#name : #FamixTFile,
	#instVars : [
		'#entities => FMMany type: #FamixTWithFiles opposite: #containerFiles',
		'#name'
	],
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTFile classSide >> annotation [

	<MSEClass: #TFile super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #groups }
FamixTFile classSide >> famixTFileRelatedGroup [

	<mooseGroup>
	
	^ FAMIXFileGroup
]

{ #category : #generator }
FamixTFile classSide >> generatedSlotNames [
	<generated>
	'FamixTFile class>>#generatedSlotNames'.
	^ #(entities)
]

{ #category : #generator }
FamixTFile classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTFile >> addEntity: famixEntity [
	self entities add: famixEntity
]

{ #category : #accessing }
FamixTFile >> entities [

	<generated>
	<MSEComment: 'List of entities defined in the file'>
	^ entities
]

{ #category : #accessing }
FamixTFile >> entities: anObject [

	<generated>
	entities value: anObject

]

{ #category : #accessing }
FamixTFile >> entitiesGroup [
	<navigation: 'Entities'>
	
	^ MooseGroup withAll: self entities withDescription: 'Entities defined in a file'
]

{ #category : #testing }
FamixTFile >> exists [
	^ self fileExists 
]

{ #category : #testing }
FamixTFile >> fileExists [
	name ifNil: [ ^ false ].
	^ self fileReference exists
]

{ #category : #enumerating }
FamixTFile >> ifFileExistsDo: aBlock [
	name ifNil: [ ^ aBlock value ].
	^ self fileExists ifTrue: [ aBlock value ]
]

{ #category : #testing }
FamixTFile >> isFolder [

	^ false
]

{ #category : #properties }
FamixTFile >> numberOfBytes [
	<MSEProperty: #numberOfBytes type: #Number>
	<MSEComment: 'Number of bytes in a file.'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfBytes
		computedAs: [ self fileExists
				ifTrue: [ self fileReference size ]
				ifFalse: [ 0 ] ]
]

{ #category : #properties }
FamixTFile >> numberOfCharacters [
	<MSEProperty: #numberOfCharacters type: #Number>
	<MSEComment: 'Number of characters in a file.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfCharacters computedAs: [ self sourceText size ]
]

{ #category : #properties }
FamixTFile >> numberOfEmptyLinesOfText [
	<MSEProperty: #numberOfEmptyLinesOfText type: #Number>
	<MSEComment: 'Number of empty lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #numberOfEmptyLinesOfText
		computedAs: [ self fileExists
				ifTrue: [ (self sourceText lines select: #isEmpty) size ]
				ifFalse: [ 0 ] ]
]

{ #category : #properties }
FamixTFile >> numberOfKiloBytes [
	<MSEProperty: #numberOfKiloBytes type: #Number>
	<MSEComment: 'Number of kilo bytes in a file.'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfKiloBytes computedAs: [ (self numberOfBytes / 1024) asFloat ]
]

{ #category : #properties }
FamixTFile >> readStream [
	^ self fileReference readStream
]

{ #category : #properties }
FamixTFile >> totalNumberOfLinesOfText [
	<MSEProperty: #totalNumberOfLinesOfText type: #Number>
	<MSEComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ 
			self sourceText isEmpty
				ifFalse: [ self sourceText lineCount ]
				ifTrue: [ 
					(name notNil and: [ self exists ])
						ifTrue: [ (self sourceText select: [ :each | each = Character cr ]) size + 1 ]
						ifFalse: [ 0 ] ] ]
]
