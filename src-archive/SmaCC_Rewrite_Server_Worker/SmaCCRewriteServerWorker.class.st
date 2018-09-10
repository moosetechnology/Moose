Class {
	#name : #SmaCCRewriteServerWorker,
	#superclass : #Object,
	#instVars : [
		'socket',
		'serverStream',
		'rewriteFiles',
		'remotePrefix',
		'localPrefix'
	],
	#category : #'SmaCC_Rewrite_Server_Worker'
}

{ #category : #running }
SmaCCRewriteServerWorker >> classNamed: aString [
	^ Smalltalk at: aString asSymbol
]

{ #category : #running }
SmaCCRewriteServerWorker >> loadRewrites: aString [
	[ 
	| rewrites |
	rewrites := rewriteFiles
		at: aString
		ifAbsentPut: [ SmaCCRewriteRuleFileParser parseFile: aString ].
	rewrites isUpToDate
		ifTrue: [ ^ rewrites ].
	rewriteFiles removeKey: aString ] repeat
]

{ #category : #accessing }
SmaCCRewriteServerWorker >> localPrefix [
	^ localPrefix ifNil: [ '' ]
]

{ #category : #accessing }
SmaCCRewriteServerWorker >> localPrefix: aString [
	localPrefix := aString
]

{ #category : #running }
SmaCCRewriteServerWorker >> localizeFilename: aString [
	| newString |
	newString := (self remotePrefix notEmpty and: [ aString beginsWith: self remotePrefix ])
		ifTrue:
			[ self localPrefix , (aString copyFrom: self remotePrefix size + 1 to: aString size) ]
		ifFalse: [ aString ].
	^ (newString copyReplaceAll: '\' with: FileSystem disk delimiter asString)
		copyReplaceAll: '/'
		with: FileSystem disk delimiter asString
]

{ #category : #running }
SmaCCRewriteServerWorker >> processRequest: aString [
	| file outputDirectory rewrites inputParser outputParser result resultBytes baseDirectory |
	aString
		splitFirstOn: $;
		andThen: $=
		do:
			[ :type :value | 
			type = 'FILE'
				ifTrue: [ file := self localizeFilename: value ].
			type = 'OUTPUTDIRECTORY'
				ifTrue: [ outputDirectory := self localizeFilename: value ].
			type = 'BASEDIRECTORY'
				ifTrue: [ baseDirectory := self localizeFilename: value ].
			type = 'REWRITEFILE'
				ifTrue:
					[ rewrites := self loadRewrites: (self localizeFilename: value) ].
			type = 'INPUTPARSER'
				ifTrue: [ inputParser := self classNamed: value ].
			type = 'OUTPUTPARSER'
				ifTrue: [ outputParser := self classNamed: value ] ].
	result := SmaCCRewriteResult new.
	SmaCCRewriteProcessor new
		rules: rewrites;
		parserClass: inputParser;
		validationParserClass: outputParser;
		outputDirectory: outputDirectory;
		baseDirectory: baseDirectory;
		processFile: file usingResult: result.
	resultBytes := result asSocketString asByteArray.
	self writeBytes: resultBytes
]

{ #category : #running }
SmaCCRewriteServerWorker >> processRequests [
	[ 
	[ 
	| bytes |
	bytes := self readBytes.
	self processRequest: bytes asString ] repeat ]
		on: Error
		do:
			[ :ex | 
			((Smalltalk options select: [ :each | '-/' includes: each first ])
				collect: [ :each | each copyFrom: 2 to: each size ])
				do: [ :each | 
					(each sameAs: 'error')
						ifTrue: [ ex pass ] ].
			Exit signalFailure: ex messageText ]
]

{ #category : #running }
SmaCCRewriteServerWorker >> readBytes [
	^ serverStream
		next:
			serverStream next + (serverStream next << 8) + (serverStream next << 16)
				+ (serverStream next << 24)
]

{ #category : #accessing }
SmaCCRewriteServerWorker >> remotePrefix [
	^ remotePrefix ifNil: [ '' ]
]

{ #category : #accessing }
SmaCCRewriteServerWorker >> remotePrefix: aString [
	remotePrefix := aString
]

{ #category : #running }
SmaCCRewriteServerWorker >> startConnectingTo: aString onPort: anInteger [
	rewriteFiles := Dictionary new.
	socket := [ Socket newTCP
		connectTo: (NetNameResolver addressForName: aString) port: anInteger;
		yourself ]
		on: Error
		do: [ :ex | Exit signalFailure: ex messageText ].
	serverStream := SocketStream on: socket.
	serverStream binary.
	serverStream noTimeout.
	[ serverStream
		nextPut: $0 asInteger;
		flush.
	self processRequests ]
		ensure: [ socket close ]
]

{ #category : #running }
SmaCCRewriteServerWorker >> writeBytes: resultBytes [
	serverStream
		nextPut: (resultBytes size bitAnd: 255);
		nextPut: (resultBytes size >> 8 bitAnd: 255);
		nextPut: (resultBytes size >> 16 bitAnd: 255);
		nextPut: (resultBytes size >> 24 bitAnd: 255);
		nextPutAll: resultBytes;
		flush
]
