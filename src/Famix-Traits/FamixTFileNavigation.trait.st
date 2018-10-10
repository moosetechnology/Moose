Trait {
	#name : #FamixTFileNavigation,
	#instVars : [
		'endColumn',
		'endLine',
		'startColumn',
		'startLine'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTFileNavigation classSide >> annotation [

	<MSEClass: #TFileNavigation super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
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

{ #category : #generator }
FamixTFileNavigation classSide >> generatedSlotNames [
	<generated>
	'FamixTFileNavigation class>>#generatedSlotNames'.
	^ #(endColumn endLine startColumn startLine)
]

{ #category : #generator }
FamixTFileNavigation classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTFileNavigation >> endColumn [

	<MSEProperty: #endColumn type: #Number>
	<generated>
	<MSEComment: 'Number of the end column'>
	^ endColumn
]

{ #category : #accessing }
FamixTFileNavigation >> endColumn: anObject [

	<generated>
	endColumn := anObject

]

{ #category : #accessing }
FamixTFileNavigation >> endLine [

	<MSEProperty: #endLine type: #Number>
	<generated>
	<MSEComment: 'Number of the end line'>
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

	<MSEProperty: #startColumn type: #Number>
	<generated>
	<MSEComment: 'Number of the start column'>
	^ startColumn
]

{ #category : #accessing }
FamixTFileNavigation >> startColumn: anObject [

	<generated>
	startColumn := anObject

]

{ #category : #accessing }
FamixTFileNavigation >> startLine [

	<MSEProperty: #startLine type: #Number>
	<generated>
	<MSEComment: 'Number of the start line'>
	^ startLine
]

{ #category : #accessing }
FamixTFileNavigation >> startLine: anObject [

	<generated>
	startLine := anObject

]
