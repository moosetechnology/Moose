Class {
	#name : #MAFileSystem,
	#superclass : #Object,
	#category : #'Magritte-Pharo3-Model'
}

{ #category : #paths }
MAFileSystem class >> extensionFor: aString [ 

	^ aString asFileReference extension.
]

{ #category : #entries }
MAFileSystem class >> fileSizeFor: filenameString [ 
	^ filenameString asFileReference size
]

{ #category : #paths }
MAFileSystem class >> fullNameFor: aString [ 

	^ aString asFileReference fullName.
]

{ #category : #locations }
MAFileSystem class >> imageDirectory [

	^ FileLocator imageDirectory.
]
