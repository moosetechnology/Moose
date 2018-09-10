"
An abstract class for formatters used to decorate markup writers. Override the ""formatting"" messages.
"
Class {
	#name : #XMLWriterFormatter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'indentString',
		'currentIndentLevel'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLWriterFormatter class >> defaultIndentLevel [
	^ 0
]

{ #category : #accessing }
XMLWriterFormatter class >> defaultIndentString [
	^ '    '
]

{ #category : #'instance creation' }
XMLWriterFormatter class >> writer: aWriter [
	^ self new writer: aWriter
]

{ #category : #private }
XMLWriterFormatter >> currentIndentLevel [
	^ currentIndentLevel
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterCData: aCDataWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterCharacterEscape: aCharacterEscape [
	"sent after outputting an escape sequence for some character"
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterComment: aCommentWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterDeclaration: aDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterEndTag: aTagWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterEntityReference: anEntityReferenceWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterInternalSubset: aDoctypeDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterName: aName [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterPI: aPIWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterQuotedStringName: aName [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterQuotedStringValue: aString [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterStartTag: aTagWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatAfterXMLDeclaration: anXMLDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeCData: aCDataWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeCharacterEscape: aCharacterEscape [
	"sent before outputting an escape sequence for some character"
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeComment: aCommentWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeDeclaration: aDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeEndTag: aTagWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeEntityReference: anEntityReferenceWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeInternalSubset: aDoctypeDeclarationWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeName: aName [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforePI: aPIWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeQuotedStringName: aName [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeQuotedStringValue: aString [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeStartTag: aTagWriter [
]

{ #category : #formatting }
XMLWriterFormatter >> formatBeforeXMLDeclaration: anXMLDeclarationWriter [
]

{ #category : #indenting }
XMLWriterFormatter >> indent [
	currentIndentLevel := self currentIndentLevel + 1
]

{ #category : #accessing }
XMLWriterFormatter >> indentString [
	^ indentString
]

{ #category : #accessing }
XMLWriterFormatter >> indentString: aString [
	currentIndentLevel := 0.
	indentString := aString.
]

{ #category : #initialization }
XMLWriterFormatter >> initialize [
	super initialize.

	currentIndentLevel := self class defaultIndentLevel.
	indentString := self class defaultIndentString.
]

{ #category : #indenting }
XMLWriterFormatter >> outdent [
	currentIndentLevel := self currentIndentLevel - 1
]

{ #category : #writing }
XMLWriterFormatter >> writeIndent [
	"use #to:do: over #timesRepeat: for speed"
	1 to: self currentIndentLevel do: [:i |
		self writer nextPutAll: self indentString]
]

{ #category : #writing }
XMLWriterFormatter >> writeLineBreak [
	self writer atBeginning
		ifFalse: [
			self writer nextPutAll: self writer lineBreak.
			(self currentIndentLevel > 0
				and: [self indentString size > 0])
				ifTrue: [self writeIndent]]
]

{ #category : #accessing }
XMLWriterFormatter >> writer [
	^ writer
]

{ #category : #accessing }
XMLWriterFormatter >> writer: aWriter [
	writer := aWriter
]
