"
This class writes general and parameter entity references.
"
Class {
	#name : #XMLEntityReferenceWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'name',
		'isParameter'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #testing }
XMLEntityReferenceWriter >> isParameter [
	^ isParameter ifNil: [isParameter := false]
]

{ #category : #accessing }
XMLEntityReferenceWriter >> isParameter: aBoolean [
	isParameter := aBoolean
]

{ #category : #accessing }
XMLEntityReferenceWriter >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XMLEntityReferenceWriter >> name: aName [
	name := aName
]

{ #category : #private }
XMLEntityReferenceWriter >> writeBody [
	"avoid #writeName: to avoid formatting"
	self writer nextPutAll: self name
]

{ #category : #private }
XMLEntityReferenceWriter >> writeEpilogue [
	self writer
		nextPut: $;;
		formatAfterEntityReference: self
]

{ #category : #private }
XMLEntityReferenceWriter >> writePrologue [
	self writer
		formatBeforeEntityReference: self;
		nextPut:
			(self isParameter
				ifTrue: [$%]
				ifFalse: [$&])
]
