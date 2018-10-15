"
This offers a source anchor that connects a sourced entity to a file through a relative path stored in the fileName. In addition, the source can be further specified with a startLine and an endLine number in the file.
"
Trait {
	#name : #FamixTFileAnchor,
	#instVars : [
		'correspondingFile',
		'encoding',
		'fileName'
	],
	#category : #'Famix-Traits-FileAnchor'
}

{ #category : #meta }
FamixTFileAnchor classSide >> annotation [

	<MSEClass: #TFileAnchor super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTFileAnchor classSide >> generatedSlotNames [
	<generated>
	'FamixTFileAnchor class>>#generatedSlotNames'.
	^ #(correspondingFile encoding fileName)
]

{ #category : #generator }
FamixTFileAnchor classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTFileAnchor >> addToFile: entity [
	^ self correspondingFile addEntity: entity
]

{ #category : #accessing }
FamixTFileAnchor >> completeText [
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	^ self fileReference
		binaryReadStreamDo:
			[ :in | (ZnCharacterReadStream on: in encoding: self encoding) upToEnd ]
]

{ #category : #accessing }
FamixTFileAnchor >> containerFiles [
	^ self correspondingFile ifNil: [ {} ] ifNotNil: [ :file | {file} ]
]

{ #category : #accessing }
FamixTFileAnchor >> correspondingFile [

	<MSEProperty: #correspondingFile type: #FamixTFile>
	<generated>
	<MSEComment: 'File associated to this source anchor'>
	^ correspondingFile
]

{ #category : #accessing }
FamixTFileAnchor >> correspondingFile: anObject [

	<generated>
	correspondingFile := anObject

]

{ #category : #decoding }
FamixTFileAnchor >> detectEncoding [
	self fileReference exists
		ifFalse: [ ^ nil ].
	^ [ self fileReference binaryReadStreamDo: [ :in | (ZnCharacterEncoder detectEncoding: in upToEnd) identifier ] ]
		on: ZnCharacterEncodingError
		do: [ nil ]
]

{ #category : #accessing }
FamixTFileAnchor >> encoding [
	<MSEProperty: #encoding type: #String>
	<MSEComment: 'A string representing the encoding of a file'>
	^ encoding ifNil: [ encoding := self detectEncoding ]
]

{ #category : #accessing }
FamixTFileAnchor >> encoding: anObject [

	<generated>
	encoding := anObject

]

{ #category : #accessing }
FamixTFileAnchor >> fileName [

	<MSEProperty: #fileName type: #String>
	<generated>
	<MSEComment: 'Name of the source file'>
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
FamixTFileAnchor >> hasSourceText [
	^ self completeText notEmpty 
]

{ #category : #testing }
FamixTFileAnchor >> isFile [
	^ true
]

{ #category : #accessing }
FamixTFileAnchor >> lineCount [
	^ self hasSourceText 
		ifTrue: [ self sourceText lineCount ]
		ifFalse: [ self notExistentMetricValue ]
	
]

{ #category : #private }
FamixTFileAnchor >> privateHasEncoding [
	^ encoding isNotNil
]

{ #category : #initialization }
FamixTFileAnchor >> rootFolder [
	^ self mooseModel rootFolder
]

{ #category : #initialization }
FamixTFileAnchor >> setCorrespondingFile [
	"files have already been added to the model"
	^ self mooseModel allFiles asOrderedCollection
		detect: [ :file | file mooseName = self fileName ]
		ifFound: [ :aFile | self correspondingFile: aFile ]
]

{ #category : #accessing }
FamixTFileAnchor >> sourceText [

	"I should be overriden in my users"
	^ String new
]

{ #category : #testing }
FamixTFileAnchor >> sourcesAreReadable [
	| file |
	^ (file := self fileReference) exists and: [ file size > 0 ]
]
