"
This class is an XML parser that parses XML into a tree of nodes with an XMLDocument node as the root:
	document := XMLDOMParser parse: xmlStringOrStream.

See the XML-Parser-DOM category for info on the node classes.

By default, XML comments are ignored during parsing and ""<![CDATA[...]]>"" sections are merged with adjacent character data as XMLString nodes. Use #preservesCommentNodes: or #preservesCDataNodes: before parsing to change this. You can also use #preservesIgnorableWhitespace: to preserve ignorable whitespace as XMLString nodes, but this requires a DTD with <!ELEMENT> declarations to distinguish ignorable and unignorable whitespace.

To control what node classes the parser uses to construct the tree, inject a custom node factory with #nodeFactory: prior to parsing. See XMLNodeFactory.

See the superclass for more info.
"
Class {
	#name : #XMLDOMParser,
	#superclass : #SAXHandler,
	#instVars : [
		'document',
		'nodeStack',
		'currentScope'
	],
	#category : #'XML-Parser'
}

{ #category : #'handling - declaration' }
XMLDOMParser >> attributeDeclaration: anElementName name: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	self topNodeAdd:
		(self nodeFactory attributeDeclarationClass
			element: anElementName
			attribute: anAttributeName
			type: aType
			defaultPragma: aDefaultPragma
			defaultValue: aDefaultValue)
]

