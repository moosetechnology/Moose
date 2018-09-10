"
This is a base class for AST node visitors that output the AST using a write stream. Instances can be created with #on: to supply a write stream or #new, which will create one, and the result of writing can be obtained with #asString or #contents. (#printString and #printOn: will truncate the output.)
"
Class {
	#name : #XPathASTWritingNodeVisitor,
	#superclass : #XPathASTNodeVisitor,
	#instVars : [
		'stream'
	],
	#classVars : [
		'SpaceCharacter'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'class initialization' }
XPathASTWritingNodeVisitor class >> initialize [
	"self initialize"

	SpaceCharacter := Character space
]

{ #category : #'instance creation' }
XPathASTWritingNodeVisitor class >> new [
	"must use #writeStream instead of 'WriteStream on:' to get a 0-based
	stream on Gemstone"
	^ self on: (String new: 128) writeStream
]

{ #category : #'instance creation' }
XPathASTWritingNodeVisitor class >> on: aStream [
	^ self basicNew initialize on: aStream
]

{ #category : #accessing }
XPathASTWritingNodeVisitor >> contents [
	"returns a string of the currently written output"
	^ stream contents
]

{ #category : #private }
XPathASTWritingNodeVisitor >> emit: aCharacter [
	stream nextPut: aCharacter
]

{ #category : #private }
XPathASTWritingNodeVisitor >> emitAll: aString [
	stream nextPutAll: aString
]

{ #category : #private }
XPathASTWritingNodeVisitor >> emitSpace [
	self emit: SpaceCharacter
]

{ #category : #initialization }
XPathASTWritingNodeVisitor >> on: aStream [
	stream := aStream
]

{ #category : #printing }
XPathASTWritingNodeVisitor >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: stream;
		nextPut: $).
]

{ #category : #private }
XPathASTWritingNodeVisitor >> stream [
	^ stream
]
