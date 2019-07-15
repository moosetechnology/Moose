"
This class is a highlighter to highlight XML document Text objects using XMLHighlights.
"
Class {
	#name : #XMLDocumentHighlighter,
	#superclass : #XMLHighlighter,
	#instVars : [
		'xmlDeclarationColor',
		'doctypeDeclarationColor',
		'declarationColor',
		'piColor',
		'tagColor',
		'nameColor',
		'quotedStringNameColor',
		'quotedStringColor',
		'entityReferenceColor',
		'cdataColor',
		'commentColor',
		'xmlDeclarationHighlight',
		'doctypeDeclarationHighlight',
		'declarationHighlight',
		'piHighlight',
		'tagHighlight',
		'nameHighlight',
		'quotedStringNameHighlight',
		'quotedStringHighlight',
		'entityReferenceHighlight',
		'cdataHighlight',
		'commentHighlight'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting'
}

{ #category : #accessing }
XMLDocumentHighlighter >> cdataColor [
	^ cdataColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> cdataColor: aTextColor [
	cdataColor := aTextColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> commentColor [
	^ commentColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> commentColor: aTextColor [
	commentColor := aTextColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> declarationColor [
	^ declarationColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> declarationColor: aTextColor [
	declarationColor := aTextColor
]

{ #category : #defaults }
XMLDocumentHighlighter >> defaultsClass [
	^ XMLDocumentHighlightDefaults
]

{ #category : #accessing }
XMLDocumentHighlighter >> doctypeDeclarationColor [
	^ doctypeDeclarationColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> doctypeDeclarationColor: aTextColor [
	doctypeDeclarationColor := aTextColor
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endCDataHighlightPosition: aPosition [
	self
		endHighlight: cdataHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endCommentHighlightPosition: aPosition [
	self
		endHighlight: commentHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endDeclarationHighlightPosition: aPosition [
	self
		endHighlight: declarationHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endDoctypeDeclarationHighlightPosition: aPosition [
	self
		endHighlight: doctypeDeclarationHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endEntityReferenceHighlightPosition: aPosition [
	self
		endHighlight: entityReferenceHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endNameHighlightPosition: aPosition [
	self
		endHighlight: nameHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endPIHighlightPosition: aPosition [
	self
		endHighlight: piHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endQuotedStringHighlightPosition: aPosition [
	self
		endHighlight: quotedStringHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endQuotedStringNameHighlightPosition: aPosition [
	self
		endHighlight: quotedStringNameHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endTagHighlightPosition: aPosition [
	self
		endHighlight: tagHighlight
		position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> endXMLDeclarationHighlightPosition: aPosition [
	self
		endHighlight: xmlDeclarationHighlight
		position: aPosition
]

{ #category : #accessing }
XMLDocumentHighlighter >> entityReferenceColor [
	^ entityReferenceColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> entityReferenceColor: aTextColor [
	entityReferenceColor := aTextColor
]

{ #category : #initialization }
XMLDocumentHighlighter >> initializeColorsWithDefaults: aDefaults [
	super initializeColorsWithDefaults: aDefaults.

	self
		xmlDeclarationColor: aDefaults xmlDeclarationColor;
		doctypeDeclarationColor: aDefaults doctypeDeclarationColor;
		piColor: aDefaults piColor;
		declarationColor: aDefaults declarationColor;
		tagColor: aDefaults tagColor;
		nameColor: aDefaults nameColor;
		quotedStringNameColor: aDefaults quotedStringNameColor;
		quotedStringColor: aDefaults quotedStringColor;
		entityReferenceColor: aDefaults entityReferenceColor;
		commentColor: aDefaults commentColor;
		cdataColor: aDefaults cdataColor.
]

{ #category : #accessing }
XMLDocumentHighlighter >> nameColor [
	^ nameColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> nameColor: aTextColor [
	nameColor := aTextColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> piColor [
	^ piColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> piColor: aTextColor [
	piColor := aTextColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> quotedStringColor [
	^ quotedStringColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> quotedStringColor: aTextColor [
	quotedStringColor := aTextColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> quotedStringNameColor [
	^ quotedStringNameColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> quotedStringNameColor: aTextColor [
	quotedStringNameColor := aTextColor
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startCDataHighlightPosition: aPosition [
	cdataHighlight :=
		self
			newHighlightColor: self cdataColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startCommentHighlightPosition: aPosition [
	commentHighlight :=
		self
			newHighlightColor: self commentColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startDeclarationHighlightPosition: aPosition [
	declarationHighlight :=
		self
			newHighlightColor: self declarationColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startDoctypeDeclarationHighlightPosition: aPosition [
	doctypeDeclarationHighlight :=
		self
			newHighlightColor: self doctypeDeclarationColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startEntityReferenceHighlightPosition: aPosition [
	entityReferenceHighlight :=
		self
			newHighlightColor: self entityReferenceColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startNameHighlightPosition: aPosition [
	nameHighlight :=
		self
			newHighlightColor: self nameColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startPIHighlightPosition: aPosition [
	piHighlight :=
		self
			newHighlightColor: self piColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startQuotedStringHighlightPosition: aPosition [
	quotedStringHighlight :=
		self
			newHighlightColor: self quotedStringColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startQuotedStringNameHighlightPosition: aPosition [
	quotedStringNameHighlight :=
		self
			newHighlightColor: self quotedStringNameColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startTagHighlightPosition: aPosition [
	tagHighlight :=
		self
			newHighlightColor: self tagColor
			position: aPosition
]

{ #category : #'highlighting - positions' }
XMLDocumentHighlighter >> startXMLDeclarationHighlightPosition: aPosition [
	xmlDeclarationHighlight :=
		self
			newHighlightColor: self xmlDeclarationColor
			position: aPosition
]

{ #category : #accessing }
XMLDocumentHighlighter >> tagColor [
	^ tagColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> tagColor: aTextColor [
	tagColor := aTextColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> xmlDeclarationColor [
	^ xmlDeclarationColor
]

{ #category : #accessing }
XMLDocumentHighlighter >> xmlDeclarationColor: aTextColor [
	xmlDeclarationColor := aTextColor
]
