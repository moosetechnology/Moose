"
I represent a file using a ByteArray in the object memory. I am not practicable for big files: use me for development and testing only.
"
Class {
	#name : #MAMemoryFileModel,
	#superclass : #MAFileModel,
	#instVars : [
		'contents'
	],
	#category : #'Magritte-Model-Models'
}

{ #category : #comparing }
MAMemoryFileModel >> = anObject [
    ^ super = anObject and: [ self contents = anObject contents ]
]

{ #category : #accessing }
MAMemoryFileModel >> contents [
	^ contents ifNil: [ contents := ByteArray new ]
]

{ #category : #accessing }
MAMemoryFileModel >> contents: aByteArray [
	super contents: aByteArray.
	contents := aByteArray asByteArray
]

{ #category : #finalization }
MAMemoryFileModel >> finalize [
	super finalize.
	contents := nil
]

{ #category : #comparing }
MAMemoryFileModel >> hash [
	^ super hash bitXor: self contents hash
]
