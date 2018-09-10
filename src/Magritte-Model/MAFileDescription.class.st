"
I am a description of files, their contents, filename and mime-type. Possible values include instances of *MAFileModel*. My visual representation could be a file-upload dialog.
"
Class {
	#name : #MAFileDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAFileDescription class >> defaultDisplayProperty [

	^ [ :e | e fullName ].
]

{ #category : #'accessing-defaults' }
MAFileDescription class >> defaultKind [
	^ MAMemoryFileModel
]

{ #category : #testing }
MAFileDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAFileDescription class >> label [
	^ 'File'
]

{ #category : #visiting }
MAFileDescription >> acceptMagritte: aVisitor [
	aVisitor visitFileDescription: self
]

{ #category : #accessing }
MAFileDescription >> defaultDirectory [

	^ self propertyAt: #defaultDirectory ifAbsent: [ MAFileSystem imageDirectory ].
]

{ #category : #accessing }
MAFileDescription >> defaultDirectory: fileReference [
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #defaultDirectory put: fileReference
]
