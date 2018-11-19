Class {
	#name : #XMLElementTest,
	#superclass : #XMLNodeWithElementsTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLElementTest class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
XMLElementTest >> newNodeWithElements [
	^ super newNodeWithElements
		name: 'root';
		yourself
]

{ #category : #accessing }
XMLElementTest >> nodeClass [
	^ XMLElement
]

{ #category : #tests }
XMLElementTest >> testAcceptNodeVisitor [
	| visitor element message |

	visitor := XMLRecordingNodeVisitor new.
	element := self newNode.
	self
		assert: (element acceptNodeVisitor: visitor) == element;
		assert: visitor messageRecorder hasMessages.

	message := visitor messageRecorder nextMessage.
	self
		assert: message selector == #visitElement:;
		assert: message arguments = (Array with: element);
		assert: visitor messageRecorder hasMessages.

	message := visitor messageRecorder nextMessage.
	self
		assert: message selector == #visitNodeWithElements:;
		assert: message arguments = (Array with: element);
		deny: visitor messageRecorder hasMessages.

	super testAcceptNodeVisitor.
]

{ #category : #tests }
XMLElementTest >> testAddElementNamed [
	| element |

	super testAddElementNamed.

	element := self newNode.
	element
		declarePrefix: 'prefix'
		uri: 'prefixNS'.
	self
		shouldnt: [element addElementNamed: 'prefix:test']
		raise: XMLNamespaceException.
	self
		assert: element nodes size = 1;
		assert: element firstNode isElement;
		assert: element firstNode name = 'prefix:test';
		assert: element firstNode namespaceURI = 'prefixNS'.
]

{ #category : #tests }
XMLElementTest >> testAddElementNamedAttributes [
	| element |

	super testAddElementNamedAttributes.

	element := self newNode.
	element
		declarePrefix: 'prefix'
		uri: 'prefixNS'.
	self
		shouldnt: [
			element
				addElementNamed: 'prefix:test'
				attributes: self attributeAssociations]
		raise: XMLNamespaceException.
	self
		assert: element nodes size = 1;
		assert: element firstNode isElement;
		assert: element firstNode name = 'prefix:test';
		assert: element firstNode namespaceURI = 'prefixNS';
		assertElement: element firstNode hasAttributes: self attributes.
]

{ #category : #tests }
XMLElementTest >> testAttributeAssociations [
	| element |

	element := self newElementWithAttributes.
	self
		assertList: element attributeAssociations
		collects: (element attributeNodes collect: [:each | each name -> each value]).
]

{ #category : #tests }
XMLElementTest >> testAttributeAt [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes do: [:each |
		self assert: (element attributeAt: each name) = each value].
	self assert: (element attributeAt: 'absent') = ''.
]

{ #category : #tests }
XMLElementTest >> testAttributeAtIfAbsent [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes do: [:each |
		self assert:
			(element
				attributeAt: each name
				ifAbsent: [self fail]) = each value].
	self assert:
		(element
			attributeAt: 'absent'
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLElementTest >> testAttributeAtIfAbsentPut [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes do: [:each |
		self assert:
			(element
				attributeAt: each name
				ifAbsentPut: [self fail]) = each value].
	self assert:
		(element
			attributeAt: 'newName'
			ifAbsentPut: ['newValue']) = 'newValue'.
	self assert: (element attributeAt: 'newName') = 'newValue'.
]

{ #category : #tests }
XMLElementTest >> testAttributeAtPut [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes do: [:each | | newValue |
		newValue := 'new', each value.
		self
			assert: (element attributeAt: each name put: newValue) = newValue;
			assert: (element attributeAt: each name) = newValue].
	self
		assert: (element attributeAt: 'newName' put: 'newValue') = 'newValue';
		assert: (element attributeAt: 'newName') = 'newValue'.
]

{ #category : #tests }
XMLElementTest >> testAttributeListCopying [
	| element attributeListCopy |

	element := self newElementWithAttributes.
	attributeListCopy := element attributeNodes copy.
	self
		assert: attributeListCopy = element attributeNodes;
		deny: attributeListCopy == element attributeNodes;
		assert: element attributeNodes observer == element;
		assert: attributeListCopy observer isNil.
]

{ #category : #tests }
XMLElementTest >> testAttributeNames [
	| element |

	element := self newElementWithAttributes.
	self
		assertList: element attributeNames
		collects: (element attributeNodes collect: [:each | each name])
]

{ #category : #tests }
XMLElementTest >> testAttributeNamesAndValuesDo [
	| element |

	element := self newNode.
	self
		xmlShould: [:twoArgumentBlock |
			element attributeNamesAndValuesDo: twoArgumentBlock]
		enumerate: #()
		and: #().

	element := self newElementWithAttributes.
	self
		xmlShould: [:twoArgumentBlock |
			element attributeNamesAndValuesDo: twoArgumentBlock]
		enumerate: self attributeNames
		and: self attributeValues.
]

{ #category : #tests }
XMLElementTest >> testAttributeNamesDo [
	| element |

	element := self newNode.
	self
		xmlShould: [:block | element attributeNamesDo: block]
		enumerate: #().

	element := self newElementWithAttributes.
	self
		xmlShould: [:block | element attributeNamesDo: block]
		enumerate: element attributeNames.
]

{ #category : #tests }
XMLElementTest >> testAttributeNodeAt [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes do: [:each |
		self assert: (element attributeNodeAt: each name) = each].
	self assert:
		(element attributeNodeAt: 'two') = element attributeNodes second.
	self assert:
		(element attributeNodeAt: 'absent') isNil.
]

{ #category : #tests }
XMLElementTest >> testAttributeNodeAtIfAbsent [
	| element attributeLocalNames |

	element := self newElementWithAttributes.
	element attributeNodes do: [:each |
		self assert:
			(element
				attributeNodeAt: each name
				ifAbsent: [self fail]) = each].
	attributeLocalNames :=
		(element attributeNodes collect: [:each | each localName]) asSet.
	attributeLocalNames do: [:localName |
		self assert:
			(element
				attributeNodeAt: localName
				ifAbsent: [self fail]) =
					(element attributeNodes detect: [:each | each localName = localName])].
	self assert:
		(element
			attributeNodeAt: 'absent'
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLElementTest >> testAttributeNodeAtNamespaceURI [
	| element |

	element := self newElementWithAttributes.
	self assert:
		(element attributeNodeAt: 'prefix:two' namespaceURI: 'prefixNS') =
			(element attributeNodes third).
	self assert:
		(element attributeNodeAt: 'two' namespaceURI: 'prefixNS') =
			(element attributeNodes third).
	self assert:
		(element attributeNodeAt: 'prefix:two' namespaceURI: 'absent') isNil.
]

{ #category : #tests }
XMLElementTest >> testAttributeNodeAtNamespaceURIIfAbsent [
	| element |

	element := self newElementWithAttributes.
	self assert:
		(element
			attributeNodeAt: 'prefix:two'
			namespaceURI: 'prefixNS'
			ifAbsent: [self fail]) =
				element attributeNodes third.
	self assert:
		(element
			attributeNodeAt: 'two'
			namespaceURI: 'prefixNS'
			ifAbsent: [self fail]) =
				element attributeNodes third.
	self assert:
		(element
			attributeNodeAt: 'prefix:two'
			namespaceURI: 'absent'
			ifAbsent: [#absent]) = #absent.
]

{ #category : #tests }
XMLElementTest >> testAttributeNodes [
	| element attributeNodes |

	element := self newElementWithAttributes.
	attributeNodes := element attributeNodes.
	self assert: attributeNodes class == self attributeListClass.
	self assert:
		(attributeNodes collect: [:each | each name -> each value]) asArray
			= self attributeAssociations asArray.
]

{ #category : #tests }
XMLElementTest >> testAttributeNodesAdding [
	| element attributesAdded elementWithAttributes |

	element := self newElement.
	attributesAdded := element attributeNodes copyEmpty.
	elementWithAttributes := self newElementWithAttributes.

	"adding from another element should remove them from the previous element"
	elementWithAttributes attributeNodes copy do: [:each |
		attributesAdded addLast: each.
		element attributeNodes addLast: each.
		self
			assert: each element == element;
			assert: each parent == element;
			assert: element attributeNodes = attributesAdded;
			deny: (elementWithAttributes attributeNodes includes: each)].

	"adding already present nodes should move them in-place"
	element attributeNodes reversed do: [:each |
		attributesAdded
			remove: each;
			addLast: each.
		element attributeNodes addLast: each.
		self
			assert: each element == element;
			assert: each parent == element;
			assert: element attributeNodes = attributesAdded]
]

{ #category : #tests }
XMLElementTest >> testAttributeNodesDo [
	| element |

	element := self newNode.
	self
		xmlShould: [:block | element attributeNodesDo: block]
		enumerate: #().

	element := self newElementWithAttributes.
	self
		xmlShould: [:block | element attributeNodesDo: block]
		enumerate: element attributeNodes.
]

{ #category : #tests }
XMLElementTest >> testAttributePrefixAliasing [
	| element |

	(element := self newElementWithAttributes)
		declarePrefix: 'alias' uri: 'prefixNS'.
	self
		should: [
			element attributeNodes addLast:
				(self attributeClass named: 'alias:four')]
		raise: XMLNamespaceException.

	(element := self newElementWithAttributes)
		declarePrefix: 'alias' uri: 'prefixNS'.
	self
		should: [(element attributeNodeAt: 'two') name: 'alias:two']
		raise: XMLNamespaceException.

	(element := self newElementWithAttributes)
		declarePrefix: 'alias' uri: 'prefixNS';
		usesNamespaces: false.
	self
		shouldnt: [
			element attributeNodes addLast:
				(self attributeClass named: 'alias:four').
			(element attributeNodeAt: 'two') name: 'alias:two']
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testAttributePrefixUndeclared [
	| element |

	element := self newElementWithAttributes.
	self
		should: [
			element attributeNodes add:
				(self attributeClass named: 'undeclared:newName')]
		raise: XMLNamespaceException.

	element := self newElementWithAttributes.
	self
		should: [
			(element attributeNodeAt: 'one') name: 'undeclared:one']
		raise: XMLNamespaceException.

	element := self newElementWithAttributes.
	self
		shouldnt: [
			element usesNamespaces: false.
			element attributeNodes add:
				(self attributeClass named: 'undeclared:newName').
			(element attributeNodeAt: 'one') name: 'undeclared:one']
		raise: XMLNamespaceException.

]

{ #category : #tests }
XMLElementTest >> testAttributeRenaming [
	| elementWithAttributes attributeNodes attributeNode oldSize oldNames oldName |

	elementWithAttributes := self newElementWithAttributes.
	attributeNodes := elementWithAttributes attributeNodes.

	attributeNode := attributeNodes first.
	oldSize := attributeNodes size.
	oldNames := elementWithAttributes attributeNames.
	oldName := attributeNode name.
	attributeNode name: 'newName'.
	self
		assert: attributeNodes size = oldSize;
		assert: attributeNodes first == attributeNode;
		assert: elementWithAttributes attributeNames = (oldNames allButFirst copyWithFirst: 'newName');
		deny: (elementWithAttributes includesAttribute: oldName);
		assert: (elementWithAttributes attributeNodeAt: 'newName') == attributeNode.

	oldNames := elementWithAttributes attributeNames.
	oldName := attributeNode name.
	attributeNode name: oldNames last.
	self
		assert: attributeNodes size = (oldSize - 1);
		assert: attributeNodes first == attributeNode;
		assert:
			elementWithAttributes attributeNames =
				((oldNames copyFrom: 2 to: oldNames size - 1) copyWithFirst: oldNames last);
		deny: (elementWithAttributes includesAttribute: oldName);
		assert: (elementWithAttributes attributeNodeAt: attributeNode name) == attributeNode.
]

{ #category : #tests }
XMLElementTest >> testAttributeSorting [
	| element |

	element :=
		self nodeClass
			name: 'sorted'
			attributes: (Array with: 'c' -> '3' with: 'b' -> '2' with: 'a' -> '1').
	self assert:
		(element attributeNodes sorted
			collect: [:each | each name]) asArray = #('a' 'b' 'c').
	self assert:
		((element attributeNodes sorted: [:a :b | a name <= b name])
			collect: [:each | each name]) asArray = #('a' 'b' 'c').
	"sorted/sorted: should sort copies"
	self assert: element attributeNames asArray = #('c' 'b' 'a').

	element attributeNodes sort.
	self assert: element attributeNames asArray = #('a' 'b' 'c').
	element attributeNodes sort: [:a :b | a name > b name].
	self assert: element attributeNames asArray = #('c' 'b' 'a').
]

{ #category : #tests }
XMLElementTest >> testAttributes [
	| element attributeDictionary |

	element := self newElementWithAttributes.
	attributeDictionary := element attributes.
	self
		assert: attributeDictionary class == self attributesClass;
		assert: attributeDictionary size = element attributeNodes size.
	self assert:
		(element attributeNodes allSatisfy: [:each |
			(attributeDictionary at: each name) = each value]).
]

{ #category : #tests }
XMLElementTest >> testCanonicalPrinting [
	| element |

	element :=
		self nodeClass
			name: 'test'
			namespaces: (Array with: 'b' -> 'ns2' with: 'a' -> 'ns1' with: '' -> 'default')
			attributes: (Array with: 'c' -> '3' with: 'b' -> '2' with: 'a' -> '1').

	self assert:
		element printString =
			'<test xmlns:b="ns2" xmlns:a="ns1" xmlns="default" c="3" b="2" a="1"/>'.
	self assert:
		element canonicallyPrinted =
			'<test xmlns="default" xmlns:a="ns1" xmlns:b="ns2" a="1" b="2" c="3"></test>'.
]

{ #category : #tests }
XMLElementTest >> testDeclareNamespaces [
	| element |

	element := self newNode.
	self assert: (element declareNamespaces: self namespaces) == element.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	element := self newNode.
	self assert: (element declareNamespaces: self namespaces associations) == element.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	(element := self newNode) usesNamespaces: false.
	self
		assert: (element declareNamespaces: #()) == element;
		assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testDeclarePrefixURI [
	| element elementsWithDeclaredPrefix |

	element := self newNodeWithElements.
	self assert:
		(element
			declarePrefix: 'newPrefix'
			uri: 'prefixNS') == element.
	element allElementsDo: [:each |
		self assert:
			(each
				isDeclaredPrefix: 'newPrefix'
				uri: 'prefixNS')].
	self assert:
		(element
			declarePrefix: 'newPrefix'
			uri: 'newPrefixNS') == element.
	element allElementsDo: [:each |
		self assert:
			(each
				isDeclaredPrefix: 'newPrefix'
				uri: 'newPrefixNS')].

	elementsWithDeclaredPrefix :=
		element allElementsSelect: [:each | each prefix = 'prefix'].
	self assert:
		(element
			declarePrefix: 'prefix'
			uri: 'newPrefixNS') == element.
	element allElementsDo: [:each |
		(elementsWithDeclaredPrefix includes: each)
			ifTrue: [
				self
					assert: (each isDeclaredPrefix: 'prefix');
					deny:
						(each
							isDeclaredPrefix: 'prefix'
							uri: 'newPrefixNS')]
				ifFalse: [
					self assert:
						(each
							isDeclaredPrefix: 'prefix'
							uri: 'newPrefixNS')]].

	self
		should: [element declarePrefix: 'nonDefault' uri: '']
		raise: XMLNamespaceException.
	"cannot rebind the xml prefix to a new NS"
	self 
		should: [element declarePrefix: 'xml' uri: 'newNS']
		raise: XMLNamespaceException.
	"cannot rebind the xmlns prefix, even to the same NS"
	self
		should: [element declarePrefix: 'xmlns' uri: XMLNamespaceScope xmlnsNamespaceURI]
		raise: XMLNamespaceException.

	(element := self newNode) usesNamespaces: false.
	self assert:
		(element
			declarePrefix: 'prefix'
			uri: 'prefixNS') == element.
	self assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testDeclarePrefixURIAttributes [
	| element |

	(element := self newElement)
		attributeAt: 'name'
		put: 'one'.
	element
		attributeAt: 'prefix:name'
		put: 'two'.
	element
		attributeAt: 'prefixTwo:name'
		put: 'three'.
	self
		shouldnt: [
			element
				declarePrefix: 'prefixTwo'
				uri: element defaultNamespace]
		raise: XMLNamespaceException.
	self
		should: [
			element
				declarePrefix: 'prefixTwo'
				uri: (element resolvePrefix: 'prefix')]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testDeclaredPrefixes [
	| element prefixes |

	element := self newNode.
	prefixes := OrderedCollection new.
	self namespaces keysAndValuesDo: [:prefix :uri |
		element
			declarePrefix: prefix
			uri: uri.
		prefixes addLast: prefix.
		self assert: element declaredPrefixes = prefixes asArray].

	(element := self newNode) usesNamespaces: false.
	self
		assert: element declaredPrefixes isEmpty;
		deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testDeclaresDefaultNamespace [
	| element |

	element := self newNodeWithElements.
	self deny: element declaresDefaultNamespace.

	element defaultNamespace: 'defaultNS'.
	self assert: element declaresDefaultNamespace.
	element elementsDo: [:each |
		self deny: each declaresDefaultNamespace].

	element elementsDo: [:each |
		each defaultNamespace: 'newDefaultNS'.
		self assert: each declaresDefaultNamespace].

	self assert: element declaresDefaultNamespace.	
	element undeclarePrefix: ''.
	self deny: element declaresDefaultNamespace.
	element elementsDo: [:each |
		self assert: each declaresDefaultNamespace].

	(element := self newNode) usesNamespaces: false.
	self
		deny: element declaresDefaultNamespace;
		deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testDeclaresPrefixURI [
	| element |

	element := self newNodeWithElements.
	self deny: element declaresDefaultNamespace.

	element
		declarePrefix: 'prefix'
		uri: 'prefixNS'.
	self assert:
		(element
			declaresPrefix: 'prefix'
			uri: 'prefixNS').
	element elementsDo: [:each |
		self deny:
			(each
				declaresPrefix: 'prefix'
				uri: 'prefixNS')].

	element elementsDo: [:each |
		each
			declarePrefix: 'prefix'
			uri: 'newPrefixNS'.
		self assert:
			(each
				declaresPrefix: 'prefix'
				uri: 'newPrefixNS')].

	self assert:
		(element
			declaresPrefix: 'prefix'
			uri: 'prefixNS').
	element undeclarePrefix: 'prefix'.
	self deny:
		(element
			declaresPrefix: 'prefix'
			uri: 'prefixNS').
	element elementsDo: [:each |
		self assert:
			(each
				declaresPrefix: 'prefix'
				uri: 'newPrefixNS')].

	(element := self newNode) usesNamespaces: false.
	self deny:
		(element
			declaresPrefix: 'prefix'
			uri: 'prefixNS').
	self deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testDefaultNamespace [
	| element elementsWithDefaultNamespace |

	element := self newNodeWithElements.
	elementsWithDefaultNamespace :=
		element allElementsSelect: [:each |
			each defaultNamespace notEmpty].

	self assert: (element defaultNamespace: 'newDefaultNS') == element.
	element allElementsDo: [:each |
		(elementsWithDefaultNamespace includes: each)
			ifTrue: [self deny: (each defaultNamespace = 'newDefaultNS')]
			ifFalse: [self assert: (each defaultNamespace = 'newDefaultNS')]].

	self assert: (element defaultNamespace: '') == element.
	element allElementsDo: [:each |
		(elementsWithDefaultNamespace includes: each)
			ifTrue: [self deny: each defaultNamespace = '']
			ifFalse: [self assert: each defaultNamespace = '']].

	(element := self newNode) usesNamespaces: false.
	self
		assert: element defaultNamespace = '';
		deny: element usesNamespaces;
		assert: (element defaultNamespace: '') == element;
		assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testElementSorting [
	| element |

	(element := self nodeClass named: 'sorted')
		addElementNamed: 'c';
		addElementNamed: 'b';
		addElementNamed: 'a'.

	self assert: (element nodes sorted collect: [:each | each name]) asArray = #('a' 'b' 'c').
	self assert:
		((element nodes sorted: [:a :b | a name <= b name])
			collect: [:each | each name]) asArray = #('a' 'b' 'c').

	self assert: (element nodesCollect: [:each | each name]) asArray = #('c' 'b' 'a').
	element nodes sort.
	self assert: (element nodesCollect: [:each | each name]) asArray = #('a' 'b' 'c').
	element nodes sort: [:a :b | a name > b name].
	self assert: (element nodesCollect: [:each | each name]) asArray = #('c' 'b' 'a').
]

{ #category : #tests }
XMLElementTest >> testExpandedName [
	| element |

	element := self nodeClass named: 'test'.
	self assert: (element expandedName = 'test').

	element defaultNamespace: 'defaultNS'.
	self assert: (element expandedName = 'Q{defaultNS}test').

	element name: 'prefix:test' namespaceURI: 'prefixNS'.
	self assert: (element expandedName = 'Q{prefixNS}test').

	element
		defaultNamespace: '';
		name: 'test'.
	self assert: (element expandedName = 'test').
]

{ #category : #tests }
XMLElementTest >> testHasAttributes [
	self
		deny: self newNode hasAttributes;
		assert: self newElementWithAttributes hasAttributes;
		deny: self newElementWithAttributes removeAttributes hasAttributes
]

{ #category : #tests }
XMLElementTest >> testHasID [
	| element document |

	element := self newElementWithAttributes.
	self deny: (element hasID: 'test').

	element
		attributeAt: 'xml:id'
		put: 'test'.
	self assert: (element hasID: 'test').

	document := element newDocument.
	document root: element.
	document doctypeDefinition: DTDDoctypeDefinition new.
	document doctypeDefinition
		addValidatorForAttributeIn: element name
		named: 'xml:id'
		type: 'CDATA'
		defaultPragma: 'REQUIRED'
		defaultValue: ''.
	self deny: (element hasID: 'test').

	element
		attributeAt: 'id'
		put: 'test'.
	self deny: (element hasID: 'test').

	document doctypeDefinition
		addValidatorForAttributeIn: element name
		named: 'id'
		type: 'ID'
		defaultPragma: 'REQUIRED'
		defaultValue: ''.
	self assert: (element hasID: 'test').
]

{ #category : #tests }
XMLElementTest >> testHasNamespaceURI [
	| element |

	element := self nodeClass named: 'test'.
	self deny: element hasNamespaceURI.

	element defaultNamespace: 'defaultNS'.
	self assert: element hasNamespaceURI.

	element defaultNamespace: ''.
	self deny: element hasNamespaceURI.

	element name: 'prefix:test' namespaceURI: 'prefixNS'.
	self assert: element hasNamespaceURI.

	element name: 'test'.
	self deny: element hasNamespaceURI.
]

{ #category : #tests }
XMLElementTest >> testHasNamespaces [
	| element |

	element := self newNode.
	self deny: element hasNamespaces.

	element defaultNamespace: 'defaultNS'.
	self assert: element hasNamespaces.

	element undeclarePrefix: ''.
	self deny: element hasNamespaces.

	element declarePrefix: 'prefix' uri: 'prefixNS'.
	self assert: element hasNamespaces.

	element undeclarePrefix: 'prefix'.
	self deny: element hasNamespaces.
]

{ #category : #tests }
XMLElementTest >> testHasPrefix [
	| element |

	element := self newNode.
	self deny: element hasPrefix.

	element name: 'one'.
	self deny: element hasPrefix.

	element declarePrefix: 'prefix' uri: 'prefixNS'.
	element name: 'prefix:two'.
	self assert: element hasPrefix.

	element name: 'three'.
	self deny: element hasPrefix.
]

{ #category : #tests }
XMLElementTest >> testIncludesAttribute [
	| element |

	element := self newElementWithAttributes.
	element attributeNames do: [:each |
		self assert: (element includesAttribute: each).
		element removeAttribute: each.
		self deny: (element includesAttribute: each)].
]

{ #category : #tests }
XMLElementTest >> testIsDeclaredPrefix [
	| element elementsWithDeclaredPrefix |

	element := self newNodeWithElements.
	elementsWithDeclaredPrefix :=
		element allElementsSelect: [:each |
			each isDeclaredPrefix: 'prefix'].

	element allElementsDo: [:each |
		(elementsWithDeclaredPrefix includes: each )
			ifFalse: [self deny: (each isDeclaredPrefix: 'prefix')]].

	element declarePrefix: 'prefix' uri: 'newPrefixNS'.
	element allElementsDo: [:each | self assert: (each isDeclaredPrefix: 'prefix')].

	element undeclarePrefix: 'prefix'.
	element allElementsDo: [:each |
		(elementsWithDeclaredPrefix includes: each )
			ifTrue: [self assert: (each isDeclaredPrefix: 'prefix')]
			ifFalse: [self deny: (each isDeclaredPrefix: 'prefix')]].

	(element := self newNode) usesNamespaces: false.
	self
		deny: (element isDeclaredPrefix: 'prefix');
		deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testIsDeclaredPrefixURI [
	| element elementsWithDeclaredPrefix |

	element := self newNodeWithElements.
	elementsWithDeclaredPrefix :=
		element allElementsSelect: [:each |
			each isDeclaredPrefix: 'prefix'].

	element allElementsDo: [:each |
		self deny:
			(each
				isDeclaredPrefix: 'prefix'
				uri: 'newPrefixNS')].

	element
		declarePrefix: 'prefix'
		uri: 'newPrefixNS'.
	element allElementsDo: [:each |
		(elementsWithDeclaredPrefix includes: each )
			ifTrue: [
				self assert: (each isDeclaredPrefix: 'prefix').
				self deny:
					(each
						isDeclaredPrefix: 'prefix'
						uri: 'newPrefixNS')]
			ifFalse: [
				self assert:
					(each
						isDeclaredPrefix: 'prefix'
						uri: 'newPrefixNS')]].

	element undeclarePrefix: 'prefix'.
	element allElementsDo: [:each |
		(elementsWithDeclaredPrefix includes: each )
			ifTrue: [self assert: (each isDeclaredPrefix: 'prefix')]
			ifFalse: [self deny: (each isDeclaredPrefix: 'prefix')]].

	(element := self newNode) usesNamespaces: false.
	self deny:
		(element
			isDeclaredPrefix: 'prefix'
			uri: 'prefixNS').
	self deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testIsElement [
	self assert: self newNode isElement
]

{ #category : #tests }
XMLElementTest >> testIsElementNamed [
	| element |

	element := self nodeClass named: 'one'.
	self
		assert: (element isElementNamed: 'one');
		deny: (element isElementNamed: 'two').
	
	element name: 'one:two' namespaceURI: 'testNS'.
	self
		assert: (element isElementNamed: 'one:two');
		assert: (element isElementNamed: 'two');
		deny: (element isElementNamed: 'one').
]

{ #category : #tests }
XMLElementTest >> testIsElementNamedAny [
	| element |

	element := self nodeClass named: 'one'.
	self
		assert: (element isElementNamedAny: #('two' 'one' 'three'));
		deny: (element isElementNamedAny: #('two' 'three')).

	element name: 'one:two' namespaceURI: 'testNS'.
	self
		assert: (element isElementNamedAny: #('one' 'one:two' 'three'));
		assert: (element isElementNamedAny: #('one' 'two' 'three'));
		deny: (element isElementNamedAny: #('one' 'three')).
]

{ #category : #tests }
XMLElementTest >> testIsInLanguage [
	| nodeWithElements |

	super testIsInLanguage.

	nodeWithElements := self newNodeWithElements.
	self languageTagsAndFilters do: [:tagAndFilters |
		| tag matchingFilters nonMatchingFilters |
		
		tag := tagAndFilters first.
		matchingFilters := tagAndFilters second.
		nonMatchingFilters := tagAndFilters third.
		nodeWithElements allElementsDo: [:element |
			(matchingFilters, nonMatchingFilters) do: [:each |
				self deny: (element isInLanguage: each)]].
		
		nodeWithElements
			attributeAt: 'xml:lang'
			put: tag.
		nodeWithElements allElementsDo: [:element |
			matchingFilters do: [:each |
				self assert: (element isInLanguage: each)].
			nonMatchingFilters do: [:each |
				self deny: (element isInLanguage: each)].

			element = nodeWithElements
				ifFalse: [
					"ensure it can be shadowed"
					element
						attributeAt: 'xml:lang'
						put: ''.
					(matchingFilters, nonMatchingFilters) do: [:each |
						self deny: (element isInLanguage: each)].
					element removeAttribute: 'xml:lang']].
		
		nodeWithElements removeAttribute: 'xml:lang'].
]

{ #category : #tests }
XMLElementTest >> testIsNamed [
	| element |

	element := self nodeClass named: 'one'.
	self
		assert: (element isNamed: 'one');
		deny: (element isNamed: 'two').

	element name: 'one:two' namespaceURI: 'testNS'.
	self
		assert: (element isNamed: 'one:two');
		assert: (element isNamed: 'two');
		deny: (element isNamed: 'one').
]

{ #category : #tests }
XMLElementTest >> testIsNamedAny [
	| element |

	element := self nodeClass named: 'one'.
	self
		assert: (element isNamedAny: #('two' 'one' 'three') asSet);
		deny: (element isNamedAny: #('two' 'three') asSet).

	element name: 'one:two' namespaceURI: 'testNS'.
	self
		assert: (element isNamedAny: #('one' 'one:two' 'three'));
		assert: (element isNamedAny: #('one' 'two' 'three'));
		deny: (element isNamedAny: #('one' 'three')).
]

{ #category : #tests }
XMLElementTest >> testIsRoot [
	| element |

	element := self newNodeWithElements.
	self assert: element allElements first isRoot.

	element descendantElementsDo: [:each |
		self deny: each isRoot].

	(element removeNodes: element elements copy) do: [:each |
		self assert: each isRoot].
]

{ #category : #tests }
XMLElementTest >> testLocalName [
	| element |

	element := self newNode.
	self
		assert: element localName = '';
		assert: (element name: 'one') == element;
		assert: element localName = 'one';
		assert: (element name: 'two') == element;
		assert: element localName = 'two'.

	element
		declarePrefix: 'prefix'
		uri: 'prefixNS'.
	self
		assert: (element name: 'prefix:three') == element;
		assert: element localName = 'three';
		assert: (element name: 'four') == element;
		assert: element localName = 'four'.
]

{ #category : #tests }
XMLElementTest >> testName [
	| element |

	"XMLElement class>>#name: is not tested here because it is soft-deprecated"

	element := self newNode.
	self
		assert: element name = '';
		assert: (element name: 'one') == element;
		assert: element name = 'one';
		assert: (element name: 'two') == element;
		assert: element name = 'two'.
	self
		should: [element name: 'unmapped:two']
		raise: XMLNamespaceException.

	element usesNamespaces: false.
	self
		shouldnt: [element name: 'unmapped:three']
		raise: XMLNamespaceException.
	self assert: element name = 'unmapped:three'.
]

{ #category : #tests }
XMLElementTest >> testNameAttributes [
	| attributes unprefixedAttributes element |

	attributes := self attributes.
	unprefixedAttributes := self unprefixedAttributes.
	element :=
		self nodeClass
			name: 'one'
			attributes: self unprefixedAttributeAssociations.
	self
		assert: element class == self nodeClass;
		assert: element name = 'one';
		assertElement: element hasAttributes: unprefixedAttributes.

	"attributes: should accept any collection of associations"
	element :=
		self nodeClass
			name: 'two'
			attributes: unprefixedAttributes associations.
	self
		assert: element name = 'two';
		assert: element class == self nodeClass;
		assertElement: element hasAttributes: unprefixedAttributes.

	self
		should: [
			self nodeClass
				name: 'undeclared:three'
				attributes: unprefixedAttributes]
		raise: XMLNamespaceException.
	"prefixed attributes are not accepted"
	self
		should: [
			self nodeClass
				name: 'four'
				attributes: attributes]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testNameNamespaceURI [
	| element |

	element :=
		self nodeClass
			name: 'one'
			namespaceURI: 'defaultNS'.
	self
		assert: element class == self nodeClass;
		assert: element name = 'one';
		assert: element namespaceURI = 'defaultNS'.

	element :=
		self nodeClass
			name: 'prefix:two'
			namespaceURI: 'prefixNS'.
	self
		assert: element class == self nodeClass;
		assert: element name = 'prefix:two';
		assert: element namespaceURI = 'prefixNS'.
	self
		should: [
			self nodeClass
				name: 'prefix:three'
				namespaceURI: '']
		raise: XMLNamespaceException.

	element := self newNode.
	self assert:
		(element
			name: 'one'
			namespaceURI: 'defaultNS') == element.
	self
		assert: element name = 'one';
		assert: element namespaceURI = 'defaultNS'.

	self assert:
		(element
			name: 'prefix:two'
			namespaceURI: 'prefixNS') == element.
	self
		assert: element name = 'prefix:two';
		assert: element namespaceURI = 'prefixNS'.

	self
		should: [
			element
				name: 'prefix:three'
				namespaceURI: '']
		raise: XMLNamespaceException.

	(element := self newNode) usesNamespaces: false.
	self assert:
		(element
			name: 'four'
			namespaceURI: 'defaultNS') == element.
	self
		assert: element name = 'four';
		assert: element namespaceURI = 'defaultNS';
		assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testNameNamespaceURIAttributes [
	| attributes unprefixedAttributes element |

	attributes := self attributes.
	unprefixedAttributes := self unprefixedAttributes.
	element :=
		self nodeClass
			name: 'one'
			namespaceURI: 'defaultNS'
			attributes: unprefixedAttributes.
	self
		assert: element class == self nodeClass;
		assert: element name = 'one';
		assert: element namespaceURI = 'defaultNS';
		assertElement: element hasAttributes: unprefixedAttributes.

	element :=
		self nodeClass
			name: 'prefix:two'
			namespaceURI: 'prefixNS'
			attributes: attributes associations.
	self
		assert: element class == self nodeClass;
		assert: element name = 'prefix:two';
		assert: element namespaceURI = 'prefixNS';
		assertElement: element hasAttributes: attributes.

	"if the attributes have a prefix, then the element must have the
	same prefix and the namespace must be non-empty"
	self
		should: [
			self nodeClass
				name: 'three'  "no prefix"
				namespaceURI: ''  "no namespace"
				attributes: attributes]
		raise: XMLNamespaceException.
	self
		should: [
			self nodeClass
				name: 'four' "no prefix"
				namespaceURI: 'prefixNS'
				attributes: attributes]
		raise: XMLNamespaceException.
	self
		should: [
			self nodeClass
				name: 'prefix:five'
				namespaceURI: ''  "no namespace"
				attributes: unprefixedAttributes]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testNameNamespaces [
	| element |
	
	element :=
		self nodeClass
			name: 'one'
			namespaces: self namespaces.
	self
		assert: element class == self nodeClass;
		assert: element name = 'one';
		assert: element namespaceURI = 'defaultNS'.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	"namespaces: should accept any collection of associations"
	element :=
		self nodeClass
			name: 'two'
			namespaces: self namespaces associations.
	self
		assert: element class == self nodeClass;
		assert: element name = 'two';
		assert: element namespaceURI = 'defaultNS'.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	element :=
		self nodeClass
			name: 'prefix:three'
			namespaces: self namespaces.
	self
		assert: element class == self nodeClass;
		assert: element name = 'prefix:three';
		assert: element namespaceURI = 'prefixNS'.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	self
		should: [
			self nodeClass
				name: 'undeclared:three'
				namespaces: self namespaces]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testNameNamespacesAttributes [
	| element |

	element :=
		self nodeClass
			name: 'one'
			namespaces: self namespaces
			attributes: self attributes.
	self
		assert: element class == self nodeClass;
		assert: element name = 'one';
		assert: element namespaceURI = 'defaultNS';
		assertElement: element hasAttributes: self attributes.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	element :=
		self nodeClass
			name: 'two'
			namespaces: self namespaces associations
			attributes: self attributes associations.
	self
		assert: element class == self nodeClass;
		assert: element name = 'two';
		assert: element namespaceURI = 'defaultNS';
		assertElement: element hasAttributes: self attributes.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element isDeclaredPrefix: prefix uri: uri)].

	self
		should: [
			self nodeClass
				name: 'undeclared:three'
				namespaces: self namespaces
				attributes: self attributes]
		raise: XMLNamespaceException.
	self
		should: [
			self nodeClass
				name: 'four'
				namespaces: #()
				attributes: self attributes]
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testNamed [
	| element |

	element := self nodeClass named: 'test'.
	self
		assert: element class == self nodeClass;
		assert: element name = 'test'.
	self
		should: [self nodeClass named: 'undeclared:test']
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testNamespaceURI [
	| element |

	element := self newNode.
	self assert: element namespaceURI = ''.

	element defaultNamespace: 'defaultNS'.
	self assert: element namespaceURI = 'defaultNS'.

	element
		name: 'prefix:test'
		namespaceURI: 'prefixNS'.
	self assert: element namespaceURI = 'prefixNS'.
	
	element
		defaultNamespace: '';
		name: 'test'.
	self assert: element namespaceURI = ''.
]

{ #category : #tests }
XMLElementTest >> testNextElement [ 
	| root nextElement |

	root := self newNodeWithElements firstElement.
	nextElement := nil.
	root elements reverseDo: [:each |
		self assert: each nextElement = nextElement.
		nextElement := each].
]

{ #category : #tests }
XMLElementTest >> testPrefix [
	| element |

	element := self newNode.
	self
		assert: element prefix = '';
		assert: (element name: 'one') == element;
		assert: element prefix = ''.

	element
		declarePrefix: 'prefix'
		uri: 'prefixNS'.
	self
		assert: (element prefix: 'prefix') == element;
		assert: element name = 'prefix:one';
		assert: element prefix = 'prefix';
		assert: (element name: 'prefix:two') == element;
		assert: element name = 'prefix:two';
		assert: element prefix = 'prefix';
		assert: (element prefix: '') == element;
		assert: element name = 'two';
		assert: element prefix = ''.

	self
		should: [element prefix: 'undeclared']
		raise: XMLNamespaceException.
]

{ #category : #tests }
XMLElementTest >> testPreviousElement [ 
	| root previousElement |

	root := self newNodeWithElements firstElement.
	previousElement := nil.
	root elements do: [:each |
		self assert: each previousElement = previousElement.
		previousElement := each].
]

{ #category : #tests }
XMLElementTest >> testPrintingDefaultNamespaces [
	| element |

	element :=
		self nodeClass
			name: 'element'
			namespaceURI: 'default'.
	element addNode:
		((self nodeClass
			name: 'element'
			namespaceURI: '')
			addElementNamed: 'empty';
			yourself).

	self assert:
		element printString =
			('<element xmlns="default">',
			'<element xmlns=""><empty/></element>',
			'</element>').
]

{ #category : #tests }
XMLElementTest >> testPrintingNonRootNamespaces [
	| element |

	element :=
		self nodeClass
			name: 'element'.
	element addNode:
		(self nodeClass
			name: 'used:empty'
			namespaces: (Array with: '' -> 'defaultNS' with: 'used' -> 'usedNS')).

	self assert:
		element printString =
			('<element>',
			'<used:empty xmlns="defaultNS" xmlns:used="usedNS"/>',
			'</element>').
]

{ #category : #tests }
XMLElementTest >> testPrintingRootNamespaces [
	| element |

	element :=
		self nodeClass
			name: 'used:element'
			namespaces: (Array with: '' -> 'defaultNS' with: 'used' -> 'usedNS').
	element addElementNamed: 'empty'.

	self assert:
		element printString =
			('<used:element xmlns="defaultNS" xmlns:used="usedNS">',
			'<empty/>',
			'</used:element>').
]

{ #category : #tests }
XMLElementTest >> testRemoveAttribute [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes copy do: [:each |
		self
			assert: (element removeAttribute: each name) = each value;
			deny: (element includesAttribute: each name).
		self
			should: [element removeAttribute: each name]
			raise: Error].
	self assert: element attributeNodes isEmpty.
]

{ #category : #tests }
XMLElementTest >> testRemoveAttributeIfAbsent [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes copy do: [:each |
		self assert:
			(element
				removeAttribute: each name
				ifAbsent: [self fail]) = each value.
		self deny: (element includesAttribute: each name).
		self assert:
			(element
				removeAttribute: each name
				ifAbsent: [#absent]) = #absent].
	self assert: element attributeNodes isEmpty.
]

{ #category : #tests }
XMLElementTest >> testRemoveAttributeNode [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes copy do: [:each |
		self
			assert: (element removeAttributeNode: each) = each ;
			deny: (element attributeNodes includes: each).
		self
			should: [element removeAttribute: each]
			raise: Error].
	self assert: element attributeNodes isEmpty.
]

{ #category : #tests }
XMLElementTest >> testRemoveAttributeNodeIfAbsent [
	| element |

	element := self newElementWithAttributes.
	element attributeNodes copy do: [:each |
		self assert:
			(element
				removeAttributeNode: each
				ifAbsent: [self fail]) = each.
		self deny: (element attributeNodes includes: each).
		self assert:
			(element
				removeAttributeNode: each
				ifAbsent: [#absent]) = #absent].
	self assert: element attributeNodes isEmpty.
]

{ #category : #tests }
XMLElementTest >> testRemoveAttributes [
	| element |

	element := self newElementWithAttributes.
	self
		assert: element removeAttributes == element;
		assert: element attributeNodes isEmpty;
		deny: element hasAttributes.
]

{ #category : #tests }
XMLElementTest >> testResolvePrefix [
	| element |

	element := self newNode.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element resolvePrefix: prefix) = ''.
		element declarePrefix: prefix uri: uri.
		self assert: (element resolvePrefix: prefix) = uri].

	self assert:
		(element resolvePrefix: 'xml') = XMLNamespaceScope xmlNamespaceURI.
	self assert:
		(element resolvePrefix: 'xmlns') = XMLNamespaceScope xmlnsNamespaceURI.

	(element := self newNode) usesNamespaces: false.
	self
		assert: (element resolvePrefix: 'xml') = '';
		assert: (element resolvePrefix: 'xmlns') = '';
		deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testResolvePrefixIfUnresolvable [
	| element |

	element := self newNode.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert:
			(element
				resolvePrefix: prefix
				ifUnresolvable: ['unresolvable']) = 'unresolvable'.
		element declarePrefix: prefix uri: uri.
		self assert:
			(element
				resolvePrefix: prefix
				ifUnresolvable: [self fail]) = uri].

	self assert:
		(element
			resolvePrefix: 'xml'
			ifUnresolvable: [self fail]) = XMLNamespaceScope xmlNamespaceURI.
	self  assert:
		(element
			resolvePrefix: 'xmlns'
			ifUnresolvable: [self fail]) = XMLNamespaceScope xmlnsNamespaceURI.

	(element := self newNode) usesNamespaces: false.
	self assert:
		(element
			resolvePrefix: 'xml'
			ifUnresolvable: ['unresolvable']) = 'unresolvable'.
	self  assert:
		(element
			resolvePrefix: 'xmlns'
			ifUnresolvable: ['unresolvable']) = 'unresolvable'.
	self deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testResolvePrefixesOfNamespaceURI [
	| element |

	element := self newNode.
	self namespaces keysAndValuesDo: [:prefix :uri |
		self assert: (element resolvePrefixesOfNamespaceURI: uri) isEmpty.

		element
			declarePrefix: prefix
			uri: uri.
		self assert:
			(element resolvePrefixesOfNamespaceURI: uri) =
				(Set with: prefix).

		element
			declarePrefix: 'newPrefix'
			uri: uri.
		self assert:
			(element resolvePrefixesOfNamespaceURI: uri) =
				(Set with: prefix with: 'newPrefix')].

	self assert:
		(element resolvePrefixesOfNamespaceURI:
			XMLNamespaceScope xmlNamespaceURI) =
				(Set with: 'xml').
	self assert:
		(element resolvePrefixesOfNamespaceURI:
			XMLNamespaceScope xmlnsNamespaceURI) =
				(Set with: 'xmlns').

	(element := self newNode) usesNamespaces: false.
	self assert:
		(element resolvePrefixesOfNamespaceURI:
			XMLNamespaceScope xmlNamespaceURI) isEmpty.
	self assert:
		(element resolvePrefixesOfNamespaceURI:
			XMLNamespaceScope xmlnsNamespaceURI) isEmpty.
	self deny: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testSetAttributes [
	| element newAttributeAssociations |

	element := self newElementWithAttributes.
	newAttributeAssociations :=
		Array
			with: 'newName' -> 'newValue'
			with: 'newName2' -> 'newValue2'.
	element setAttributes: newAttributeAssociations.

	self assert:
		(element attributeNodes collect: [:each |
			each name -> each value]) asArray =
				newAttributeAssociations.
]

{ #category : #tests }
XMLElementTest >> testSortKey [
	self assert: (self nodeClass named: 'test') sortKey = 'test'
]

{ #category : #tests }
XMLElementTest >> testUndeclareDefaultNamespace [
	| element oldRootDefaultNamespace elementsWithCustomDefaultNamespace |

	element := self newNodeWithElements.
	oldRootDefaultNamespace := element defaultNamespace.
	elementsWithCustomDefaultNamespace :=
		element descendantElementsSelect: [:each |
			each defaultNamespace notEmpty
				and: [each defaultNamespace ~= oldRootDefaultNamespace]].

	element
		defaultNamespace: 'newDefaultNS';
		undeclareDefaultNamespace;
		allElementsDo: [:each |
			(elementsWithCustomDefaultNamespace includes: each)
				ifTrue: [
					self
						assert: each defaultNamespace notEmpty;
						deny: each defaultNamespace = oldRootDefaultNamespace;
						deny: each defaultNamespace = 'newDefaultNS']
				ifFalse: [self assert: each defaultNamespace isEmpty]].

	(element := self newNode) usesNamespaces: false.
	self
		assert: element undeclareDefaultNamespace == element;
		assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testUndeclarePrefix [
	| element |

	element := self newElementWithAttributes.
	element
		declarePrefix: 'unused'
		uri: 'unusedNS'.
	element addElementNamed: 'prefixTwo:inner'.

	self
		assert: (element undeclarePrefix: '') == element;
		assert: (element undeclarePrefix: 'unused') == element.
	element allElementsDo: [:each |
		self
			deny: (each isDeclaredPrefix: '');
			deny: (each isDeclaredPrefix: 'unusused');
			assert: (each isDeclaredPrefix: 'prefixTwo')].

	"this prefix is used by the subelement so it can't be undeclared"
	self
		should: [element undeclarePrefix: 'prefixTwo']
		raise: XMLNamespaceException.

	(element := self newElementWithAttributes)
		attributeAt: 'prefixTwo:name'
		put: 'value'.
	"this prefix is used by an attribute so it can't be undeclared"
	self
		should: [element undeclarePrefix: 'prefixTwo']
		raise: XMLNamespaceException.

	(element := self newNode) usesNamespaces: false.
	self
		assert: (element undeclarePrefix: '') == element;
		assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testUndeclarePrefixes [
	| element innerElement |

	element :=
		self nodeClass
			name: 'outer'
			namespaces: self namespaces
			attributes: self unprefixedAttributes.
	(innerElement := element addElementNamed: 'prefixTwo:inner')
		declarePrefix: 'prefixTwo'
		uri: 'newNS'.

	self
		assert: (element undeclarePrefixes) == element;
		deny: element hasNamespaces;
		assert: innerElement hasNamespaces;
		assert: innerElement declaredPrefixes asArray = #('prefixTwo');
		assert: (innerElement resolvePrefix: 'prefixTwo') = 'newNS'.

	self
		should: [innerElement undeclarePrefixes]
		raise: XMLNamespaceException.

	(element := self newNode) usesNamespaces: false.
	self
		assert: element undeclarePrefixes == element;
		assert: element usesNamespaces.
]

{ #category : #tests }
XMLElementTest >> testWriteXMLOn [
	| element attributes |

	element := self nodeClass named: 'element'.
	self assert: element printString = '<element/>'.
	
	element addString: 'test'.
	self assert: element printString = '<element>test</element>'.

	"attribute order should be preserved when printing"
	attributes :=
		self attributesClass
			with: 'b' -> 'one'
			with: 'a' -> 'two'
			with: 'c' -> 'three'
			with: 'e' -> 'four'
			with: 'd' -> 'five'.
	element setAttributes: attributes.
	self assert:
		element printString =
			'<element b="one" a="two" c="three" e="four" d="five">test</element>'.
	element setAttributes: attributes associations reversed.
	self assert:
		element printString =
			'<element d="five" e="four" c="three" a="two" b="one">test</element>'.
]
