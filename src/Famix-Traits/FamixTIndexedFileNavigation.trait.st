Trait {
	#name : #FamixTIndexedFileNavigation,
	#instVars : [
		'#endPos => FMProperty',
		'#startPos => FMProperty'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTIndexedFileNavigation classSide >> annotation [

	<MSEClass: #TIndexedFileNavigation super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTIndexedFileNavigation classSide >> fileName: aString startPos: anInteger endPos: anotherInteger [
	^ self
		fileName: aString
		startPos: anInteger
		endPos: anotherInteger
		model: nil
]

{ #category : #'instance creation' }
FamixTIndexedFileNavigation classSide >> fileName: aString startPos: anInteger endPos: anotherInteger model: aMooseModel [
	^ self new
		mooseModel: aMooseModel;
		fileName: aString;
		startPos: anInteger;
		endPos: anotherInteger;
		yourself
]

{ #category : #private }
FamixTIndexedFileNavigation >> countNumberOfLinesRuturnsFrom: aStream from: start to: end [
	"Here is a speedup version of the #lineCount method for the IndexedFileAnchors.
	If we have the file of the entity, instead of reading the full file we can jump directly to the startPos in the stream of the file and read the characters until the endPos. 
	If it is a cr we increment a counter and we ignore a potential lf to manage crlf. If this is a lf, we increment."

	| count char |
	count := 1.
	"Go to the start position in the stream"
	1 to: start - 1 do: [ :i | aStream next ].
	[ aStream position < end ]
		whileTrue: [ 
			(char := aStream next) isCr
				ifTrue: [ "We increment the counter if it is a CR and we ignore a potential LF to manage CRLF"
					count := count + 1.
					(char := aStream peek) isLf
						ifTrue: [ aStream next ] ]
				ifFalse: [ char isLf
						ifTrue: [ "Since we manage CRLF before we can just increment the counter" count := count + 1 ] ] ].
	^ count
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> endPos [

	<MSEProperty: #endPos type: #Number>
	<generated>
	<MSEComment: 'Stop position in the source'>
	^ endPos
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> endPos: anObject [

	<generated>
	endPos := anObject

]

{ #category : #accessing }
FamixTIndexedFileNavigation >> intervalAsCharPos [
	^ self startPos to: self endPos
]

{ #category : #private }
FamixTIndexedFileNavigation >> lineCountFromFileReference: file [

	^ file exists
		ifTrue: [ file
				binaryReadStreamDo: [ :in | 
					| stream |
					stream := ZnCharacterReadStream on: in encoding: self encoding.
					self countNumberOfLinesRuturnsFrom: stream from: (startPos ifNil: [ 1 ]) to: (self endPos ifNil: [ in size ]) ] ]
		ifFalse: [ super lineCount ]
]

{ #category : #private }
FamixTIndexedFileNavigation >> sourceText [
	| start |
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	start := startPos ifNil: [ 1 ].
	
	^ self fileReference
		binaryReadStreamDo: [ :in | 
			| stream |
			stream := ZnCharacterReadStream on: in encoding: self encoding.
			1 to: start - 1 do: [ :i | stream next ].
			stream next: (endPos ifNil: [ in size + 1 ]) - start + 1 ]
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> startPos [

	<MSEProperty: #startPos type: #Number>
	<generated>
	<MSEComment: 'Start position in the source'>
	^ startPos
]

{ #category : #accessing }
FamixTIndexedFileNavigation >> startPos: anObject [

	<generated>
	startPos := anObject

]
