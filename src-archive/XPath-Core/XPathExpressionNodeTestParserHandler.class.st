"
This is a handler class used by the expression parser for parsing node tests that are part of location path steps. It forwards its handler messages to the expression parser handler and returns a boolean as its parsing result indicating if a node test was successfully parsed.
"
Class {
	#name : #XPathExpressionNodeTestParserHandler,
	#superclass : #XPathNodeTestParserHandler,
	#instVars : [
		'currentAxis',
		'expressionParserHandler'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #'instance creation' }
XPathExpressionNodeTestParserHandler class >> currentAxis: anAxis expressionParserHandler: anExpressionParserHandler [
	^ self new
		setCurrentAxis: anAxis
		expressionParserHandler: anExpressionParserHandler
]

{ #category : #defaults }
XPathExpressionNodeTestParserHandler >> defaultNodeTestParserStateClass [
	^ currentAxis defaultNodeTestParserStateClass
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAnyNodeTest [
	self startNodeTest.
	expressionParserHandler handleAnyNodeTest.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTest [
	self startNodeTest.
	expressionParserHandler handleAttributeNodeTest.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTestForLocalName: aLocalName [
	self startNodeTest.
	expressionParserHandler handleAttributeNodeTestForLocalName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTestForName: aName [
	self startNodeTest.
	expressionParserHandler handleAttributeNodeTestForName: aName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI [
	self startNodeTest.
	expressionParserHandler handleAttributeNodeTestForNamespaceURI: aURI.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI localName: aLocalName [
	self startNodeTest.
	expressionParserHandler
		handleAttributeNodeTestForNamespaceURI: aURI
		localName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTestForPrefix: aPrefix [
	self startNodeTest.
	expressionParserHandler handleAttributeNodeTestForPrefix: aPrefix.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleAttributeNodeTestForPrefix: aPrefix localName: aLocalName [
	self startNodeTest.
	expressionParserHandler
		handleAttributeNodeTestForPrefix: aPrefix
		localName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleCommentNodeTest [
	self startNodeTest.
	expressionParserHandler handleCommentNodeTest.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTest [
	self startNodeTest.
	expressionParserHandler handleElementNodeTest.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTestForLocalName: aLocalName [
	self startNodeTest.
	expressionParserHandler handleElementNodeTestForLocalName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTestForName: aName [
	self startNodeTest.
	expressionParserHandler handleElementNodeTestForName: aName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTestForNamespaceURI: aURI [
	self startNodeTest.
	expressionParserHandler handleElementNodeTestForNamespaceURI: aURI.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTestForNamespaceURI: aURI localName: aLocalName [
	self startNodeTest.
	expressionParserHandler
		handleElementNodeTestForNamespaceURI: aURI
		localName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTestForPrefix: aPrefix [
	self startNodeTest.
	expressionParserHandler handleElementNodeTestForPrefix: aPrefix.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleElementNodeTestForPrefix: aPrefix localName: aLocalName [
	self startNodeTest.
	expressionParserHandler
		handleElementNodeTestForPrefix: aPrefix
		localName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTest [
	self startNodeTest.
	expressionParserHandler handleNamespaceNodeTest.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTestForLocalName: aLocalName [
	self startNodeTest.
	expressionParserHandler handleNamespaceNodeTestForLocalName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTestForName: aName [
	self startNodeTest.
	expressionParserHandler handleNamespaceNodeTestForName: aName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI [
	self startNodeTest.
	expressionParserHandler handleNamespaceNodeTestForNamespaceURI: aURI.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI localName: aLocalName [
	self startNodeTest.
	expressionParserHandler
		handleNamespaceNodeTestForNamespaceURI: aURI
		localName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix [
	self startNodeTest.
	expressionParserHandler handleNamespaceNodeTestForPrefix: aPrefix.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix localName: aLocalName [
	self startNodeTest.
	expressionParserHandler
		handleNamespaceNodeTestForPrefix: aPrefix
		localName: aLocalName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handlePINodeTest [
	self startNodeTest.
	expressionParserHandler handlePINodeTest.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handlePINodeTestForName: aName [
	self startNodeTest.
	expressionParserHandler handlePINodeTestForName: aName.
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleStartParsing [
	self parsingResult: false
]

{ #category : #handling }
XPathExpressionNodeTestParserHandler >> handleTextNodeTest [
	self startNodeTest.
	expressionParserHandler handleTextNodeTest.
]

{ #category : #testing }
XPathExpressionNodeTestParserHandler >> mustBeAtEndAfterParsing [
	^ false
]

{ #category : #initialization }
XPathExpressionNodeTestParserHandler >> setCurrentAxis: anAxis expressionParserHandler: anExpressionParserHandler [
	currentAxis := anAxis.
	expressionParserHandler := anExpressionParserHandler.
]

{ #category : #private }
XPathExpressionNodeTestParserHandler >> startNodeTest [
	self parsingResult: true.
	currentAxis isStartOfRelativeLocationPath
		ifTrue: [expressionParserHandler handleStartRelativeLocationPath].
	expressionParserHandler
		handleStartStep;
		perform: currentAxis handlerSelector.
	currentAxis beDefaultImplicitAxis.
]
