Class {
	#name : #XMLNodeFactoryTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-DOM-Factories'
}

{ #category : #testing }
XMLNodeFactoryTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLNodeFactoryTest >> attributeAssociations [
	^ Array
		with: 'one' -> '1'
		with: 'two' -> '2'
]

{ #category : #accessing }
XMLNodeFactoryTest >> attributes [
	^ XMLAttributeDictionary newFrom: self attributeAssociations
]

{ #category : #accessing }
XMLNodeFactoryTest >> factoryClass [
	^ XMLNodeFactory
]

{ #category : #'instance creation' }
XMLNodeFactoryTest >> newFactory [
	^ self factoryClass new
]

{ #category : #accessing }
XMLNodeFactoryTest >> pluggableFactoryClass [
	^ XMLPluggableNodeFactory 
]

{ #category : #source }
XMLNodeFactoryTest >> sampleUserXML [
	^
	XMLWriter new
		enablePrettyPrinting;
		writeWith: [:writer |
			writer pi
				target: 'xml-stylesheet';
				data: 'type="text/css" href="sample.css"'.
			writer comment: 'sample'.
			writer tag
				name: 'user:user';
				xmlnsAt: 'user' put: 'urn:user';
				with: [
					writer
						tag: 'user:username' with: 'jsmith';
						tag: 'user:real-name' with: 'John Smith';
						tag: 'user:date-registered' with: [writer cdata: DateAndTime now printString];
						tag: 'user:date-last-active' with: [writer cdata: DateAndTime now printString];
						tag: 'table-name' with: 'users';
						tag: 'row-id' with: '1000';
						tag: 'serializationFormat' with: 'XML']];
		contents
]

{ #category : #tests }
XMLNodeFactoryTest >> testAsPluggableNodeFactory [
	| factory pluggableFactory |

	factory := self factoryClass new.
	pluggableFactory := factory asPluggableNodeFactory.
	self assert: pluggableFactory class == self pluggableFactoryClass.
	factory class == self pluggableFactoryClass
		ifTrue: [self assert: pluggableFactory == factory]
		ifFalse: [self deny: pluggableFactory == factory].
]

{ #category : #tests }
XMLNodeFactoryTest >> testAttributeDeclarationClass [
	self assert: self newFactory attributeDeclarationClass == XMLAttributeDeclaration
]

{ #category : #tests }
XMLNodeFactoryTest >> testAttributeListClass [
	self assert: self newFactory attributeListClass == XMLCachingAttributeList
]

{ #category : #tests }
XMLNodeFactoryTest >> testCDataClass [
	self assert: self newFactory cdataClass == XMLCData
]

{ #category : #tests }
XMLNodeFactoryTest >> testClassForElement [
	self assert: (self newFactory classForElement: 'test') == XMLElement
]

{ #category : #tests }
XMLNodeFactoryTest >> testClassForElementNamespaceURI [
	self assert:
		(self newFactory
			classForElement: 'test'
			namespaceURI: '') == XMLElement.
	self assert:
		(self newFactory
			classForElement: 'test'
			namespaceURI: 'testNS') == XMLElement.
]

{ #category : #tests }
XMLNodeFactoryTest >> testCommentClass [
	self assert: self newFactory commentClass == XMLComment
]

{ #category : #tests }
XMLNodeFactoryTest >> testDoctypeDeclarationClass [
	self assert: self newFactory doctypeDeclarationClass == XMLDoctypeDeclaration
]

{ #category : #tests }
XMLNodeFactoryTest >> testDocumentClass [
	self assert: self newFactory documentClass == XMLDocument
]

{ #category : #tests }
XMLNodeFactoryTest >> testElementClass [
	self assert: self newFactory elementClass == XMLElement
]

{ #category : #tests }
XMLNodeFactoryTest >> testElementDeclarationClass [
	self assert: self newFactory elementDeclarationClass == XMLElementDeclaration
]

{ #category : #tests }
XMLNodeFactoryTest >> testGeneralEntityDeclarationClass [
	self assert:
		self newFactory generalEntityDeclarationClass ==
			XMLGeneralEntityDeclaration
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewCData [
	| cdata |

	cdata := self newFactory newCData: 'test'.
	self
		assert: cdata class == XMLCData;
		assert: cdata string = 'test'.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewComment [
	| comment |

	comment := self newFactory newComment: 'test'.
	self
		assert: comment class == XMLComment;
		assert: comment string = 'test'.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewDocument [
	self assert: self newFactory newDocument class == XMLDocument
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewElement [
	self assert: self newFactory newElement class == XMLElement
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewElementNamed [
	| element |

	element := self newFactory newElementNamed: 'test'.
	self
		assert: element class == XMLElement;
		assert: element name = 'test'.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewElementNamedAttributes [
	| element |

	element :=
		self newFactory
			newElementNamed: 'test'
			attributes: self attributeAssociations.
	self
		assert: element class == XMLElement;
		assert: element name = 'test';
		assert: element attributes = self attributes
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewElementNamedNamespaceURI [
	| element |

	element :=
		self newFactory
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'.
	self
		assert: element class == XMLElement;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS'.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewElementNamedNamespaceURIAttributes [
	| element |

	element :=
		self newFactory
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'
			attributes: self attributeAssociations.
	self
		assert: element class == XMLElement;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS';
		assert: element attributes = self attributes.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewPI [
	self assert: self newFactory newPI class == XMLPI
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewPITargetData [
	| pi |

	pi :=
		self newFactory
			newPITarget: 'target'
			data: 'data'.
	self
		assert: pi class == XMLPI;
		assert: pi target = 'target';
		assert: pi data = 'data'.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNewStringNode [
	| cdata |

	cdata := self newFactory newStringNode: 'test'.
	self
		assert: cdata class == XMLString;
		assert: cdata string = 'test'.
]

{ #category : #tests }
XMLNodeFactoryTest >> testNodeListClass [
	self assert: self newFactory nodeListClass == XMLNodeList
]

{ #category : #tests }
XMLNodeFactoryTest >> testNotationDeclarationClass [
	self assert: self newFactory notationDeclarationClass == XMLNotationDeclaration
]

{ #category : #tests }
XMLNodeFactoryTest >> testPIClass [
	self assert: self newFactory piClass == XMLPI
]

{ #category : #tests }
XMLNodeFactoryTest >> testParameterEntityDeclarationClass [
	self assert:
		self newFactory parameterEntityDeclarationClass ==
			XMLParameterEntityDeclaration
]

{ #category : #tests }
XMLNodeFactoryTest >> testStringNodeClass [
	self assert: self newFactory stringNodeClass == XMLString
]
