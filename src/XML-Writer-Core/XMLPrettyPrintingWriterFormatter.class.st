"
A formatter that inserts whitespace formatting to make XML output nicer and more readable.
"
Class {
	#name : #XMLPrettyPrintingWriterFormatter,
	#superclass : #XMLPrologPrettyPrintingWriterFormatter,
	#category : #'XML-Writer-Core'
}

{ #category : #formatting }
XMLPrettyPrintingWriterFormatter >> formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter [
	self writeLineBreak
]

{ #category : #formatting }
XMLPrettyPrintingWriterFormatter >> formatAfterStartTag: aTagWriter [
	self indent
]

{ #category : #formatting }
XMLPrettyPrintingWriterFormatter >> formatBeforeComment: aCommentWriter [
	aCommentWriter isEmbeddedWithStringMarkup
		ifFalse: [self writeLineBreak]
]

{ #category : #formatting }
XMLPrettyPrintingWriterFormatter >> formatBeforeEndTag: aTagWriter [
	aTagWriter hasEmbeddedMarkup
		ifTrue: [
			self outdent.
			aTagWriter hasEmbeddedStringMarkup
				ifFalse: [self writeLineBreak]]
]

{ #category : #formatting }
XMLPrettyPrintingWriterFormatter >> formatBeforePI: aPIWriter [
	aPIWriter isEmbeddedWithStringMarkup
		ifFalse: [self writeLineBreak]
]

{ #category : #formatting }
XMLPrettyPrintingWriterFormatter >> formatBeforeStartTag: aTagWriter [
	aTagWriter isEmbeddedWithStringMarkup
		ifFalse: [self writeLineBreak]
]
