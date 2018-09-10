Class {
	#name : #SmaCCRewriteFile,
	#superclass : #SmaCCAbstractRewrite,
	#instVars : [
		'filename',
		'rewrites',
		'parserClass',
		'isModified',
		'timestamp',
		'cachedLists'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #comparing }
SmaCCRewriteFile >> = anObject [
	self class = anObject class
		ifFalse: [ ^ false ].
	^ self filename = anObject filename
]

{ #category : #accessing }
SmaCCRewriteFile >> addTransformation: aSmaCCAbstractRewrite [
	rewrites add: aSmaCCAbstractRewrite.
	aSmaCCAbstractRewrite parent: self.
	self changed: #rewrites
]

{ #category : #accessing }
SmaCCRewriteFile >> addTransformation: aSmaCCAbstractRewrite before: anotherSmaCCAbstractRewrite [
	rewrites add: aSmaCCAbstractRewrite before: anotherSmaCCAbstractRewrite.
	aSmaCCAbstractRewrite parent: self.
	self changed: #rewrites
]

{ #category : #rewriting }
SmaCCRewriteFile >> clearLocalVariablesIn: aClass [
	self rewrites do: [ :each | each clearLocalVariablesIn: aClass ]
]

{ #category : #accessing }
SmaCCRewriteFile >> currentFileTimestamp [
	^ filename isNil
		ifTrue: [ nil ]
		ifFalse: [ filename asFileReference exists
				ifTrue: [ filename asFileReference modificationTime ]
				ifFalse: [ nil ] ]
]

{ #category : #accessing }
SmaCCRewriteFile >> directory [
	^ filename asFileReference parent pathString
		, FileSystem disk delimiter asString
]

{ #category : #printing }
SmaCCRewriteFile >> displayOn: aStream [
	filename isNil
		ifTrue: [ ^ aStream nextPutAll: '...new file...' ].
	aStream nextPutAll: filename asFileReference basename
]

{ #category : #accessing }
SmaCCRewriteFile >> engine: aSmaCCRewriteEngine [
	rewrites do: [ :each | each engine: aSmaCCRewriteEngine ]
]

{ #category : #accessing }
SmaCCRewriteFile >> filename [
	^ filename
]

{ #category : #accessing }
SmaCCRewriteFile >> filename: aString [
	filename := aString.
	timestamp := self currentFileTimestamp.
	self changed: #filename
]

{ #category : #accessing }
SmaCCRewriteFile >> finishedLoading [
	isModified := false.
	rewrites do: [ :each | each finishedLoading ]
]

{ #category : #comparing }
SmaCCRewriteFile >> hash [
	^ self class hash bitXor: self filename hash
]

{ #category : #accessing }
SmaCCRewriteFile >> import: aString [
	| name rewriteFile |
	name := self directory , aString.
	name asFileReference exists
		ifFalse: [ name := aString ].
	rewriteFile := SmaCCRewriteRuleFileParser parseFile: name.
	self addTransformation: rewriteFile
]

{ #category : #'initialize-release' }
SmaCCRewriteFile >> initialize [
	super initialize.
	rewrites := OrderedCollection new.
	isModified := false.
	cachedLists := IdentityDictionary new
]

{ #category : #testing }
SmaCCRewriteFile >> isComposite [
	^ true
]

{ #category : #testing }
SmaCCRewriteFile >> isModified [
	^ isModified
]

{ #category : #testing }
SmaCCRewriteFile >> isUpToDate [
	^ timestamp = self currentFileTimestamp
		and: [ rewrites allSatisfy: [ :each | each isUpToDate ] ]
]

{ #category : #accessing }
SmaCCRewriteFile >> listForClass: aClass into: aSmaCCRewriteLink [
	^ rewrites
		inject: aSmaCCRewriteLink
		into: [ :sum :each | each listForClass: aClass into: sum ]
]

{ #category : #saving }
SmaCCRewriteFile >> localSaveOn: aStream [
	aStream
		nextPutAll: 'Import: ''';
		nextPutAll: self relativeFilename;
		nextPut: $'
]

{ #category : #accessing }
SmaCCRewriteFile >> modified [
	isModified := true.
	cachedLists := IdentityDictionary new.
	super modified.
	self announcer announce: #display
]

{ #category : #accessing }
SmaCCRewriteFile >> parserClass [
	^ parserClass ifNil: [ super parserClass ]
]

{ #category : #accessing }
SmaCCRewriteFile >> parserClass: aSmaCCParserClass [
	parserClass := aSmaCCParserClass.
	self changed: #parserClass
]

{ #category : #rewriting }
SmaCCRewriteFile >> performLink: aSmaCCRewriteLink on: aSmaCCNode continuation: aBlock [
	| link continuation |
	link := aSmaCCRewriteLink.
	continuation := [ self
		performLink: link next
		on: aSmaCCNode
		continuation: aBlock ].
	[ link notNil ]
		whileTrue:
			[ (link rewrite performOn: aSmaCCNode continuation: continuation)
				ifTrue: [ ^ true ].
			link := link next ].
	^ aBlock value
]

{ #category : #rewriting }
SmaCCRewriteFile >> performOn: aSmaCCNode continuation: aBlock [
	| link |
	link := cachedLists
		at: aSmaCCNode class
		ifAbsentPut:
			[ | first |
			first := SmaCCRewriteLink new.
			self listForClass: aSmaCCNode class into: first.
			first next ].
	^ self performLink: link on: aSmaCCNode continuation: aBlock
]

{ #category : #copying }
SmaCCRewriteFile >> postCopy [
	| oldRewrites |
	super postCopy.
	oldRewrites := self rewrites.
	rewrites := OrderedCollection new: oldRewrites size.
	oldRewrites do: [ :each | self addTransformation: each copy ].
	cachedLists := IdentityDictionary new
]

{ #category : #accessing }
SmaCCRewriteFile >> relativeFilename [
	| parentDirectory |
	parent isNil
		ifTrue: [ ^ filename ].
	parentDirectory := parent directory.
	^ (filename beginsWith: parentDirectory)
		ifTrue: [ filename
				copyFrom: parentDirectory size + 1
				to: filename size ]
		ifFalse: [ filename ]
]

{ #category : #accessing }
SmaCCRewriteFile >> removeTransformation: aSmaCCAbstractRewrite [
	rewrites remove: aSmaCCAbstractRewrite ifAbsent: [  ].
	aSmaCCAbstractRewrite parent: nil.
	self changed: #rewrites
]

{ #category : #accessing }
SmaCCRewriteFile >> rewrites [
	^ rewrites
]

{ #category : #accessing }
SmaCCRewriteFile >> rewrites: aCollection [
	rewrites := aCollection.
	self changed: #rewrites
]

{ #category : #saving }
SmaCCRewriteFile >> save [
	| stream |
	stream := FileStream forceNewFileNamed: filename.
	[ parserClass notNil
		ifTrue:
			[ stream
				nextPutAll: 'Parser: ';
				nextPutAll: parserClass name;
				cr;
				cr ].
	rewrites
		do: [ :each | each saveOn: stream ]
		separatedBy: [ stream
				cr;
				cr ].
	isModified := false ]
		ensure: [ stream close ].
	timestamp := self currentFileTimestamp
]

{ #category : #saving }
SmaCCRewriteFile >> saveOn: aStream [
	super saveOn: aStream.
	self save
]

{ #category : #rewriting }
SmaCCRewriteFile >> updateClass: aClass [
	self rewrites do: [ :each | each updateClass: aClass ]
]
