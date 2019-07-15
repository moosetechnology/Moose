"
A formatter that adds LF linebreaks around canonical markup.
"
Class {
	#name : #XMLCanonicalWriterFormatter,
	#superclass : #XMLWriterFormatter,
	#category : #'XML-Writer-Core'
}

{ #category : #formatting }
XMLCanonicalWriterFormatter >> formatAfterComment: aCommentWriter [
	self writer hadActiveTagWriter
		ifFalse: [self writeLineBreak]
]

{ #category : #formatting }
XMLCanonicalWriterFormatter >> formatAfterPI: aPIWriter [
	self writer hadActiveTagWriter
		ifFalse: [self writeLineBreak]
]

{ #category : #formatting }
XMLCanonicalWriterFormatter >> formatBeforeComment: aCommentWriter [
	(self writer hadActiveTagWriter
		and: [self writer hasActiveTagWriter not])
		ifTrue: [self writeLineBreak]
]

{ #category : #formatting }
XMLCanonicalWriterFormatter >> formatBeforePI: aPIWriter [
	(self writer hadActiveTagWriter
		and: [self writer hasActiveTagWriter not])
		ifTrue: [self writeLineBreak]
]
