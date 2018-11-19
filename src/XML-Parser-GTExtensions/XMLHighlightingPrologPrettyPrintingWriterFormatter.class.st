"
This formatter adds highlights to prolog pretty printed XMLHighlightingWriter output.

(Generated from XMLHighlightingWriterFormatter.)
"
Class {
	#name : #XMLHighlightingPrologPrettyPrintingWriterFormatter,
	#superclass : #XMLPrologPrettyPrintingWriterFormatter,
	#instVars : [
		'highlighter'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Writer'
}

{ #category : #private }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> endPosition [
	^ self writer position
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterCData: aCDataWriter [
	highlighter endCDataHighlightPosition: self endPosition.

	super formatAfterCData: aCDataWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterCharacterEscape: aCharacterEscape [
	highlighter endEntityReferenceHighlightPosition: self endPosition.

	super formatAfterCharacterEscape: aCharacterEscape.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterComment: aCommentWriter [
	highlighter endCommentHighlightPosition: self endPosition.

	super formatAfterComment: aCommentWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterDeclaration: aDeclarationWriter [
	highlighter endDeclarationHighlightPosition: self endPosition.

	super formatAfterDeclaration: aDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter [
	highlighter endDoctypeDeclarationHighlightPosition: self endPosition.

	super formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterEndTag: aTagWriter [
	highlighter endTagHighlightPosition: self endPosition.

	super formatAfterEndTag: aTagWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterEntityReference: anEntityReferenceWriter [
	highlighter endEntityReferenceHighlightPosition: self endPosition.

	super formatAfterEntityReference: anEntityReferenceWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterName: aName [
	highlighter endNameHighlightPosition: self endPosition.

	super formatAfterName: aName.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterPI: aPIWriter [
	highlighter endPIHighlightPosition: self endPosition.

	super formatAfterPI: aPIWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterQuotedStringName: aName [
	highlighter endQuotedStringNameHighlightPosition: self endPosition.

	super formatAfterQuotedStringName: aName.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterQuotedStringValue: aString [
	highlighter endQuotedStringHighlightPosition: self endPosition + 1.

	super formatAfterQuotedStringValue: aString.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterStartTag: aTagWriter [
	highlighter endTagHighlightPosition: self endPosition.

	super formatAfterStartTag: aTagWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatAfterXMLDeclaration: anXMLDeclarationWriter [
	highlighter endXMLDeclarationHighlightPosition: self endPosition.

	super formatAfterXMLDeclaration: anXMLDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeCData: aCDataWriter [
	super formatBeforeCData: aCDataWriter.

	highlighter startCDataHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeCharacterEscape: aCharacterEscape [
	super formatBeforeCharacterEscape: aCharacterEscape.

	highlighter startEntityReferenceHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeComment: aCommentWriter [
	super formatBeforeComment: aCommentWriter.

	highlighter startCommentHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeDeclaration: aDeclarationWriter [
	super formatBeforeDeclaration: aDeclarationWriter.

	highlighter startDeclarationHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter [
	super formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter.

	highlighter startDoctypeDeclarationHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeEndTag: aTagWriter [
	super formatBeforeEndTag: aTagWriter.

	highlighter startTagHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeEntityReference: anEntityReferenceWriter [
	super formatBeforeEntityReference: anEntityReferenceWriter.

	highlighter startEntityReferenceHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeName: aName [
	highlighter startNameHighlightPosition: self startPosition.

	super formatBeforeName: aName.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforePI: aPIWriter [
	super formatBeforePI: aPIWriter.

	highlighter startPIHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeQuotedStringName: aName [
	highlighter startQuotedStringNameHighlightPosition: self startPosition.

	super formatBeforeQuotedStringName: aName.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeQuotedStringValue: aString [
	super formatBeforeQuotedStringValue: aString.

	highlighter startQuotedStringHighlightPosition: self startPosition - 1.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeStartTag: aTagWriter [
	super formatBeforeStartTag: aTagWriter.

	highlighter startTagHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> formatBeforeXMLDeclaration: anXMLDeclarationWriter [
	super formatBeforeXMLDeclaration: anXMLDeclarationWriter.

	highlighter startXMLDeclarationHighlightPosition: self startPosition.
]

{ #category : #private }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> startPosition [
	^ self writer position + 1
]

{ #category : #accessing }
XMLHighlightingPrologPrettyPrintingWriterFormatter >> writer: aWriter [
	super writer: aWriter.

	highlighter := aWriter highlighter.
]
