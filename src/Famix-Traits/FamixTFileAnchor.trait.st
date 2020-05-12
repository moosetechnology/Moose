"
This offers a source anchor that connects a sourced entity to a file through a relative path stored in the fileName. In addition, the source can be further specified with a startLine and an endLine number in the file.
"
Trait {
	#name : #FamixTFileAnchor,
	#instVars : [
		'#correspondingFile => FMProperty',
		'#encoding => FMProperty',
		'#fileName => FMProperty'
	],
	#traits : 'FamixTSourceAnchor',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTFileAnchor classSide >> annotation [

	<FMClass: #TFileAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTFileAnchor >> addToFile: entity [
	^ self correspondingFile addEntity: entity
]

{ #category : #accessing }
FamixTFileAnchor >> completeText [
	self sourcesAreReadable ifFalse: [ ^ '' ].

	^ self fileReference binaryReadStreamDo: [ :in | (ZnCharacterReadStream on: in encoding: self encoding) upToEnd ]
]

{ #category : #accessing }
FamixTFileAnchor >> containerFiles [
	^ self correspondingFile ifNil: [ {} ] ifNotNil: [ :file | {file} ]
]

{ #category : #accessing }
FamixTFileAnchor >> correspondingFile [

	<FMProperty: #correspondingFile type: #FamixTFile>
	<generated>
	<FMComment: 'File associated to this source anchor'>
	^ correspondingFile
]

{ #category : #accessing }
FamixTFileAnchor >> correspondingFile: anObject [
	<generated>
	correspondingFile := anObject
]

{ #category : #decoding }
FamixTFileAnchor >> detectEncoding [
	self fileReference ifAbsent: [ ^ nil ].

	^ [ self fileReference binaryReadStreamDo: [ :in | (ZnCharacterEncoder detectEncoding: in upToEnd) identifier ] ]
		on: ZnCharacterEncodingError
		do: [ nil ]
]

{ #category : #accessing }
FamixTFileAnchor >> encoding [
	<FMProperty: #encoding type: #String>
	<FMComment: 'A string representing the encoding of a file'>
	^ encoding ifNil: [ encoding := self detectEncoding ]
]

{ #category : #accessing }
FamixTFileAnchor >> encoding: anObject [
	<generated>
	encoding := anObject
]

{ #category : #accessing }
FamixTFileAnchor >> endLine [
	^ self explicitRequirement
]

{ #category : #accessing }
FamixTFileAnchor >> fileName [

	<FMProperty: #fileName type: #String>
	<generated>
	<FMComment: 'Name of the source file'>
	^ fileName
]

{ #category : #accessing }
FamixTFileAnchor >> fileName: aFileName [
	fileName := aFileName copyReplaceAll: '\' with: '/'. 
]

{ #category : #accessing }
FamixTFileAnchor >> fileReference [
	^ self rootFolder asFileReference resolve: self fileName
]

{ #category : #accessing }
FamixTFileAnchor >> hasSource [
	^ self sourcesAreReadable
]

{ #category : #testing }
FamixTFileAnchor >> isContiguousWith: anotherFileAnchor [
	"compute to see if two entities are contiguous (i.e one followed by the other on consective lines) in a file by looking at their indexed file anchors"

	self fileName = anotherFileAnchor fileName ifFalse: [ ^ false ].

	self endLine + 1 = anotherFileAnchor startLine ifTrue: [ ^ true ].

	^ anotherFileAnchor endLine + 1 = self startLine
]

{ #category : #testing }
FamixTFileAnchor >> isFileAnchor [
	^ true
]

{ #category : #accessing }
FamixTFileAnchor >> lineCount [
	^ self hasSource
		ifTrue: [ self sourceText lineCount ]
		ifFalse: [ self notExistentMetricValue ]
]

{ #category : #printing }
FamixTFileAnchor >> mooseNameOn: aStream [
	aStream nextPutAll: (self fileName ifNil: [ 'No associated file' ])
]

{ #category : #private }
FamixTFileAnchor >> privateHasEncoding [
	^ encoding isNotNil
]

{ #category : #initialization }
FamixTFileAnchor >> rootFolder [
	^ self mooseModel rootFolder
]

{ #category : #testing }
FamixTFileAnchor >> sourcesAreReadable [
	^ self fileReference
		ifExists: [ :file | file size > 0 ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
FamixTFileAnchor >> startLine [
	^ self explicitRequirement
]