{ #category : #'handling - content' }
XMLDOMParser >> characters: aString [
	(self isInCDataSection
		and: [self preservesCDataNodes])
		ifTrue: [self topNodeAdd: (self nodeFactory newCData: aString)]
		ifFalse: [self topNodeAddString: aString]
]

{ #category : #'handling - lexical' }
XMLDOMParser >> comment: aString [
	self preservesCommentNodes
		ifTrue: [self topNodeAdd: (self nodeFactory newComment: aString)]
]

{ #category : #defaults }
XMLDOMParser >> configurationClass [
	^ XMLDOMConfiguration
]

{ #category : #private }
XMLDOMParser >> doctypeDefinition: aDoctypeDefinition [
	self document doctypeDefinition: aDoctypeDefinition
]

{ #category : #accessing }
XMLDOMParser >> document [
	^ document
]

{ #category : #accessing }
XMLDOMParser >> document: aDocument [
	document := aDocument
]

{ #category : #'handling - declaration' }
XMLDOMParser >> elementDeclaration: anElementName contentModel: aContentModel [
	self topNodeAdd:
		(self nodeFactory elementDeclarationClass
			element: anElementName
			contentModel: aContentModel)
]

{ #category : #'handling - lexical' }
XMLDOMParser >> endDTD [
	self popNode
]

{ #category : #'handling - content' }
XMLDOMParser >> endDocument [
	"nodeStack is not popped here for efficiency because #document keeps
	a reference to the root too, and there may not be a root to pop
	anyway if it's an inner XML parser"
]

{ #category : #'handling - content' }
XMLDOMParser >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self popNode
]

{ #category : #'handling - declaration' }
XMLDOMParser >> generalEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	self topNodeAdd:
		(self nodeFactory generalEntityDeclarationClass
			name: aName
			publicID: aPublicID
			systemID: aSystemID
			ndata: aNotationName)
]

{ #category : #'handling - declaration' }
XMLDOMParser >> generalEntityDeclaration: aName replacement: aReplacement [
	self topNodeAdd:
		(self nodeFactory generalEntityDeclarationClass
			name: aName
			replacement: aReplacement)
]

{ #category : #'handling - content' }
XMLDOMParser >> ignorableWhitespace: aString [
	self preservesIgnorableWhitespace
		ifTrue: [self characters: aString]
]

{ #category : #initialization }
XMLDOMParser >> initializeInnerXMLParser: aParser [
	self document
		ifNotNil: [
			aParser driver isStandalone: self document isStandalone.
			self document hasDoctypeDefinition
				ifTrue: [
					aParser driver doctypeDefinition addGeneralEntitiesFrom:
						self document doctypeDefinition]].

	self nodeStack do: [:each |
		each isElement
			ifTrue: [
				self
					startInnerXMLElement: each
					forParser: aParser]].

	aParser state: self topNode newInnerXMLState.
	aParser state isContentState
		ifTrue: [self startContent].
]

{ #category : #initialization }
XMLDOMParser >> initializeParser: aParser [
	super initializeParser: aParser.

	self nodeStack size > 0
		ifTrue: [self initializeInnerXMLParser: aParser].
]

{ #category : #private }
XMLDOMParser >> innerXMLRootNode: aRootNode [
	self
		configuration: aRootNode configuration;
		document: aRootNode document;
		pushNode: aRootNode
]

{ #category : #configuring }
XMLDOMParser >> nodeFactory [
	^ self configuration nodeFactory
]

{ #category : #configuring }
XMLDOMParser >> nodeFactory: aNodeFactory [
	self configuration nodeFactory: aNodeFactory
]

{ #category : #deprecated }
XMLDOMParser >> nodeListClass [
	"will be deprecated"
	^ self configuration nodeListClass
]

{ #category : #deprecated }
XMLDOMParser >> nodeListClass: aClass [
	"will be deprecated"
	self configuration nodeListClass: aClass
]

{ #category : #private }
XMLDOMParser >> nodeStack [
	^ nodeStack
]

{ #category : #'handling - declaration' }
XMLDOMParser >> notationDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self topNodeAdd:
		(self nodeFactory notationDeclarationClass
			name: aName
			publicID: aPublicID
			systemID: aSystemID)
]

{ #category : #initialization }
XMLDOMParser >> on: aStringOrStream [
	super on: aStringOrStream.

	document := nil.
	nodeStack := OrderedCollection new: 10.
	currentScope := nil.
]

{ #category : #configuring }
XMLDOMParser >> optimizeForLargeDocuments [
	super optimizeForLargeDocuments.

	"use the non-caching attribute list class to save memory"
	self configuration attributeListClass: XMLAttributeList.
]

{ #category : #'handling - declaration' }
XMLDOMParser >> parameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self topNodeAdd:
		(self nodeFactory parameterEntityDeclarationClass
			name: aName
			publicID: aPublicID
			systemID: aSystemID)
]

{ #category : #'handling - declaration' }
XMLDOMParser >> parameterEntityDeclaration: aName replacement: aReplacement [
	self topNodeAdd:
		(self nodeFactory parameterEntityDeclarationClass
			name: aName
			replacement: aReplacement)
]

{ #category : #parsing }
XMLDOMParser >> parsingResult [
	^ self document
]

{ #category : #private }
XMLDOMParser >> popNode [
	^ self nodeStack removeLast
]

{ #category : #configuring }
XMLDOMParser >> preservesCDataNodes [
	^ self configuration preservesCDataNodes
]

{ #category : #configuring }
XMLDOMParser >> preservesCDataNodes: aBoolean [
	"if enabled, <![CDATA[...]]> sections will be preserved as CDATA nodes
	and not ordinary string nodes and won't be merged with adjacent string
	nodes (not default)"
	self configuration preservesCDataNodes: aBoolean
]

{ #category : #configuring }
XMLDOMParser >> preservesCommentNodes [
	^ self configuration preservesCommentNodes
]

{ #category : #configuring }
XMLDOMParser >> preservesCommentNodes: aBoolean [
	"if enabled, comments will be preserved as comment nodes (not default)"
	self configuration preservesCommentNodes: aBoolean
]

{ #category : #configuring }
XMLDOMParser >> preservesIgnorableWhitespace [
	^ self configuration preservesIgnorableWhitespace
]

{ #category : #configuring }
XMLDOMParser >> preservesIgnorableWhitespace: aBoolean [
	"If enabled, ignorable whitespace (identified by DTD element declarations
	with element content) will be preserved as string nodes. Enables validation.
	(Not default)"

	self configuration preservesIgnorableWhitespace: aBoolean
]

{ #category : #'handling - content' }
XMLDOMParser >> processingInstruction: aTargetString data: aDataString [
	self topNodeAdd:
		(self nodeFactory newPI
			target: aTargetString;
			data: aDataString)
]

{ #category : #private }
XMLDOMParser >> pushElement: anElement [
	self topNodeAdd: anElement.
	^ self pushNode: anElement.
]

{ #category : #private }
XMLDOMParser >> pushNode: aNode [
	^ self nodeStack addLast: aNode

]

{ #category : #'handling - lexical' }
XMLDOMParser >> startDTD: aRootElementName publicID: aPublicID systemID: aSystemID [
	| doctypeDeclaration |

	doctypeDeclaration := 
		self nodeFactory doctypeDeclarationClass
			root: aRootElementName
			publicID: aPublicID
			systemID: aSystemID.
	self pushNode: doctypeDeclaration.
	self document doctypeDeclaration: doctypeDeclaration.
]

{ #category : #'handling - content' }
XMLDOMParser >> startDocument [
	"inner XML parsers should ignore this event"
	self nodeStack size > 0
		ifFalse: [
			self
				document: self nodeFactory newDocument;
				pushNode: self document.

			self document configuration: self configuration]
]

{ #category : #'handling - content' }
XMLDOMParser >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self pushElement:
		((self nodeFactory
			classForElement: aQualifiedName
			namespaceURI: aURI
			localName: aLocalName
			attributes: anAttributeDictionary) new
				setConfiguration: self configuration
				name: aQualifiedName
				localName: aLocalName
				attributes: anAttributeDictionary
				namespaceScope: currentScope)
]

{ #category : #private }
XMLDOMParser >> startInnerXMLElement: anElement forParser: aParser [
	aParser driver currentElement: anElement name.
	anElement hasNamespaces
		ifTrue: [aParser driver currentScope: anElement namespaceScope].
]

{ #category : #private }
XMLDOMParser >> startScope: aNamespaceScope [
	currentScope := aNamespaceScope
]

{ #category : #accessing }
XMLDOMParser >> topNode [
	^ self nodeStack xmlLastOrNil
]

{ #category : #private }
XMLDOMParser >> topNodeAdd: aNode [
	^ self nodeStack last addNode: aNode
]

{ #category : #private }
XMLDOMParser >> topNodeAddString: aString [
	^ self nodeStack last addString: aString
]

{ #category : #'handling - lexical' }
XMLDOMParser >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	self document ifNotNil: [
		self document
			version: aVersionFloat;
			encoding: anEncoding;
			isStandalone: aBoolean]
]
