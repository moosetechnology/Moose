Trait {
	#name : #FamixTFileNavigation,
	#instVars : [
		'#endColumn => FMProperty',
		'#endLine => FMProperty',
		'#startColumn => FMProperty',
		'#startLine => FMProperty'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTFileNavigation classSide >> annotation [

	<FMClass: #TFileNavigation super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTFileNavigation classSide >> fileName: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	^ self 
		fileName: aString
		startLine: anInteger
		startColumn: anInteger2
		endLine: anInteger3
		endColumn: anInteger4
		model: nil
]

{ #category : #'instance creation' }
FamixTFileNavigation classSide >> fileName: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 model: aMooseModel [
	^ self new
		mooseModel: aMooseModel;
		fileName: aString;
		startLine: anInteger;
		startColumn: anInteger2;
		endLine: anInteger3;
		endColumn: anInteger4;
		yourself
]

{ #category : #accessing }
FamixTFileNavigation >> endColumn [

	<FMProperty: #endColumn type: #Number>
	<generated>
	<FMComment: 'Number of the end column'>
	^ endColumn
]

{ #category : #accessing }
FamixTFileNavigation >> endColumn: anObject [
	<generated>
	endColumn := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> endLine [

	<FMProperty: #endLine type: #Number>
	<generated>
	<FMComment: 'Number of the end line'>
	^ endLine
]

{ #category : #accessing }
FamixTFileNavigation >> endLine: anObject [
	<generated>
	endLine := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> includeLine: anInteger [
	^ anInteger between: startLine and: endLine
]

{ #category : #accessing }
FamixTFileNavigation >> interval [
	| start end index |
	index := 0.
	start := 1.
	end := 0.
	self completeText lineIndicesDo: [:lineStart :lineEnd :y | 
		index := index + 1.
		self startLine = index ifTrue: [ start := lineStart ].
		self endLine = index ifTrue: [end := lineEnd ] ].
	^ start to: end
]

{ #category : #accessing }
FamixTFileNavigation >> intervalAsCharPos [
	| start end index |
	index := 0.
	start := 1.
	end := 0.
	self completeText lineIndicesDo: [:lineStart :lineEnd :y | 
		index := index + 1.
		self startLine = index ifTrue: [ start := lineStart ].
		self endLine = index ifTrue: [end := lineEnd ] ].
	^ start to: end
]

{ #category : #accessing }
FamixTFileNavigation >> lineCount [
	(endLine notNil and: [ startLine notNil ])
		ifTrue: [ ^ endLine - startLine + 1 ].

	"if no start/end position, use the comple text ..."
	^ self hasSourceText 
		ifTrue: [ self completeText lineCount ]
		ifFalse: [ self notExistentMetricValue ]
	
]

{ #category : #printing }
FamixTFileNavigation >> mooseNameOn: aStream [
	aStream
		nextPutAll: self fileName asString;
		nextPut: $(;
		nextPutAll: self startLine asString;
		nextPut: $@;
		nextPutAll: self startColumn asString;
		nextPut: $-;
		nextPutAll: self endLine asString;
		nextPut: $@;
		nextPutAll: self endColumn asString;
		nextPut: $)
]

{ #category : #accessing }
FamixTFileNavigation >> sourceText [
	(self startLine isNil and: [ self endLine isNil ]) ifTrue: [ ^ self completeText ].
	
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	^ self fileReference
		binaryReadStreamDo: [ :in | 
			String
				streamContents: [ :s | 
					[ FAMIXFileAnchorReader readStream: ((ZnCharacterReadStream on: (ZnBufferedReadStream on: in) encoding: self encoding)) for: self into: s ]
						on: MessageNotUnderstood
						do: [ self endLine: nil.
							s ] ] ]
]

{ #category : #accessing }
FamixTFileNavigation >> startColumn [

	<FMProperty: #startColumn type: #Number>
	<generated>
	<FMComment: 'Number of the start column'>
	^ startColumn
]

{ #category : #accessing }
FamixTFileNavigation >> startColumn: anObject [
	<generated>
	startColumn := anObject
]

{ #category : #accessing }
FamixTFileNavigation >> startLine [

	<FMProperty: #startLine type: #Number>
	<generated>
	<FMComment: 'Number of the start line'>
	^ startLine
]

{ #category : #accessing }
FamixTFileNavigation >> startLine: anObject [
	<generated>
	startLine := anObject
]
