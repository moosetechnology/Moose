"
A highlighting XML document text style decorator for editing the ""outer"" XML of a document or document node.
"
Class {
	#name : #GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator,
	#superclass : #GLMXMLDocumentHighlighterTextStylerDecorator,
	#instVars : [
		'outerXMLNode',
		'document'
	],
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #private }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator class >> outerXMLNode: aNode [
	^ self new outerXMLNode: aNode
]

{ #category : #accessing }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator >> document [
	^ document
]

{ #category : #accessing }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator >> document: aDocument [
	document := aDocument
]

{ #category : #accessing }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator >> encoding [
	^ super encoding
		ifEmpty: [
			self document
				ifNil: ['']
				ifNotNil: [:node | node encoding]]
]

{ #category : #private }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator >> newHighlightingParserFromHandler: aHighlightingParserHandler [
	| parser rootElement |

	parser := super newHighlightingParserFromHandler: aHighlightingParserHandler.

	self document
		ifNotNil: [
			parser driver isStandalone: self document isStandalone.
			self document hasDoctypeDefinition
				ifTrue: [
					parser driver doctypeDefinition
						addGeneralEntitiesFrom: self document doctypeDefinition]].

	self outerXMLNode isElement
		ifTrue: [rootElement := self outerXMLNode]
		ifFalse: [
			(self outerXMLNode hasParent
				and: [self outerXMLNode parent isElement])
				ifTrue: [rootElement := self outerXMLNode parent]].
	rootElement
		ifNotNil: [
			parser driver currentElement: rootElement name.
			rootElement hasNamespaces
				ifTrue: [parser driver currentScope: rootElement namespaceScope]].

	parser state: self outerXMLNode parent newInnerXMLState.
	parser state isContentState
		ifTrue: [aHighlightingParserHandler startContent].

	^ parser.
]

{ #category : #accessing }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator >> outerXMLNode [
	^ outerXMLNode
]

{ #category : #accessing }
GLMXMLOuterXMLDocumentHighlighterTextStylerDecorator >> outerXMLNode: aNode [
	outerXMLNode := aNode.
	"the document is saved because this node will be replaced and removed
	from it when the edited source is accepted, and the encoding is needed
	from it if the source is being saved to a file"
	self
		configuration: aNode configuration;
		document: aNode document
]
