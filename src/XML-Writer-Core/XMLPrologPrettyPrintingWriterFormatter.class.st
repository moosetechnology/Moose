"
A formatter that inserts whitespace formatting to make the prolog XML output nicer and more readable, but doesn't format content XML.
"
Class {
	#name : #XMLPrologPrettyPrintingWriterFormatter,
	#superclass : #XMLWriterFormatter,
	#category : #'XML-Writer-Core'
}

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatAfterInternalSubset: aDoctypeDeclarationWriter [
	aDoctypeDeclarationWriter hasEmbeddedMarkup
		ifTrue: [
			self
				outdent;
				writeLineBreak]
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforeComment: aCommentWriter [
	aCommentWriter isEmbeddedInTagWriter
		ifFalse: [self writeLineBreak]
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforeDeclaration: aDeclarationWriter [
	self writeLineBreak
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter [
	self writeLineBreak
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforeEntityReference: anEntityReferenceWriter [
	anEntityReferenceWriter isParameter
		ifTrue: [self writeLineBreak]
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforeInternalSubset: aDoctypeDeclarationWriter [
	self indent
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforePI: aPIWriter [
	aPIWriter isEmbeddedInTagWriter
		ifFalse: [self writeLineBreak]
]

{ #category : #formatting }
XMLPrologPrettyPrintingWriterFormatter >> formatBeforeStartTag: aTagWriter [
	aTagWriter isEmbeddedInTagWriter
		ifFalse: [self writeLineBreak]
]
