"
A read stream adapter for string read streams that accepts character input and converts it to binary output.
"
Class {
	#name : #XMLStringReadStreamAdapter,
	#superclass : #XMLReadStreamAdapter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLStringReadStreamAdapter >> isBinary [
	"this stream is binary, because it converts characters to integers"
	^ true
]

{ #category : #accessing }
XMLStringReadStreamAdapter >> next [
	stream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ stream next asInteger]
]

{ #category : #accessing }
XMLStringReadStreamAdapter >> peek [
	stream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ stream peek asInteger]
]
