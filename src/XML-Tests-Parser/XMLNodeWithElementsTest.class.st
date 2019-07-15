"
Abstract, do not run.
"
Class {
	#name : #XMLNodeWithElementsTest,
	#superclass : #XMLNodeWithChildrenTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #asserting }
XMLNodeWithElementsTest >> assertElements: aPrettyPrintFormattedElementCollection werePrettyPrintFormattedFrom: anElementCollection [
	anElementCollection
		with: aPrettyPrintFormattedElementCollection
		do: [:element :prettyElement |
			element hasChildren
				ifTrue: [
					"if the first node wasn't a string node, then whitespace
					formatting should have been output before it"
					element firstNode isStringNode
						ifFalse: [
							self
								assert: prettyElement firstNode isStringNode;
								assert: prettyElement firstNode isWhitespace].

					"if there were no string nodes at all, then trailing
					whitespace formatting should have been output"	
					element hasStringNodes
						ifFalse: [
							self
								assert: prettyElement lastNode isStringNode;
								assert: prettyElement lastNode isWhitespace]]].
]

{ #category : #accessing }
XMLNodeWithElementsTest >> configurationClass [
	^ XMLDOMConfiguration
]

{ #category : #tests }
XMLNodeWithElementsTest >> elementBefore [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elementBefore |
				elementBefore := nil.
				node elements do: [:each |
					self assert: (node elementBefore: each) == elementBefore.
					elementBefore := each]]].
]

{ #category : #'instance creation' }
XMLNodeWithElementsTest >> newNodeWithElements [
	^ self newNode
		addNode: (XMLComment string: 'before');
		addNode:
			((self elementClass named: 'zero')
				addNode: (XMLComment string: 'during');
				addNode:
					((self elementClass named: 'one')
						attributeAt: 'one' put: '1';
						addNode: (XMLString string: 'testing one');
						addNode: (self elementClass named: 'two');
						addNode: (XMLPI target: 'target' data: 'data');
						yourself);
				addNode: (XMLString string: 'testing two');
				addNode:
					((self elementClass name: 'three' namespaceURI: 'testNS')
						addNode: (self elementClass named: 'four');
						addNode: (XMLCData string: 'testing three');
						yourself);
				addNode:
					((self elementClass name: 'prefix:four' namespaceURI: 'testNS')
						attributeAt: 'four' put: '4';
						addNode:
							(self elementClass name: 'prefix:five' namespaceURI: 'testNS');
						yourself);
				addNode: (self elementClass named: 'four');
				yourself);
		addNode: (XMLComment string: 'after');
		yourself.
]

{ #category : #'instance creation' }
XMLNodeWithElementsTest >> newNodeWithNodes [
	^ self newNodeWithElements
]

{ #category : #accessing }
XMLNodeWithElementsTest >> nodeClass [
	^ XMLNodeWithElements
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAcceptNodeVisitor [
	| visitor nodeWithElements message |

	visitor := XMLRecordingNodeVisitor new.
	nodeWithElements := self newNodeWithElements.
	self
		assert: (nodeWithElements acceptNodeVisitor: visitor) == nodeWithElements;
		assert: visitor messageRecorder hasMessages.

	"skip the messages for the nodeWithElements"
	[visitor messageRecorder hasMessages
		and: [
			visitor messageRecorder peekMessage arguments =
				(Array with: nodeWithElements)]]
		whileTrue: [visitor messageRecorder nextMessage].

	nodeWithElements descendantNodesDo: [:node | | visitingSelectors |
		visitingSelectors :=
			(#(
				#(isElement #(visitElement: visitNodeWithElements:))
				#(isCData #(visitCData: #visitStringNode:))
				#(isStringNode #(#visitStringNode:))
				#(isComment #(visitComment:))
				#(isPI #(visitPI:)))
					detect: [:each | node perform: each first]
					ifNone: [#(nil #())]) second.

		self assert: visitingSelectors notEmpty.
		visitingSelectors do: [:selector |
			self assert: visitor messageRecorder hasMessages.

			message := visitor messageRecorder nextMessage.
			self
				assert: message selector = selector;
				assert: message arguments = (Array with: node)]].

	self deny: visitor messageRecorder hasMessages.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddCData [
	| nodeWithElements cdataNode |

	nodeWithElements := self newNode.
	cdataNode := nodeWithElements addCData: 'test'.
	self
		assert: cdataNode isCData;
		assert: cdataNode string = 'test';
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements firstNode == cdataNode.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddCDataNodeFactoryUse [
	| nodeWithElements firstCDataNode lastCDataNode |

	nodeWithElements := self newNode.
	firstCDataNode := nodeWithElements addCData: 'one'.
	nodeWithElements nodeFactory:
		(XMLPluggableNodeFactory new
			cdataClass: XMLFCData).
	lastCDataNode := nodeWithElements addCData: 'two'.
	self
		assert: nodeWithElements nodes size = 2;
		assert: firstCDataNode class == XMLCData;
		assert: firstCDataNode string = 'one';
		assert: lastCDataNode class == XMLFCData;
		assert: lastCDataNode string = 'two'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddComment [
	| nodeWithElements comment |

	super testAddComment.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				commentClass: XMLFComment).
	comment := nodeWithElements addComment: 'test'.
	self
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements firstNode == comment;
		assert: comment class == XMLFComment;
		assert: comment string = 'test'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamed [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	element := nodeWithElements addElementNamed: 'one'.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element isElement;
		assert: element name = 'one'.
	self
		should: [nodeWithElements addElementNamed: 'undeclared:two']
		raise: XMLNamespaceException.

	nodeWithElements := self newNode.
	nodeWithElements usesNamespaces: false.
	self
		shouldnt: [nodeWithElements addElementNamed: 'undeclared:three']
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedAttributes [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	element :=
		nodeWithElements
			addElementNamed: 'one'
			attributes: self unprefixedAttributeAssociations.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element isElement;
		assert: element name = 'one';
		assertElement: element hasAttributes: self unprefixedAttributes.
	self
		should: [
			nodeWithElements
				addElementNamed: 'undeclared:two'
				attributes: self unprefixedAttributeAssociations]
		raise: XMLNamespaceException.
	self
		should: [
			"attributes with undeclared prefixes should be caught too"
			nodeWithElements
				addElementNamed: 'three'
				attributes: self attributeAssociations]
		raise: XMLNamespaceException.

	nodeWithElements := self newNode.
	nodeWithElements usesNamespaces: false.
	self
		shouldnt: [
			nodeWithElements
				addElementNamed: 'undeclared:four'
				attributes: self attributeAssociations]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedAttributesNodeFactoryUse [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	nodeWithElements nodeFactory:
		(XMLPluggableElementFactory new
			handleElement: 'test'
			attributes: self unprefixedAttributeAssociations
			withClass: self otherElementClass).
	element :=
		nodeWithElements
			addElementNamed: 'test'
			attributes: self unprefixedAttributeAssociations.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element class == self otherElementClass;
		assert: element name = 'test';
		assertElement: element hasAttributes: self unprefixedAttributes.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedNamespaceURI [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	element :=
		nodeWithElements
			addElementNamed: 'test'
			namespaceURI: 'defaultNS'.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element isElement;
		assert: element name = 'test';
		assert: element namespaceURI = 'defaultNS'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedNamespaceURIAttributes [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	element :=
		nodeWithElements
			addElementNamed: 'prefix:one'
			namespaceURI: 'prefixNS'
			attributes: self attributeAssociations.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element isElement;
		assert: element name = 'prefix:one';
		assert: element namespaceURI = 'prefixNS';
		assertElement: element hasAttributes: self attributes.
	self
		should: [
			"attributes with undeclared prefixes should be caught"
			nodeWithElements
				addElementNamed: 'two'
				namespaceURI: 'defaultNS'
				attributes: self attributeAssociations]
		raise: XMLNamespaceException.

	"this forces namespace support"
	nodeWithElements := self newNode.
	nodeWithElements usesNamespaces: false.
	self
		shouldnt: [
			nodeWithElements
				addElementNamed: 'three'
				namespaceURI: ''
				attributes: self unprefixedAttributeAssociations]
		raise: XMLNamespaceException.
	nodeWithElements usesNamespaces: false.
	self
		should: [
			nodeWithElements
				addElementNamed: 'four'
				namespaceURI: ''
				attributes: self attributeAssociations]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedNamespaceURIAttributesNodeFactoryUse [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	nodeWithElements nodeFactory:
		(XMLPluggableElementFactory new
			handleElement: 'prefix:test'
			namespaceURI: 'prefixNS'
			attributes: self attributeAssociations
			withClass: self otherElementClass).
	element :=
		nodeWithElements
			addElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'
			attributes: self attributeAssociations.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element class == self otherElementClass;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS';
		assertElement: element hasAttributes: self attributes.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedNamespaceURINodeFactoryUse [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	nodeWithElements nodeFactory:
		(XMLPluggableElementFactory new
			handleElement: 'test'
			namespaceURI: 'defaultNS'
			withClass: self otherElementClass).
	element :=
		nodeWithElements
			addElementNamed: 'test'
			namespaceURI: 'defaultNS'.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element class == self otherElementClass;
		assert: element name = 'test';
		assert: element namespaceURI = 'defaultNS'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddElementNamedNodeFactoryUse [
	| nodeWithElements element |

	nodeWithElements := self newNode.
	nodeWithElements nodeFactory:
		(XMLPluggableElementFactory new
			handleElement: 'test'
			withClass: self otherElementClass).
	element := nodeWithElements addElementNamed: 'test'.
	self
		assert: nodeWithElements nodes size = 1;
		assert: element class == self otherElementClass;
		assert: element name = 'test'.

]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddPITargetData [
	| nodeWithElements pi |

	super testAddPITargetData.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				piClass: XMLFPI).
	pi :=
		nodeWithElements
			addPITarget: 'target'
			data: 'data'.
	self
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements firstNode == pi;
		assert: pi class == XMLFPI;
		assert: pi target = 'target';
		assert: pi data = 'data'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddString [
	| nodeWithElements firstStringNode elementNode lastStringNode |

	nodeWithElements := self newNode.
	firstStringNode := nodeWithElements addString: 'one'.
	self
		assert: (firstStringNode isStringNode: 'one');
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements firstNode == firstStringNode.

	self
		assert: (nodeWithElements addString: 'two') == firstStringNode;
		assert: (firstStringNode isStringNode: 'onetwo');
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements nodes first == firstStringNode.

	elementNode := nodeWithElements addNode: (self elementClass named: 'three').
	self
		assert: (elementNode isElementNamed: 'three');
		assert: nodeWithElements nodes size = 2;
		assert: nodeWithElements nodes first == firstStringNode;
		assert: nodeWithElements nodes second == elementNode.

	lastStringNode := nodeWithElements addString: 'four'.
	self
		assert: (lastStringNode isStringNode: 'four');
		assert: nodeWithElements nodes size = 3;
		assert: nodeWithElements nodes first == firstStringNode;
		assert: nodeWithElements nodes second == elementNode;
		assert: nodeWithElements nodes third == lastStringNode.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAddStringNodeFactoryUse [
	| nodeWithElements firstStringNode elementNode lastStringNode |

	nodeWithElements := self newNode.
	firstStringNode := nodeWithElements addString: 'one'.
	self
		assert: (firstStringNode isStringNode: 'one');
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements firstNode == firstStringNode.

	nodeWithElements nodeFactory:
		(XMLPluggableNodeFactory new
			stringNodeClass: XMLFString).
	self
		assert: (nodeWithElements addString: 'two') == firstStringNode;
		assert: (firstStringNode isStringNode: 'onetwo');
		assert: nodeWithElements nodes size = 1;
		assert: nodeWithElements nodes first == firstStringNode.

	elementNode := nodeWithElements addNode: (self elementClass named: 'three').
	self
		assert: (elementNode isElementNamed: 'three');
		assert: nodeWithElements nodes size = 2;
		assert: nodeWithElements nodes first == firstStringNode;
		assert: nodeWithElements nodes second == elementNode.

	lastStringNode := nodeWithElements addString: 'four'.
	self
		assert: lastStringNode class == XMLFString;
		assert: (lastStringNode isStringNode: 'four');
		assert: nodeWithElements nodes size = 3;
		assert: nodeWithElements nodes first == firstStringNode;
		assert: nodeWithElements nodes second == elementNode;
		assert: nodeWithElements nodes third == lastStringNode.

	self
		assert: (nodeWithElements addString: 'five') == lastStringNode;
		assert: lastStringNode class == XMLFString;
		assert: (lastStringNode isStringNode: 'fourfive');
		assert: nodeWithElements nodes size = 3;
		assert: nodeWithElements nodes first == firstStringNode;
		assert: nodeWithElements nodes second == elementNode;
		assert: nodeWithElements nodes third == lastStringNode.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElements [
	| nodeWithElements allElements |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	nodeWithElements isElement
		ifTrue: [
			self assert: allElements first = nodeWithElements.
			allElements removeFirst].
	self assert:
		(allElements collect: [:each | each name]) asArray =
			#('zero' 'one' 'two' 'three' 'four' 'prefix:four' 'prefix:five' 'four').
	self
		assertList: allElements first allElements selects: (allElements copyFrom: 1 to: 8);
		assertList: allElements second allElements selects: (allElements copyFrom: 2 to: 3);
		assertList: allElements third allElements selects: (allElements copyFrom: 3 to: 3);
		assertList: allElements fourth allElements selects: (allElements copyFrom: 4 to: 5);
		assertList: allElements fifth allElements selects: (allElements copyFrom: 5 to: 5);
		assertList: allElements sixth allElements selects: (allElements copyFrom: 6 to: 7);
		assertList: allElements seventh allElements selects: (allElements copyFrom: 7 to: 7);
		assertList: allElements eighth allElements selects: (allElements copyFrom: 8 to: 8).
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsCollect [
	| nodeWithElements allElements |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	self
		assertList: (nodeWithElements allElementsCollect: [:each | each identityHash])
		collects: (allElements collect: [:each | each identityHash]).

	allElements do: [:node |
		self
			assertList: (node allElementsCollect: [:each | each identityHash])
			collects: (node allElements collect: [:each | each identityHash])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsDetect [
	| nodeWithElements allElements detectedElement |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	detectedElement := nodeWithElements allElementsDetect: [:each | each isNamed: 'prefix:four'].
	self
		assert: detectedElement notNil;
		assert: (detectedElement isNamed: 'prefix:four');
		assert: detectedElement = (allElements detect: [:each | each isNamed: 'prefix:four']);
		assert: (nodeWithElements allElementsDetect: [:each | each isNamed: 'absent']) isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsDetectIfNone [
	| nodeWithElements allElements detectedElement |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	detectedElement :=
		nodeWithElements
			allElementsDetect: [:each | each isNamed: 'prefix:four']
			ifNone: [self fail].
	self assert: (detectedElement isNamed: 'prefix:four').
	self assert:	
		detectedElement =
			(allElements detect: [:each | each isNamed: 'prefix:four']).
	self assert:
		(nodeWithElements
			allElementsDetect: [:each | each isNamed: 'absent']
			ifNone: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsDo [
	| nodeWithElements allElements |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	self
		xmlShould: [:block | nodeWithElements allElementsDo: block]
		enumerate: allElements.

	allElements do: [:element |
		self
			xmlShould: [:block | element allElementsDo: block]
			enumerate: element allElements].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsNamed [
	| nodeWithElements allElements namedElements |

	nodeWithElements := self newNodeWithElements.
	self assert: (nodeWithElements allElementsNamed: 'absent') isEmpty.

	allElements := nodeWithElements allElements.
	namedElements := nodeWithElements allElementsNamed: 'four'. 
	self
		assert: namedElements size = 3;
		assertList: namedElements selects: (allElements select: [:each | each isNamed: 'four']).
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsNamedDo [
	| nodeWithElements allElements namedElements |

	nodeWithElements := self newNodeWithElements.
	self
		xmlShould: [:block | nodeWithElements allElementsNamed: 'absent' do: block]
		enumerate: #().

	allElements := nodeWithElements allElements.
	namedElements := nodeWithElements allElementsNamed: 'four'. 
	self
		xmlShould: [:block | nodeWithElements allElementsNamed: 'four' do: block]
		enumerate: namedElements.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsNamedNamespaceURI [
	| nodeWithElements allElements namedElements |

	nodeWithElements := self newNodeWithElements.
	self assert: (nodeWithElements allElementsNamed: 'four' namespaceURI: 'absent') isEmpty.

	allElements := nodeWithElements allElements.
	namedElements := nodeWithElements allElementsNamed: 'four' namespaceURI: 'testNS'. 
	self
		assert: namedElements size = 2;
		assertList: namedElements
		selects:
			(allElements select: [:each |
				(each isNamed: 'four')
					and: [each namespaceURI = 'testNS']]).
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllElementsSelect [
	| nodeWithElements allElements |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	self
		assertList: (nodeWithElements allElementsSelect: [:each | each hasChildren])
		selects: (allElements select: [:each | each hasChildren]).

	allElements do: [:node |
		self
			assertList: (node allElementsSelect: [:each | each hasChildren])
			selects: (node allElements select: [:each | each hasChildren])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAllNodes [
	| nodeWithElements allNodes |

	nodeWithElements := self newNodeWithElements.
	allNodes := nodeWithElements allNodes.
	self
		assert: allNodes size = 16;
		assert: (allNodes at: 1) = nodeWithElements;
		assert: (allNodes at: 2) isComment;
		assert: ((allNodes at: 3) isElementNamed: 'zero');
		assert: (allNodes at: 4) isComment;
		assert: ((allNodes at: 5) isElementNamed: 'one');
		assert: ((allNodes at: 6) isStringNode: 'testing one');
		assert: ((allNodes at: 7) isElementNamed: 'two');
		assert: (allNodes at: 8) isPI;
		assert: ((allNodes at: 9) isStringNode: 'testing two');
		assert: ((allNodes at: 10) isElementNamed: 'three');
		assert: ((allNodes at: 11) isElementNamed: 'four');
		assert: ((allNodes at: 12) isStringNode: 'testing three');
		assert: ((allNodes at: 13) isElementNamed: 'prefix:four');
		assert: ((allNodes at: 14) isElementNamed: 'prefix:five');
		assert: ((allNodes at: 15) isElementNamed: 'four');
		assert: (allNodes at: 16) isComment.
	self
		assertList: (allNodes at: 3) allNodes selects: (allNodes copyFrom: 3 to: 15);
		assertList: (allNodes at: 5) allNodes selects: (allNodes copyFrom: 5 to: 8);
		assertList: (allNodes at: 7) allNodes selects: (allNodes copyFrom: 7 to: 7);
		assertList: (allNodes at: 10) allNodes selects: (allNodes copyFrom: 10 to: 12);
		assertList: (allNodes at: 11) allNodes selects: (allNodes copyFrom: 11 to: 11);
		assertList: (allNodes at: 13) allNodes selects: (allNodes copyFrom: 13 to: 14);
		assertList: (allNodes at: 14) allNodes selects: (allNodes copyFrom: 14 to: 14);
		assertList: (allNodes at: 15) allNodes selects: (allNodes copyFrom: 15 to: 15).
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAncestorElements [
	| nodeWithElements ancestorStack |

	super testAncestorElements.

	nodeWithElements := self newNodeWithElements.
	ancestorStack := OrderedCollection new.
	nodeWithElements allNodesDo: [:each |
		[ancestorStack isEmpty
			or: [ancestorStack last = each parent]]
			whileFalse: [ancestorStack removeLast].
		self assert:
			each ancestorElements asOrderedCollection =
				ancestorStack reversed.
		each isElement
			ifTrue: [ancestorStack addLast: each]].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testAncestorElementsDo [
	| nodeWithElements |

	super testAncestorElementsDo.

	nodeWithElements := self newNodeWithElements.
	nodeWithElements allNodesDo: [:each |
		self
			xmlShould: [:block | each ancestorElementsDo: block]
			enumerate: each ancestorElements].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testConfiguration [
	| nodeWithElements configuration newConfiguration |

	nodeWithElements := self newNodeWithElements.
	configuration := nodeWithElements configuration.
	self assert: configuration class == self configurationClass.
	nodeWithElements allElementsDo: [:element |
		self assert: element configuration == configuration.
		element attributeNodes do: [:each |
			self assert: each configuration == configuration]].

	"ensure descendants inherit the new config when it's set"
	newConfiguration := self configurationClass new.
	nodeWithElements configuration: newConfiguration.
	self assert: nodeWithElements configuration == newConfiguration.
	nodeWithElements allElementsDo: [:element |
		self assert: element configuration == newConfiguration.
		element attributeNodes do: [:each |
			self assert: each configuration == newConfiguration]].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testContentNodes [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		assertList: nodeWithElements contentNodes
		selects: (nodeWithElements nodes select: [:each | each isContentNode]).
	nodeWithElements allElementsDo: [:element |
		self
			assertList: element contentNodes
			selects: (element nodes select: [:each | each isContentNode])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testContentNodesDo [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		xmlShould: [:block | nodeWithElements contentNodesDo: block]
		enumerate: nodeWithElements contentNodes.
	nodeWithElements allElementsDo: [:each |
		self
			xmlShould: [:block | each contentNodesDo: block]
			enumerate: each contentNodes].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testContentStringAt [
	| root |

	root := self newNodeWithElements firstElement.
	root elementsDo: [:each |
		self assert: (root contentStringAt: each name) = each contentString].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElements [
	| nodeWithElements descendantElements |

	nodeWithElements := self newNodeWithElements.
	descendantElements := nodeWithElements descendantElements.
	self assert:
		(descendantElements collect: [:each | each name]) asArray =
			#('zero' 'one' 'two' 'three' 'four' 'prefix:four' 'prefix:five' 'four').
	self
		assertList: descendantElements first descendantElements selects: (descendantElements copyFrom: 2 to: 8);
		assertList: descendantElements second descendantElements selects: (descendantElements copyFrom: 3 to: 3);
		assertList: descendantElements third descendantElements selects: descendantElements copyEmpty;
		assertList: descendantElements fourth descendantElements selects: (descendantElements copyFrom: 5 to: 5);
		assertList: descendantElements fifth descendantElements selects: descendantElements copyEmpty;
		assertList: descendantElements sixth descendantElements selects: (descendantElements copyFrom: 7 to: 7);
		assertList: descendantElements seventh descendantElements selects: descendantElements copyEmpty;
		assertList: descendantElements eighth descendantElements selects: descendantElements copyEmpty.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsCollect [
	| nodeWithElements descendantElements |

	nodeWithElements := self newNodeWithElements.
	descendantElements := nodeWithElements descendantElements.
	self
		assertList: (nodeWithElements descendantElementsCollect: [:each | each identityHash])
		collects: (descendantElements collect: [:each | each identityHash]).

	descendantElements do: [:node |
		self
			assertList: (node descendantElementsCollect: [:each | each identityHash])
			collects: (node descendantElements collect: [:each | each identityHash])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsDetect [
	| nodeWithElements descendantElements detectedElement |

	nodeWithElements := self newNodeWithElements.
	descendantElements := nodeWithElements descendantElements.
	detectedElement := nodeWithElements descendantElementsDetect: [:each | each isNamed: 'prefix:four'].
	self
		assert: detectedElement notNil;
		assert: (detectedElement isNamed: 'prefix:four');
		assert: detectedElement = (descendantElements detect: [:each | each isNamed: 'prefix:four']);
		assert: (detectedElement descendantElementsDetect: [:each | each isNamed: 'prefix:four']) isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsDetectIfNone [
	| nodeWithElements descendantElements detectedElement |

	nodeWithElements := self newNodeWithElements.
	descendantElements := nodeWithElements descendantElements.
	detectedElement :=
		nodeWithElements
			descendantElementsDetect: [:each | each isNamed: 'prefix:four']
			ifNone: [self fail].
	self assert: (detectedElement isNamed: 'prefix:four').
	self assert:	
		detectedElement =
			(descendantElements detect: [:each | each isNamed: 'prefix:four']).
	self assert:
		(detectedElement
			descendantElementsDetect: [:each | each isNamed: 'prefix:four']
			ifNone: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsDo [
	| nodeWithElements descendantElements |

	nodeWithElements := self newNodeWithElements.
	descendantElements := nodeWithElements descendantElements.
	self
		xmlShould: [:block | nodeWithElements descendantElementsDo: block]
		enumerate: descendantElements.

	descendantElements do: [:element |
		self
			xmlShould: [:block | element descendantElementsDo: block]
			enumerate: element descendantElements].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsNamed [
	| nodeWithElements descendantElements namedElements |

	nodeWithElements := self newNodeWithElements.
	self assert: (nodeWithElements descendantElementsNamed: 'absent') isEmpty.

	descendantElements := nodeWithElements descendantElements.
	namedElements := nodeWithElements descendantElementsNamed: 'four'. 
	self assert: namedElements size = 3.
	self
		assertList: namedElements
		selects: (descendantElements select: [:each | each isNamed: 'four']).

	namedElements do: [:each |
		self assert: (each descendantElementsNamed: 'four') isEmpty]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsNamedDo [
	| nodeWithElements namedElements |

	nodeWithElements := self newNodeWithElements.
	self
		xmlShould: [:block | nodeWithElements descendantElementsNamed: 'absent' do: block]
		enumerate: #().

	namedElements := nodeWithElements descendantElementsNamed: 'four'. 
	self
		xmlShould: [:block | nodeWithElements descendantElementsNamed: 'four' do: block]
		enumerate: namedElements.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsNamedNamespaceURI [
	| nodeWithElements descendantElements namedElements |

	nodeWithElements := self newNodeWithElements.
	self assert:
		(nodeWithElements
			descendantElementsNamed: 'four'
			namespaceURI: 'absent') isEmpty.

	descendantElements := nodeWithElements descendantElements.
	namedElements :=
		nodeWithElements
			descendantElementsNamed: 'four'
			namespaceURI: 'testNS'. 
	self
		assert: namedElements size = 2;
		assertList: namedElements
		selects:
			(descendantElements select: [:each |
				(each isNamed: 'four')
					and: [each namespaceURI = 'testNS']]).
]

{ #category : #tests }
XMLNodeWithElementsTest >> testDescendantElementsSelect [
	| nodeWithElements descendantElements |

	nodeWithElements := self newNodeWithElements.
	descendantElements := nodeWithElements descendantElements.
	self
		assertList: (nodeWithElements descendantElementsSelect: [:each | each hasChildren])
		selects: (descendantElements select: [:each | each hasChildren]).

	descendantElements do: [:node |
		self
			assertList: (node descendantElementsSelect: [:each | each hasChildren])
			selects: (node descendantElements select: [:each | each hasChildren])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementAfter [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elementAfter |
				elementAfter := nil.
				node elements reverseDo: [:each |
					self assert: (node elementAfter: each) = elementAfter.
					elementAfter := each]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementAt [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				localNames do: [:localName |
					self assert:
						(node elementAt: localName) =
							(elements detect: [:each | each localName = localName]).
					self assert: (node elementAt: 'absent:', localName) isNil].
				qualifiedNames do: [:qualifiedName |
					self assert:
						(node elementAt: qualifiedName) =
							(elements detect: [:each |
								each hasPrefix
									and: [each name = qualifiedName]])].
			self assert: (node elementAt: 'absent') isNil]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementAtAddedInPlace [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [
				(Array
					with: node elements
					with: node elements reversed) do: [:elements | | localNames qualifiedNames |
					localNames := (elements collect: [:each | each localName]) asSet.
					qualifiedNames :=
						(elements
							select: [:each | each hasPrefix]
							thenCollect: [:each | each name]) asSet.
					node addNodes: elements.
					localNames do: [:localName |
						self assert:
							(node elementAt: localName) =
								(elements detect: [:each | each localName = localName])].
					qualifiedNames do: [:qualifiedName |
						self assert:
							(node elementAt: qualifiedName) =
								(elements detect: [:each |
									each hasPrefix
										and: [each name = qualifiedName]])]]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementAtIfAbsent [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				localNames do: [:localName |
					self assert:
						(node
							elementAt: localName
							ifAbsent: [self fail]) =
								(elements detect: [:each | each localName = localName]).
					self assert:
						(node
							elementAt: 'absent:', localName
							ifAbsent: [#absent]) = #absent].
				qualifiedNames do: [:qualifiedName |
					self assert:
						(node
							elementAt: qualifiedName
							ifAbsent: [self fail]) =
								(elements detect: [:each |
									each hasPrefix
										and: [each name = qualifiedName]])].
			self assert:
				(node
					elementAt: 'absent'
					ifAbsent: [#absent]) = #absent]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementAtNamespaceURI [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames namespaceURIs |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				namespaceURIs := (elements collect: [:each | each namespaceURI]) asSet.
				localNames do: [:localName |
					namespaceURIs do: [:uri |
						self assert:
							(node
								elementAt: localName
								namespaceURI: uri) =
									(elements detect: [:each |
										each localName = localName
											and: [each namespaceURI = uri]])].
					self assert:
						(node
							elementAt: localName
							namespaceURI: 'absentNS') isNil].
				qualifiedNames do: [:qualifiedName |
					namespaceURIs do: [:uri |
						self assert:
							(node
								elementAt: qualifiedName
								namespaceURI: uri) =
									(elements detect: [:each |
										each hasPrefix
											and: [each name = qualifiedName
												and: [each namespaceURI = uri]]])].
					self assert:
						(node
							elementAt: qualifiedName
							namespaceURI: 'absentNS') isNil]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementAtNamespaceURIIfAbsent [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames namespaceURIs |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				namespaceURIs := (elements collect: [:each | each namespaceURI]) asSet.
				localNames do: [:localName |
					namespaceURIs do: [:uri |
						self assert:
							(node
								elementAt: localName
								namespaceURI: uri
								ifAbsent: [#absent]) =
									(elements
										detect: [:each |
											each localName = localName
												and: [each namespaceURI = uri]]
										ifNone: [#absent])].
					self assert:
						(node
							elementAt: localName
							namespaceURI: 'absentNS'
							ifAbsent: [#absent]) = #absent].
				qualifiedNames do: [:qualifiedName |
					namespaceURIs do: [:uri |
						self assert:
							(node
								elementAt: qualifiedName
								namespaceURI: uri
								ifAbsent: [#absent]) =
									(elements
										detect: [:each |
											each hasPrefix
												and: [each name = qualifiedName
													and: [each namespaceURI = uri]]]
										ifNone: [#absent])].
					self assert:
						(node
							elementAt: qualifiedName
							namespaceURI: 'absentNS'
							ifAbsent: [#absent]) = #absent]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementBefore [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elementBefore |
				elementBefore := nil.
				node elements do: [:each |
					self assert: (node elementBefore: each) = elementBefore.
					elementBefore := each]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementNames [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		assertList: nodeWithElements elementNames
		collects: (nodeWithElements elements collect: [:each | each name]).
	nodeWithElements allElementsDo: [:element |
		self
			assertList: element elementNames
			collects: (element elements collect: [:each | each name])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementRenamingToNext [
	self newNodeWithElements
		usesNamespaces: false;
		allElementsDo: [:each | | parent oldName oldLocalName nextElement |
			((parent := each parent) notNil
				and: [(nextElement := each nextElement) notNil])
				ifTrue: [
					oldName := each name.
					oldLocalName := each localName.
					
					each name: nextElement name.
					each name = oldName
						ifFalse: [
							self
								deny: ((parent elementAt: oldName) = each);
								deny: ((parent elementsAt: oldName) includes: each)].
					each localName = oldLocalName
						ifFalse: [
							self
								deny: ((parent elementAt: oldLocalName) = each);
								deny: ((parent elementsAt: oldLocalName) includes: each)].
					self
						assert: ((parent elementsAt: each name) after: each) = nextElement;
						assert: ((parent elementsAt: each localName) after: each) = nextElement]].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementRenamingToPrevious [
	self newNodeWithElements
		usesNamespaces: false;
		allElementsDo: [:each | | parent oldName oldLocalName previousElement |
			((parent := each parent) notNil
				and: [(previousElement := each previousElement) notNil])
				ifTrue: [
					oldName := each name.
					oldLocalName := each localName.
					
					each name: previousElement name.
					each name = oldName
						ifFalse: [
							self
								deny: ((parent elementAt: oldName) = each);
								deny: ((parent elementsAt: oldName) includes: each)].
					each localName = oldLocalName
						ifFalse: [
							self
								deny: ((parent elementAt: oldLocalName) = each);
								deny: ((parent elementsAt: oldLocalName) includes: each)].
					self
						assert: ((parent elementsAt: each name) before: each) = previousElement;
						assert: ((parent elementsAt: each localName) before: each) = previousElement]].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElements [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [
				self
					assertList: node elements 
					selects: (node nodes select: [:each | each isElement])]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsAddedInPlace [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [
				(Array
					with: node elements
					with: node elements reversed) do: [:elements |
					node addNodes: elements.
					self
						assertList: node elements 
						selects: elements]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsAt [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				localNames do: [:localName |
					self
						assertList: (node elementsAt: localName)
						selects:
							(elements select: [:each |
								each localName = localName]).
					self
						assertList: (node elementsAt: 'absent:', localName)
						selects: elements copyEmpty].
				qualifiedNames do: [:qualifiedName |
					self
						assertList: (node elementsAt: qualifiedName)
						selects:
							(elements select: [:each |
								each hasPrefix
									and: [each name = qualifiedName]])].
			self
				assertList: (node elementsAt: 'absent')
				selects: elements copyEmpty]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsAtAddedInPlace [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [
				(Array
					with: node elements
					with: node elements reversed) do: [:elements | | localNames qualifiedNames |
					localNames := (elements collect: [:each | each localName]) asSet.
					qualifiedNames :=
						(elements
							select: [:each | each hasPrefix]
							thenCollect: [:each | each name]) asSet.
					node addNodes: elements.
					localNames do: [:localName |
						self
							assertList: (node elementsAt: localName)
							selects:
								(elements select: [:each |
									each localName = localName])].
					qualifiedNames do: [:qualifiedName |
						self
							assertList: (node elementsAt: qualifiedName)
							selects:
								(elements select: [:each |
									each hasPrefix
										and: [each name = qualifiedName]])]]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsAtDo [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				localNames do: [:localName |
					self
						xmlShould: [:block | node elementsAt: localName do: block]
						enumerate:
							(elements select: [:each |
								each localName = localName]).
					self
						xmlShould: [:block | node elementsAt: 'absent:', localName do: block]
						enumerate: #()].
				qualifiedNames do: [:qualifiedName |
					self
						xmlShould: [:block | node elementsAt: qualifiedName do: block]
						enumerate:
							(elements select: [:each |
								each hasPrefix
									and: [each name = qualifiedName]])].
			self
				xmlShould: [:block | node elementsAt: 'absent' do: block]
				enumerate: #()]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsAtNamespaceURI [
	self newNodeWithElements allNodesDo: [:node |
		node canHaveChildren
			ifTrue: [| elements localNames qualifiedNames namespaceURIs |
				elements := node elements.
				localNames := (elements collect: [:each | each localName]) asSet.
				qualifiedNames :=
					(elements
						select: [:each | each hasPrefix]
						thenCollect: [:each | each name]) asSet.
				namespaceURIs := (elements collect: [:each | each namespaceURI]) asSet.
				localNames do: [:localName |
					namespaceURIs do: [:uri |
						self
							assertList:
								(node
									elementsAt: localName
									namespaceURI: uri)
							selects:
								(elements select: [:each |
									each localName = localName
										and: [each namespaceURI = uri]])].
					self
						assertList:
							(node
								elementsAt: localName
								namespaceURI: 'absentNS')
						selects: elements copyEmpty].
				qualifiedNames do: [:qualifiedName |
					namespaceURIs do: [:uri |
						self
							assertList:
								(node
									elementsAt: qualifiedName
									namespaceURI: uri)
							selects:
								(elements select: [:each |
									each hasPrefix
										and: [each name = qualifiedName
											and: [each namespaceURI = uri]]])].
					self
						assertList:
							(node
								elementsAt: qualifiedName
								namespaceURI: 'absentNS')
						selects: elements copyEmpty]]]
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsCollect [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		assertList: (nodeWithElements elementsCollect: [:each | each name])
		collects: (nodeWithElements elements collect: [:each | each name]).
	nodeWithElements allElementsDo: [:element |
		self
			assertList: (element elementsCollect: [:each | each name])
			collects: (element elements collect: [:each | each name])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsDetect [
	| root element |

	root := self newNodeWithElements firstElement.
	element :=
		root elementsDetect: [:each |
			(each isNamed: 'four')
				and: [each namespaceURI = 'testNS']].
	self deny: element isNil.
	self assert:
		element = 
			(root elements detect: [:each |
				(each isNamed: 'four')
					and: [each namespaceURI = 'testNS']]).
	self assert:
		(root elementsDetect: [:each |
			(each isNamed: 'four')
				and: [each namespaceURI = 'absentNS']]) isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsDetectIfNone [
	| root |

	root := self newNodeWithElements firstElement.
	self assert: 
		(root
			elementsDetect: [:each |
				(each isNamed: 'four')
					and: [each namespaceURI = 'testNS']]
			ifNone: [self fail]) =
				(root elements
					detect: [:each |
						(each isNamed: 'four')
							and: [each namespaceURI = 'testNS']]).
	self assert:
		(root
			elementsDetect: [:each |
				(each isNamed: 'four')
					and: [each namespaceURI = 'absentNS']]
			ifNone: [#absent]) = #absent.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsDo [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		xmlShould: [:block | nodeWithElements elementsDo: block]
		enumerate: nodeWithElements elements.
	nodeWithElements allElementsDo: [:each |
		self
			xmlShould: [:block | each elementsDo: block]
			enumerate: each elements].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testElementsSelect [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		assertList: (nodeWithElements elementsSelect: [:each | each hasChildren])
		selects: (nodeWithElements elements select: [:each | each hasChildren]).
	nodeWithElements allElementsDo: [:element |
		self
			assertList: (element elementsSelect: [:each | each hasChildren])
			selects: (element elements select: [:each | each hasChildren])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testFindElementNamed [
	| nodeWithElements allElements foundElement |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	foundElement := nodeWithElements findElementNamed: 'four'.
	self
		assert: foundElement notNil;
		assert: (foundElement isNamed: 'four');
		assert: foundElement == (allElements detect: [:each | each isNamed: 'four']);
		assert: (foundElement findElementNamed: 'four') == foundElement;
		assert: (nodeWithElements findElementNamed: 'absent') isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testFindElementNamedNamespaceURI [
	| nodeWithElements allElements foundElement |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	foundElement := nodeWithElements findElementNamed: 'four' namespaceURI: 'testNS'.
	self
		assert: foundElement notNil;
		assert: (foundElement isNamed: 'four').
	self assert:
		foundElement ==
			(allElements detect: [:each |
				(each isNamed: 'four') and: [each namespaceURI = 'testNS']]).
	self
		assert: (foundElement findElementNamed: 'four' namespaceURI: 'testNS') == foundElement;
		assert: (nodeWithElements findElementNamed: 'four' namespaceURI: 'absentNS') isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testFindElementNamedNamespaceURIWith [
	| nodeWithElements allElements foundElement |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	foundElement :=
		nodeWithElements
			findElementNamed: 'four'
			namespaceURI: 'testNS'
			with: [:each | each hasChildren].
	self
		assert: foundElement notNil;
		assert: (foundElement isNamed: 'prefix:four').
	self assert:
		foundElement ==
			(allElements detect: [:each |
				(each isNamed: 'four')
					and: [(each namespaceURI = 'testNS')
						and: [each hasChildren]]]).
	self assert:
		(foundElement
			findElementNamed: 'four'
			namespaceURI: 'testNS'
			with: [:each | each hasChildren]) == foundElement.
	self assert:
		(nodeWithElements 
			findElementNamed: 'four'
			namespaceURI: 'testNS'
			with: [:each | false]) isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testFindElementNamedWith [
	| nodeWithElements allElements foundElement |

	nodeWithElements := self newNodeWithElements.
	allElements := nodeWithElements allElements.
	foundElement := nodeWithElements findElementNamed: 'four' with: [:each | each hasChildren].
	self
		assert: foundElement notNil;
		assert: (foundElement isNamed: 'four').
	self assert:
		foundElement ==
			(allElements detect: [:each | (each isNamed: 'four') and: [each hasChildren]]).
	self
		assert: (foundElement findElementNamed: 'four' with: [:each | each hasChildren]) == foundElement;
		assert: (nodeWithElements findElementNamed: 'four' with: [:each | false]) isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testFindElementWithID [
	| dtd content contentWithUndeclaredAttribute document idElement xmlIDElement |

	dtd := '
		<!DOCTYPE a [
			<!ELEMENT a (
				b,
				c,
				d,
				e
			)>
			<!ELEMENT b EMPTY>
			<!ELEMENT c EMPTY>
			<!ELEMENT d EMPTY>
			<!ELEMENT e EMPTY>
			<!ATTLIST b id CDATA #REQUIRED>
			<!ATTLIST c id ID #REQUIRED>
			<!ATTLIST d xml:id ID #REQUIRED>
		]>'.
	content := '
		<a>
			<b id="one"/>
			<c id="one"/>
			<d xml:id="two"/>
			<e/>
		</a>'.
	contentWithUndeclaredAttribute := '
		<a>
			<b id="one"/>
			<c id="one"/>
			<d xml:id="two" undeclared="three"/>
			<e />
		</a>'.

	#(true false) do: [:isValidating |
		document :=
			XMLDOMParser
				parse:
					dtd,
						(isValidating
							ifTrue: [content]
							ifFalse: [contentWithUndeclaredAttribute])
				usingNamespaces: true
				validation: isValidating.
		idElement := document findElementNamed: 'c'.
		xmlIDElement := document findElementNamed: 'd'.
		self
			assert: (document findElementWithID: 'one') = idElement;
			assert: (idElement findElementWithID: 'one') = idElement;
			assert: (idElement nextElement findElementWithID: 'one') isNil;
			assert: (document findElementWithID: 'two') = xmlIDElement;
			assert: (xmlIDElement findElementWithID: 'two') = xmlIDElement;
			assert: (xmlIDElement nextElement findElementWithID: 'two') isNil;
			assert: (document findElementWithID: 'three') isNil.

		"remove them so they can't access the DTD anymore"
		document root
			removeNode: idElement;
			removeNode: xmlIDElement.
		self
			assert: (document findElementWithID: 'one') isNil;
			assert: (idElement findElementWithID: 'one') isNil;
			assert: (document findElementWithID: 'two') isNil;
			"xml:id is always an ID attribute, even without a DTD declaring it"
			assert: (xmlIDElement findElementWithID: 'two') = xmlIDElement].

	#(true false) do: [:isValidating |
		document :=
			XMLDOMParser
				parse: contentWithUndeclaredAttribute
				usingNamespaces: true
				validation: isValidating.
		xmlIDElement := document findElementNamed: 'd'.
		self
			assert: (document findElementWithID: 'one') isNil;
			"xml:id is always an ID attribute, even without a DTD declaring it"
			assert: (document findElementWithID: 'two') = xmlIDElement;
			assert: (xmlIDElement findElementWithID: 'two') = xmlIDElement].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testFirstElement [
	| root |

	root := self newNodeWithElements nodeAt: 2.
	root elements copy do: [:each |
		self assert: root firstElement = each.
		root removeNode: each].
	self assert: root firstElement isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testHasContentNodes [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self assert: nodeWithElements hasContentNodes.
	nodeWithElements allElementsDo: [:element |
		self assert: element hasContentNodes = element contentNodes notEmpty].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testHasElements [
	self
		deny: self newNode hasElements;
		assert: self newNodeWithElements hasElements;
		deny: self newNodeWithElements removeNodes hasElements
]

{ #category : #tests }
XMLNodeWithElementsTest >> testHasStringNodes [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self deny: nodeWithElements hasStringNodes.
	nodeWithElements allElementsDo: [:element |
		self assert: element hasStringNodes = element stringNodes notEmpty].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testIncludesElement [
	| root |
	
	root := self newNodeWithElements firstElement.
	self deny: (root includesElement: 'absent').
	root elements copy do: [:each |
		self assert: (root includesElement: each name).
		root removeNode: each.
		self deny: (root includesElement: each name)].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testInnerXML [
	| node element |

	node := self newNode.
	element :=
		node addNode:
			(self elementClass
				name: 'test'
				namespaces: (Array with: 'prefix'-> 'ns')).
	element innerXML: '<prefix:inner></prefix:inner>'.
	element firstNode innerXML: 'test<!--comment-->'.
	self
		assert: element nodes size = 1;
		assert: (element firstNode isNamed: 'prefix:inner');
		assert: (element firstNode contentString = 'test');
		assert:
			node innerXML =
				'<test xmlns:prefix="ns"><prefix:inner>test</prefix:inner></test>';
		assert:
			element innerXML =
				'<prefix:inner xmlns:prefix="ns">test</prefix:inner>';
		assert: element firstNode innerXML = 'test'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testInnerXMLIsInContent [
	| node parser |

	node := self newNodeWithElements.
	parser := XMLDOMParser on: '<content/>'.
	self deny: parser isInContent.

	node innerXMLParsedWith: parser.
	self
		assert: node nodes size = 1;
		assert: (node firstNode isElementNamed: 'content');
		deny: node firstNode hasChildren;
		assert: parser isInContent.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testInnerXMLPrettyPrinted [
	| nodeWithElements printString prettyPrintString prettyNodeWithElements |

	nodeWithElements := self newNodeWithElements.
	"remove any whitespace formatting around elements
	(avoid descendantNodesDo: because we're removing)"
	nodeWithElements descendantNodes do: [:each |
		(each isStringNode
			and: [each isWhitespace])
			ifTrue: [each parent removeNode: each]].

	printString := nodeWithElements innerXML.
	prettyPrintString := nodeWithElements innerXMLPrettyPrinted.
	self deny: printString = prettyPrintString.

	prettyNodeWithElements :=
		(XMLDOMParser on: prettyPrintString)
			preservesCommentNodes: true;
			parseDocument.
	self
		assertElements: prettyNodeWithElements descendantElements
		werePrettyPrintFormattedFrom: nodeWithElements descendantElements
]

{ #category : #tests }
XMLNodeWithElementsTest >> testInnerXMLResetting [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		should: [nodeWithElements firstElement innerXML: '<one><two></one></two>']
		raise: XMLWellFormednessException.
	self assert: nodeWithElements printString = self newNodeWithNodes printString.

	self
		should: [nodeWithElements firstElement innerXML: '<one>&invalid;</one>']
		raise: XMLWellFormednessException.
	self assert: nodeWithElements printString = self newNodeWithNodes printString.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testIsContentNode [
	self assert: self newNode isContentNode
]

{ #category : #tests }
XMLNodeWithElementsTest >> testLastElement [
	| root |

	root := self newNodeWithElements nodeAt: 2.
	root elements reversed do: [:each |
		self assert: root lastElement = each.
		root removeNode: each].
	self assert: root lastElement isNil.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewCData [
	| nodeWithElements cdata |

	super testNewCData.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				cdataClass: XMLFCData).
	cdata := nodeWithElements newCData: 'test'.
	self
		assert: cdata class == XMLFCData;
		assert: cdata string = 'test'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewComment [
	| nodeWithElements comment |

	super testNewComment.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				commentClass: XMLFComment).
	comment := nodeWithElements newComment: 'test'.
	self
		assert: comment class == XMLFComment;
		assert: comment string = 'test'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewDocument [
	| nodeWithElements document |

	super testNewDocument.

	(nodeWithElements := self newNode)
		 nodeFactory:
			(XMLPluggableNodeFactory new
				documentClass: XMLFDocument).
	document := nodeWithElements newDocument.
	self
		assert: document class == XMLFDocument;
		assert: document configuration == nodeWithElements configuration;
		assert: document nodeFactory == nodeWithElements nodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewElement [
	| nodeWithElements element |

	super testNewElement.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				elementClass: self otherElementClass).
	element := nodeWithElements newElement.
	self
		assert: element class == self otherElementClass;
		assert: element configuration == nodeWithElements configuration;
		assert: element nodeFactory == nodeWithElements nodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewElementNamed [
	| nodeWithElements element |

	super testNewElementNamed.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableElementFactory new
				handleElement: 'test' withClass: self otherElementClass).
	element := nodeWithElements newElementNamed: 'test'.
	self
		assert: element class == self otherElementClass;
		assert: element name = 'test';
		assert: element configuration == nodeWithElements configuration;
		assert: element nodeFactory == nodeWithElements nodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewElementNamedAttributes [
	| nodeWithElements element |

	super testNewElementNamedAttributes.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableElementFactory new
				handleElement: 'test'
				attributes: self unprefixedAttributeAssociations
				withClass: self otherElementClass;
				attributeListClass: self otherAttributeListClass).
	element :=
		nodeWithElements
			newElementNamed: 'test'
			attributes: self unprefixedAttributeAssociations.
	self
		assert: element class == self otherElementClass;
		assert: element name = 'test';
		assert: element attributeNodes class == self otherAttributeListClass;
		assertElement: element hasAttributes: self unprefixedAttributes;
		assert: element configuration == nodeWithElements configuration;
		assert: element nodeFactory == nodeWithElements nodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewElementNamedNamespaceURI [
	| nodeWithElements element |

	super testNewElementNamedNamespaceURI.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableElementFactory new
				handleElement: 'prefix:test'
				namespaceURI: 'prefixNS'
				withClass: self otherElementClass).
	element :=
		nodeWithElements
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'.
	self
		assert: element class == self otherElementClass;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS';
		assert: element configuration == nodeWithElements configuration;
		assert: element nodeFactory == nodeWithElements nodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewElementNamedNamespaceURIAttributes [
	| nodeWithElements element |

	super testNewElementNamedNamespaceURIAttributes.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableElementFactory new
				handleElement: 'prefix:test'
				namespaceURI: 'prefixNS'
				attributes: self attributeAssociations
				withClass: self otherElementClass;
				attributeListClass: self otherAttributeListClass).
	element :=
		nodeWithElements
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'
			attributes: self attributeAssociations.
	self
		assert: element class == self otherElementClass;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS';
		assert: element attributeNodes class == self otherAttributeListClass;
		assertElement: element hasAttributes: self attributes;
		assert: element configuration == nodeWithElements configuration;
		assert: element nodeFactory == nodeWithElements nodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewPI [
	| nodeWithElements |

	super testNewPI.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				piClass: XMLFPI).
	self assert: nodeWithElements newPI class == XMLFPI.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewPITargetData [
	| nodeWithElements pi |

	super testNewPITargetData.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				piClass: XMLFPI).
	pi :=
		nodeWithElements
			newPITarget: 'target'
			data: 'data'.
	self
		assert: pi class == XMLFPI;
		assert: pi target = 'target';
		assert: pi data = 'data'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNewStringNode [
	| nodeWithElements stringNode |

	super testNewStringNode.

	(nodeWithElements := self newNode)
		nodeFactory:
			(XMLPluggableNodeFactory new
				stringNodeClass: XMLFString).
	stringNode := nodeWithElements newStringNode: 'test'.
	self
		assert: stringNode class == XMLFString;
		assert: stringNode string = 'test'.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testNodeFactory [
	| nodeWithElements oldNodeFactory newNodeFactory |

	nodeWithElements := self newNodeWithElements.
	oldNodeFactory := nodeWithElements nodeFactory.
	self assert: oldNodeFactory class == self nodeFactoryClass.

	newNodeFactory := self nodeFactoryClass new.
	self
		assert: (nodeWithElements nodeFactory: newNodeFactory) == nodeWithElements;
		assert: nodeWithElements nodeFactory == newNodeFactory.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testOuterXMLForNode [
	| nodeWithElements root nodes |

	nodeWithElements := self newNodeWithElements.
	root := nodeWithElements firstElement.
	nodes := root nodes copy.
	nodes copy withIndexDo: [:each :i | | innerXML newNode |
		innerXML := '<new', i printString, '>test</new', i printString, '>'.
		root outerXML: innerXML forNode: each.
		newNode := root nodeAt: i.
		self
			assert: newNode printString = innerXML;
			deny: root nodes = nodes.
		nodes at: i put: newNode.
		self assert: root nodes = nodes].

	nodes copy do: [:each |
		root outerXML: '' forNode: each.
		self deny: root nodes = nodes.
		nodes remove: each.
		self assert: root nodes = nodes].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testOuterXMLForNodeResetting [
	| nodeWithElements root |

	nodeWithElements := self newNodeWithElements.
	root := nodeWithElements firstElement.
	self
		should: [
			root
				outerXML: '<one><two></one></two>'
				forNode: root firstNode]
		raise: XMLWellFormednessException.
	self assert: nodeWithElements printString = self newNodeWithNodes printString.

	self
		should: [
			root
				outerXML: '<one>&invalid;</one>'
				forNode: root firstNode]
		raise: XMLWellFormednessException.
	self assert: nodeWithElements printString = self newNodeWithNodes printString.

	self
		should: [
			root
				outerXML: '<one />'
				forNode: self nodeClass new]
		raise: XMLDOMException.
	self assert: nodeWithElements printString = self newNodeWithNodes printString.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testPrettyPrinted [
	| nodeWithElements printString prettyPrintString prettyNodeWithElements |

	nodeWithElements := self newNodeWithElements.
	"remove any whitespace formatting around elements
	(avoid #allNodesDo: because we're removing)"
	nodeWithElements allNodes do: [:each |
		(each isStringNode
			and: [each isWhitespace])
			ifTrue: [each parent removeNode: each]].

	printString := nodeWithElements printString.
	prettyPrintString := nodeWithElements prettyPrinted.
	self deny: printString = prettyPrintString.

	prettyNodeWithElements :=
		(XMLDOMParser on: prettyPrintString)
			preservesCommentNodes: true;
			parseDocument.
	self
		assertElements: prettyNodeWithElements allElements
		werePrettyPrintFormattedFrom: nodeWithElements allElements.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testPrintedWithoutSelfClosingTags [
	| nodeWithElements printString printStringWithoutSelfClosingTags |

	nodeWithElements := self newNodeWithElements.
	printString := nodeWithElements printString.
	printStringWithoutSelfClosingTags := nodeWithElements printedWithoutSelfClosingTags.
	self deny: printString = printStringWithoutSelfClosingTags.

	nodeWithElements allElementsDo: [:each |
		each hasChildren
			ifFalse: [
				printString :=
					printString
						copyReplaceAll: '<', each name, '/>'
						with: '<', each name, '></', each name, '>']].
	self assert: printString = printStringWithoutSelfClosingTags.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testRawContentString [
	self assert: self newNodeWithElements rawContentString = 'testing onetesting twotesting three'
]

{ #category : #tests }
XMLNodeWithElementsTest >> testRawContentStringAt [
	| root |

	root := self newNodeWithElements firstElement.
	root elementsDo: [:each |
		self assert: (root rawContentStringAt: each name) = each rawContentString].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testRemoveAllFormattingNodes [
	| nodeWithElements nonFormattingStringNodes |

	nodeWithElements := self newNode.
	nodeWithElements innerXML:
		'<a>
			<non-formatting> </non-formatting>
			<b>
				<c>
					<d/>
				</c>
			</b>
			<non-formatting> one </non-formatting>
			<non-formatting>
				one
				<c> </c>
				<c>
					two <d> </d> three
				</c>
				four
			</non-formatting>
		</a>'.
	nonFormattingStringNodes :=
		nodeWithElements allNodesSelect: [:node |
			node isStringNode
				and: [
					node ancestorElements anySatisfy: [:each |
						each isNamed: 'non-formatting']]].

	self
		assert: nodeWithElements removeAllFormattingNodes == nodeWithElements;
		assert:
			(nodeWithElements allNodesSelect: [ :each | each isStringNode]) =
				nonFormattingStringNodes.
]

{ #category : #tests }
XMLNodeWithElementsTest >> testStringNodes [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		assertList: nodeWithElements stringNodes
		selects: (nodeWithElements nodes select: [:each | each isStringNode]).
	nodeWithElements allElementsDo: [:element |
		self
			assertList: element stringNodes
			selects: (element nodes select: [:each | each isStringNode])].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testStringNodesDo [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		xmlShould: [:block | nodeWithElements stringNodesDo: block]
		enumerate: nodeWithElements stringNodes.
	nodeWithElements allElementsDo: [:each |
		self
			xmlShould: [:block | each stringNodesDo: block]
			enumerate: each stringNodes].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testStrings [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		assertList: nodeWithElements strings
		collects: (nodeWithElements stringNodes collect: [:each | each string]).
	nodeWithElements allElementsDo: [:element |
		self
			assertList: element strings
			collects: (element stringNodes collect: [:each | each string]).].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testStringsDo [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self
		xmlShould: [:block | nodeWithElements stringsDo: block]
		enumerate: nodeWithElements strings.
	nodeWithElements allElementsDo: [:each |
		self
			xmlShould: [:block | each stringsDo: block]
			enumerate: each strings].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testUsesNamespaces [
	| nodeWithElements |

	nodeWithElements := self newNodeWithElements.
	self assert: nodeWithElements usesNamespaces.
	nodeWithElements allElementsDo: [:each |
		self assert: each usesNamespaces].

	self
		assert: (nodeWithElements usesNamespaces: false) == nodeWithElements;
		deny: nodeWithElements usesNamespaces.
	nodeWithElements allElementsDo: [:each |
		self deny: each usesNamespaces.
		self
			shouldnt: [each prefix: 'undeclared']
			raise: XMLNamespaceException].

	self
		assert: (nodeWithElements usesNamespaces: true) == nodeWithElements;
		assert: nodeWithElements usesNamespaces.
	nodeWithElements allElementsDo: [:each |
		self assert: each usesNamespaces.
		self
			should: [each prefix: 'undeclaredTwo']
			raise: XMLNamespaceException].
]

{ #category : #tests }
XMLNodeWithElementsTest >> testValidate [
	super testValidate.
	self
		shouldnt: [self newNodeWithNodes validate]
		raise: XMLValidationException.
]
