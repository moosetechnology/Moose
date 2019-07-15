Class {
	#name : #XPathTest,
	#superclass : #TestCase,
	#instVars : [
		'document',
		'namespacedDocument',
		'textDocument'
	],
	#category : #'XPath-Tests'
}

{ #category : #asserting }
XPathTest >> assertNodeSet: aNodeSet hasNode: aNode [
	self
		assertNodeSet: aNodeSet
		hasNodes: (self nodeSetClass with: aNode)
]

{ #category : #asserting }
XPathTest >> assertNodeSet: aNodeSet hasNodes: aNodeCollection [
	self
		assert: aNodeSet size = aNodeCollection size;
		assert: aNodeSet = (XPathNodeSet newFrom: aNodeCollection) sort;
		assert: (aNodeSet sortOrder isKindOf: XPathDocumentSortOrder)
]

{ #category : #asserting }
XPathTest >> assertNodeSet: aNodeSet hasSortOrder: aSortOrder [
	self assert: aNodeSet sortOrder class == aSortOrder
]

{ #category : #accessing }
XPathTest >> contextClass [
	^ XPathContext
]

{ #category : #accessing }
XPathTest >> functionSetClass [
	^ XPathFunctionSet
]

{ #category : #'instance creation' }
XPathTest >> newContext [
	^ self contextClass new
]

{ #category : #'instance creation' }
XPathTest >> newNodeSet [
	^ self nodeSetClass new
]

{ #category : #accessing }
XPathTest >> nodeSetClass [
	^ XPathNodeSet
]

{ #category : #running }
XPathTest >> setUp [
	document :=
		(XMLDOMParser on: XMLParserTest addressBookXML)
			preservesCommentNodes: true;
			parseDocument.
	namespacedDocument := 
		(XMLDOMParser on: XMLParserTest addressBookNamespacePrefixedXML)
			preservesCommentNodes: true;
			parseDocument.
	textDocument :=
		(XMLDOMParser on: self textDocumentXML)
			preservesCommentNodes: true;
			parseDocument.
]

{ #category : #tests }
XPathTest >> testAbbreviatedSteps [
	| expected |

	self
		assertNodeSet: (document xpath: '.')
		hasNode: document.
	self
		assertNodeSet: (document xpath: './.')
		hasNode: document.
	self
		assert: (document xpath: './..') isEmpty;
		assert: (document xpath: '..') isEmpty;
		assert: (document xpath: '../..') isEmpty.
	self
		assertNodeSet: (document xpath: '/.')
		hasNode: document.
	self
		assertNodeSet: (document xpath: '/./.')
		hasNode: document.
	self
		assert: (document xpath: '/./..') isEmpty;
		assert: (document xpath: '/..') isEmpty;
		assert: (document xpath: '/../..') isEmpty.

	expected := document allElementsNamed: 'person'.
	self
		assertNodeSet: (document xpath: './addressbook/./person/.')
		hasNodes: expected.
	self
		assertNodeSet: (document xpath: '././addressbook/././person/./.')
		hasNodes: expected.
	self
		assertNodeSet: (document xpath: './addressbook/../addressbook/person/../person')
		hasNodes: expected.
	self
		assertNodeSet: (document xpath: './addressbook/./../addressbook/./person/./../person')
		hasNodes: expected.

	"abbreviated steps can't have predicates"
	self
		should: [document xpath: '.[true()]']
		raise: XPathSyntaxException.
	self
		should: [document xpath: '..[true()]']
		raise: XPathSyntaxException.
	self
		should: [document xpath: '/.[true()]']
		raise: XPathSyntaxException.
	self
		should: [document xpath: '/..[true()]']
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testAbsoluteLocationPaths [
	document allNodesDo: [:each |
		self
			assertNodeSet: (XPath for: '/' in: each)
			hasNode: document.
		self
			assertNodeSet: (XPath for: '/*' in: each)
			hasNode: document root.
		self
			assertNodeSet: (XPath for: '/self::node()' in: each)
			hasNode: document.
		self
			assertNodeSet: (XPath for: '/addressbook/person' in: each)
			hasNodes: (document allElementsNamed: 'person')]
]

{ #category : #tests }
XPathTest >> testAddFunction [
	| path functionsWithoutCeiling context |

	path := XPath for: 'ceiling(1.9)'.

	functionsWithoutCeiling :=
		self functionSetClass default copyWithout:
			XPathCeilingFunction.
	context := self contextClass functions: functionsWithoutCeiling.
	self deny: (context includesFunction: XPathCeilingFunction).
	self
		should: [
			path
				in: nil
				context: context]
		raise: XPathUndeclaredFunctionException.

	(context := self contextClass functions: functionsWithoutCeiling)
		addFunction: XPathCeilingFunction.
	self assert: (context includesFunction: XPathCeilingFunction).
	"adding should modify an internal copy, not the original"
	self deny: (functionsWithoutCeiling includes: XPathCeilingFunction).
	self assert:
		(path
			in: nil
			context: context) = 2.
]

{ #category : #tests }
XPathTest >> testAncestorAxis [
	| ancestors |

	ancestors := document allNodesSelect: [:each | each hasChildren].
	self
		assertNodeSet: (XPath for: '//ancestor::node()' in: document)
		hasNodes: ancestors.

	ancestors := ancestors select: [:ancestor |
		ancestor nodes anySatisfy: [:each | each hasChildren]].
	self
		assertNodeSet: (XPath for: '//ancestor::node()/ancestor::node()' in: document)
		hasNodes: ancestors.

	ancestors
		removeAll;
		addAll: (document allElementsNamed: 'person');
		addAll: ancestors last ancestorNodes.
	self
		assertNodeSet: (XPath for: '*/person/node()/ancestor::node()' in: document)
		hasNodes: ancestors.

	self
		assertNodeSet: (XPath for: 'addressbook/ancestor::node()' in: document)
		hasNode: document.
	self
		assertNodeSet: (XPath for: 'addressbook/person/ancestor::*' in: document)
		hasNode: document root.

	self
		assert: (XPath for: 'addressbook/ancestor::*' in: document) isEmpty;
		assert: (XPath for: 'ancestor::node()' in: document) isEmpty.
]

{ #category : #tests }
XPathTest >> testAncestorOrSelfAxis [
	| nodes |

	nodes := document allNodesSelect: [:each | each hasChildren not].
	self
		assertNodeSet:
			(XPath
				for: '//node() [ count( child::node() ) = 0]'
				in: document)
		hasNodes: nodes.

	nodes := document allNodes.
	self
		assertNodeSet:
			(XPath
				for: '//node( )[count(child::node( ))=0]/ancestor-or-self::node( )'
				in: document)
		hasNodes: nodes.

	nodes := (document allElementsNamed: 'person') allButLast.
	nodes addAll: nodes last ancestorNodes.
	self
		assertNodeSet:
			(XPath
				for: '//person[last()]/preceding-sibling::person/ancestor-or-self::node()'
				in: document)
		hasNodes: nodes.

	nodes removeAll.
	(document allElementsNamed: 'person') do: [:each |
		nodes
			addLast: each;
			addAll: each nodes].
	nodes addAll: nodes first ancestorNodes.
	self
		assertNodeSet: (XPath for: '*/person/node()/ancestor-or-self::node()' in: document)
		hasNodes: nodes.

	nodes
		removeAll;
		addLast: document root;
		addAll: (document allElementsNamed: 'person').
	self
		assertNodeSet: (XPath for: 'addressbook/person/ancestor-or-self::*' in: document)
		hasNodes: nodes.

	self
		assertNodeSet: (XPath for: 'addressbook/ancestor-or-self::*' in: document)
		hasNode: document root.
	self
		assertNodeSet: (XPath for: 'ancestor-or-self::node()' in: document)
		hasNode: document.
]

{ #category : #tests }
XPathTest >> testAsXPath [
	| path |

	path := '/addressbook' asXPath.
	self
		assert: path class == XPath;
		assert: (document xpath: path) = (self nodeSetClass with: document root);
		assert: path asXPath == path.
]

{ #category : #tests }
XPathTest >> testAttributeAxis [
	| result expected |

	result :=
		XPath
			for: 'addressbook/person/address/@city'
			in: document.
	expected := XMLNodeList new.
	document root
		elementsAt: 'person'
		do: [:person |
			person
				elementsAt: 'address'
				do: [:each |
					(each includesAttribute: 'city')
						ifTrue: [
							expected addLast:
								(each attributeNodeAt: 'city')]]].
	self
		assertNodeSet: result
		hasNodes: expected.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	"attribute nodes don't have attributes"
	self assert: 
		(XPath
			for: 'addressbook/person/address/@city/@city'
			in: document) isEmpty.

	expected removeAll.
	(document allElementsNamed: 'person') allButLast do: [:each |
		expected addAll: each attributeNodes].
	result :=
		(document allElementsNamed: 'person') last xpath:
			'preceding-sibling::node()/attribute::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
]

{ #category : #tests }
XPathTest >> testAttributeNameTest [
	| results |

	results :=
		document xpath:
			'addressbook/person/attribute::node()/self::attribute(employee-number)'.
	self
		assertNodeSet: results
		hasNodes:
			((document allElementsNamed: 'person') collect: [:each |
				each attributeNodeAt: 'employee-number']).

	results :=
		document xpath:
			'addressbook/person/attribute::node()/self::attribute(absent)'.
	self assert: results isEmpty.
]

{ #category : #tests }
XPathTest >> testAttributePredicates [
	| persons |

	persons := (document allElementsNamed: 'person') copyFrom: 2 to: 3.
	self
		assertNodeSet: (document xpath: 'addressbook/person[ @ middle-initial ]')
		hasNodes: persons;
		assertNodeSet: (document xpath: 'addressbook/person[ @ middle-initial and position() > 1 ]')
		hasNodes: persons;
		assertNodeSet: (document xpath: 'addressbook/person[ @ * [ local-name() = "middle-initial" ] ]')
		hasNodes: persons;
		assertNodeSet: (document xpath: 'addressbook/person[ @ * [ self::attribute(middle-initial) ] ]')
		hasNodes: persons;
		assertNodeSet:
			(document xpath:
				'addressbook/person[ @ * [ local-name() = "middle-initial" ] and position() < 4 ]')
		hasNodes: persons.

	self
		assert: (document xpath: 'addressbook/person[ @ middle-initial and position() < 2 ]') isEmpty;
		assert:
			(document xpath:
				'addressbook/person[ @ * [ local-name() = "middle-initial" ] and position() > 3 ]') isEmpty;
		assert: (document xpath: 'addressbook/person[ @ absent ]') isEmpty;
		assert: (document xpath: 'addressbook/person[ @ * [ self::attribute(absent) ] ]') isEmpty;
		assert: (document xpath: 'addressbook/person[ @ * [ local-name() = "absent" ] ]') isEmpty.
]

{ #category : #tests }
XPathTest >> testAttributePredicatesComparison [
	| addresses |

	addresses := document allElementsNamed: 'address'.
	self
		assertNodeSet: (document xpath: '//address[ @ number >= 344 ]')
		hasNodes: addresses.

	addresses := addresses copyReplaceFrom: 2 to: 2 with: #().
	self
		assertNodeSet: (document xpath: '//address[ @ number > 344 ]')
		hasNodes: addresses.

	self
		assertNodeSet: (document xpath: '//address[ @ number <= 344 ]')
		hasNode: (document allElementsNamed: 'address') second.
	self assert: (document xpath: '//address[ @ number < 344 ]') isEmpty.
]

{ #category : #tests }
XPathTest >> testAttributePredicatesEquals [
	| person |

	person := (document allElementsNamed: 'person') first.
	self
		assertNodeSet: (document xpath: 'addressbook/person[ @ employee-number = "A0000" ]')
		hasNode: person;
		assertNodeSet: (document xpath: 'addressbook/person[ @ employee-number = ''A0000'' ]')
		hasNode: person;
		assertNodeSet:
			(document xpath: 'addressbook/person[ @ employee-number = "A0000" and position() = 1]')
		hasNode: person.
	self assert:
		(document xpath:
			'addressbook/person[ @ employee-number = ''A0000'' and position() > 1]') isEmpty.

	self
		assertNodeSet: (document xpath: '//address[ @ number = 344 ]')
		hasNode: (document allElementsNamed: 'address') second.
	self assert:
		(document xpath: '//address[ @ number = 1 ]') isEmpty.
]

{ #category : #tests }
XPathTest >> testAttributePredicatesNotEquals [
	| persons addresses |

	persons := (document allElementsNamed: 'person') allButFirst.
	self
		assertNodeSet: (document xpath: 'addressbook/person[ @ employee-number != "A0000" ]')
		hasNodes: persons;
		assertNodeSet: (document xpath: 'addressbook/person[ @ employee-number != ''A0000'' ]')
		hasNodes: persons;
		assertNodeSet:
			(document xpath: 'addressbook/person[ @ employee-number != "A0000"  and position() > 1]')
		hasNodes: persons.
	self assert:
		(document xpath:
			'addressbook/person[ @ employee-number != ''A0000'' and position() = 1]') isEmpty.

	addresses := document allElementsNamed: 'address'.
	self
		assertNodeSet: (document xpath: '//address[ @ number != 1 ]')
		hasNodes: addresses.
	addresses := addresses copyReplaceFrom: 2 to: 2 with: #().
	self
		assertNodeSet: (document xpath: '//address[ @ number != 344 ]')
		hasNodes: addresses.
]

{ #category : #tests }
XPathTest >> testAttributeTypeTest [
	| expected |

	expected := XMLNodeList new.
	document allNodesDo: [:each |
		each isElement
			ifTrue: [expected addAll: each attributeNodes]
			ifFalse: [
				each isStringNode
					ifTrue: [expected addLast: each]]].
	self
		assertNodeSet: (document xpath: '//attribute::* | //text()')
		hasNodes: expected.
	
	expected := expected select: [:each | each isAttribute].
	self
		assertNodeSet:
			(document xpath: '(//attribute::* | //text())/ self :: attribute()')
		hasNodes: expected.
]

{ #category : #tests }
XPathTest >> testChildAxis [
	| children result |

	children := document allElementsNamed: 'person'.
	result :=
		XPath
			for: 'child::addressbook/child::person'
			in: document.
	self
		assertNodeSet: result
		hasNodes: children.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	children removeAll.
	document
		allElementsNamed: 'person'
		do: [:each |
			children addAll: each nodes].
	result :=
		XPath
			for: '/addressbook/person/node()'
			in: document.
	self
		assertNodeSet: result
		hasNodes: children.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	children := document root nodes copy.
	(document allElementsNamed: 'person') third nodesDo: [:each |
		each hasChildren
			ifTrue: [children addAll: each nodes]].
	result :=
		XPath
			for: '(/addressbook | //person[3]/*)/node()'
			in: document.
	self
		assertNodeSet: result
		hasNodes: children.
]

{ #category : #tests }
XPathTest >> testCommentTypeTest [
	| comments |

	comments := document allNodesSelect: [:each | each isComment].
	self
		assertNodeSet: (document xpath: '//comment()')
		hasNodes: comments.
	self
		assertNodeSet: (document xpath: '//comment()/self::comment()')
		hasNodes: comments.
	self assert: (document xpath: '//comment()/comment()') isEmpty.
]

{ #category : #tests }
XPathTest >> testConcatFunction [
	self
		assert: (XPath for: 'concat("one", "two")' in: nil) = 'onetwo';
		assert: (XPath for: 'concat("one", "two", true())' in: nil) = 'onetwotrue'.
	self
		should: [XPath for: 'concat("one")' in: nil]
		raise: XPathArgumentNumberException.
]

{ #category : #tests }
XPathTest >> testCountFunction [
	self assert:
		(XPath for: 'count(addressbook/person)' in: document) =
			(document allElementsNamed: 'person') size.
	self assert:
		(XPath for: 'addressbook/person[count(@*) >= 4]' in: document) =
			((document allElementsNamed: 'person') copyFrom: 2 to: 3).
	self
		should: [XPath for: 'count()' in: nil]
		raise: XPathArgumentNumberException.
	self
		should: [XPath for: 'count(1)' in: nil]
		raise: XPathTypeException.
]

{ #category : #tests }
XPathTest >> testDescendantAxis [
	| path results |

	path := XPath for: '//address/@city'.
	results := path in: document.
	self
		assert: results size = 4;
		assert: results first value = 'Los Angeles'.

	path := XPath for: 'addressbook/person//address'.
	self
		assertNodeSet: (path in: document)
		hasNodes: (document allElementsNamed: 'address').

	path := XPath for: 'addressbook/person//address//absent'.
	self assert: (path in: document) isEmpty.

	path := XPath for: 'addressbook/person//*'.
	self
		assertNodeSet: (path in: document)
		hasNodes:
			(document root descendantElementsSelect: [:each |
				(each isNamed: 'person') not]).

	path := XPath for: 'addressbook/person//*/descendant::*'.
	self
		assertNodeSet: (path in: document)
		hasNodes:
			(document root descendantElementsSelect: [:each |
				((each isNamed: 'person')
					or: [each parent isNamed: 'person']) not]).

	path := XPath for: 'addressbook/person[last()]/preceding-sibling::person/descendant::*'.
	self
		assertNodeSet: (path in: document)
		hasNodes:
			(document root descendantElementsSelect: [:each |
				((each isNamed: 'person')
					or: [each ancestorElements includes: document root lastElement]) not]).

	path := XPath for: 'addressbook/descendant::comment()'.
	self
		assertNodeSet: (path in: document)
		hasNodes: (document allNodesSelect: [:each | each isComment]).

	path := XPath for: 'addressbook/descendant::comment()/descendant::node()'.
	self assert: (path in: document) isEmpty.
]

{ #category : #tests }
XPathTest >> testDescendantOrSelfAxis [
	self
		assertNodeSet: (XPath for: '//.' in: document)
		hasNodes: document allNodes.
	self
		assertNodeSet: (XPath for: '//./node()' in: document)
		hasNodes: document descendantNodes.
	self
		assertNodeSet: (XPath for: '// self :: node()' in: document)
		hasNodes: document allNodes.
	self
		assertNodeSet: (XPath for: '/ descendant-or-self ::node()' in: document)
		hasNodes: document allNodes.
	self
		assertNodeSet: (XPath for: '//*' in: document)
		hasNodes: document allElements.
	self
		assertNodeSet:
			(XPath for: '//comment()/descendant-or-self::comment()' in: document)
		hasNodes: (document allNodesSelect: [:each | each isComment]).
	self
		assertNodeSet:
			(XPath for: 'addressbook/person/descendant-or-self::element()' in: document)
		hasNodes: document root descendantElements.
	self
		assertNodeSet:
			(XPath for: 'addressbook/person/descendant-or-self::address' in: document)
		hasNodes: (document allElementsNamed: 'address').
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person[last()]/preceding-sibling::person/descendant-or-self::*'
				in: document)
		hasNodes: (document root descendantElements copyUpTo: document root lastElement).
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/contact-info/comment()/descendant-or-self::node()'
				in: document)
		hasNodes: (document allNodesSelect: [:each | each isComment]).
]

{ #category : #tests }
XPathTest >> testDocumentOrderLosing [
	| expected result |

	expected := document allNodesSelect: [:each | each hasChildren].
	result := document xpath: 'descendant::node()/ancestor::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected := document allNodes.
	result := document xpath: 'descendant::node()/ancestor-or-self::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected :=
		document root descendantNodesSelect: [:each |
			each previousNode isNil].
	result := document xpath: 'descendant::node()/descendant::node()[1]'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	document descendantNodesDo: [:each |
		each hasChildren
			ifTrue: [expected add: each firstNode]].
	result := document xpath: 'descendant::node()/descendant-or-self::node()[2]'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected := document root descendantNodesSelect: [:each | each hasParent].
	result := document xpath: 'descendant::node()/node()'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected := self newNodeSet.
	document descendantNodesDo: [:node |
		node followingSiblingNodesDo: [:each |
			expected addIfNotPresent: each]].
	result := document xpath: 'descendant::node()/following-sibling::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	document descendantNodesDo: [:node |
		node followingNodesDo: [:each |
			expected addIfNotPresent: each]].
	result := document xpath: '/descendant::node()/following::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	document descendantNodesDo: [:node |
		node precedingSiblingNodesDo: [:each |
			expected addIfNotPresent: each]].
	result := document xpath: 'descendant::node()/preceding-sibling::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	document descendantNodesDo: [:node |
		node precedingNodesDo: [:each |
			expected addIfNotPresent: each]].
	result := document xpath: 'descendant::node()/preceding::node()'.
	self
		assertNodeSet: result
		hasNodes: expected.
]

{ #category : #tests }
XPathTest >> testDocumentOrderPreserving [
	| expected result |

	expected := document allNodesSelect: [:each | each hasChildren].
	result := document xpath: 'descendant::node()/parent::node()[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected := document allNodes allButFirst.
	result := document xpath: 'descendant::node()/self::node()[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	document allElementsDo: [:each | expected addAll: each attributeNodes].
	result := document xpath: 'descendant::*/@*[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	namespacedDocument allElementsDo: [:each | expected addAll: each namespaceNodes].
	result := namespacedDocument xpath: 'descendant::*/namespace::*[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.
]

{ #category : #tests }
XPathTest >> testDot [
	| path results |

	path := XPath for: 'addressbook/person/address/./@city'.
	results := path in: document.
	self assert: results size = 4.
	self assert: (results at: 1) value = 'Los Angeles'.

]

{ #category : #tests }
XPathTest >> testDotDot [
	| path results |
	path := XPath for: 'addressbook/person/address/../address/@city'.
	results := path in: document.
	self assert: results size = 4.
	self assert: (results at: 1) value = 'Los Angeles'.

]

{ #category : #tests }
XPathTest >> testDotDotTooHigh [
	| path results |
	path := XPath for: 'person/address/../../../address/@city'.
	results := path in: document.
	self assert: results isEmpty.
]

{ #category : #tests }
XPathTest >> testDoubleWildcard [
	self
		assertNodeSet: (XPath for: 'addressbook/*:*' in: document)
		hasNodes: (document allElementsNamed: 'person').
	self
		assertNodeSet: (XPath for: 'book:addressbook/*:*' in: namespacedDocument)
		hasNodes: (namespacedDocument allElementsNamed: 'person').
	self
		assertNodeSet: 
			(XPath
				for: '*:*/*:*'
				in: namespacedDocument
				context: (self newContext declarePrefix: 'two' uri: 'personNS'))
		hasNodes: (namespacedDocument allElementsNamed: 'person').
]

{ #category : #tests }
XPathTest >> testElementDoubleWildcard [
	self
		assertNodeSet: (XPath for: 'addressbook/element(*:*)' in: document)
		hasNodes: (document allElementsNamed: 'person').
	self
		assertNodeSet: (XPath for: 'book:addressbook/element(*:*)' in: namespacedDocument)
		hasNodes: (namespacedDocument allElementsNamed: 'person').
	self
		assertNodeSet:
			(XPath
				for: 'element(*:*)/element(*:*)'
				in: namespacedDocument
				context: (self newContext declarePrefix: 'two' uri: 'personNS')) 
		hasNodes: (namespacedDocument allElementsNamed: 'person').
]

{ #category : #tests }
XPathTest >> testElementExpandedNameTest [
	self
		assertNodeSet:
			(namespacedDocument xpath: 'element( Q{bookNS}addressbook ) / element( Q{personNS}person )')
		hasNodes: (namespacedDocument allElementsNamed: 'person').
	self assert: (namespacedDocument xpath: 'element(Q{undeclared}addressbook)') isEmpty.

	self
		should: [namespacedDocument xpath: 'element(Q{bookNS} addressbook)']
		raise: XPathSyntaxException.
	self
		should: [namespacedDocument xpath: 'element(Q {bookNS}addressbook)']
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testElementExpandedNameWildcardTest [
	self
		assertNodeSet: (namespacedDocument xpath: 'element( Q{bookNS}* ) / element( Q{personNS}* )')
		hasNodes: (namespacedDocument allElementsNamed: 'person').
	self assert: (namespacedDocument xpath: 'element(Q{undeclared}*)') isEmpty.

	self
		should: [namespacedDocument xpath: 'element(Q{bookNS} *)']
		raise: XPathSyntaxException.
	self
		should: [namespacedDocument xpath: 'element(Q {bookNS}*)']
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testElementLocalNameWildcardTest [
	| persons mappings |

	persons := namespacedDocument allElementsNamed: 'person'.
	mappings := 
		Array
			with: 'one' -> 'bookNS'
			with: 'two' -> 'personNS'.
	self
		assertNodeSet: (namespacedDocument xpath: 'element(book:*)/element(ps:*)')
		hasNodes: persons.
	self assert: (namespacedDocument xpath: 'element(book:*)/element(undeclared:*)') isEmpty.
	self
		assertNodeSet:
			(XPath
				for: 'element(one:*)/element(two:*)'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))
		hasNodes: persons.
	self assert:
		(XPath
			for: 'element(one:*)/element(one:*)'
			in: namespacedDocument
			context: (self contextClass namespaces: mappings)) isEmpty.
	self
		should: [
			(XPath
				for: 'element(undeclared:*)'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))]
		raise: XPathUndeclaredPrefixException.
]

{ #category : #tests }
XPathTest >> testElementNameTest [
	self
		assertNodeSet: (document xpath: 'element(addressbook)/element(person)')
		hasNodes: (document allElementsNamed: 'person').
	self assert:
		(namespacedDocument xpath: 'element(addressbook)/element(person)') isEmpty.
]

{ #category : #tests }
XPathTest >> testElementPrefixWildcardTest [
	| persons |

	persons := namespacedDocument allElementsNamed: 'person'.
	self
		assertNodeSet: (namespacedDocument xpath: 'element(*:addressbook)/element(*:person)')
		hasNodes: persons.
	self assert: (namespacedDocument xpath: 'element(*:addressbook)/element(*:contaxt-info)') isEmpty.
	self
		assertNodeSet:
			(XPath
				for: 'element(one:addressbook)/element(*:person)'
				in: namespacedDocument
				context: (self newContext declarePrefix: 'one' uri: 'bookNS'))
		hasNodes: persons.
	self assert:
		(XPath
			for: 'element(one:addressbook)/element(*:contact-info)'
			in: namespacedDocument
			context: (self newContext declarePrefix: 'one' uri: 'bookNS')) isEmpty.
]

{ #category : #tests }
XPathTest >> testElementQualfiedNameTest [
	| persons mappings |

	persons := namespacedDocument allElementsNamed: 'person'.
	mappings := 
		Array
			with: 'zero' -> 'defaultNS'
			with: 'one' -> 'bookNS'
			with: 'two' -> 'personNS'.
	self
		assertNodeSet:
			(namespacedDocument xpath:
				'element(book:addressbook)/element(ps:person)')
		hasNodes: persons.
	self assert:
		(namespacedDocument xpath:
			'element(book:addressbook)/element(undeclared:person)') isEmpty.
	self
		assertNodeSet:
			(XPath
				for: '//element(zero:*)'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))
		hasNodes:
			(namespacedDocument allElementsSelect: [:each |
				each namespaceURI = 'defaultNS']).
	self
		assertNodeSet:
			(XPath
				for: 'element(one:addressbook)/element(two:person)'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))
		hasNodes: persons.
	self assert:
		(XPath
			for: 'element(one:addressbook)/element(one:person)'
			in: namespacedDocument
			context: (self contextClass namespaces: mappings)) isEmpty.

	self
		should: [
			(XPath
				for: 'element(undeclared:addressbook)'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))]
		raise: XPathUndeclaredPrefixException.
]

{ #category : #tests }
XPathTest >> testElementTypeTest [
	self
		assertNodeSet: (document xpath: '//element()')
		hasNodes: document allElements.
	self
		assertNodeSet: (document xpath: '//node()/self::element()')
		hasNodes: document allElements
]

{ #category : #tests }
XPathTest >> testExpandedNameTest [
	self
		assertNodeSet:
			(namespacedDocument xpath: 'Q{bookNS}addressbook/Q{personNS}person')
		hasNodes: (namespacedDocument allElementsNamed: 'person').
	self assert: (namespacedDocument xpath: 'Q{undeclared}addressbook') isEmpty.

	self
		should: [namespacedDocument xpath: 'Q{bookNS} addressbook']
		raise: XPathSyntaxException.
	self
		should: [namespacedDocument xpath: 'Q {bookNS}addressbook']
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testExpressionSource [
	| query compiled newCompiled |

	query := 'test' asXPath.
	self assert: query expressionSource = 'test'.

	compiled := query compiledExpression.
	self
		assert: compiled notNil;
		assert: query compiledExpression == compiled.

	self
		assert: (query expressionSource: 'test/new') == query;
		assert: query expressionSource = 'test/new'.

	newCompiled := query compiledExpression.
	self
		assert: newCompiled notNil;
		deny: newCompiled == compiled;
		assert: query compiledExpression == newCompiled
]

{ #category : #tests }
XPathTest >> testFalseFunction [
	self deny: 'false()' asXPath evaluate.
	self
		should: ['false(1)' asXPath evaluate]
		raise: XPathArgumentNumberException.
]

{ #category : #tests }
XPathTest >> testFileterExpressionPredicates [
	self
		assertNodeSet:
			(document xpath: '(./addressbook/*)[position() <= 3 and position() > 1]')
		hasNodes: ((document allElementsNamed: 'person') copyFrom: 2 to: 3).
	self
		assertNodeSet: (document xpath: '(addressbook/*)[true()] / address')
		hasNodes: (document allElementsNamed: 'address').
	self
		assertNodeSet:
			(document xpath: '(addressbook)[true()] // email')
		hasNodes: (document allElementsNamed: 'email').
	self
		assertNodeSet: (document xpath: '(//person[position()>1])[position()<=2]')
		hasNodes: ((document allElementsNamed: 'person') copyFrom: 2 to: 3).
]

{ #category : #tests }
XPathTest >> testFollowingAxis [
	| persons following |

	persons := document allElementsNamed: 'person'.
	following := self newNodeSet.
	persons first followingNodesDo: [:each |
		following addLast: each].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/following::node()'
				in: document)
		hasNodes: following.

	following removeAll.
	persons do: [:person |
		 person firstNode followingNodesDo: [:each |
			following add: each]].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/node()/following::node()'
				in: document)
		hasNodes: following.

	following removeAll.
	document descendantNodesDo: [:node |
		node followingNodesDo: [:each |
			following addIfNotPresent: each]].
	self
		assertNodeSet: (XPath for: '//following::node()' in: document)
		hasNodes: following.

	following removeAll.
	persons first followingNodesDo: [:each |
		following addIfNotPresent: each].
	persons third firstNode followingNodesDo: [:each |
		following addIfNotPresent: each].
	self
		assertNodeSet:
			(XPath
				for: '(//person[1]|//person[3]/node()[1])/following::node()'
				in: document)
		hasNodes: following.
	self
		assertNodeSet:
			(XPath
				for: '(//person[1]|//person[last()])/following::node()'
				in: document)
		hasNodes: following.
]

{ #category : #tests }
XPathTest >> testFollowingSiblingAxis [
	| persons siblings |

	persons := document allElementsNamed: 'person'.
	siblings := self newNodeSet.
	siblings addAll: persons allButFirst.
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/following-sibling::person'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	persons do: [:each | 
		each hasChildren
			ifTrue: [siblings addAll: each nodes allButFirst]].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/node()/following-sibling::node()'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	persons first allNodesDo: [:node |
		node followingSiblingNodesDo: [:each |
			siblings addIfNotPresent: each]].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person[1]//following-sibling::node()'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	document allNodesDo: [:node |
		node followingSiblingNodesDo: [:each |
			siblings addIfNotPresent: each]].
	self
		assertNodeSet:
			(XPath
				for: '//following-sibling::node()'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	persons first followingSiblingNodesDo: [:each |
		siblings addLast: each].
	persons third nodes first followingSiblingNodesDo: [:each |
		siblings addIfNotPresent: each].
	self
		assertNodeSet:
			(XPath
				for: '(//person[1]|//person[3]/node()[1])/following-sibling::node()'
				in: document)
		hasNodes: siblings.
]

{ #category : #tests }
XPathTest >> testFunctions [
	| functionSet |

	functionSet := self functionSetClass default.
	self
		assert: self newContext functions = functionSet;
		deny: self newContext functions == functionSet;
		assert: (self contextClass functions: functionSet) functions == functionSet;
		assert: (self newContext functions: functionSet) functions == functionSet.
]

{ #category : #tests }
XPathTest >> testIDFunction [
	| dtdWithIDs contentWithIDs contentWithIDsAndUndeclaredAttributes documentWithIDs idElements |

	dtdWithIDs :=
		'<!DOCTYPE one [
			<!ELEMENT one ANY>
			<!ATTLIST one id ID #REQUIRED>
			<!ELEMENT two ANY>
			<!ATTLIST two id2 ID #IMPLIED>
			<!ELEMENT three ANY>
			<!ATTLIST three
				xml:id ID #REQUIRED
				id3 CDATA #IMPLIED>
			<!ELEMENT four ANY>
			<!ATTLIST four id4 ID #REQUIRED>
			<!ELEMENT five ANY>
			<!ATTLIST five id CDATA #IMPLIED>
			<!ELEMENT six ANY>
			<!ATTLIST six id2 CDATA #IMPLIED>
			<!ELEMENT seven ANY>
			<!ATTLIST seven id4 CDATA #IMPLIED>
		]>'.
	contentWithIDs := '
		<one id="first">
			<two/>
			<three xml:id="third" id3="non-id">
				<four id4="fourth">
					<five id="non-id">first</five>
					<six id2="non-id">third</six>
					<seven id4="non-id">non-id</seven>
				</four>
			</three>
		</one>'.
	contentWithIDsAndUndeclaredAttributes := '
		<one id="first">
			<two/>
			<three xml:id="third" id3="non-id">
				<four id4="fourth">
					<five id="non-id">first</five>
					<six id2="non-id">third</six>
					<seven id4="non-id" undeclared="non-id">non-id</seven>
				</four>
			</three>
		</one>'.

	#(true false) do: [:isValidating |
		documentWithIDs :=
			XMLDOMParser
				parse:
					(isValidating
						ifTrue: [dtdWithIDs, contentWithIDs]
						ifFalse: [dtdWithIDs, contentWithIDsAndUndeclaredAttributes])
				usingNamespaces: true
				validation: isValidating.
		idElements :=
			documentWithIDs allElementsSelect: [:each |
				each isNamedAny: #('one' 'three')].
		self
			assertNodeSet: (documentWithIDs xpath: 'id("   third  first non-id  ")')
			hasNodes: idElements.
		self
			assertNodeSet: (documentWithIDs xpath: 'id("first third non-id")')
			hasNodes: idElements.
		self
			assertNodeSet: (documentWithIDs xpath: 'id(//*)')
			hasNodes: idElements].

	"xml:id attributes should always be recognized, even without a DTD"
	#(true false) do: [:isValidating |
		documentWithIDs :=
			XMLDOMParser
				parse: contentWithIDsAndUndeclaredAttributes
				usingNamespaces: true
				validation: isValidating.
		idElements :=
			documentWithIDs allElementsSelect: [:each |
				each isNamedAny: #('three')].
		self
			assertNodeSet: (documentWithIDs xpath: 'id("  third  first  non-id  ")')
			hasNodes: idElements.
		self
			assertNodeSet: (documentWithIDs xpath: 'id("first third non-id")')
			hasNodes: idElements.
		self
			assertNodeSet: (documentWithIDs xpath: 'id(//*)')
			hasNodes: idElements].
]

{ #category : #tests }
XPathTest >> testInvalidAbbreviatedLocationPath [
	self
		should: ['/ /one' asXPath compileExpression]
		raise: XPathSyntaxException.
	self
		should: ['one/ /two' asXPath compileExpression]
		raise: XPathSyntaxException.
	self
		should: ['//' asXPath compileExpression]
		raise: XPathSyntaxException.
	self
		should: ['//one/' asXPath compileExpression]
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testInvalidFilterExpressionRootType [
	#('1[1]' '"string"[position()=1]' 'true()[true()]'
		'(1)[1]' '("string")[position()=1]' '(true())[true()]'
		'1/addressbook' '"string"/addressbook' 'true()/addressbook'
		'(1)/addressbook' '("string")/addressbook' '(true())/addressbook')
		do: [:each |
			self
				should: [document xpath: each]
				raise: XPathTypeException]
]

{ #category : #tests }
XPathTest >> testInvalidNumberTokenizing [
	self
		should: ['. 1' asXPath evaluate]
		raise: XPathSyntaxException.
	self
		should: ['1 .' asXPath evaluate]
		raise: XPathSyntaxException.
	self
		should: ['.1.2' asXPath evaluate]
		raise: XPathSyntaxException.
	self
		should: ['1.2.' asXPath evaluate]
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testInvalidOperatorTokenizing [
	#('1 ortwo 3' '1 andtwo 3' '1 divtwo 3' '1 modtwo 3' '1 ! 3')
		do: [:each |
			self
				should: [each asXPath evaluate]
				raise: XPathSyntaxException]
]

{ #category : #tests }
XPathTest >> testInvalidUnionExpressionType [
	#('//person | 1' '1 | //person'
		'//person | true()' 'true() | //person'
		'//person | "string"' '"string" | //person') do: [:each |
		self
			should: [document xpath: each]
			raise: XPathTypeException].
]

{ #category : #tests }
XPathTest >> testLangFunction [
	| langElement docWithLangElements |

	(langElement := XMLElement named: 'test')
		attributeAt: 'xml:lang' put: 'en-us'.
	self
		assert: ('lang("En")' asXPath in: langElement);
		assert: ('lang("en-US")' asXPath in: langElement);
		deny: ('lang("en-UK")' asXPath in: langElement);
		deny: ('lang("DE")' asXPath in: langElement).

	langElement attributeAt: 'xml:lang' put: 'En'.
	self
		assert: ('lang("En")' asXPath in: langElement);
		deny: ('lang("en-US")' asXPath in: langElement);
		deny: ('lang("en-UK")' asXPath in: langElement);
		deny: ('lang("DE")' asXPath in: langElement).

	"from the spec"
	docWithLangElements :=
		XMLDOMParser parse:
			'<doc>
				<para xml:lang="en"/>
				<div xml:lang="en"><para/></div>
				<para xml:lang="EN"/>
				<para xml:lang="en-us"/>
			</doc>'.
	self
		assertNodeSet:
			(docWithLangElements xpath: '/descendant-or-self::*[lang("en")]')
		hasNodes:
			docWithLangElements root descendantElements.
	self
		assertNodeSet:
			(docWithLangElements xpath: '/descendant-or-self::*[lang("en-us")]')
		hasNodes:
			(XMLNodeList with: docWithLangElements descendantElements last).
]

{ #category : #tests }
XPathTest >> testLastFunction [
	| path elements |

	path := XPath for: 'last()'.
	self assert: (path in: document) = 1.

	path := XPath for: 'last()'.
	elements := document allElementsNamed: 'person'.
	elements do: [:each | self assert: (path in: each) = 1].

	path := XPath for: 'addressbook/person[last()]'.
	self
		assertNodeSet: (path in: document)
		hasNodes: (XMLNodeList with: elements last).

	path := XPath for: 'addressbook/descendant::node()[last()]'.
	self
		assertNodeSet: (path in: document)
		hasNodes: (XMLNodeList with: document allNodes last).

	path := XPath for: 'addressbook//node()[last()]'.
	self
		assertNodeSet: (path in: document)
		hasNodes: (document root descendantNodesSelect: [:each | each nextNode isNil]).

	self
		should: ['last(0)' asXPath evaluate]
		raise: XPathException.
]

{ #category : #tests }
XPathTest >> testLocalNameFunction [
	self assert:
		(XPath
			for: 'local-name(addressbook/person[1]/*[last()]/preceding::*)'
			in: document) = 'contact-info'.
	self assert:
		(XPath
			for: 'local-name(addressbook/absent)'
			in: document) isEmpty.
	self assert:
		(XPath
			for: 'local-name(//comment())'
			in: document) isEmpty.
	self assert:
		(XPath
			for: 'local-name()'
			in: document root) = 'addressbook'.
]

{ #category : #tests }
XPathTest >> testLocalNameWildcardTest [
	| persons mappings |

	persons := namespacedDocument allElementsNamed: 'person'.
	mappings := 
		Array
			with: 'one' -> 'bookNS'
			with: 'two' -> 'personNS'.
	self
		assertNodeSet: (namespacedDocument xpath: 'book:*/ps:*')
		hasNodes: persons.
	self assert: (namespacedDocument xpath: 'book:*/undeclared:*') isEmpty.
	self
		assertNodeSet:
			(XPath
				for: 'one:*/two:*'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))
		hasNodes: persons.
	self assert:
		(XPath
			for: 'one:*/one:*'
			in: namespacedDocument
			context: (self contextClass namespaces: mappings)) isEmpty.

	self
		should: [
			(XPath
				for: 'undeclared:*'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))]
		raise: XPathUndeclaredPrefixException.
]

{ #category : #tests }
XPathTest >> testLocationPathPredicates [
	self
		assertNodeSet:
			(document xpath: '/descendant::home-phone[1][2 - 1][position() = 1]')
		hasNodes:
			(XMLNodeList with: (document allElementsNamed: 'home-phone') first).
	self assert:
		(document xpath: '/descendant::home-phone[1][position() + 1]') isEmpty.

	self
		assertNodeSet:
			(document xpath: '//home-phone[1][1 + 0][position() = 1]')
		hasNodes:
			(document allElementsNamed: 'home-phone') allButLast.
	self
		assertNodeSet:
			(document xpath: '//home-phone[1 + 1][1][position() = 1]')
		hasNodes:
			(XMLNodeList with: (document allElementsNamed: 'home-phone') third).
	self assert:
		(document xpath: '//home-phone[position() = 1][1 + 1]') isEmpty.

	self
		assertNodeSet:
			(document xpath: '/descendant::home-phone[2][1 + 0][position() = 1]')
		hasNodes:
			(XMLNodeList with: (document allElementsNamed: 'home-phone') second).
]

{ #category : #tests }
XPathTest >> testLogicalOperators [
	self
		deny: '0 or 0 or 0' asXPath evaluate;
		assert: '0 or 0 or 1' asXPath evaluate;
		deny: '1 and 1 and 0' asXPath evaluate;
		assert: '1 and 1 and 2' asXPath evaluate;
		deny: '0 or 1 and 0' asXPath evaluate;
		assert: '1 and (0 or 1)' asXPath evaluate;
		assert: '0 and 0 or 1 and 1' asXPath evaluate;
		deny: '0 and 1 or 1 and 0' asXPath evaluate
]

{ #category : #tests }
XPathTest >> testModulus [
	#('5 mod 2' '5 mod -2' '$var mod 2' '$var mod -2') do: [:each |
		self assert:
			(each asXPath
				in: nil
				context:
					(XPathContext new
						variableAt: 'var' put: 5;
						yourself)) = 1].

	#('-5 mod 2' '-5 mod -2' '$var mod 2' '$var mod -2') do: [:each |
		self assert:
			(each asXPath
				in: nil
				context:
					(XPathContext new
						variableAt: 'var' put: -5;
						yourself)) = -1].

	#('6 mod 3' '6 mod -3' '$var mod 3' '$var mod -3') do: [:each | | result |
		result :=
			each asXPath
				in: nil
				context:
					(XPathContext new
						variableAt: 'var' put: 6.0;
						yourself).
		self assert: result isXPathPositiveZero].

	#('-6 mod 3' '-6 mod -3' '$var mod 3' '$var mod -3') do: [:each | | result |
		result :=
			each asXPath
				in: nil
				context:
					(XPathContext new
						variableAt: 'var' put: -6.0;
						yourself).
		self assert: result isXPathNegativeZero].

	#('0.0 mod 0' '0.0 mod -.0' '$var mod 0' '$var mod -.0') do: [:each |
		self assert:
			(each asXPath
				in: nil
				context:
					(XPathContext new
						variableAt: 'var' put: 0.0;
						yourself)) isNaN].

	#('-0.0 mod 0' '-0.0 mod -.0' '$var mod 0' '$var mod -.0') do: [:each |
		self assert:
			(each asXPath
				in: nil
				context:
					(XPathContext new
						variableAt: 'var' put: Float xpathNegativeZero;
						yourself)) isNaN].
]

{ #category : #tests }
XPathTest >> testNameFunction [
	| element |

	(element := XMLElement named: 'test')
		addNode: (XMLElement named: 'test-two');
		addNode: 'test-three' asXMLStringNode.
	self
		assert: (XPath for: 'name()' in: element) = 'test';
		assert: (XPath for: 'name(//.)' in: element) = 'test'.

	element name: 'test' namespaceURI: 'defaultNS'.
	self assert: (XPath for: 'name()' in: element) = 'test'.
	self assert:
		(XPath
			for: 'name()'
			in: element
			context:
				(self newContext
					declarePrefix: 'one'
					uri: 'defaultNS')) = 'test'.

	element name: 'prefix:test' namespaceURI: 'prefixNS'.
	self assert: (XPath for: 'name()' in: element) = 'prefix:test'.
	self assert:
		(XPath
			for: 'name()'
			in: element
			context:
				(self newContext
					declarePrefix: 'two'
					uri: 'prefixNS')) = 'two:test'.

	self assert: (XPath for: 'name(//text())' in: element) isEmpty.
]

{ #category : #tests }
XPathTest >> testNamespaceAxis [
	| nodes |

	nodes := self newNodeSet.
	namespacedDocument allElementsDo: [:each |
		nodes
			add: (XPathNamespaceNode withXMLNamespaceOnElement: each);
			add: (XPathNamespaceNode element: each name: '' uri: 'defaultNS');
			add: (XPathNamespaceNode element: each name: 'book' uri: 'bookNS');
			add: (XPathNamespaceNode element: each name: 'ps' uri: 'personNS')].
	self assert: nodes size = (namespacedDocument allElements size * 4).
	self
		assertNodeSet: (namespacedDocument xpath: '//namespace::*')
		hasNodes: nodes.
	self
		assertNodeSet: (namespacedDocument xpath: '//namespace::book')
		hasNodes: (nodes select: [:each | each name ='book']).

	"namespace nodes can't be prefixed or namespaced themselves:"
	self
		assert: (namespacedDocument xpath: '//namespace::book:*') isEmpty;
		assert: (namespacedDocument xpath: '//namespace::book/namespace::book') isEmpty.

	self
		assertNodeSet: (document xpath: '//namespace::*')
		hasNodes:
			(document allElementsCollect: [:each |
				XPathNamespaceNode withXMLNamespaceOnElement: each]).
]

{ #category : #tests }
XPathTest >> testNamespaceNameTest [
	self
		assertNodeSet: (document xpath: '//namespace::namespace( xml )')
		hasNodes: (document allElements collect: [:each | each namespaceNodes first]).

	self assert: (document xpath: '//namespace::namespace( undeclared )') isEmpty.
]

{ #category : #tests }
XPathTest >> testNamespaceTypeTest [
	| results |

	results := XMLNodeList new.
	namespacedDocument allNodesDo: [:each |
		each isElement
			ifTrue: [results addAll: each namespaceNodes]
			ifFalse: [
				each isStringNode
					ifTrue: [results addLast: each]]].
	self
		assertNodeSet:
			(namespacedDocument xpath: '//namespace::node() | //text()')
		hasNodes: results.
	self
		assertNodeSet:
			(namespacedDocument xpath:
				'(//namespace::node() | //text())/ self :: namespace()')
		hasNodes: (results select: [:each | each isNamespace]).
]

{ #category : #tests }
XPathTest >> testNamespaceURIFunction [
	self
		assert: (document xpath: 'namespace-uri(/*)') isEmpty;
		assert: (document root xpath: 'namespace-uri()') isEmpty;
		assert: (document xpath: 'namespace-uri(/*/*)') isEmpty;
		assert: (namespacedDocument xpath: 'namespace-uri(/*)') = 'bookNS';
		assert: (namespacedDocument root xpath: 'namespace-uri()') = 'bookNS';
		assert: (namespacedDocument xpath: 'namespace-uri(/*/*)') = 'personNS'
]

{ #category : #tests }
XPathTest >> testNegation [
	self
		assert: '-0.0' asXPath evaluate isXPathNegativeZero;
		assert: '--0.0' asXPath evaluate isXPathPositiveZero;
		assert: '---0.0' asXPath evaluate isXPathNegativeZero;
		assert: '-1.0' asXPath evaluate = -1.0;
		assert: '--1.0' asXPath evaluate = 1.0;
		assert: '---1.0' asXPath evaluate = -1.0;
		assert: '-(1 div 0)' asXPath evaluate = Float xpathNegativeInfinity;
		assert: '--(1 div 0)' asXPath evaluate = Float infinity;
		assert: '---(1 div 0)' asXPath evaluate = Float xpathNegativeInfinity;
		assert: '-"test"' asXPath evaluate isNaN;
		assert: '--"test"' asXPath evaluate isNaN;
		assert: '---"test"' asXPath evaluate isNaN
]

{ #category : #tests }
XPathTest >> testNestedFunctionCalls [
	self
		assert: 'number(ceiling(3.5) + floor(1.5))' asXPath evaluate = 5;
		assert: 'contains(concat(concat("one", "two"), string("three")), "two")' asXPath evaluate
]

{ #category : #tests }
XPathTest >> testNodeSetAndBooleanComparing [
	self assert:
		('<list><a>not-empty</a></list>' parseXML xpath:
			'list/b < true()
				and list/b <= true()
				and list/a > false()
				and list/a >= false()
				and false() < list/a
				and true() <= list/a
				and true() > list/b
				and false() >= list/b
				and not(list/b < false())
				and not(list/a <= false())
				and not(list/b > true())
				and not(list/b >= true())
				and not(true() < list/a)
				and not(true() <= list/b)
				and not(true() > list/a)
				and not(false() >= list/a)')
]

{ #category : #tests }
XPathTest >> testNodeSetAndNonNodeSetEquality [
	self assert:
		('<list><a>1</a><a>two</a></list>' parseXML xpath:
			'list/a = 1.0
				and 1.0 = list/a
				and not(list/a = 2.0)
				and not(2.0 = list/a)
				and list/a = "two"
				and "two" = list/a
				and not(list/a = "one")
				and not("one" = list/a)
				and list/a = true()
				and true() = list/a
				and not(list/absent = true())
				and not(true() = list/absent)')
]

{ #category : #tests }
XPathTest >> testNodeSetAndNonNodeSetInequality [
	self assert:
		('<list><a>1</a><b>two</b></list>' parseXML xpath:
			'list/a != 2.0
				and 2.0 != list/a
				and not(list/a != 1.0)
				and not(1.0 != list/a)
				and list/b != "one"
				and "one" != list/b
				and not(list/b != "two")
				and not("two" != list/b)
				and list/a != false()
				and false() != list/a
				and list/absent != true()
				and true() != list/absent')
]

{ #category : #tests }
XPathTest >> testNodeSetAndNumberComparing [
	self assert:
		('<list><a>1</a><a>2</a></list>' parseXML xpath:
			'list/a < 2
				and list/a <= 1
				and list/a > 1
				and list/a >= 2
				and 1 < list/a
				and 2 <= list/a
				and 2 > list/a
				and 2 >= list/a
				and not(list/a < 1)
				and not(list/a <= 0)
				and not(list/a > 3)
				and not(list/a >= 3)
				and not(3 < list/a)
				and not(3 <= list/a)
				and not(0 > list/a)
				and not(0 >= list/a)')
]

{ #category : #tests }
XPathTest >> testNodeSetComparing [
	self assert:
		('<list>
			<a>1</a><a>2</a><a>3</a>
			<b>0</b>
			<c>4</c>
		</list>' parseXML xpath:
			'list/a < list/a
				and list/a <= list/a
				and list/a > list/a
				and list/a >= list/a
				and list/b < list/a
				and list/b <= list/a
				and not(list/b > list/a)
				and not(list/b >= list/a)
				and not(list/c < list/a)
				and not(list/c <= list/a)
				and list/c > list/a
				and list/c >= list/a')
]

{ #category : #tests }
XPathTest >> testNodeSetEquality [
	self assert:
		('<list>
			<a>one</a><a>two</a><a>three</a>
			<b>four</b>
		</list>' parseXML xpath:
			'list/a = list/a
				and list/a != list/a
				and not(list/b = list/a)
				and list/b != list/a
				and not(list/absent = list/a)
				and not(list/absent = list/absent)
				and not(list/absent != list/a)
				and not(list/absent != list/absent)')
]

{ #category : #tests }
XPathTest >> testNormalizeSpaceFunction [
	self assert:
		'normalize-space("
		    one		  
		    two
		    three
		")' asXPath evaluate = 'one two three'.
	self assert: 'normalize-space(" 	")' asXPath evaluate = ''.

	"if the argument is omitted, use a node set with the context node"
	self assert:
		('normalize-space()' asXPath in:
			'<test>
			    one		  
			    two
			    three
			</test>' parseXML) = 'one two three'.
	self assert:
		('normalize-space()' asXPath in: '<test> 	</test>' parseXML) = ''.

	self
		should: ['normalize-space("one","two three")' asXPath evaluate]
		raise: XPathArgumentNumberException.
]

{ #category : #tests }
XPathTest >> testNotFunction [
	self	
		deny: 'not(true())' asXPath evaluate;
		assert: 'not(false())' asXPath evaluate;
		deny: 'not(1) or not("1")' asXPath evaluate;
		assert: 'not(0) and not("")' asXPath evaluate;
		deny: (document xpath: 'not(/node())');
		assert: (document xpath: 'not(/text())').
	self
		should: ['not()' asXPath evaluate]
		raise: XPathArgumentNumberException.
]

{ #category : #tests }
XPathTest >> testNumberFunction [
	self
		assert: 'number("123")' asXPath evaluate = 123;
		assert: 'number(123)' asXPath evaluate = 123;
		assert: 'number(true())' asXPath evaluate = 1;
		assert: 'number(false())' asXPath evaluate = 0.

	"if the argument is omitted, use a node set with the context node"
	self assert:
		('number()' asXPath in: '<test>123</test>' parseXML) = 123.

	self
		should: ['number(1, 23)' asXPath evaluate]
		raise: XPathArgumentNumberException.

]

{ #category : #tests }
XPathTest >> testNumberTokenizing [
	self
		assert: ' 1 ' asXPath evaluate = 1;
		assert: ' 12 ' asXPath evaluate = 12;
		assert: ' 1.5 ' asXPath evaluate = 1.5;
		assert: ' 12.5 ' asXPath evaluate = 12.5;
		assert: ' -1 ' asXPath evaluate = -1;
		assert: ' -12 ' asXPath evaluate = -12;
		assert: ' -1.5 ' asXPath evaluate = -1.5;
		assert: ' -12.5 ' asXPath evaluate = -12.5;
		assert: ' .1 ' asXPath evaluate = 0.1;
		assert: ' .12 ' asXPath evaluate = 0.12;
		assert: ' -.1 ' asXPath evaluate = -0.1;
		assert: ' -.12 ' asXPath evaluate = -0.12
]

{ #category : #tests }
XPathTest >> testOneLevel [
	| path results |
	path := XPath for: 'addressbook/person'.
	results := path in: document.
	self assert: (results size = 4).
]

{ #category : #tests }
XPathTest >> testOptimizedAttributeAxis [
	| attributes |

	attributes := (document findElementNamed: 'person') attributeNodes.
	self
		assertNodeSet: (document xpath: 'addressbook/person[1]/@node()')
		hasNodes: attributes.
	self
		assertNodeSet: (document xpath: 'addressbook/person[1]/@*')
		hasNodes: attributes.
]

{ #category : #tests }
XPathTest >> testOptimizedAttributeAxisWithPositionPredicate [
	| result attributes |

	attributes :=
		(document allElementsNamed: 'person')
			collect: [:each | each attributeNodes first].
	result := document xpath: '//person/@employee-number[1]'.
	self
		assertNodeSet: result
		hasNodes: attributes.
	result := document xpath: '//person/@employee-number[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: attributes.
	self
		assert: (document xpath: '//person/@employee-number[0]') isEmpty;
		assert: (document xpath: '//person/@employee-number[1.2]') isEmpty;
		assert: (document xpath: '//person/@employee-number[1][2]') isEmpty.

	attributes :=
		(document allElementsNamed: 'person')
			collect: [:each | each attributeNodes second].
	result := document xpath: '//person/@*[2]'.
	self
		assertNodeSet: result
		hasNodes: attributes.
	result := document xpath: '//person/@*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: attributes.
	self
		assert: (document xpath: '//person/@*[0]') isEmpty;
		assert: (document xpath: '//person/@*[2.2]') isEmpty;
		assert: (document xpath: '//person/@*[2][2]') isEmpty.

	attributes :=
		(document allElementsNamed: 'person') first attributeNodes.
	result :=
		document xpath:
			'addressbook/person[1]/@*[', attributes size asString, ']'.
	self
		assertNodeSet: result
		hasNodes: (XMLNodeList with: attributes last).
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	result :=
		document xpath:
			'addressbook/person[1]/@*[', (attributes size + 1) asString, ']'.
	self assert: result isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedChildAxisWithPositionPredicate [
	| result children |

	children :=
		XMLNodeList with:
			(document allElementsNamed: 'person') first.
	result := document xpath: 'addressbook/person[1]'.
	self
		assertNodeSet: result
		hasNodes: children.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	result := document xpath: 'addressbook/person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: children.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self
		assert: (document xpath: 'addressbook/person[0]') isEmpty;
		assert: (document xpath: 'addressbook/person[1.2]') isEmpty;
		assert: (document xpath: 'addressbook/person[1][2]') isEmpty.

	children :=
		XMLNodeList with:
			(document allElementsNamed: 'person') second.
	result := document xpath: 'addressbook/*[2]'.
	self
		assertNodeSet: result
		hasNodes: children.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	result := document xpath: 'addressbook/*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: children.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self
		assert: (document xpath: 'addressbook/*[0]') isEmpty;
		assert: (document xpath: 'addressbook/*[2.2]') isEmpty;
		assert: (document xpath: 'addressbook/*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedDescendantAxisWithPositionPredicate [
	| result descendants |

	descendants :=
		XMLNodeList with:
			(document allElementsNamed: 'person') first.
	result := document xpath: 'descendant::person[1]'.
	self
		assertNodeSet: result
		hasNodes: descendants.
	result := document xpath: 'descendant::person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: descendants.
	self
		assert: (document xpath: 'descendant::person[0]') isEmpty;
		assert: (document xpath: 'descendant::person[1.2]') isEmpty;
		assert: (document xpath: 'descendant::person[1][2]') isEmpty.

	descendants :=
		XMLNodeList with:
			document descendantElements second.
	result := document xpath: 'descendant::*[2]'.
	self
		assertNodeSet: result
		hasNodes: descendants.
	result := document xpath: 'descendant::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: descendants.
	self
		assert: (document xpath: 'descendant::*[0]') isEmpty;
		assert: (document xpath: 'descendant::*[2.2]') isEmpty;
		assert: (document xpath: 'descendant::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedDescendantOrSelfAxisWithPositionPredicate [
	| result nodes |

	nodes :=
		XMLNodeList with:
			(document allElementsNamed: 'person') first.
	result := document xpath: 'descendant-or-self::person[1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	result := document xpath: 'descendant-or-self::person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	self
		assert: (document xpath: 'descendant-or-self::person[0]') isEmpty;
		assert: (document xpath: 'descendant-or-self::person[1.2]') isEmpty;
		assert: (document xpath: 'descendant-or-self::person[1][2]') isEmpty.

	nodes :=
		XMLNodeList with:
			document allElements second.
	result := document xpath: 'descendant-or-self::*[2]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	result := document xpath: 'descendant-or-self::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	self
		assert: (document xpath: 'descendant-or-self::*[0]') isEmpty;
		assert: (document xpath: 'descendant-or-self::*[2.2]') isEmpty;
		assert: (document xpath: 'descendant-or-self::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedFollowingAxisWithPositionPredicate [
	| result following |

	following :=
		XMLNodeList with:
			(document allElementsNamed: 'address') second.
	result := document xpath: '//person[1]/following::address[1]'.
	self
		assertNodeSet: result
		hasNodes: following.
	result := document xpath: '//person[1]/following::address[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: following.
	self
		assert: (document xpath: '//person[1]/following::address[0]') isEmpty;
		assert: (document xpath: '//person[1]/following::address[1.2]') isEmpty;
		assert: (document xpath: '//person[1]/following::address[1][2]') isEmpty.

	following :=
		XMLNodeList with:
			(document allElementsNamed: 'person') second firstElement.
	result := document xpath: '//person[1]/following::*[2]'.
	self
		assertNodeSet: result
		hasNodes: following.
	result := document xpath: '//person[1]/following::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: following.
	self
		assert: (document xpath: '//person[1]/following::*[0]') isEmpty;
		assert: (document xpath: '//person[1]/following::*[2.2]') isEmpty;
		assert: (document xpath: '//person[1]/following::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedFollowingSiblingAxisWithPositionPredicate [
	| result followingSiblings |

	followingSiblings :=
		XMLNodeList with:
			(document allElementsNamed: 'person') second.
	result := document xpath: '//person[1]/following-sibling::person[1]'.
	self
		assertNodeSet: result
		hasNodes: followingSiblings.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	result := document xpath: '//person[1]/following-sibling::person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: followingSiblings.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self
		assert: (document xpath: '//person[1]/following-sibling::address[1]') isEmpty;
		assert: (document xpath: '//person[1]/following-sibling::person[0]') isEmpty;
		assert: (document xpath: '//person[1]/following-sibling::person[1.2]') isEmpty;
		assert: (document xpath: '//person[1]/following-sibling::person[1][2]') isEmpty.

	followingSiblings :=
		XMLNodeList with:
			(document allElementsNamed: 'person') third.
	result := document xpath: '//person[1]/following-sibling::*[2]'.
	self
		assertNodeSet: result
		hasNodes: followingSiblings.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	result := document xpath: '//person[1]/following-sibling::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: followingSiblings.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self
		assert: (document xpath: '//person[1]/following-sibling::*[0]') isEmpty;
		assert: (document xpath: '//person[1]/following-sibling::*[2.2]') isEmpty;
		assert: (document xpath: '//person[1]/following-sibling::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedNamespaceAxisWithPositionPredicate [
	| result namespaces |

	namespaces :=
		(namespacedDocument allElementsNamed: 'person')
			collect: [:element |
				element namespaceNodes detect: [:each | each name = 'ps']].
	result := namespacedDocument xpath: '//ps:person/namespace::ps[1]'.
	self
		assertNodeSet: result
		hasNodes: namespaces.
	result := namespacedDocument xpath: '//ps:person/namespace::ps[1]'.
	self
		assertNodeSet: result
		hasNodes: namespaces.
	self
		assert: (namespacedDocument xpath: '//ps:person/namespace::ps[0]') isEmpty;
		assert: (namespacedDocument xpath: '//ps:person/namespace::ps[1.2]') isEmpty;
		assert: (namespacedDocument xpath: '//ps:person/namespace::ps[1][2]') isEmpty.

	namespaces :=
		(namespacedDocument allElementsNamed: 'person')
			collect: [:each | each namespaceNodes second].
	result := namespacedDocument xpath: '//ps:person/namespace::*[2]'.
	self
		assertNodeSet: result
		hasNodes: namespaces.
	result := namespacedDocument xpath: '//ps:person/namespace::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: namespaces.
	self
		assert: (namespacedDocument xpath: '//ps:person/namespace::*[0]') isEmpty;
		assert: (namespacedDocument xpath: '//ps:person/namespace::*[2.2]') isEmpty;
		assert: (namespacedDocument xpath: '//ps:person/namespace::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedParentAxisWithPositionPredicate [
	| result parents |

	parents := document allElementsNamed: 'person'.
	result := document xpath: '//address/parent::person[1]'.
	self
		assertNodeSet: result
		hasNodes: parents.
	result := document xpath: '//address/parent::person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: parents.
	self
		assert: (document xpath: '//address/parent::person[0]') isEmpty;
		assert: (document xpath: '//address/parent::person[1.2]') isEmpty;
		assert: (document xpath: '//address/parent::person[1][2]') isEmpty.

	result := document xpath: '//address/parent::*[1]'.
	self
		assertNodeSet: result
		hasNodes: parents.
	result := document xpath: '//address/parent::*[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: parents.
	self
		assert: (document xpath: '//address/parent::*[0]') isEmpty;
		assert: (document xpath: '//address/parent::*[1.2]') isEmpty;
		assert: (document xpath: '//address/parent::*[1][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPrecedingAxisWithPositionPredicate [
	| result preceding |

	preceding :=
		XMLNodeList with:
			(document allElementsNamed: 'address') first.
	result := document xpath: '//person[2]/preceding::address[1]'.
	self
		assertNodeSet: result
		hasNodes: preceding.
	result := document xpath: '//person[2]/preceding::address[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: preceding.
	self
		assert: (document xpath: '//person[2]/preceding::address[0]') isEmpty;
		assert: (document xpath: '//person[2]/preceding::address[1.2]') isEmpty;
		assert: (document xpath: '//person[2]/preceding::address[1][2]') isEmpty.

	preceding :=
		XMLNodeList with:
			(document allElementsNamed: 'person')
				first allElements reversed second.
	result := document xpath: '//person[2]/preceding::*[2]'.
	self
		assertNodeSet: result
		hasNodes: preceding.
	result := document xpath: '//person[2]/preceding::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: preceding.
	self
		assert: (document xpath: '//person[2]/preceding::*[0]') isEmpty;
		assert: (document xpath: '//person[2]/preceding::*[2.2]') isEmpty;
		assert: (document xpath: '//person[2]/preceding::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPrecedingSiblingAxisWithPositionPredicate [
	| result precedingSibling |

	precedingSibling :=
		XMLNodeList with:
			(document allElementsNamed: 'person') first.
	result := document xpath: '//person[2]/preceding-sibling::person[1]'.
	self
		assertNodeSet: result
		hasNodes: precedingSibling.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	result := document xpath: '//person[2]/preceding-sibling::person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: precedingSibling.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self
		assert: (document xpath: '//person[2]/preceding-sibling::address[1]') isEmpty;
		assert: (document xpath: '//person[2]/preceding-sibling::person[0]') isEmpty;
		assert: (document xpath: '//person[2]/preceding-sibling::person[1.2]') isEmpty;
		assert: (document xpath: '//person[2]/preceding-sibling::person[1][2]') isEmpty.

	result := document xpath: '//person[3]/preceding-sibling::*[2]'.
	self
		assertNodeSet: result
		hasNodes: precedingSibling.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	result := document xpath: '//person[3]/preceding-sibling::*[2.0][1]'.
	self
		assertNodeSet: result
		hasNodes: precedingSibling.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
	self
		assert: (document xpath: '//person[3]/preceding-sibling::*[0]') isEmpty;
		assert: (document xpath: '//person[3]/preceding-sibling::*[2.2]') isEmpty;
		assert: (document xpath: '//person[3]/preceding-sibling::*[2][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateAttributeAxis [
	| attributes |

	attributes :=
		document allElementsSelect: [:each |
			(each isNamed: 'address')
				and: [(each attributeAt: 'city') notEmpty]].
	self
		assertNodeSet: (document xpath: '//address[@city]')
		hasNodes: attributes.
	self
		assertNodeSet: (document xpath: '//address[@city[true()]]')
		hasNodes: attributes.
	self
		assertNodeSet: (document xpath: '//address[./@city]')
		hasNodes: attributes.
	self
		assert: (document xpath: '//address[@absent]') isEmpty;
		assert: (document xpath: '//address[@city[false()]]') isEmpty;
		assert: (document xpath: '//address[./@absent]') isEmpty.

	attributes :=
		document allElementsSelect: [:each |
			(each isNamed: 'address')
				and: [each hasAttributes
					and: [(each attributeAt: 'city') = 'New York']]].
	self
		assertNodeSet: (document xpath: '//address[@city = "New York"]')
		hasNodes: attributes.
	self
		assertNodeSet: (document xpath: '//address[@city[true()] = "New York"]')
		hasNodes: attributes.
	self
		assertNodeSet: (document xpath: '//address[./@city = "New York"]')
		hasNodes: attributes.
	self
		assert: (document xpath: '//address[@city = "Absent"]') isEmpty;
		assert: (document xpath: '//address[@city[false()] = "New York"]') isEmpty;
		assert: (document xpath: '//address[./@city = "Absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateChildAxis [
	| children |

	children := document allElementsNamed: 'person'.
	self
		assertNodeSet: (document xpath: '//*[address]')
		hasNodes: children.
	self
		assertNodeSet: (document xpath: '//*[address[true()]]')
		hasNodes: children.
	self
		assertNodeSet: (document xpath: '//*[./address]')
		hasNodes: children.
	self
		assert: (document xpath: '//*[absent]') isEmpty;
		assert: (document xpath: '//*[address[false()]]') isEmpty;
		assert: (document xpath: '//*[./absent]') isEmpty.

	children :=
		textDocument allElementsSelect: [:element |
			(element isNamed: 'b')
				and: [
					(element elementsAt: 'c') anySatisfy: [:each |
						each stringValue = 'two']]].
	self
		assertNodeSet: (textDocument xpath: '//b[c = "two"]')
		hasNodes: children.
	self
		assertNodeSet: (textDocument xpath: '//b[c[true()] = "two"]')
		hasNodes: children.
	self
		assertNodeSet: (textDocument xpath: '//b[./c = "two"]')
		hasNodes: children.
	self
		assert: (textDocument xpath: '//b[c = "absent"]') isEmpty;
		assert: (textDocument xpath: '//b[c[false()] = "two"]') isEmpty;
		assert: (textDocument xpath: '//b[./c = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateDescendantAxis [
	| descendants |

	descendants :=
		document allElementsSelect: [:element |
			(element descendantElementsDetect: [:each |
				each isNamed: 'address']) notNil].
	self
		assertNodeSet: (document xpath: '//*[descendant::address]')
		hasNodes: descendants.
	self
		assertNodeSet: (document xpath: '//*[descendant::address[true()]]')
		hasNodes: descendants.
	self
		assertNodeSet: (document xpath: '//*[./descendant::address]')
		hasNodes: descendants.
	self
		assert: (document xpath: '//*[descendant::absent]') isEmpty;
		assert: (document xpath: '//*[descendant::address[false()]]') isEmpty;
		assert: (document xpath: '//*[./descendant::absent]') isEmpty.

	descendants :=
		textDocument descendantNodesSelect: [:node |
			node hasChildren
				and: [
					(node descendantNodesDetect: [:each |
						each stringValue = 'two']) notNil]].
	self
		assertNodeSet:
			(textDocument xpath: '//node()[descendant::node() = "two"]')
		hasNodes: descendants.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[descendant::node()[true()] = "two"]')
		hasNodes: descendants.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[./descendant::node() = "two"]')
		hasNodes: descendants.
	self
		assert:
			(textDocument xpath: '//node()[descendant::node() = "absent"]') isEmpty;
		assert:
			(textDocument xpath: '//node()[descendant::node()[false()] = "two"]') isEmpty;
		assert:
			(textDocument xpath: '//node()[./descendant::node() = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateDescendantOrSelfAxis [
	| descendants |

	descendants :=
		document allElementsSelect: [:element |
			(element allElementsDetect: [:each |
				each isNamed: 'address']) notNil].
	self
		assertNodeSet:
			(document xpath: '//*[descendant-or-self::address]')
		hasNodes: descendants.
	self
		assertNodeSet:
			(document xpath: '//*[descendant-or-self::address[true()]]')
		hasNodes: descendants.
	self
		assertNodeSet:
			(document xpath: '//*[./descendant-or-self::address]')
		hasNodes: descendants.
	self
		assert:
			(document xpath: '//*[descendant-or-self::absent]') isEmpty;
		assert:
			(document xpath: '//*[descendant-or-self::address[false()]]') isEmpty;
		assert:
			(document xpath: '//*[./descendant-or-self::absent]') isEmpty.

	descendants :=
		textDocument descendantNodesSelect: [:node |
			node hasChildren
				ifTrue: [
					(node allNodesDetect: [:each |
						each stringValue = 'two']) notNil]
				ifFalse: [node stringValue = 'two']].
	self
		assertNodeSet:
			(textDocument xpath:
				'//node()[descendant-or-self::node() = "two"]')
		hasNodes: descendants.
	self
		assertNodeSet:
			(textDocument xpath:
				'//node()[descendant-or-self::node()[true()] = "two"]')
		hasNodes: descendants.
	self
		assertNodeSet:
			(textDocument xpath:
				'//node()[./descendant-or-self::node() = "two"]')
		hasNodes: descendants.
	self
		assert:
			(textDocument xpath:
				'//node()[descendant-or-self::node() = "absent"]') isEmpty;
		assert:
			(textDocument xpath:
				'//node()[descendant-or-self::node()[false()] = "two"]') isEmpty;
		assert:
			(textDocument xpath:
				'//node()[./descendant-or-self::node() = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateFollowingAxis [
	| following |

	following :=
		document allElements select: [:element |
			element followingNodes anySatisfy: [:each |
				each isElementNamed: 'address']].
	self
		assertNodeSet: (document xpath: '//*[following::address]')
		hasNodes: following.
	self
		assertNodeSet: (document xpath: '//*[following::address[true()]]')
		hasNodes: following.
	self
		assertNodeSet: (document xpath: '//*[./following::address]')
		hasNodes: following.
	self
		assert: (document xpath: '//*[following::absent]') isEmpty;
		assert: (document xpath: '//*[following::node()[false()]]') isEmpty;
		assert: (document xpath: '//*[./following::absent]') isEmpty.

	following :=
		textDocument allNodesSelect: [:node |
			(node followingNodes collect: [:each | each stringValue])
				includes: 'two'].
	self
		assertNodeSet:
			(textDocument xpath: '//node()[following::node() = "two"]')
		hasNodes: following.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[following::node()[true()] = "two"]')
		hasNodes: following.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[./following::node() = "two"]')
		hasNodes: following.
	self
		assert:
			(document xpath: '//node()[following::node() = "absent"]') isEmpty;
		assert:
			(document xpath: '//node()[following::node()[false()] = "two"]') isEmpty;
		assert:
			(document xpath: '//node()[./following::node() = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateFollowingSiblingAxis [
	| followingSiblings |

	followingSiblings :=
		document allElements select: [:element |
			element followingSiblingNodes anySatisfy: [:each |
				each isElementNamed: 'address']].
	self
		assertNodeSet: (document xpath: '//*[following-sibling::address]')
		hasNodes: followingSiblings.
	self
		assertNodeSet: (document xpath: '//*[following-sibling::address[true()]]')
		hasNodes: followingSiblings.
	self
		assertNodeSet: (document xpath: '//*[./following-sibling::address]')
		hasNodes: followingSiblings.
	self
		assert: (document xpath: '//*[following-sibling::absent]') isEmpty;
		assert: (document xpath: '//*[following-sibling::node()[false()]]') isEmpty;
		assert: (document xpath: '//*[./following-sibling::absent]') isEmpty.

	followingSiblings :=
		textDocument allNodesSelect: [:node |
			(node followingSiblingNodes collect: [:each | each stringValue])
				includes: 'two'].
	self
		assertNodeSet:
			(textDocument xpath: '//node()[following-sibling::node() = "two"]')
		hasNodes: followingSiblings.
	self
		assertNodeSet:
			(textDocument xpath:
				'//node()[following-sibling::node()[true()] = "two"]')
		hasNodes: followingSiblings.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[./following-sibling::node() = "two"]')
		hasNodes: followingSiblings.
	self
		assert:
			(document xpath: '//node()[following-sibling::node() = "absent"]')
				isEmpty;
		assert:
			(document xpath: '//node()[following-sibling::node()[false()] = "two"]')
				isEmpty;
		assert:
			(document xpath: '//node()[./following-sibling::node() = "absent"]')
				isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateParentAxis [
	| parents |

	parents := document allElementsNamed: 'person'.
	self
		assertNodeSet: (document xpath: '//*[parent::addressbook]')
		hasNodes: parents.
	self
		assertNodeSet: (document xpath: '//*[parent::addressbook[true()]]')
		hasNodes: parents.
	self
		assertNodeSet: (document xpath: '//*[./parent::addressbook]')
		hasNodes: parents.
	self
		assert: (document xpath: '//*[parent::absent]') isEmpty;
		assert: (document xpath: '//*[parent::addressbook[false()]]') isEmpty;
		assert: (document xpath: '//*[./parent::absent]') isEmpty.

	parents :=
		textDocument allNodesSelect: [:each |
			each isStringNode
				and: [(each parent isElementNamed: 'c')
					and: [each parent rawContentString = 'two']]].
	self
		assertNodeSet: (textDocument xpath: '//text()[parent::c = "two"]')
		hasNodes: parents.
	self
		assertNodeSet: (textDocument xpath: '//text()[parent::c[true()] = "two"]')
		hasNodes: parents.
	self
		assertNodeSet: (textDocument xpath: '//text()[./parent::c = "two"]')
		hasNodes: parents.
	self
		assert:
			(textDocument xpath: '//text()[parent::c = "absent"]') isEmpty;
		assert:
			(textDocument xpath: '//text()[parent::c[false()] = "two"]') isEmpty;
		assert:
			(textDocument xpath: '//text()[./parent::c = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicatePrecedingAxis [
	| preceding |

	preceding :=
		document allElements select: [:element |
			element precedingNodes anySatisfy: [:each |
				each isElementNamed: 'address']].
	self
		assertNodeSet: (document xpath: '//*[preceding::address]')
		hasNodes: preceding.
	self
		assertNodeSet: (document xpath: '//*[preceding::address[true()]]')
		hasNodes: preceding.
	self
		assertNodeSet: (document xpath: '//*[./preceding::address]')
		hasNodes: preceding.
	self
		assert: (document xpath: '//*[preceding::absent]') isEmpty;
		assert: (document xpath: '//*[preceding::node()[false()]]') isEmpty;
		assert: (document xpath: '//*[./preceding::absent]') isEmpty.

	preceding :=
		textDocument allNodesSelect: [:node |
			(node precedingNodes collect: [:each | each stringValue])
				includes: 'two'].
	self
		assertNodeSet:
			(textDocument xpath: '//node()[preceding::node() = "two"]')
		hasNodes: preceding.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[preceding::node()[true()] = "two"]')
		hasNodes: preceding.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[./preceding::node() = "two"]')
		hasNodes: preceding.
	self
		assert:
			(document xpath: '//node()[preceding::node() = "absent"]') isEmpty;
		assert:
			(document xpath: '//node()[preceding::node()[false()] = "two"]') isEmpty;
		assert:
			(document xpath: '//node()[./preceding::node() = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicatePrecedingSiblingAxis [
	| precedingSiblings |

	precedingSiblings :=
		document allElements select: [:element |
			element precedingSiblingNodes anySatisfy: [:each |
				each isElementNamed: 'address']].
	self
		assertNodeSet: (document xpath: '//*[preceding-sibling::address]')
		hasNodes: precedingSiblings.
	self
		assertNodeSet: (document xpath: '//*[preceding-sibling::address[true()]]')
		hasNodes: precedingSiblings.
	self
		assertNodeSet: (document xpath: '//*[./preceding-sibling::address]')
		hasNodes: precedingSiblings.
	self
		assert: (document xpath: '//*[preceding-sibling::absent]') isEmpty;
		assert: (document xpath: '//*[preceding-sibling::node()[false()]]') isEmpty;
		assert: (document xpath: '//*[./preceding-sibling::absent]') isEmpty.

	precedingSiblings :=
		textDocument allNodesSelect: [:node |
			(node precedingSiblingNodes collect: [:each | each stringValue])
				includes: 'two'].
	self
		assertNodeSet:
			(textDocument xpath: '//node()[preceding-sibling::node() = "two"]')
		hasNodes: precedingSiblings.
	self
		assertNodeSet:
			(textDocument xpath:
				'//node()[preceding-sibling::node()[true()] = "two"]')
		hasNodes: precedingSiblings.
	self
		assertNodeSet:
			(textDocument xpath: '//node()[./preceding-sibling::node() = "two"]')
		hasNodes: precedingSiblings.
	self
		assert:
			(document xpath: '//node()[preceding-sibling::node() = "absent"]')
				isEmpty;
		assert:
			(document xpath: '//node()[preceding-sibling::node()[false()] = "two"]')
				isEmpty;
		assert:
			(document xpath: '//node()[./preceding-sibling::node() = "absent"]')
				isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedPredicateSelfAxis [
	| nodes |

	nodes := document allElementsNamed: 'person'.
	self
		assertNodeSet: (document xpath: '//*[self::person]')
		hasNodes: nodes.
	self
		assertNodeSet: (document xpath: '//*[self::person[true()]]')
		hasNodes: nodes.
	self
		assertNodeSet: (document xpath: '//*[./self::person]')
		hasNodes: nodes.
	self
		assert: (document xpath: '//*[self::absent]') isEmpty;
		assert: (document xpath: '//*[self::person[false()]]') isEmpty;
		assert: (document xpath: '//*[./self::absent]') isEmpty.

	nodes :=
		textDocument allNodesSelect: [:each |
			each isStringNode: 'two'].
	self
		assertNodeSet:
			(textDocument xpath: '//text()[self::text() = "two"]')
		hasNodes: nodes.
	self
		assertNodeSet:
			(textDocument xpath: '//text()[self::text()[true()] = "two"]')
		hasNodes: nodes.
	self
		assertNodeSet:
			(textDocument xpath: '//text()[./self::text() = "two"]')
		hasNodes: nodes.
	self
		assert: (document xpath: '//text()[self::text() = "absent"]') isEmpty;
		assert: (document xpath: '//text()[self::text()[false()] = "two"]') isEmpty;
		assert: (document xpath: '//text()[./self::text() = "absent"]') isEmpty.
]

{ #category : #tests }
XPathTest >> testOptimizedSelfAxisWithPositionPredicate [
	| result nodes |

	nodes := document allElementsNamed: 'person'.
	result := document xpath: '//person/self::person[1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	result := document xpath: '//person/self::person[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	self
		assert: (document xpath: '//person/self::person[0]') isEmpty;
		assert: (document xpath: '//person/self::person[1.1]') isEmpty;
		assert: (document xpath: '//person/self::person[1][2]') isEmpty.

	result := document xpath: '//person/self::*[1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	result := document xpath: '//person/self::*[1.0][1]'.
	self
		assertNodeSet: result
		hasNodes: nodes.
	self
		assert: (document xpath: '//person/self::*[0]') isEmpty;
		assert: (document xpath: '//person/self::*[1.2]') isEmpty;
		assert: (document xpath: '//person/self::*[1][2]') isEmpty.
]

{ #category : #tests }
XPathTest >> testParentAxis [
	self
		assertNodeSet:
			(XPath
				for: '//parent::*'
				in: document)
		hasNodes: (document allElementsSelect: [:each | each hasChildren]).

	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/parent::*'
				in: document)
		hasNodes: (XMLNodeList with: document root).

	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/node()/parent::*'
				in: document)
		hasNodes: (document allElementsNamed: 'person').

	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/node()/parent::*[1][position()=1][last()=1]'
				in: document)
		hasNodes: (document allElementsNamed: 'person').
	self assert:
		(XPath
			for: 'addressbook/person/node()/parent::*[2]'
			in: document) isEmpty.
	self assert:
		(XPath
			for: 'addressbook/person/node()/parent::*[position()+1]'
			in: document) isEmpty.

	self
		assertNodeSet:
			(XPath
				for: 'parent::*[1][position()=1][last()=1]'
				in: (document findElementNamed: 'person'))
		hasNodes: (XMLNodeList with: document root).
	self assert:
		(XPath
			for: 'parent::*[2]'
			in: (document findElementNamed: 'person')) isEmpty.
	self assert:
		(XPath
			for: 'parent::*[position() + 1]'
			in: (document findElementNamed: 'person')) isEmpty.

	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/attribute::node()/parent::node()'
				in: document)
		hasNodes: (document allElementsNamed: 'person').

	self assert:
		(XPath
			for: 'parent::node()'
			in: document) isEmpty.
	self assert:
		(XPath
			for: 'addressbook/parent::*'
			in: document) isEmpty.
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/parent::node()'
				in: document)
		hasNodes: (XMLNodeList with: document)
]

{ #category : #tests }
XPathTest >> testPositionFunction [
	self assert:
		(XPath
			for: ' position( ) '
			in: document) = 1.

	(document allElementsNamed: 'person') do: [:each |
		self assert: (XPath for: ' position() ' in: each) = 1].

	(document allElementsNamed: 'person')
		withIndexDo: [:each :i |
			self assert:
				(XPath
					for: 'addressbook/person[position() = ', i printString, ']'
					in: document) = (XMLNodeList with: each).
			self assert:
				(XPath
					for: 'addressbook/person[', i printString, '=position()]'
					in: document) = (XMLNodeList with: each).
			self assert:
				(XPath
					for: 'addressbook/person[ ', i printString, ' ]'
					in: document) = (XMLNodeList with: each)].

	self
		should: ['position(0)' asXPath evaluate]
		raise: XPathException.
]

{ #category : #tests }
XPathTest >> testPrecedence [
	self
		assert: (XPath for: '1 + 2 * 3 + 4 div 2' in: nil) rounded = 9;
		assert: (XPath for: '(1 + 2) * (3 + 4) mod 5' in: nil) rounded = 1.
]

{ #category : #tests }
XPathTest >> testPrecedingAxis [
	| persons preceding |

	persons := document allElementsNamed: 'person'.
	preceding := self newNodeSet.
	persons last precedingNodesDo: [:each | preceding addLast: each].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/preceding::node()'
				in: document)
		hasNodes: preceding.

	preceding removeAll.
	persons do: [:person |
		person hasChildren
			ifTrue: [
				person nodes last precedingNodesDo: [:each |
					preceding addIfNotPresent: each]]].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person/node()/preceding::node()'
				in: document)
		hasNodes: preceding.

	preceding removeAll.
	document allNodesDo: [:node |
		node precedingNodesDo: [:each |
			preceding addIfNotPresent: each]].
	self
		assertNodeSet:
			(XPath
				for: '//preceding::node()'
				in: document)
		hasNodes: preceding.

	preceding removeAll.
	persons last precedingNodesDo: [:each |
		preceding addLast: each].
	persons second nodes last precedingNodesDo: [:each |
		preceding addLast: each].
	self
		assertNodeSet:
			(XPath
				for: '(//person[last()]|//person[2]/node()[last()])/preceding::node()'
				in: document)
		hasNodes: preceding.
	self
		assertNodeSet:
			(XPath
				for: '(//person[last()]|//person[1])/preceding::node()'
				in: document)
		hasNodes: preceding.
]

{ #category : #tests }
XPathTest >> testPrecedingSiblingAxis [
	| persons siblings |

	persons := document allElementsNamed: 'person'.
	siblings := self newNodeSet.
	persons fourth precedingSiblingNodesDo: [:each |
		siblings addLast: each].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person[4]/preceding-sibling::node()'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	persons fourth precedingSiblingNodesDo: [:node |
		node hasChildren
			ifTrue: [
				node
					elementsAt: 'manager'
					do: [:each | siblings addIfNotPresent: each]]].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person[4]/preceding-sibling::node()/manager'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	persons fourth allNodesDo: [:node |
		node precedingSiblingNodesDo: [:each |
			siblings addIfNotPresent: each]].
	self
		assertNodeSet:
			(XPath
				for: 'addressbook/person[4]//preceding-sibling::node()'
				in: document)
		hasNodes: siblings.

	siblings removeAll.
	document allNodesDo: [:node |
		node precedingSiblingNodesDo: [:each |
			siblings addIfNotPresent: each]].
	self
		assertNodeSet:
			(XPath for: '//preceding-sibling::node()' in: document)
		hasNodes: siblings.

	siblings removeAll.
	persons last precedingSiblingNodesDo: [:each |
		siblings addLast: each].
	persons second nodes last precedingSiblingNodesDo: [:each |
		siblings addIfNotPresent: each].
	self
		assertNodeSet:
			(XPath
				for: '(//person[last()]|//person[2]/node()[last()])/preceding-sibling::node()'
				in: document)
		hasNodes: siblings.
]

{ #category : #tests }
XPathTest >> testPrefixWildcardTest [
	| persons |

	persons := namespacedDocument allElementsNamed: 'person'.
	self
		assertNodeSet: (namespacedDocument xpath: '*:addressbook/*:person')
		hasNodes: persons.
	self assert: (namespacedDocument xpath: '*:addressbook/*:contaxt-info') isEmpty.
	self
		assertNodeSet:
			(XPath
				for: 'one:addressbook/*:person'
				in: namespacedDocument
				context: (self newContext declarePrefix: 'one' uri: 'bookNS'))
		hasNodes: persons.
	self assert:
		(XPath
			for: 'one:addressbook/*:contact-info'
			in: namespacedDocument
			context: (self newContext declarePrefix: 'one' uri: 'bookNS')) isEmpty.
]

{ #category : #tests }
XPathTest >> testProcessingInstructionTypeTest [
	| xml |

	xml := '<root>before<?one two?><?three four?>after</root>' parseXML.
	self
		assertNodeSet: (xml xpath: '// processing-instruction ()')
		hasNodes: (xml root nodes copyFrom: 2 to: 3).
	self
		assertNodeSet: (xml xpath: '// processing-instruction ( "three" )')
		hasNodes: (xml root nodes copyFrom: 3 to: 3).
	self
		assertNodeSet: (xml xpath: '// processing-instruction ( one )')
		hasNodes: (xml root nodes copyFrom: 2 to: 2).
]

{ #category : #tests }
XPathTest >> testQualfiedNameTest [
	| persons mappings |

	persons := namespacedDocument allElementsNamed: 'person'.
	mappings := 
		Array
			with: 'one' -> 'bookNS'
			with: 'two' -> 'personNS'.
	self
		assert: (namespacedDocument xpath: 'book:addressbook/ps:person') = persons;
		assert: (namespacedDocument xpath: 'book:addressbook/undeclared:person') isEmpty.
	self assert:
		(XPath
			for: 'one:addressbook/two:person'
			in: namespacedDocument
			context: (self contextClass namespaces: mappings)) = persons.
	self assert:
		(XPath
			for: 'one:addressbook/one:person'
			in: namespacedDocument
			context: (self contextClass namespaces: mappings)) isEmpty.
	self
		should: [
			(XPath
				for: 'undeclared:addressbook'
				in: namespacedDocument
				context: (self contextClass namespaces: mappings))]
		raise: XPathUndeclaredPrefixException.
]

{ #category : #tests }
XPathTest >> testReverseDocumentOrderPreserving [
	| expected result |

	result :=
		document xpath:
			'addressbook/person[last()]/preceding-sibling::node()/parent::node()[true()]'.
	self
		assertNodeSet: result
		hasNode: document root.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	expected :=
		document root nodes copyUpTo:
			(document allElementsNamed: 'person') last.
	result :=
		document xpath:
			'addressbook/person[last()]/preceding-sibling::node()/self::node()[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	expected removeAll.
	(document allElementsNamed: 'person') allButLast do: [:each |
		expected addAll: each attributeNodes].
	result :=
		document xpath:
			'addressbook/person[last()]/preceding-sibling::node()/@*[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.

	expected removeAll.
	(namespacedDocument allElementsNamed: 'person') allButLast do: [:each |
		expected addAll: each namespaceNodes].
	result :=
		namespacedDocument xpath:
			'book:addressbook/ps:person[last()]/preceding-sibling::node()/namespace::*[true()]'.
	self
		assertNodeSet: result
		hasNodes: expected.
	self
		assertNodeSet: result
		hasSortOrder: XPathLevelDocumentSortOrder.
]

{ #category : #tests }
XPathTest >> testReverseForwardAxisCombination [
	| nodes |

	nodes := self newNodeSet.
	(document allElementsNamed: 'person') allButLast do: [:person |
		person descendantNodesDo: [:each |
			nodes addLast: each]].
	self
		assertNodeSet:
			(XPath for: '*/person[last()]/preceding::node()/node()' in: document)
		hasNodes: nodes.

	nodes := (document allElementsNamed: 'person') allButLast.
	self
		assertNodeSet:
			(XPath
				for: '*/person[last()]/preceding-sibling::node()/self::*[1][position()>0]'
				in: document)
		hasNodes: nodes.
	self
		assert:
			(XPath
				for: '*/person[last()]/preceding-sibling::node()/self::*[1][2]'
				in: document) isEmpty.
]

{ #category : #tests }
XPathTest >> testRoundFunction [
	self
		assert: 'round(1.1)' asXPath evaluate = 1;
		assert: 'round(1.9)' asXPath evaluate = 2;
		assert: 'round(1 div 0)' asXPath evaluate = Float infinity;
		assert: 'round(-1 div 0)' asXPath evaluate = Float xpathNegativeInfinity;
		assert: 'round(0 div 0)' asXPath evaluate isNaN;
		assert: 'round(0.5)' asXPath evaluate = 1;
		assert: 'round(-0.5)' asXPath evaluate isXPathNegativeZero;
		assert: 'round(0.0)' asXPath evaluate isXPathPositiveZero;
		assert: 'round(-0.0)' asXPath evaluate isXPathNegativeZero
]

{ #category : #tests }
XPathTest >> testSelfAxis [
	self
		assertNodeSet: (XPath for: ' / self::node() ' in: document)
		hasNodes: (XMLNodeList with: document).
	self
		assertNodeSet: (XPath for: ' /*/person/self::* ' in: document)
		hasNodes: (document allElementsNamed: 'person').
	self
		assertNodeSet: (XPath for: ' /*/person/node()/self::node() ' in: document)
		hasNodes:
			(document allNodesSelect: [:each |
				each hasParent
					and: [each parent isElementNamed: 'person']]).

	self
		assertNodeSet:
			(XPath
				for: ' /*/person/self::node()[1][position() = 1][last() = 1] '
				in: document)
		hasNodes: (document allElementsNamed: 'person').
	self
		assert: (XPath for: ' /*/person/self::node()[2] ' in: document) isEmpty;
		assert: (XPath for: ' /*/person/self::node()[position() + 1] ' in: document) isEmpty.

	self
		assertNodeSet:
			(XPath
				for: 'self::node()[1][position() = 1][last() = 1]'
				in: document)
		hasNodes: (XMLNodeList with: document).
	self
		assert: (XPath for: 'self::node()[2]' in: document) isEmpty;
		assert: (XPath for: 'self::node()[position() + 1]' in: document) isEmpty.

	self
		assertNodeSet: (XPath for: ' //person[1]/attribute::node()/. ' in: document)
		hasNodes: (document findElementNamed: 'person') attributeNodes.
	self assert:
		(XPath
			for: ' //person[1]/attribute::node()/self::* '
			in: document) isEmpty.
]

{ #category : #tests }
XPathTest >> testSorting [
	| allNodes |

	allNodes := document allNodes.
	(Array
		with: (self nodeSetClass newFrom: allNodes)
		with: (self nodeSetClass newFrom: allNodes reversed))
		do: [:nodeSet |
			self
				assert: nodeSet sorted = allNodes;
				assert: nodeSet sorted reversed sorted = allNodes].
]

{ #category : #tests }
XPathTest >> testStartsWithFunction [
	self
		assert: 'starts-with("onetwothree", "one")' asXPath evaluate;
		deny: 'starts-with("onetwothree", "ONE")' asXPath evaluate;
		"string-type argument converts 1.0 to '1', but not 1.1 to '1'"
		assert: 'starts-with("123", 1.0)' asXPath evaluate;
		deny: 'starts-with("123", 1.1)' asXPath evaluate
]

{ #category : #tests }
XPathTest >> testStringFunction [
	self
		assert: 'string("test")' asXPath evaluate = 'test';
		assert: 'string(1.0)' asXPath evaluate = '1';
		assert: 'string(1 div 0)' asXPath evaluate = 'Infinity';
		assert: 'string(-1 div 0)' asXPath evaluate = '-Infinity';
		assert: 'string(0 div 0)' asXPath evaluate = 'NaN';
		assert: 'string(0.0)' asXPath evaluate = '0';
		assert: 'string(-0.0)' asXPath evaluate = '0';
		assert: 'string(true())' asXPath evaluate = 'true';
		assert: 'string(false())' asXPath evaluate = 'false'.

	"if the argument is omitted, use a node set with the context node"
	self assert:
		('string()' asXPath in: '<test>test</test>' parseXML) = 'test'.

	self
		should: ['string("1", "23")' asXPath evaluate]
		raise: XPathArgumentNumberException.

]

{ #category : #tests }
XPathTest >> testStringLengthFunction [
	self
		assert: 'string-length("test")' asXPath evaluate = 4;
		assert: 'string-length(false())' asXPath evaluate = 5;
		assert: ('string-length()' asXPath in: 'string-value' asXMLStringNode) = 12
]

{ #category : #tests }
XPathTest >> testSubstringAfterFunction [
	self
		assert: 'substring-after("onetwothree", "one")' asXPath evaluate = 'twothree';
		assert: 'substring-after("onetwothree", ''two'')' asXPath evaluate = 'three';
		assert: 'substring-after("onetwothree", "three")' asXPath evaluate isEmpty;
		assert: 'substring-after("onetwothree", "four")' asXPath evaluate isEmpty
]

{ #category : #tests }
XPathTest >> testSubstringBeforeFunction [
	self
		assert: 'substring-before("onetwothree", "one")' asXPath evaluate isEmpty;
		assert: 'substring-before("onetwothree", ''two'')' asXPath evaluate = 'one';
		assert: 'substring-before("onetwothree", "three")' asXPath evaluate = 'onetwo';
		assert: 'substring-before("onetwothree", "four")' asXPath evaluate isEmpty
]

{ #category : #tests }
XPathTest >> testSubstringFunction [
	#('substring("onetwothree", 4, 3)'
		'substring("onetwothree", 4)'
		'substring("onetwothree", -3, 7)'
		'substring("onetwothree", 12, 2)'
		'substring("", 0, 1)'
		'substring("", 0)')
		with:
			#('two'
				'twothree'
				'one'
				''
				''
				'')
		do: [:expression :result |
			self assert: expression asXPath evaluate = result].

	"from the spec"
	#('substring("12345",2,3)'
		'substring("12345",2)'
		'substring("12345", 1.5, 2.6)'
		'substring("12345", 0, 3)'
		'substring("12345", 0 div 0, 3)'
		'substring("12345", 1, 0 div 0)'
		'substring("12345", -42, 1 div 0)'
		'substring("12345", -1 div 0, 1 div 0)')
		with:
			#('234'
				'2345'
				'234'
				'12'
				''
				''
				'12345'
				'')
		do: [:expression :result |
			self assert: expression asXPath evaluate = result].
]

{ #category : #tests }
XPathTest >> testSumFunction [
	self assert:
		('<nums><one>1</one><two>2</two><three>3</three></nums>' parseXML
			xpath: 'sum(/nums/*)') = 6.
	self
		should: ['sum()' asXPath evaluate]
		raise: XPathArgumentNumberException.
]

{ #category : #tests }
XPathTest >> testTextTypeTest [
	self
		assertNodeSet: (document xpath: ' //text( ) ')
		hasNodes: (document allNodesSelect: [:each | each isStringNode]).
	self
		assertNodeSet: (document xpath: '//text()/self::text()')
		hasNodes: (document allNodesSelect: [:each | each isStringNode]).
	self assert: (document xpath: ' //text()/text()') isEmpty.

	self
		should: [document xpath: '//text(name)']
		raise: XPathSyntaxException.
]

{ #category : #tests }
XPathTest >> testThreeLevel [
	| path results |
	path := XPath for: '*/person/contact-info/email'.
	results := path in: document.
	self assert: (results size = 2).
]

{ #category : #tests }
XPathTest >> testTopLevel [
	| path results elem |
	path := XPath for: 'addressbook'.
	results := path in: document.
	
	self assert: results size = 1.
	
	elem := results first.
	self assert: elem isElement.
	self assert: elem name = 'addressbook'.
	self assert: elem elements size = 4.
	self assert: elem elements first isElement.
	self assert: elem elements first name = 'person'.
	self assert: elem elements last name = 'person'.	
]

{ #category : #tests }
XPathTest >> testTranslateFunction [
	self
		assert: 'translate("onetwothree", "oe", "O")' asXPath evaluate = 'OntwOthr';
		assert: 'translate("onetwothree", "oe", "OEN")' asXPath evaluate = 'OnEtwOthrEE';
		assert: 'translate("onetwothree", "z", "x")' asXPath evaluate = 'onetwothree'.

	"from the spec"
	self
		assert: 'translate("bar","abc","ABC")' asXPath evaluate = 'BAr';
		assert: 'translate("--aaa--","abc-","ABC")' asXPath evaluate = 'AAA'.
]

{ #category : #tests }
XPathTest >> testTrueFunction [
	self assert: 'true()' asXPath evaluate.
	self
		should: ['true(1)' asXPath evaluate]
		raise: XPathArgumentNumberException.
]

{ #category : #tests }
XPathTest >> testTwoLevel [
	| path results |
	path := XPath for: '/*/person/address'.
	results := path in: document.
	self assert: (results size = 4).
]

{ #category : #tests }
XPathTest >> testUndeclaredFunctions [
	self
		should: [XPath for: 'undeclared()/addressbook' in: document]
		raise: XPathUndeclaredFunctionException.
	self
		should: [XPath for: '(undeclared())/addressbook' in: document]
		raise: XPathUndeclaredFunctionException.
	self
		should: [XPath for: 'addressbook[undeclared()]' in: document]
		raise: XPathUndeclaredFunctionException.
]

{ #category : #tests }
XPathTest >> testUndeclaredVariables [
	self
		should: [XPath for: '$undeclared/addressbook' in: document]
		raise: XPathUndeclaredVariableException.
	self
		should: [XPath for: '($undeclared)/addressbook' in: document]
		raise: XPathUndeclaredVariableException.
	self
		should: [XPath for: 'addressbook[$undeclared]' in: document]
		raise: XPathUndeclaredVariableException.
]

{ #category : #tests }
XPathTest >> testUnion [
	| expected result |

	expected := document allElementsNamed: 'person'.
	result := 
		XPath
			for:
				'addressbook/person[position() = 1 or position() = 4] |
				(addressbook/person[4]/ preceding-sibling::* [position() < 4])'
			in: document.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	document allElementsNamed: 'person' do: [:each |
		expected
			addLast: each;
			addAll: each namespaceNodes;
			addAll: each attributeNodes;
			addAll: each elements].
	result :=
		XPath
			for:
				'addressbook/person/@* | ',
				'*/person/namespace::* | ',
				'addressbook/person | ',
				'*/person/*'
			in: document.
	self
		assertNodeSet: result
		hasNodes: expected.

	expected removeAll.
	(document allElementsNamed: 'person') first
		namespaceNodesDo: [:each | expected addLast: each];
		attributeNodesDo: [:each | expected addLast: each];
		nodesDo: [:each | expected addLast: each].
	result :=
		XPath
			for:
				'addressbook/person[1]/node() | ',
				'*/person[1]/@* | ',
				'addressbook/person[1]/namespace::*'
			in: document.
	self
		assertNodeSet: result
		hasNodes: expected.
]

{ #category : #tests }
XPathTest >> testVariables [
	| context result |

	(context := self newContext)
		variableAt: 'doc' put: document;
		variableAt: 'pos' ifAbsentPut: [4].
	result :=
		(XPath for: '$doc/addressbook/person[position() != $pos]')
			in: nil
			context: context.
	self assert: result = (document allElementsNamed: 'person') allButLast.

	context :=
		self contextClass variables:
			(Dictionary
				with: 'doc' -> document
				with: 'city' -> 'Los Angeles').
	result :=
		(XPath for: '($doc)/addressbook/person[.//address[@city=$city]]')
			in: nil
			context: context.
	self
		assert: result size = 2;
		assert:
			result =
				((document allElementsNamed: 'person') select: [:each |
					((each elementAt: 'address') attributeAt: 'city') = 'Los Angeles']).
]

{ #category : #tests }
XPathTest >> testWildcard [
	| path results |

	path := XPath for: 'addressbook/*'.
	results := path in: document.
	self assert: results size = 4.
	self
		assertNodeSet: results
		hasNodes: (document allElementsNamed: 'person').
]

{ #category : #tests }
XPathTest >> testWildcardDescendant [
	| path results |

	path := XPath for: '//*'.
	results := path in: document.
	self assert: (results size = 28).
	self
		assertNodeSet: results
		hasNodes: document descendantElements.
]

{ #category : #tests }
XPathTest >> testWildcardDescendantAttribute [
	| path results |
	path := XPath for: '//*/@city'.
	results := path in: document.
	self assert: results size = 4.
	self
		assertNodeSet: results
		hasNodes:
			((document allElementsSelect: [:each | each includesAttribute: 'city'])
				collect: [:each | each attributeNodeAt: 'city']).
]

{ #category : #tests }
XPathTest >> testWildcardDescendantAttributeValue [
	| path results |
	path := XPath for: ' // * [ @ city = "Los Angeles" ] '.
	results := path in: document.
	self assert: results size = 2.
	self
		assertNodeSet: results
		hasNodes:
			(document allElementsSelect: [:each |
				(each isNamed: 'address')
					and: [(each attributeAt: 'city') = 'Los Angeles']]).
]

{ #category : #tests }
XPathTest >> testZeroDivision [
	#('0 div 0' '0.0 div 0.0' '0 div 0.0' '0.0 div 0') do: [:each |
		self assert: each asXPath evaluate isNaN].

	"ensure nan propagates"
	#('(0 div 0) div 0' '(0.0 div 0.0) div 0' '(0 div 0.0) div 0' '(0.0 div 0) div 0') do: [:each |
		self assert: each asXPath evaluate isNaN].

	"if the sign is the same, the infinity should be positive"
	#('1 div 0' '0.1 div 0.0' '1 div 0.0' '0.1 div 0'
		'-1 div -0' '-0.1 div -0.0' '-1 div -0.0' '-0.1 div -0') do: [:each |
		self assert: each asXPath evaluate = Float infinity].

	"otherwise it should be negative"
	#('-1 div 0' '-0.1 div 0.0' '1 div -0.0' '0.1 div -0') do: [:each |
		"avoid #negativeInfinity for portability"
		self assert: each asXPath evaluate = Float xpathNegativeInfinity].
]

{ #category : #'source XML' }
XPathTest >> textDocumentXML [
	^ '
		<a>
			<b><c>one</c></b>
			<b><c>one</c><c>two</c></b>
			<b><c>two</c></b>
			<b><c>one</c><c>two</c><c>three</c></b>
			<b><c>three</c></b>
		</a>'
]
