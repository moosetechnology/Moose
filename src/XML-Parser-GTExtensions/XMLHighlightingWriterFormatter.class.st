"
This formatter adds highlights to XMLHighlightingWriter output.
"
Class {
	#name : #XMLHighlightingWriterFormatter,
	#superclass : #XMLWriterFormatter,
	#instVars : [
		'highlighter'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Writer'
}

{ #category : #private }
XMLHighlightingWriterFormatter class >> generateHighlightingSubclassOf: aFormatterClass named: aName inCategory: aCategory [
	"
	self
		generateHighlightingSubclassOf: XMLPrologPrettyPrintingWriterFormatter
		named: #XMLHighlightingPrologPrettyPrintingWriterFormatter
		inCategory: self category.
	self
		generateHighlightingSubclassOf: XMLPrettyPrintingWriterFormatter
		named: #XMLHighlightingPrettyPrintingWriterFormatter
		inCategory: self category.
	self
		generateHighlightingSubclassOf: XMLCanonicalWriterFormatter
		named: #XMLHighlightingCanonicalWriterFormatter
		inCategory: self category.
	"
	| newSubclass |

	(aFormatterClass == self
		or: [aFormatterClass class inheritsFrom: self])
		ifTrue: [
			^ aFormatterClass
				subclass: aName asSymbol
				instanceVariableNames: ''
				classVariableNames: ''
				category: aCategory asSymbol].

	newSubclass :=
		aFormatterClass
			subclass: aName asSymbol
			instanceVariableNames: 'highlighter'
			classVariableNames: ''
			category: aCategory asSymbol.
	self selectors do: [:each |
		newSubclass
			compile: (self sourceCodeAt: each)
			classified: (self whichCategoryIncludesSelector: each)].

	^ newSubclass.
]

{ #category : #private }
XMLHighlightingWriterFormatter >> endPosition [
	^ self writer position
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterCData: aCDataWriter [
	highlighter endCDataHighlightPosition: self endPosition.

	super formatAfterCData: aCDataWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterCharacterEscape: aCharacterEscape [
	highlighter endEntityReferenceHighlightPosition: self endPosition.

	super formatAfterCharacterEscape: aCharacterEscape.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterComment: aCommentWriter [
	highlighter endCommentHighlightPosition: self endPosition.

	super formatAfterComment: aCommentWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterDeclaration: aDeclarationWriter [
	highlighter endDeclarationHighlightPosition: self endPosition.

	super formatAfterDeclaration: aDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter [
	highlighter endDoctypeDeclarationHighlightPosition: self endPosition.

	super formatAfterDoctypeDeclaration: aDoctypeDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterEndTag: aTagWriter [
	highlighter endTagHighlightPosition: self endPosition.

	super formatAfterEndTag: aTagWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterEntityReference: anEntityReferenceWriter [
	highlighter endEntityReferenceHighlightPosition: self endPosition.

	super formatAfterEntityReference: anEntityReferenceWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterName: aName [
	highlighter endNameHighlightPosition: self endPosition.

	super formatAfterName: aName.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterPI: aPIWriter [
	highlighter endPIHighlightPosition: self endPosition.

	super formatAfterPI: aPIWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterQuotedStringName: aName [
	highlighter endQuotedStringNameHighlightPosition: self endPosition.

	super formatAfterQuotedStringName: aName.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterQuotedStringValue: aString [
	highlighter endQuotedStringHighlightPosition: self endPosition + 1.

	super formatAfterQuotedStringValue: aString.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterStartTag: aTagWriter [
	highlighter endTagHighlightPosition: self endPosition.

	super formatAfterStartTag: aTagWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatAfterXMLDeclaration: anXMLDeclarationWriter [
	highlighter endXMLDeclarationHighlightPosition: self endPosition.

	super formatAfterXMLDeclaration: anXMLDeclarationWriter.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeCData: aCDataWriter [
	super formatBeforeCData: aCDataWriter.

	highlighter startCDataHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeCharacterEscape: aCharacterEscape [
	super formatBeforeCharacterEscape: aCharacterEscape.

	highlighter startEntityReferenceHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeComment: aCommentWriter [
	super formatBeforeComment: aCommentWriter.

	highlighter startCommentHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeDeclaration: aDeclarationWriter [
	super formatBeforeDeclaration: aDeclarationWriter.

	highlighter startDeclarationHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter [
	super formatBeforeDoctypeDeclaration: aDoctypeDeclarationWriter.

	highlighter startDoctypeDeclarationHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeEndTag: aTagWriter [
	super formatBeforeEndTag: aTagWriter.

	highlighter startTagHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeEntityReference: anEntityReferenceWriter [
	super formatBeforeEntityReference: anEntityReferenceWriter.

	highlighter startEntityReferenceHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeName: aName [
	highlighter startNameHighlightPosition: self startPosition.

	super formatBeforeName: aName.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforePI: aPIWriter [
	super formatBeforePI: aPIWriter.

	highlighter startPIHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeQuotedStringName: aName [
	highlighter startQuotedStringNameHighlightPosition: self startPosition.

	super formatBeforeQuotedStringName: aName.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeQuotedStringValue: aString [
	super formatBeforeQuotedStringValue: aString.

	highlighter startQuotedStringHighlightPosition: self startPosition - 1.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeStartTag: aTagWriter [
	super formatBeforeStartTag: aTagWriter.

	highlighter startTagHighlightPosition: self startPosition.
]

{ #category : #formatting }
XMLHighlightingWriterFormatter >> formatBeforeXMLDeclaration: anXMLDeclarationWriter [
	super formatBeforeXMLDeclaration: anXMLDeclarationWriter.

	highlighter startXMLDeclarationHighlightPosition: self startPosition.
]

{ #category : #private }
XMLHighlightingWriterFormatter >> startPosition [
	^ self writer position + 1
]

{ #category : #accessing }
XMLHighlightingWriterFormatter >> writer: aWriter [
	super writer: aWriter.

	highlighter := aWriter highlighter.
]
