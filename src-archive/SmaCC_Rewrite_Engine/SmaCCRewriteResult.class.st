Class {
	#name : #SmaCCRewriteResult,
	#superclass : #Object,
	#instVars : [
		'filename',
		'outputFilename',
		'errorString',
		'type',
		'startLine',
		'startColumn',
		'interval',
		'transformation'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewriteResult class >> fromSocketString: aString [
	| result |
	result := self new.
	aString
		splitFirstOn: (Character value: 0)
		andThen: $=
		do:
			[ :key :value | 
			key = 'FILENAME'
				ifTrue: [ result filename: value ].
			key = 'ERRORSTRING'
				ifTrue: [ result errorString: value ].
			key = 'TYPE'
				ifTrue: [ result type: value asSymbol ].
			key = 'STARTLINE'
				ifTrue: [ result startLine: value asNumber ].
			key = 'STARTCOLUMN'
				ifTrue: [ result startColumn: value asNumber ].
			key = 'INTERVAL'
				ifTrue:
					[ | items |
					items := value substrings: $- asString.
					result interval: (items first asNumber to: items last asNumber) ].
			key = 'TRANSFORMATION'
				ifTrue: [ result transformation: value ] ].
	^ result
]

{ #category : #accessing }
SmaCCRewriteResult >> addFile: aSmaCCString named: aString [
	
]

{ #category : #accessing }
SmaCCRewriteResult >> additionalFiles [
	^ Dictionary new
]

{ #category : #converting }
SmaCCRewriteResult >> asSocketString [
	| stream null |
	stream := WriteStream on: String new.
	null := Character value: 0.
	stream
		nextPutAll: 'FILENAME=';
		nextPutAll: filename;
		nextPut: null.
	errorString notNil
		ifTrue:
			[ stream
				nextPutAll: 'ERRORSTRING=';
				nextPutAll: errorString;
				nextPut: null ].
	type notNil
		ifTrue:
			[ stream
				nextPutAll: 'TYPE=';
				nextPutAll: type;
				nextPut: null ].
	startLine notNil
		ifTrue:
			[ stream
				nextPutAll: 'STARTLINE=';
				print: startLine;
				nextPut: null ].
	startColumn notNil
		ifTrue:
			[ stream
				nextPutAll: 'STARTCOLUMN=';
				print: startColumn;
				nextPut: null ].
	interval notNil
		ifTrue:
			[ stream
				nextPutAll: 'INTERVAL=';
				print: interval first;
				nextPut: $-;
				print: interval last;
				nextPut: null ].
	transformation notNil
		ifTrue:
			[ stream
				nextPutAll: 'TRANSFORMATION=';
				nextPutAll: transformation displayString;
				nextPut: null ].
	^ stream contents
]

{ #category : #converting }
SmaCCRewriteResult >> asTabDelimitedString [
	| stream |
	stream := WriteStream on: String new.
	stream
		nextPutAll: filename;
		tab;
		nextPutAll: (errorString ifNil: [ '' ]);
		tab;
		nextPutAll: (type ifNil: [ '' ]);
		tab;
		nextPutAll: (startLine ifNil: [ '' ] ifNotNil: [ :value | value printString ]);
		tab;
		nextPutAll: (startColumn ifNil: [ '' ] ifNotNil: [ :value | value printString ]);
		tab;
		nextPutAll:
			(transformation
				ifNil: [ '' ]
				ifNotNil: [ :value | value displayString ]).
	^ stream contents
]

{ #category : #accessing }
SmaCCRewriteResult >> errorString [
	^ errorString
]

{ #category : #accessing }
SmaCCRewriteResult >> errorString: anObject [
	errorString := anObject
]

{ #category : #accessing }
SmaCCRewriteResult >> filename [
	^ filename
]

{ #category : #accessing }
SmaCCRewriteResult >> filename: anObject [
	filename := anObject
]

{ #category : #public }
SmaCCRewriteResult >> inputSource [
	^ ''
]

{ #category : #accessing }
SmaCCRewriteResult >> inputSource: aString [
	
]

{ #category : #accessing }
SmaCCRewriteResult >> interval [
	^ interval
]

{ #category : #accessing }
SmaCCRewriteResult >> interval: anObject [
	interval := anObject
]

{ #category : #testing }
SmaCCRewriteResult >> isError [
	^ type = #error
]

{ #category : #testing }
SmaCCRewriteResult >> isWarning [
	^ type = #warning
]

{ #category : #accessing }
SmaCCRewriteResult >> outputFilename [
	^ outputFilename
]

{ #category : #accessing }
SmaCCRewriteResult >> outputFilename: anObject [
	outputFilename := anObject
]

{ #category : #public }
SmaCCRewriteResult >> outputSource [
	^ ''
]

{ #category : #accessing }
SmaCCRewriteResult >> outputSource: aString [
	
]

{ #category : #accessing }
SmaCCRewriteResult >> smaccStringClass [
	^ SmaCCString
]

{ #category : #accessing }
SmaCCRewriteResult >> startColumn [
	^ startColumn
]

{ #category : #accessing }
SmaCCRewriteResult >> startColumn: anInteger [
	startColumn := anInteger
]

{ #category : #accessing }
SmaCCRewriteResult >> startLine [
	^ startLine
]

{ #category : #accessing }
SmaCCRewriteResult >> startLine: anInteger [
	startLine := anInteger
]

{ #category : #accessing }
SmaCCRewriteResult >> transformation [
	^ transformation
]

{ #category : #accessing }
SmaCCRewriteResult >> transformation: anObject [
	transformation := anObject
]

{ #category : #public }
SmaCCRewriteResult >> transformedString [
	^ SmaCCAnnotatedString on: ''
]

{ #category : #accessing }
SmaCCRewriteResult >> transformedString: aSmaCCAnnotatedString [
	
]

{ #category : #accessing }
SmaCCRewriteResult >> type [
	^ type
]

{ #category : #accessing }
SmaCCRewriteResult >> type: aSymbol [
	type := aSymbol
]
