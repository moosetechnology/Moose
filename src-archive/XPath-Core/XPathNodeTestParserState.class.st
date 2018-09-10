"
This is an abstract base class for node test parser states. Instances of subclasses are immutable and shared.
"
Class {
	#name : #XPathNodeTestParserState,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #accessing }
XPathNodeTestParserState class >> instance [
	^ instance
		ifNil: [instance := self basicNew initialize]
]

{ #category : #'instance creation' }
XPathNodeTestParserState class >> new [
	"these classes are immutable and shared, so they are only initialized once"
	^ self instance
]

{ #category : #handling }
XPathNodeTestParserState >> handleAnyNodeTestWith: aHandler [
	aHandler handleAnyNodeTest
]

{ #category : #handling }
XPathNodeTestParserState >> handleCommentNodeTestWith: aHandler [
	aHandler handleCommentNodeTest
]

{ #category : #handling }
XPathNodeTestParserState >> handleEmptyNodeTestWith: aHandler [
	aHandler handleEmptyNodeTest
]

{ #category : #handling }
XPathNodeTestParserState >> handleNodeTestForLocalName: aLocalName with: aHandler [
	self subclassResponsibility
]

{ #category : #handling }
XPathNodeTestParserState >> handleNodeTestForName: aName with: aHandler [
	self subclassResponsibility

]

{ #category : #handling }
XPathNodeTestParserState >> handleNodeTestForNamespaceURI: aURI localName: aLocalName with: aHandler [
	self subclassResponsibility
]

{ #category : #handling }
XPathNodeTestParserState >> handleNodeTestForNamespaceURI: aURI with: aHandler [
	self subclassResponsibility
]

{ #category : #handling }
XPathNodeTestParserState >> handleNodeTestForPrefix: aPrefix localName: aLocalName with: aHandler [
	self subclassResponsibility
]

{ #category : #handling }
XPathNodeTestParserState >> handleNodeTestForPrefix: aPrefix with: aHandler [
	self subclassResponsibility
]

{ #category : #handling }
XPathNodeTestParserState >> handlePINodeTestForName: aName with: aHandler [
	aHandler handlePINodeTestForName: aName
]

{ #category : #handling }
XPathNodeTestParserState >> handlePINodeTestWith: aHandler [
	aHandler handlePINodeTest
]

{ #category : #handling }
XPathNodeTestParserState >> handleTextNodeTestWith: aHandler [
	aHandler handleTextNodeTest
]

{ #category : #handling }
XPathNodeTestParserState >> handleWildcardNodeTestWith: aHandler [
	self subclassResponsibility
]
