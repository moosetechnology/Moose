"
This class is an XMLWriter that can make highlighted text output with XMLHighlightingPrettyPrintingWriterFormatter and XMLHighlighter.
"
Class {
	#name : #XMLHighlightingWriter,
	#superclass : #XMLWriter,
	#instVars : [
		'highlighter'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Writer'
}

{ #category : #converting }
XMLHighlightingWriter >> asHighlightedText [
	| text |

	"printString/asString forward to printStringLimitedTo: which truncates,
	so contents is used instead to get the complete text"
	text := self contents asText.
	self highlighter highlightText: text.
	^ text.
]

{ #category : #defaults }
XMLHighlightingWriter >> canonicalWriterFormatterClass [
	^ XMLHighlightingCanonicalWriterFormatter
]

{ #category : #accessing }
XMLHighlightingWriter >> highlighter [
	^ highlighter
]

{ #category : #initialization }
XMLHighlightingWriter >> on: aStream [
	super on: aStream.

	highlighter := XMLDocumentHighlighter new.
	self formatter: XMLHighlightingWriterFormatter new.
]

{ #category : #defaults }
XMLHighlightingWriter >> prettyPrintingWriterFormatterClass [
	^ XMLHighlightingPrettyPrintingWriterFormatter
]

{ #category : #defaults }
XMLHighlightingWriter >> prologPrettyPrintingWriterFormatterClass [
	^ XMLHighlightingPrologPrettyPrintingWriterFormatter
]
