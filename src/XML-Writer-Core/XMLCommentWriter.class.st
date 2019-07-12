"
This class writes XML <!-- ... --> comments, but not in DTD internal subsets if canonical XML is enabled.
"
Class {
	#name : #XMLCommentWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'string'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #testing }
XMLCommentWriter >> isOmittable [
	^ self isCanonical
		and: [self isEmbeddedInDoctypeDeclaration]
]

{ #category : #accessing }
XMLCommentWriter >> string [
	^ string ifNil: [string := '']
]

{ #category : #accessing }
XMLCommentWriter >> string: aString [
	string := aString
]

{ #category : #private }
XMLCommentWriter >> writeBody [
	self isOmittable
		ifFalse: [self writer nextPutAll: self string]
]

{ #category : #private }
XMLCommentWriter >> writeEpilogue [
	self isOmittable
		ifFalse: [
			self writer
				nextPutAll: '-->';
				formatAfterComment: self]
]

{ #category : #private }
XMLCommentWriter >> writePrologue [
	self isOmittable
		ifFalse: [
			self writer
				formatBeforeComment: self;
				nextPutAll: '<!--']
]
