Class {
	#name : #SmaCCTransformationToolkitModel,
	#superclass : #Model,
	#instVars : [
		'modified',
		'files',
		'inputParserClass',
		'validationParserClass',
		'rewrites',
		'outputDirectory',
		'server',
		'runOnServer',
		'createSubdirectories',
		'commonParentDirectory'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'actions-rewrites' }
SmaCCTransformationToolkitModel >> addTransformation: aSmaCCAbstractRewrite under: aSmaCCRewriteFile [
	self
		addTransformation: aSmaCCAbstractRewrite
		under: aSmaCCRewriteFile
		before: nil
]

{ #category : #'actions-rewrites' }
SmaCCTransformationToolkitModel >> addTransformation: aSmaCCAbstractRewrite under: aSmaCCRewriteFile before: anotherSmaCCAbstractRewrite [
	anotherSmaCCAbstractRewrite isNil
		ifTrue: [ aSmaCCRewriteFile addTransformation: aSmaCCAbstractRewrite ]
		ifFalse:
			[ aSmaCCRewriteFile
				addTransformation: aSmaCCAbstractRewrite
				before: anotherSmaCCAbstractRewrite ].
	self
		changed: #addTransformation:under:
		with:
			(Array with: aSmaCCAbstractRewrite with: aSmaCCRewriteFile)
]

{ #category : #testing }
SmaCCTransformationToolkitModel >> areRewritesModified [
	^ self rewrites notNil and: [ self rewrites isModified ]
]

{ #category : #running }
SmaCCTransformationToolkitModel >> commonParentDirectory [
	| common |
	commonParentDirectory notNil
		ifTrue: [ ^ commonParentDirectory ].
	(self files isEmpty or: [ self createSubdirectories not ])
		ifTrue: [ ^ '' ].
	common := self files first asFileReference parent pathString.
	self files
		do: [ :each | 
			[ common isEmpty or: [ each beginsWith: common ] ]
				whileFalse: [ common := (common isEmpty
						or: [ (common size = 3 and: [ (common at: 2) = $: ]) or: [ common size = 1 and: [ common first = $/ ] ] ])
						ifTrue: [ '' ]
						ifFalse: [ (common copyFrom: 1 to: common size - 1) asFileReference parent pathString ] ] ].
	^ common
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> commonParentDirectory: aString [
	commonParentDirectory := aString
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> createSubdirectories [
	^ createSubdirectories ifNil: [ false ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> createSubdirectories: aBoolean [
	createSubdirectories := aBoolean.
	modified := true.
	self changed: #createSubdirectories with: aBoolean
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> files [
	^ files ifNil: [ #() ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> files: aCollection [
	files := aCollection.
	modified := true.
	self changed: #files with: aCollection
]

{ #category : #'initialize/release' }
SmaCCTransformationToolkitModel >> initialize [
	super initialize.
	modified := false.
	rewrites := SmaCCRewriteFile new
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> inputParserClass [
	^ inputParserClass
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> inputParserClass: aSmaCCParserClass [
	inputParserClass := aSmaCCParserClass.
	modified := true.
	self changed: #inputParserClass with: aSmaCCParserClass
]

{ #category : #testing }
SmaCCTransformationToolkitModel >> isModified [
	^ modified or: [ self areRewritesModified ]
]

{ #category : #testing }
SmaCCTransformationToolkitModel >> isModified: aBoolean [
	modified := aBoolean
]

{ #category : #actions }
SmaCCTransformationToolkitModel >> loadFile: aString [
	| stream |
	stream := FileStream readOnlyFileNamed: aString.
	[ Compiler evaluate: stream contents for: self logged: false.
	self isModified: false ]
		ensure: [ stream close ]
]

{ #category : #public }
SmaCCTransformationToolkitModel >> loadRewriteFile: aString [
	aString isNil
		ifTrue: [ ^ self ].
	self rewrites: (self openRewriteFile: aString)
]

{ #category : #running }
SmaCCTransformationToolkitModel >> localRunOn: aCollection [
	SmaCCRewriteProcessor new
		rules: self rewrites;
		parserClass: self inputParserClass;
		validationParserClass: self validationParserClass;
		files: aCollection;
		outputDirectory: self outputDirectory;
		baseDirectory: self commonParentDirectory;
		processAllNotifying: [ :each | self changed: #resultAdded with: each ]
]

{ #category : #'actions-rewrites' }
SmaCCTransformationToolkitModel >> openRewriteFile: filename [
	^ filename asFileReference exists
		ifTrue: [ SmaCCRewriteRuleFileParser parseFile: filename ]
		ifFalse: [ SmaCCRewriteFile new
				filename: filename;
				yourself ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> outputDirectory [
	^ outputDirectory ifNil: [ '' ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> outputDirectory: aString [
	outputDirectory := aString.
	modified := true.
	self changed: #outputDirectory with: aString
]

{ #category : #'actions-rewrites' }
SmaCCTransformationToolkitModel >> removeTransformation: aSmaCCAbstractRewrite [
	aSmaCCAbstractRewrite parent
		removeTransformation: aSmaCCAbstractRewrite.
	self changed: #removedTransformation: with: aSmaCCAbstractRewrite
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> rewrites [
	^ rewrites
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> rewrites: aSmaCCRewrite [
	rewrites := aSmaCCRewrite.
	modified := true.
	self changed: #rewrites with: aSmaCCRewrite
]

{ #category : #'actions-running' }
SmaCCTransformationToolkitModel >> runOn: tranformationFiles [
	self runOnServer
		ifTrue: [ self serverRunOn: tranformationFiles ]
		ifFalse: [ self localRunOn: tranformationFiles ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> runOnServer [
	^ runOnServer ifNil: [ false ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> runOnServer: aBoolean [
	runOnServer := aBoolean.
	modified := true.
	self changed: #runOnServer with: aBoolean
]

{ #category : #public }
SmaCCTransformationToolkitModel >> saveRewrites [
	self rewrites save
]

{ #category : #public }
SmaCCTransformationToolkitModel >> saveTo: filename [
	| stream |
	stream := FileStream forceNewFileNamed: filename.
	[ stream
		nextPutAll: 'self';
		crtab;
		nextPutAll: 'inputParserClass: ';
		nextPutAll: self inputParserClass storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'validationParserClass: ';
		nextPutAll: self validationParserClass storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'loadRewriteFile: ';
		nextPutAll: self rewrites filename storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'files: ';
		nextPutAll: self files asArray storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'outputDirectory: ';
		nextPutAll: self outputDirectory storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'createSubdirectories: ';
		nextPutAll: self createSubdirectories storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'server: ';
		nextPutAll: self server storeString;
		nextPut: $;;
		crtab;
		nextPutAll: 'runOnServer: ';
		nextPutAll: self runOnServer storeString ]
		ensure: [ stream close ].
	modified := false.
	self areRewritesModified
		ifTrue: [ self saveRewrites ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> server [
	^ (server isNil or: [ server isEmpty ])
		ifTrue: [ 'localhost' ]
		ifFalse: [ server ]
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> server: aString [
	server := aString.
	modified := true.
	self changed: #server with: aString
]

{ #category : #private }
SmaCCTransformationToolkitModel >> serverAndPort: defaultPort from: aString [
	| serverName port parts |
	parts := aString substrings: $: asString.
	(parts size = 2
		and:
			[ parts last notEmpty
				and: [ parts last allSatisfy: [ :each | each isDigit ] ] ])
		ifTrue: [ serverName := parts first.
			port := parts last asNumber ]
		ifFalse: [ serverName := aString.
			port := defaultPort ].
	^ Array with: serverName with: port
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> serverName [
	^ (self serverAndPort: 36rSM from: self server) first
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> serverPort [
	^ (self serverAndPort: 36rSM from: self server) last
]

{ #category : #running }
SmaCCTransformationToolkitModel >> serverRunOn: aCollection [
	| baseString stream socket request serverStream |
	baseString := 'INPUTPARSER=' , self inputParserClass name
		, ';REWRITEFILE=' , self rewrites filename.
	self outputDirectory notEmpty
		ifTrue:
			[ baseString := baseString , ';OUTPUTDIRECTORY='
				, self outputDirectory ].
	baseString := baseString , ';BASEDIRECTORY='
		, self commonParentDirectory.
	self validationParserClass notNil
		ifTrue:
			[ baseString := baseString , ';OUTPUTPARSER='
				, self validationParserClass name ].
	stream := WriteStream on: String new.
	aCollection
		do:
			[ :each | 
			stream
				nextPutAll: baseString;
				nextPutAll: ';FILE=';
				nextPutAll: each;
				nextPut: (Character value: 0) ].
	request := stream contents.
	socket := Socket newTCP
		connectTo:
			(NetNameResolver addressForName: self serverName)
			port: self serverPort;
		yourself.
	(serverStream := SocketStream on: socket) binary.
	[ serverStream
		nextPut: $1 asInteger;
		nextPut: (request size bitAnd: 255);
		nextPut: (request size >> 8 bitAnd: 255);
		nextPut: (request size >> 16 bitAnd: 255);
		nextPut: (request size >> 24 bitAnd: 255);
		nextPutAll: request asByteArray;
		flush.
	aCollection size
		timesRepeat:
			[ self
				changed: #resultAdded
				with:
					(SmaCCRewriteResult
						fromSocketString:
							(serverStream
								next:
									serverStream next + (serverStream next << 8)
										+ (serverStream next << 16) + (serverStream next << 24))
								asString) ] ]
		ensure: [ socket close ]
]

{ #category : #running }
SmaCCTransformationToolkitModel >> terminateServer [
	| socket serverStream |
	socket := Socket newTCP
		connectTo: (NetNameResolver addressForName: self serverName) port: self serverPort;
		yourself.
	(serverStream := SocketStream on: socket) binary.
	[ serverStream
		nextPut: $E asInteger;
		flush.
	[ serverStream next ]
		on: Error
		do: [ :ex | "We should get here when the server quits" ex return ] ]
		ensure: [ serverStream close ]
]

{ #category : #public }
SmaCCTransformationToolkitModel >> toggleUseServer [
	self runOnServer: self runOnServer not
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> validationParserClass [
	^ validationParserClass
]

{ #category : #accessing }
SmaCCTransformationToolkitModel >> validationParserClass: aSmaCCParserClass [
	validationParserClass := aSmaCCParserClass.
	modified := true.
	self changed: #validationParserClass with: aSmaCCParserClass
]
