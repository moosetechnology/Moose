"
This offers a source anchor that connects a sourced entity to a file through a relative path stored in the fileName.
Subclasses are responsible for recording the start and end positions in the file
"
Class {
	#name : #FAMIXAbstractFileAnchor,
	#superclass : #FAMIXSourceAnchor,
	#instVars : [
		'fileName',
		'encoding'
	],
	#category : #'Famix-SourceAnchor'
}

{ #category : #meta }
FAMIXAbstractFileAnchor class >> annotation [
	<MSEClass: #AbstractFileAnchor super: #FAMIXSourceAnchor>
	<package: #FAMIX>
]

{ #category : #comparing }
FAMIXAbstractFileAnchor >> <= aFileAnchor [
	^ self fileName <= aFileAnchor fileName
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> completeText [
	self sourcesAreReadable ifFalse: [ ^ '' ].
	
	^ self fileReference
		binaryReadStreamDo:
			[ :in | (ZnCharacterReadStream on: in encoding: self encoding) upToEnd ]
]

{ #category : #encoding }
FAMIXAbstractFileAnchor >> detectEncoding [
	self fileReference exists
		ifFalse: [ ^ nil ].
	^ [ self fileReference binaryReadStreamDo: [ :in | (ZnCharacterEncoder detectEncoding: in upToEnd) identifier ] ]
		on: ZnCharacterEncodingError
		do: [ nil ]
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> encoding [
	<MSEProperty: #encoding type: #String>
	<MSEComment: 'A string representing the encoding of a file'>
	^ encoding ifNil: [ encoding := self detectEncoding ]
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> encoding: aString [
	encoding := aString
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> fileName [
	<MSEProperty: #fileName type: #String>
	<MSEComment: 'Name of the source file'>
	^ fileName
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> fileName: aFileName [
	fileName := aFileName copyReplaceAll: '\' with: '/'. 
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> fileReference [
	^ self rootFolder asFileReference resolve: self fileName
]

{ #category : #testing }
FAMIXAbstractFileAnchor >> hasSourceText [
	^ self completeText notEmpty 
]

{ #category : #testing }
FAMIXAbstractFileAnchor >> isFile [
	^ true
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> lineCount [
	^ self hasSourceText 
		ifTrue: [ self sourceText lineCount ]
		ifFalse: [ self notExistentMetricValue ]
	
]

{ #category : #printing }
FAMIXAbstractFileAnchor >> mooseNameOn: aStream [
	aStream nextPutAll: self fileName asString
]

{ #category : #private }
FAMIXAbstractFileAnchor >> privateHasEncoding [
	^ encoding isNotNil
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> rootFolder [
	^ self mooseModel rootFolder
]

{ #category : #accessing }
FAMIXAbstractFileAnchor >> sourceText [
	self subclassResponsibility
]

{ #category : #testing }
FAMIXAbstractFileAnchor >> sourcesAreReadable [
	| file |
	^ (file := self fileReference) exists and: [ file size > 0 ]
]
