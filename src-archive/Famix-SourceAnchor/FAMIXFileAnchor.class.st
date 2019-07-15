"
This offers a source anchor that connects a sourced entity to a file through a relative path stored in the fileName. In addition, the source can be further specified with a startLine and an endLine number in the file.
"
Class {
	#name : #FAMIXFileAnchor,
	#superclass : #FAMIXAbstractFileAnchor,
	#instVars : [
		'startLine',
		'startColumn',
		'endLine',
		'endColumn'
	],
	#category : #'Famix-SourceAnchor'
}

{ #category : #meta }
FAMIXFileAnchor class >> annotation [
	<MSEClass: #FileAnchor super: #FAMIXAbstractFileAnchor>
	<package: #FAMIX>
]

{ #category : #'instance creation' }
FAMIXFileAnchor class >> fileName: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 [
	^ self 
		fileName: aString
		startLine: anInteger
		startColumn: anInteger2
		endLine: anInteger3
		endColumn: anInteger4
		model: nil
]

{ #category : #'instance creation' }
FAMIXFileAnchor class >> fileName: aString startLine: anInteger startColumn: anInteger2 endLine: anInteger3 endColumn: anInteger4 model: aMooseModel [
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
FAMIXFileAnchor >> endColumn [
	<MSEProperty: #endColumn type: #Number>
	<MSEComment: 'Number of the end column'>
	^ endColumn
]

{ #category : #accessing }
FAMIXFileAnchor >> endColumn: anObject [
	endColumn := anObject
]

{ #category : #accessing }
FAMIXFileAnchor >> endLine [
	<MSEProperty: #endLine type: #Number>
	<MSEComment: 'Number of the end line'>
	^ endLine
]

{ #category : #accessing }
FAMIXFileAnchor >> endLine: anObject [
	endLine := anObject
]

{ #category : #accessing }
FAMIXFileAnchor >> includeLine: anInteger [
	^ anInteger between: startLine and: endLine
]

{ #category : #accessing }
FAMIXFileAnchor >> interval [
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
FAMIXFileAnchor >> lineCount [
	(endLine notNil and: [ startLine notNil ])
		ifTrue: [ ^ endLine - startLine + 1 ].

	"if no start/end position, use the comple text ..."
	^ self hasSourceText 
		ifTrue: [ self completeText lineCount ]
		ifFalse: [ self notExistentMetricValue ]
	
]

{ #category : #printing }
FAMIXFileAnchor >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self startLine asString;
		nextPut: $@;
		nextPutAll: self startColumn asString;
		nextPut: $-;
		nextPutAll: self endLine asString;
		nextPut: $@;
		nextPutAll: self endColumn asString;
		nextPut: $).

]

{ #category : #accessing }
FAMIXFileAnchor >> sourceText [
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
FAMIXFileAnchor >> startColumn [
	<MSEProperty: #startColumn type: #Number>
	<MSEComment: 'Number of the start column'>
	^ startColumn
]

{ #category : #accessing }
FAMIXFileAnchor >> startColumn: anObject [
	startColumn := anObject
]

{ #category : #accessing }
FAMIXFileAnchor >> startLine [
	<MSEProperty: #startLine type: #Number>
	<MSEComment: 'Number of the start line'>
	^ startLine
]

{ #category : #accessing }
FAMIXFileAnchor >> startLine: anObject [
	startLine := anObject
]
