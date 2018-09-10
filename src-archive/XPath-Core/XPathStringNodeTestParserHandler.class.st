"
A handler for node tests that occur in string arguments to the axis selectors defined in the ""enumerating - axis"" category of XMLNode and subclasses. It converts them to node test blocks.
"
Class {
	#name : #XPathStringNodeTestParserHandler,
	#superclass : #XPathNodeTestParserHandler,
	#instVars : [
		'defaultNodeTestParserStateClass'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #'instance creation' }
XPathStringNodeTestParserHandler class >> withAttributePrincipalNodeType [
	^ self new defaultNodeTestParserStateClass: XPathNodeTestParserAttributeState
]

{ #category : #'instance creation' }
XPathStringNodeTestParserHandler class >> withElementPrincipalNodeType [
	^ self new defaultNodeTestParserStateClass: XPathNodeTestParserElementState
]

{ #category : #'instance creation' }
XPathStringNodeTestParserHandler class >> withNamespacePrincipalNodeType [
	^ self new defaultNodeTestParserStateClass: XPathNodeTestParserNamespaceState
]

{ #category : #defaults }
XPathStringNodeTestParserHandler >> defaultNodeTestParserStateClass [
	^ defaultNodeTestParserStateClass
]

{ #category : #defaults }
XPathStringNodeTestParserHandler >> defaultNodeTestParserStateClass: aClass [
	defaultNodeTestParserStateClass := aClass
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAnyNodeTest [
	self parsingResult: XPathAnyNodeTest new
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTest [
	self parsingResult: XPathAttributeNodeTest new
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTestForLocalName: aLocalName [
	self parsingResult:
		(XPathAttributeNodeTestForLocalName localName: aLocalName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTestForName: aName [
	self parsingResult:
		(XPathAttributeNodeTestForName name: aName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI [
	self parsingResult:
		(XPathAttributeNodeTestForNamespaceURI namespaceURI: aURI)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI localName: aLocalName [
	self parsingResult:
		(XPathAttributeNodeTestForNamespaceURIAndLocalName
			namespaceURI: aURI
			localName: aLocalName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTestForPrefix: aPrefix [
	self parsingResult:
		(XPathAttributeNodeTestForPrefix prefix: aPrefix)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleAttributeNodeTestForPrefix: aPrefix localName: aLocalName [
	self parsingResult:
		(XPathAttributeNodeTestForName name:
			(aLocalName qualifyWithXMLPrefix: aPrefix))
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleCommentNodeTest [
	self parsingResult: XPathCommentNodeTest new
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTest [
	self parsingResult: XPathElementNodeTest new
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTestForLocalName: aLocalName [
	self parsingResult:
		(XPathElementNodeTestForLocalName localName: aLocalName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTestForName: aName [
	self parsingResult:
		(XPathElementNodeTestForName name: aName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTestForNamespaceURI: aURI [
	self parsingResult:
		(XPathElementNodeTestForNamespaceURI namespaceURI: aURI)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTestForNamespaceURI: aURI localName: aLocalName [
	self parsingResult:
		(XPathElementNodeTestForNamespaceURIAndLocalName
			namespaceURI: aURI
			localName: aLocalName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTestForPrefix: aPrefix [
	self parsingResult:
		(XPathElementNodeTestForPrefix prefix: aPrefix)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleElementNodeTestForPrefix: aPrefix localName: aLocalName [
	self parsingResult:
		(XPathElementNodeTestForName name:
			(aLocalName qualifyWithXMLPrefix: aPrefix))
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleEmptyNodeTest [
	XPathSyntaxException signal:
		'String arguments to axis selectors must contain node tests'
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTest [
	self parsingResult: XPathNamespaceTest new
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTestForLocalName: aLocalName [
	self parsingResult:
		(XPathNamespaceTestForLocalName localName: aLocalName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTestForName: aName [
	self parsingResult:
		(XPathNamespaceTestForName name: aName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI [
	self parsingResult:
		(XPathNamespaceTestForNamespaceURI namespaceURI: aURI)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI localName: aLocalName [
	self parsingResult:
		(XPathNamespaceTestForNamespaceURIAndLocalName
			namespaceURI: aURI
			localName: aLocalName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix [
	self parsingResult:
		(XPathNamespaceTestForPrefix prefix: aPrefix)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix localName: aLocalName [
	self parsingResult:
		(XPathNamespaceTestForName name:
			(aLocalName qualifyWithXMLPrefix: aPrefix))
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handlePINodeTest [
	self parsingResult: XPathPINodeTest new
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handlePINodeTestForName: aName [
	self parsingResult:
		(XPathPINodeTestForName name: aName)
]

{ #category : #handling }
XPathStringNodeTestParserHandler >> handleTextNodeTest [
	self parsingResult: XPathTextNodeTest new
]
