"
This is a base class for node tests.
"
Class {
	#name : #XMLNodeTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLNodeTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #assertions }
XMLNodeTest >> assertElement: anElement hasAttributes: anAssociationCollection [
	| attributeNodes |

	self assert: anElement attributeNodes size = anAssociationCollection size.
	attributeNodes := anElement attributeNodes copy.
	anAssociationCollection associationsDo: [:each | | attributeNode |
		attributeNode := attributeNodes removeFirst.
		self
			assert: attributeNode name = each key;
			assert: attributeNode value = each value].
]

{ #category : #assertions }
XMLNodeTest >> assertList: aList collects: aSecondList [
	self
		assert: aList = aSecondList;
		assert: aList class == self collectListClass.
]

{ #category : #assertions }
XMLNodeTest >> assertList: aList selects: aSecondList [
	self
		assert: aList = aSecondList;
		assert: aList class == self selectListClass.
]

{ #category : #accessing }
XMLNodeTest >> attributeAssociations [
	^ Array
		with: 'one' -> '1'
		with: 'two' -> '2'
		with: 'prefix:two' -> '3'  "different from 'two', because of the prefix"
		with: 'prefix:four' -> '4'
]

{ #category : #accessing }
XMLNodeTest >> attributeClass [
	^ XMLAttribute
]

{ #category : #accessing }
XMLNodeTest >> attributeListClass [
	^ XMLCachingAttributeList
]

{ #category : #accessing }
XMLNodeTest >> attributeNames [
	^ self attributeAssociations collect: [:each | each key]
]

{ #category : #accessing }
XMLNodeTest >> attributeValues [
	^ self attributeAssociations collect: [:each | each value]
]

{ #category : #accessing }
XMLNodeTest >> attributes [
	^ self attributesClass newFrom: self attributeAssociations
]

{ #category : #accessing }
XMLNodeTest >> attributesClass [
	^ OrderPreservingStringDictionary
]

{ #category : #accessing }
XMLNodeTest >> collectListClass [
	^ XMLOrderedList
]

{ #category : #accessing }
XMLNodeTest >> elementClass [
	^ XMLElement
]

{ #category : #accessing }
XMLNodeTest >> escapedString [
	^ '&lt;test name="&amp;name;"&gt;''&amp;value;''&lt;/test&gt;'
]

{ #category : #accessing }
XMLNodeTest >> languageTagsAndFilters [
	"returns an array of triplet arrays of langauge tag, matching filters,
	and non-matching filters"
	^ #(
		#(''
			#()
			#('' 'de' 'De' 'DE' 'de'
				'en' 'En' 'EN' '*'
				'en-US' 'En-Us' 'EN-US' 'en-*' '*-US' '*-*'
				'en-GB' 'En-Gb' 'EN-GB' 'de-*' '*-GB'
				'en-US-Custom' 'EN-US-CUSTOM'
				'en-US-*' '*-US-custom' 'en-*-Custom'
				'en-*-*' '*-*-custom' '*-us-*'
				'*-*-*'
				'en-US-other' 'en-GB-custom' 'de-at-custom'
				'de-US-*' '*-GB-Custom' 'de-*-custom'
				'de-*-*' '*-*-other' '*-GB-*'))
		#('en'
			#('en' 'En' 'EN' '*')
			#('' 'de' 'De' 'DE' 'de'
				'en-US' 'En-Us' 'EN-US' 'en-*' '*-US' '*-*'
				'en-GB' 'En-Gb' 'EN-GB' 'de-*' '*-GB'
				'en-US-Custom' 'EN-US-CUSTOM'
				'en-US-*' '*-US-custom' 'en-*-Custom'
				'en-*-*' '*-*-custom' '*-us-*'
				'*-*-*'
				'en-US-other' 'en-GB-custom' 'de-at-custom'
				'de-US-*' '*-GB-Custom' 'de-*-custom'
				'de-*-*' '*-*-other' '*-GB-*'))
		#('en-US'
			#('en' 'En' 'EN' '*' 'en-US' 'En-Us' 'EN-US' 'en-*' '*-US' '*-*')
			#('' 'de' 'De' 'DE' 'de'
				'en-GB' 'En-Gb' 'EN-GB' 'de-*' '*-GB'
				'en-US-Custom' 'EN-US-CUSTOM'
				'en-US-*' '*-US-custom' 'en-*-Custom'
				'en-*-*' '*-*-custom' '*-us-*'
				'*-*-*'
				'en-US-other' 'en-GB-custom' 'de-at-custom'
				'de-US-*' '*-GB-Custom' 'de-*-custom'
				'de-*-*' '*-*-other' '*-GB-*'))
		#('en-US-custom'
			#('en' 'En' 'EN' '*' 'en-US' 'En-Us' 'EN-US'
				'en-*' '*-US' '*-*'
				'en-US-Custom' 'EN-US-CUSTOM'
				'en-US-*' '*-US-custom' 'en-*-Custom'
				'en-*-*' '*-*-custom' '*-us-*'
				'*-*-*')
			#('' 'de' 'De' 'DE' 'de'
				'en-GB' 'En-Gb' 'EN-GB' 'de-*' '*-GB'
				'en-US-other' 'en-GB-custom' 'de-at-custom'
				'de-US-*' '*-GB-Custom' 'de-*-custom'
				'de-*-*' '*-*-other' '*-GB-*')))
]

{ #category : #accessing }
XMLNodeTest >> markupString [
	^ '<test name="&name;">''&value;''</test>'
]

{ #category : #accessing }
XMLNodeTest >> namespaceAssociations [
	^ Array
		with: '' -> 'defaultNS'
		with: 'prefix' -> 'prefixNS'
		with: 'prefixTwo' -> 'prefixTwoNS'
]

{ #category : #accessing }
XMLNodeTest >> namespaces [
	^ self attributesClass newFrom: self namespaceAssociations
]

{ #category : #'instance creation' }
XMLNodeTest >> newElement [
	^ self elementClass
		name: 'test'
		namespaces: self namespaceAssociations
]

{ #category : #'instance creation' }
XMLNodeTest >> newElementWithAttributes [
	| element |

	element := self newElement.
	self attributeAssociations do: [:each |
		element attributeNodes addLast:
			(self attributeClass
				name: each key
				value: each value)].
	^ element.
]

{ #category : #'instance creation' }
XMLNodeTest >> newNode [
	^ self nodeClass new
]

{ #category : #accessing }
XMLNodeTest >> nodeClass [
	^ XMLNode
]

{ #category : #accessing }
XMLNodeTest >> nodeFactoryClass [
	^ XMLNodeFactory
]

{ #category : #accessing }
XMLNodeTest >> otherAttributeListClass [
	"must be different from attributeListClass"
	^ XMLFAttributeList
]

{ #category : #accessing }
XMLNodeTest >> otherElementClass [
	"must be different from elementClass"
	^ XMLFElement
]

{ #category : #accessing }
XMLNodeTest >> selectListClass [
	^ XMLNodeList
]

{ #category : #tests }
XMLNodeTest >> testAcceptNodeVisitor [
	| visitor node |

	visitor := XMLRecordingNodeVisitor new.
	node := self newNode.
	self
		assert: (node acceptNodeVisitor: visitor) == node;
		deny: visitor messageRecorder hasMessages.
]

{ #category : #tests }
XMLNodeTest >> testAncestorElements [
	self assert: self newNode ancestorElements isEmpty
]

{ #category : #tests }
XMLNodeTest >> testAncestorElementsDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block |  node ancestorElementsDo: block]
		enumerate: #().
]

{ #category : #tests }
XMLNodeTest >> testAncestorNodes [
	self assert: self newNode ancestorNodes isEmpty
]

{ #category : #tests }
XMLNodeTest >> testAncestorNodesDo [
	| node |

	node := self newNode.
	self
		xmlShould: [:block |  node ancestorNodesDo: block]
		enumerate: #().
]

{ #category : #tests }
XMLNodeTest >> testCanHaveChildren [
	self deny: self newNode canHaveChildren
]

{ #category : #tests }
XMLNodeTest >> testCanonicallyEquals [
	self assert: (self newNode canonicallyEquals: self newNode)
]

{ #category : #tests }
XMLNodeTest >> testConfiguration [
	self assert: self newNode configuration isNil
]

{ #category : #tests }
XMLNodeTest >> testContentString [
	self assert: self newNode contentString = ''
]

{ #category : #tests }
XMLNodeTest >> testCopy [
	| node copy |

	(node := self newNode)
		parent: self newNode.
	copy := node copy.
	self
		deny: copy == node;
		deny: copy hasParent. 
]

{ #category : #tests }
XMLNodeTest >> testDocument [
	self assert: self newNode document isNil
]

{ #category : #tests }
XMLNodeTest >> testDocumentRoot [
	| node |

	node := self newNode.
	self assert: node documentRoot == node.
]

{ #category : #tests }
XMLNodeTest >> testHasChildren [
	self deny: self newNode hasChildren
]

{ #category : #tests }
XMLNodeTest >> testHasParent [
	| node |

	node := self newNode.
	self deny: node hasParent.

	node parent: self newNode.
	self assert: node hasParent.
]

{ #category : #tests }
XMLNodeTest >> testIsAttribute [
	self deny: self newNode isAttribute
]

{ #category : #tests }
XMLNodeTest >> testIsCData [
	self deny: self newNode isCData
]

{ #category : #tests }
XMLNodeTest >> testIsComment [
	self deny: self newNode isComment
]

{ #category : #tests }
XMLNodeTest >> testIsContentNode [
	self deny: self newNode isContentNode
]

{ #category : #tests }
XMLNodeTest >> testIsDeclaration [
	self deny: self newNode isDeclaration
]

{ #category : #tests }
XMLNodeTest >> testIsDocument [
	self deny: self newNode isDocument
]

{ #category : #tests }
XMLNodeTest >> testIsElement [
	self deny: self newNode isElement
]

{ #category : #tests }
XMLNodeTest >> testIsElementNamed [
	self deny: (self newNode isElementNamed: '')
]

{ #category : #tests }
XMLNodeTest >> testIsElementNamedAny [
	self deny: (self newNode isElementNamedAny: #())
]

{ #category : #tests }
XMLNodeTest >> testIsInLanguage [
	self deny: (self newNode isInLanguage: 'test')
]

{ #category : #tests }
XMLNodeTest >> testIsPI [
	self deny: self newNode isPI
]

{ #category : #tests }
XMLNodeTest >> testIsStringNode [
	self
		deny: self newNode isStringNode;
		deny: (self newNode isStringNode: '').
]

{ #category : #tests }
XMLNodeTest >> testNewCData [
	| cdata |

	cdata := self newNode newCData: 'test'.
	self
		assert: cdata isCData;
		assert: cdata string = 'test'.
]

{ #category : #tests }
XMLNodeTest >> testNewComment [
	| comment |

	comment := self newNode newComment: 'test'.
	self
		assert: comment isComment;
		assert: comment string = 'test'.
]

{ #category : #tests }
XMLNodeTest >> testNewDocument [
	| node document |

	node := self newNode.
	document := node newDocument.
	self assert: document isDocument.
	node configuration
		ifNotNil: [
			self
				assert: document configuration == node configuration;
				assert: document nodeFactory == node nodeFactory].
]

{ #category : #tests }
XMLNodeTest >> testNewElement [
	| node element |

	node := self newNode.
	element := node newElement.
	self assert: element isElement.
	node configuration
		ifNotNil: [
			self
				assert: element configuration == node configuration;
				assert: element nodeFactory == node nodeFactory].
]

{ #category : #tests }
XMLNodeTest >> testNewElementNamed [
	| node element |

	node := self newNode.
	element := node newElementNamed: 'test'.
	self
		assert: element isElement;
		assert: element name = 'test'.
	node configuration
		ifNotNil: [
			self
				assert: element configuration == node configuration;
				assert: element nodeFactory == node nodeFactory].
]

{ #category : #tests }
XMLNodeTest >> testNewElementNamedAttributes [
	| node element |

	node := self newNode.
	element :=
		node
			newElementNamed: 'test'
			attributes: self unprefixedAttributeAssociations.
	self
		assert: element isElement;
		assert: element name = 'test';
		assertElement: element hasAttributes: self unprefixedAttributes.
	node configuration
		ifNotNil: [
			self
				assert: element configuration == node configuration;
				assert: element nodeFactory == node nodeFactory].
]

{ #category : #tests }
XMLNodeTest >> testNewElementNamedNamespaceURI [
	| node element |

	node := self newNode.
	element :=
		node
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'.
	self
		assert: element isElement;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS'.
	node configuration
		ifNotNil: [
			self
				assert: element configuration == node configuration;
				assert: element nodeFactory == node nodeFactory].
]

{ #category : #tests }
XMLNodeTest >> testNewElementNamedNamespaceURIAttributes [
	| node element |

	node := self newNode.
	element :=
		node
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'
			attributes: self attributeAssociations.
	self
		assert: element isElement;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS';
		assertElement: element hasAttributes: self attributes.
	node configuration
		ifNotNil: [
			self
				assert: element configuration == node configuration;
				assert: element nodeFactory == node nodeFactory].
]

{ #category : #tests }
XMLNodeTest >> testNewPI [
	self assert: self newNode newPI isPI.
]

{ #category : #tests }
XMLNodeTest >> testNewPITargetData [
	| pi |

	pi :=
		self newNode
			newPITarget: 'target'
			data: 'data'.
	self
		assert: pi isPI;
		assert: pi target = 'target';
		assert: pi data = 'data'.
]

{ #category : #tests }
XMLNodeTest >> testNewStringNode [
	| stringNode |

	stringNode := self newNode newStringNode: 'test'.
	self
		assert: stringNode isStringNode;
		assert: stringNode string = 'test'.
]

{ #category : #tests }
XMLNodeTest >> testNextNode [
	self assert: self newNode nextNode isNil
]

{ #category : #tests }
XMLNodeTest >> testNodeFactory [
	self assert: self newNode nodeFactory class == self nodeFactoryClass
]

{ #category : #tests }
XMLNodeTest >> testParent [
	| node parent |

	node := self newNode.
	self assert: node parent isNil.

	parent := self newNode.
	self
		assert: (node parent: parent) == node;
		assert: node parent == parent.
]

{ #category : #tests }
XMLNodeTest >> testPreviousNode [
	self assert: self newNode previousNode isNil
]

{ #category : #tests }
XMLNodeTest >> testRawContentString [
	self assert: self newNode rawContentString = ''
]

{ #category : #tests }
XMLNodeTest >> testSortKey [
	self assert: self newNode sortKey = self nodeClass name asString
]

{ #category : #tests }
XMLNodeTest >> testValidate [
	self
		shouldnt: [self newNode validate]
		raise: XMLValidationException
]

{ #category : #accessing }
XMLNodeTest >> unprefixedAttributeAssociations [
	^ self attributeAssociations collect: [:each |
		each key xmlLocalNameAfterPrefix -> each value]
]

{ #category : #accessing }
XMLNodeTest >> unprefixedAttributes [
	^ self attributesClass newFrom: self unprefixedAttributeAssociations
]
