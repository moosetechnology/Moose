"
This formatter adds highlights to canonical XMLHighlightingWriter output.

(Generated from XMLHighlightingWriterFormatter.)
"
Class {
	#name : #XMLHighlightingCanonicalWriterFormatter,
	#superclass : #XMLCanonicalWriterFormatter,
	#instVars : [
		'highlighter'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Writer'
}

{ #category : #private }
XMLHighlightingCanonicalWriterFormatter >> endPosition [
	^ self writer position
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterCData: aCDataWriter [
	highlighter endCDataHighlightPosition: self endPosition.

	super formatAfterCData: aCDataWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterCharacterEscape: aCharacterEscape [
	highlighter endEntityReferenceHighlightPosition: self endPosition.

	super formatAfterCharacterEscape: aCharacterEscape.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterComment: aCommentWriter [
	highlighter endCommentHighlightPosition: self endPosition.

	super formatAfterComment: aCommentWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterDeclaration: aDeclarationWriter [
	highlighter endDeclarationHighlightPosition: self endPosition.

	super formatAfterDeclaration: aDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter [
	highlighter endDoctypeDeclarationHighlightPosition: self endPosition.

	super formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterEndTag: aTagWriter [
	highlighter endTagHighlightPosition: self endPosition.

	super formatAfterEndTag: aTagWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterEntityReference: anEntityReferenceWriter [
	highlighter endEntityReferenceHighlightPosition: self endPosition.

	super formatAfterEntityReference: anEntityReferenceWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterName: aName [
	highlighter endNameHighlightPosition: self endPosition.

	super formatAfterName: aName.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterPI: aPIWriter [
	highlighter endPIHighlightPosition: self endPosition.

	super formatAfterPI: aPIWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterQuotedStringName: aName [
	highlighter endQuotedStringNameHighlightPosition: self endPosition.

	super formatAfterQuotedStringName: aName.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterQuotedStringValue: aString [
	highlighter endQuotedStringHighlightPosition: self endPosition + 1.

	super formatAfterQuotedStringValue: aString.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterStartTag: aTagWriter [
	highlighter endTagHighlightPosition: self endPosition.

	super formatAfterStartTag: aTagWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatAfterXMLDeclaration: anXMLDeclarationWriter [
	highlighter endXMLDeclarationHighlightPosition: self endPosition.

	super formatAfterXMLDeclaration: anXMLDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeCData: aCDataWriter [
	super formatBeforeCData: aCDataWriter.

	highlighter startCDataHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeCharacterEscape: aCharacterEscape [
	super formatBeforeCharacterEscape: aCharacterEscape.

	highlighter startEntityReferenceHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeComment: aCommentWriter [
	super formatBeforeComment: aCommentWriter.

	highlighter startCommentHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeDeclaration: aDeclarationWriter [
	super formatBeforeDeclaration: aDeclarationWriter.

	highlighter startDeclarationHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter [
	super formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter.

	highlighter startDoctypeDeclarationHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeEndTag: aTagWriter [
	super formatBeforeEndTag: aTagWriter.

	highlighter startTagHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeEntityReference: anEntityReferenceWriter [
	super formatBeforeEntityReference: anEntityReferenceWriter.

	highlighter startEntityReferenceHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeName: aName [
	highlighter startNameHighlightPosition: self startPosition.

	super formatBeforeName: aName.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforePI: aPIWriter [
	super formatBeforePI: aPIWriter.

	highlighter startPIHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeQuotedStringName: aName [
	highlighter startQuotedStringNameHighlightPosition: self startPosition.

	super formatBeforeQuotedStringName: aName.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeQuotedStringValue: aString [
	super formatBeforeQuotedStringValue: aString.

	highlighter startQuotedStringHighlightPosition: self startPosition - 1.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeStartTag: aTagWriter [
	super formatBeforeStartTag: aTagWriter.

	highlighter startTagHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingCanonicalWriterFormatter >> formatBeforeXMLDeclaration: anXMLDeclarationWriter [
	super formatBeforeXMLDeclaration: anXMLDeclarationWriter.

	highlighter startXMLDeclarationHighlightPosition: self startPosition.
]

{ #category : #private }
XMLHighlightingCanonicalWriterFormatter >> startPosition [
	^ self writer position + 1
]

{ #category : #accessing }
XMLHighlightingCanonicalWriterFormatter >> writer: aWriter [
	super writer: aWriter.

	highlighter := aWriter highlighter.
]
