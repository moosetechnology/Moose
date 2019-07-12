"
This class is an XML parser that can convert its input to Text objects styled with highlighting after parsing.
"
Class {
	#name : #XMLHighlightingParser,
	#superclass : #SAXPositionHandler,
	#instVars : [
		'highlighter',
		'encoding'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #converting }
XMLHighlightingParser >> asHighlightedText [
	| text |

	text := self input asString asText.
	highlighter highlightText: text.
	^ text.
]

{ #category : #converting }
XMLHighlightingParser >> asHighlightedTextColored: aTextColor startingAt: aPosition [
	| text |

	text := self asHighlightedText.
	highlighter
		highlightText: text
		withColor: aTextColor
		startingAt: aPosition.
	^ text.
]

{ #category : #accessing }
XMLHighlightingParser >> encoding [
	^ encoding
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endCDataPosition: aPosition [
	highlighter endCDataHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endCommentPosition: aPosition [
	highlighter endCommentHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endDeclarationPosition: aPosition [
	highlighter endDeclarationHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endDoctypeDeclarationPosition: aPosition [
	highlighter endDoctypeDeclarationHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endEntityReferencePosition: aPosition [
	highlighter endEntityReferenceHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endNamePosition: aPosition [
	highlighter endNameHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endPIPosition: aPosition [
	highlighter endPIHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endQuotedStringNamePosition: aPosition [
	highlighter endQuotedStringNameHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endQuotedStringPosition: aPosition [
	highlighter endQuotedStringHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endTagPosition: aPosition [
	highlighter endTagHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> endXMLDeclarationPosition: aPosition [
	highlighter endXMLDeclarationHighlightPosition: aPosition
]

{ #category : #accessing }
XMLHighlightingParser >> highlighter [
	^ highlighter
]

{ #category : #initialization }
XMLHighlightingParser >> on: aStringOrStream [
	super on: aStringOrStream.

	highlighter := XMLDocumentHighlighter new.
	encoding := ''.
]

{ #category : #parsing }
XMLHighlightingParser >> parsingResult [
	^ self asHighlightedText
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startCDataPosition: aPosition [
	highlighter startCDataHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startCommentPosition: aPosition [
	highlighter startCommentHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startDeclarationPosition: aPosition [
	highlighter startDeclarationHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startDoctypeDeclarationPosition: aPosition [
	highlighter startDoctypeDeclarationHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startEntityReferencePosition: aPosition [
	highlighter startEntityReferenceHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startNamePosition: aPosition [
	highlighter startNameHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startPIPosition: aPosition [
	highlighter startPIHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startQuotedStringNamePosition: aPosition [
	highlighter startQuotedStringNameHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startQuotedStringPosition: aPosition [
	highlighter startQuotedStringHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startTagPosition: aPosition [
	highlighter startTagHighlightPosition: aPosition
]

{ #category : #'handling - positions' }
XMLHighlightingParser >> startXMLDeclarationPosition: aPosition [
	highlighter startXMLDeclarationHighlightPosition: aPosition
]

{ #category : #'handling - lexical' }
XMLHighlightingParser >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	encoding := anEncoding
]
