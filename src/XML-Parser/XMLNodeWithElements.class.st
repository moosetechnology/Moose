"
This is an abstract class for nodes with elements.

Instances provide ""accessing"" messages to retrieve child elements by their name and namespace information. The #elementAt: forms return the first matching element, while the #elementsAt: forms return all matching child elements.

There are three different modes of enumeration: the #elements* enumerating messages enumerate child elements, the #allElements* forms enumerate the receiver (if it's an element) and all descendant elements, and the #descendantElement* forms enumerate descendant elements only.

The #findElementNamed:* forms search the receicer (if it's an element) and descendants for a specific element.

Element name matching is done the qualified and local name, so 'prefix:element-name' will only match 'prefix:element-name' while 'element-name' will match 'element-name', 'prefix:element-name' or 'different-prefix:element-name' and so on.

The inner XML can be accessed as a string using #innerXML and set (reparsed) using #innerXML:.
"
Class {
	#name : #XMLNodeWithElements,
	#superclass : #XMLNodeWithChildren,
	#instVars : [
		'configuration'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #visiting }
XMLNodeWithElements >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNodeWithElements: self
]

{ #category : #adding }
XMLNodeWithElements >> addCData: aString [
	^ self addNode: (self newCData: aString)
]

{ #category : #deprecated }
XMLNodeWithElements >> addContent: aStringOrStringNode [
	"will be deprecated; use #addString: instead"

	(self hasChildren
		and: [self lastNode isCoalescingStringNode])
		ifTrue: [self lastNode append: aStringOrStringNode]
		ifFalse: [self addNode:
			(aStringOrStringNode isString
				ifTrue: [self nodeFactory newStringNode: aStringOrStringNode]
				ifFalse: [aStringOrStringNode])].
	"returns self for backwards compatibility"
]

{ #category : #deprecated }
XMLNodeWithElements >> addElement: anElement [
	self deprecated:
		'Use #addNode: with an element argument or #addElementNamed: instead'.

	self addNode: anElement.
	"returns self for backwards compatibility"
]

{ #category : #adding }
XMLNodeWithElements >> addElementNamed: aName [
	"adds and returns a new element with the specified name"

	| addedElementNamespaceScope addedElementNamespaceURI addedElement |

	addedElementNamespaceScope := self newNamespaceScopeForAddedElement.
	addedElementNamespaceURI :=
		self
			namespaceURIOfAddedElementNamed: aName
			withScope: addedElementNamespaceScope.
	"added first to inherit the config before setting the name"
	addedElement :=
		self addNode:
			((self nodeFactory
				classForElement: aName
				namespaceURI: addedElementNamespaceURI) new
				setNamespaceScope: addedElementNamespaceScope).
	^ addedElement name: aName.
]

{ #category : #adding }
XMLNodeWithElements >> addElementNamed: aName attributes: anAssociationCollection [
	"adds and returns a new element with the specified name and attributes"

	| addedElementNamespaceScope addedElementNamespaceURI addedElementAttributeDictionary addedElement |

	addedElementNamespaceScope := self newNamespaceScopeForAddedElement.
	addedElementNamespaceURI :=
		self
			namespaceURIOfAddedElementNamed: aName
			withScope: addedElementNamespaceScope.
	addedElementAttributeDictionary :=
		self
			newAttributeDictionaryFrom: anAssociationCollection
			forAddedElementWithScope: addedElementNamespaceScope.
	"added first to inherit the config before setting the name and attributes"
	addedElement :=
		self addNode:
			((self nodeFactory
				classForElement: aName
				namespaceURI: addedElementNamespaceURI
				attributes: addedElementAttributeDictionary) new
				setNamespaceScope: addedElementNamespaceScope).
	^ addedElement
		name: aName;
		setAttributes: addedElementAttributeDictionary.
]

{ #category : #adding }
XMLNodeWithElements >> addElementNamed: aName namespaceURI: aURI [
	"adds and returns a new element with the specified name and namespace
	URI"

	| addedElementNamespaceScope addedElement |

	addedElementNamespaceScope :=
		self
			newNamespaceScopeForAddedElementNamed: aName
			namespaceURI: aURI.
	"added first to inherit the config before setting the name"
	addedElement :=
		self addNode:
			((self nodeFactory
				classForElement: aName
				namespaceURI: aURI) new
				setNamespaceScope: addedElementNamespaceScope).
	^ addedElement name: aName.
]

{ #category : #adding }
XMLNodeWithElements >> addElementNamed: aName namespaceURI: aURI attributes: anAssociationCollection [
	"adds and returns a new element with the specified name, namespace URI,
	and attributes"

	| addedElementNamespaceScope addedElementAttributeDictionary addedElement |

	addedElementNamespaceScope :=
		self
			newNamespaceScopeForAddedElementNamed: aName
			namespaceURI: aURI.
	addedElementAttributeDictionary :=
		self
			newAttributeDictionaryFrom: anAssociationCollection
			forAddedElementWithScope: addedElementNamespaceScope.
	"added first to inherit the config before setting the name and attributes"
	addedElement :=
		self addNode:
			((self nodeFactory
				classForElement: aName
				namespaceURI: aURI
				attributes: addedElementAttributeDictionary) new
				setNamespaceScope: addedElementNamespaceScope).
	^ addedElement
		name: aName;
		setAttributes: addedElementAttributeDictionary.
]

{ #category : #adding }
XMLNodeWithElements >> addString: aString [
	"Adds a new string node for aString or just appends aString to the
	last node if it's a coalescing string node (not CDATA).

	Returns the new string node or the string node appeneded to."

	| lastNode |

	(self hasChildren
		and: [(lastNode := self lastNode) isCoalescingStringNode])
		ifTrue: [^ lastNode append: aString]
		ifFalse: [^ self addNode: (self nodeFactory newStringNode: aString)]
]

{ #category : #private }
XMLNodeWithElements >> addedElement: anElement [
]

{ #category : #notifying }
XMLNodeWithElements >> addedNode: aNode [
	super addedNode: aNode.
	aNode isElement
		ifTrue: [
			aNode configuration: self configuration.
			self addedElement: aNode].
]

{ #category : #accessing }
XMLNodeWithElements >> allElements [
	"returns a node list with all descendant elements (and the receiver if
	it's an element)"
	| allElements |

	allElements := self newListForSelect.
	self allElementsDo: [:each | allElements addLast: each].
	^ allElements.
]

{ #category : #enumerating }
XMLNodeWithElements >> allElementsCollect: aBlock [
	"returns an ordered list of the values of evaluating all descendant
	elements (and the receiver if it's an element) with aBlock"
	| collectedObjects |

	collectedObjects := self newListForCollect.
	self allElementsDo: [:each | collectedObjects addLast: (aBlock value: each)].
	^ collectedObjects.
]

{ #category : #enumerating }
XMLNodeWithElements >> allElementsDetect: aBlock [
	"Descend depth-first visiting each element with aBlock until one such evaluation
	of aBlock with an element is true, then return that element. If no evaluation is
	true, then return nil."

	^ self allElementsDetect: aBlock ifNone: [nil]
]

{ #category : #enumerating }
XMLNodeWithElements >> allElementsDetect: aBlock ifNone: anExceptionBlock [
	"Descend depth-first visiting each element with aBlock until one such evaluation
	of aBlock with an element is true, then return that element. If no evaluation is
	true, then return the value of anExceptionBlock."

	self allElementsDo: [:each |
		(aBlock value: each)
			ifTrue: [^ each]].
	^ anExceptionBlock value.
]

{ #category : #enumerating }
XMLNodeWithElements >> allElementsDo: aBlock [
	"evaluates all descendant elements (and the receiver if it's an
	element) with aBlock"

	self hasChildren
		ifTrue: [self elementsDo: [:each | each allElementsDo: aBlock]]
]

{ #category : #accessing }
XMLNodeWithElements >> allElementsNamed: aName [
	"returns a node list with all descendant elements (and the receiver if
	it's an element) whose qualified or local names match aName"

	^ self allElementsSelect: [:each | each isNamed: aName]
]

{ #category : #enumerating }
XMLNodeWithElements >> allElementsNamed: aName do: aBlock [
	"evaluates all descendant elements (and the receiver if it's an
	element) whose qualified or local names match aName with aBlock"

	self allElementsDo: [:each |
		(each isNamed: aName)
			ifTrue: [aBlock value: each]]
]

{ #category : #accessing }
XMLNodeWithElements >> allElementsNamed: aName namespaceURI: aURI [
	"returns a node list with all descendant elements (and the receiver if
	it's an element) whose qualified or local names match aName and whose
	namespace URIs matches aURI"

	^ self allElementsSelect: [:each |
		(each isNamed: aName)
			and: [each namespaceURI = aURI]]
]

{ #category : #enumerating }
XMLNodeWithElements >> allElementsSelect: aBlock [
	"returns a new node list with all descendant elements (and the receiver
	if it's an element) that aBlock evaluates true for"

	| selectedElements |

	selectedElements := self newListForSelect.
	self allElementsDo: [:each |
		(aBlock value: each)
			ifTrue: [selectedElements addLast: each]].
	^ selectedElements.
]

{ #category : #accessing }
XMLNodeWithElements >> configuration [
	^ configuration ifNil: [
		self configuration: self configurationClass new.
		configuration]
]

{ #category : #accessing }
XMLNodeWithElements >> configuration: aConfiguration [
	configuration := aConfiguration.
	self hasChildren
		ifTrue: [
			self elementsDo: [:each |
				each configuration: aConfiguration]].
]

{ #category : #defaults }
XMLNodeWithElements >> configurationClass [
	^ XMLDOMConfiguration
]

{ #category : #accessing }
XMLNodeWithElements >> contentNodes [
	"returns a node list of the receiver's element and string node children"

	^ self nodes contentNodes
]

{ #category : #enumerating }
XMLNodeWithElements >> contentNodesDo: aBlock [
	"evaluates aBlock for all element and string node children of the receiver"

	self nodes contentNodesDo: aBlock
]

{ #category : #deprecated }
XMLNodeWithElements >> contentString: aString [
	"will be deprecated; use #removeNodes and #addString: instead"

	self
		removeNodes;
		addString: aString
]

{ #category : #accessing }
XMLNodeWithElements >> contentStringAt: aName [
	"Returns the content string of the first element child of the receiver
	whose qualified or local name matches aName or an empty string if there
	isn't one.

	See also #rawContentStringAt:"

	^ self nodes contentStringAt: aName
]

{ #category : #accessing }
XMLNodeWithElements >> descendantElements [
	"returns a node list of all descendant elements"
	| descendentElements |

	descendentElements := self newListForSelect.
	self descendantElementsDo: [:each | descendentElements addLast: each].
	^ descendentElements.
]

{ #category : #enumerating }
XMLNodeWithElements >> descendantElementsCollect: aBlock [
	"returns an ordered list of the values of evaluating all descendant
	elements with aBlock"
	| collectedObjects |

	collectedObjects := self newListForCollect.
	self descendantElementsDo: [:each |
		collectedObjects addLast: (aBlock value: each)].
	^ collectedObjects.
]

{ #category : #enumerating }
XMLNodeWithElements >> descendantElementsDetect: aBlock [
	"returns the first descendant element that aBlock evaluates true for or
	nil if there isn't one"

	^ self
		descendantElementsDetect: aBlock
		ifNone: [nil]
]

{ #category : #enumerating }
XMLNodeWithElements >> descendantElementsDetect: aBlock ifNone: anExceptionBlock [
	"returns the first descendant element that aBlock evaluates true for or
	the value of anExceptionBlock if there isn't one"

	self descendantElementsDo: [:each |
		(aBlock value: each)
			ifTrue: [^ each]].
	^ anExceptionBlock value.
]

{ #category : #enumerating }
XMLNodeWithElements >> descendantElementsDo: aBlock [
	"evaluates all descendant elements with aBlock"

	self hasChildren
		ifTrue: [self elementsDo: [:each | each allElementsDo: aBlock]]
]

{ #category : #accessing }
XMLNodeWithElements >> descendantElementsNamed: aName [
	"returns a node list of all descendant elements whose qualified
	or local names match aName"

	^ self descendantElementsSelect: [:each | each isNamed: aName]
]

{ #category : #enumerating }
XMLNodeWithElements >> descendantElementsNamed: aName do: aBlock [
	"evaluates all descendant elements whose qualified or local names
	match aName with aBlock"

	self descendantElementsDo: [:each |
		(each isNamed: aName)
			ifTrue: [aBlock value: each]]
]

{ #category : #accessing }
XMLNodeWithElements >> descendantElementsNamed: aName namespaceURI: aURI [
	"returns a node list of all descendant elements whose qualified
	or local names match aName and whose namespace URIs match aURI"

	^ self descendantElementsSelect: [:each |
		(each isNamed: aName)
			and: [each namespaceURI = aURI]]
]

{ #category : #enumerating }
XMLNodeWithElements >> descendantElementsSelect: aBlock [
	"returns a new node list with all descendant elements that aBlock
	evaluates true for"
	| selectedElements |

	selectedElements := self newListForSelect.
	self descendantElementsDo: [:each |
		(aBlock value: each)
			ifTrue: [selectedElements addLast: each]].
	^ selectedElements.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElements [
	self deprecated: 'use #descendantElements instead'.
	^ self descendantElements.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsCollect: aBlock [
	self deprecated: 'use #descendantElementsCollect: instead'.
	^ self descendantElementsCollect: aBlock.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsDetect: aBlock [
	self deprecated: 'use #descendantElementsDetect: instead'.
	^ self descendantElementsDetect: aBlock.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsDetect: aBlock ifNone: anExceptionBlock [
	self deprecated: 'use #descendantElementsDetect:ifNone: instead'.
	^ self
		descendantElementsDetect: aBlock
		ifNone: anExceptionBlock.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsDo: aBlock [
	self deprecated: 'use #descendantElementsDo: instead'.
	^ self descendantElementsDo: aBlock.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsNamed: aName [
	self deprecated: 'use #descendantElementsNamed: instead"'.
	^ self descendantElementsNamed: aName.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsNamed: aName do: aBlock [
	self deprecated: 'use #descendantElementsNamed:do: instead'.
	^ self
		descendantElementsNamed: aName
		do: aBlock.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsNamed: aName namespaceURI: aURI [
	self deprecated: 'use #descendantElementsNamed:namespaceURI: instead'.
	^ self
		descendantElementsNamed: aName
		namespaceURI: aURI.
]

{ #category : #deprecated }
XMLNodeWithElements >> descendentElementsSelect: aBlock [
	self deprecated: 'use #descendantElementsSelect: instead'.
	^ self descendantElementsSelect: aBlock.
]

{ #category : #accessing }
XMLNodeWithElements >> elementAfter: anElement [
	"returns the first element child of the receiver after anElement or nil if
	there isn't one"

	^ self nodes elementAfter: anElement
]

{ #category : #accessing }
XMLNodeWithElements >> elementAt: aName [
	"returns the first element child of the receiver whose qualified or
	local name matches aName or nil if there isn't one"

	^ self nodes elementAt: aName
]

{ #category : #accessing }
XMLNodeWithElements >> elementAt: aName ifAbsent: aBlock [
	"returns the first element child of the receiver whose qualified or
	local name matches aName or the value of aBlock if there isn't one"

	^ self nodes
		elementAt: aName
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLNodeWithElements >> elementAt: aName namespaceURI: aURI [
	"returns the first element child of the receiver whose qualified or
	local name matches aName and whose namespace URI matches aURI or nil
	if there isn't one"

	^ self nodes
		elementAt: aName
		namespaceURI: aURI
]

{ #category : #accessing }
XMLNodeWithElements >> elementAt: aName namespaceURI: aURI ifAbsent: aBlock [
	"returns the first element child of the receiver whose qualified or
	local name matches aName and whose namespace URI matches aURI or the
	value of aBlock if there isn't one"

	^ self nodes
		elementAt: aName
		namespaceURI: aURI
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLNodeWithElements >> elementBefore: anElement [
	"returns the first element child of the receiver before anElement or
	nil if there isn't one"

	^ self nodes elementBefore: anElement
]

{ #category : #accessing }
XMLNodeWithElements >> elementNames [
	^ self nodes elementNames
]

{ #category : #accessing }
XMLNodeWithElements >> elements [
	"returns a new node list of all of the receiver's elements"

	^ self nodes elements
]

{ #category : #accessing }
XMLNodeWithElements >> elementsAt: aName [
	"returns a node list of all the receiver's elements whose qualified
	or local names match aName"

	^ self nodes elementsAt: aName
]

{ #category : #enumerating }
XMLNodeWithElements >> elementsAt: aName do: aBlock [
	"evaluates aBlock for all element children of the receiver whose
	qualified or local names match aName"

	self nodes
		elementsAt: aName
		do: aBlock
]

{ #category : #accessing }
XMLNodeWithElements >> elementsAt: aName namespaceURI: aURI [
	"returns a node list of all the receiver's elements whose qualified
	or local names match aName and whose namespace URIs match aURI"

	^ self nodes
		elementsAt: aName
		namespaceURI: aURI
]

{ #category : #enumerating }
XMLNodeWithElements >> elementsCollect: aBlock [
	"returns an ordered list of the values of evaluating the element
	children of the receiver with aBlock"

	^ self nodes elementsCollect: aBlock
]

{ #category : #enumerating }
XMLNodeWithElements >> elementsDetect: aBlock [
	"returns the first element child of the receiver that aBlock evaluates
	true for or nil if there isn't one"

	^ self nodes elementsDetect: aBlock
]

{ #category : #enumerating }
XMLNodeWithElements >> elementsDetect: aBlock ifNone: anExceptionBlock [
	"returns the first element child of the receiver that aBlock evaluates
	true for or the value of anExceptionBlock if there isn't one"

	^ self nodes
		elementsDetect: aBlock
		ifNone: anExceptionBlock
]

{ #category : #enumerating }
XMLNodeWithElements >> elementsDo: aBlock [
	"evaluates aBlock for all element children of the receiver"

	self nodes elementsDo: aBlock
]

{ #category : #enumerating }
XMLNodeWithElements >> elementsSelect: aBlock [
	"returns a node list of all element children of the receiver that
	aBlock evaluates true for"

	^ self nodes elementsSelect: aBlock
]

{ #category : #private }
XMLNodeWithElements >> ensureUsesNamespaces [
	self usesNamespaces: true
]

{ #category : #private }
XMLNodeWithElements >> errorOuterXMLForAbsentNode [
	XMLDOMException signal: 'Cannot change outer XML for absent node'
]

{ #category : #private }
XMLNodeWithElements >> escapesContentEntitiesWhenWriting [
	"avoid initializing config; defualt to true"
	^ configuration isNil
		or: [configuration replacesContentEntityReferences]
]

{ #category : #searching }
XMLNodeWithElements >> findElementNamed: aName [
	"searches the receiver and all descendants for the first element whose
	qualified or local name matches aName"

	^ self allElementsDetect: [:each | each isNamed: aName]
]

{ #category : #searching }
XMLNodeWithElements >> findElementNamed: aName namespaceURI: aURI [
	"searches the receiver and all descendants for the first element whose
	qualified or local name matches aName and whose namespace URI matches aURI"

	^ self allElementsDetect: [:each |
		(each isNamed: aName)
			and: [each namespaceURI = aURI]]
]

{ #category : #searching }
XMLNodeWithElements >> findElementNamed: aName namespaceURI: aURI with: aBlock [
	"searches the receiver and all descendants for the first element whose
	qualified or local name matches aName and whose namespace URI matches
	aURI and that aBlock evaluates true for"

	^ self allElementsDetect: [:each |
		(each isNamed: aName)
			and: [each namespaceURI = aURI
				and: [aBlock value: each]]]
]

{ #category : #searching }
XMLNodeWithElements >> findElementNamed: aName with: aBlock [
	"searches the receiver and all descendants for the first element whose
	qualified or local name matches aName and aBlock evaluates true for"

	^ self allElementsDetect: [:each |
		(each isNamed: aName)
			and: [aBlock value: each]]
]

{ #category : #searching }
XMLNodeWithElements >> findElementWithID: anID [
	"Works like XML DOM Level 2's getElementByID(). It will scan attributes
	identified as IDs by a DTD with '<!ATTLIST ...>' declarations or any
	attribute named 'xml:id'."

	| document doctypeDefinition |
	
	((document := self document) notNil
		and: [(doctypeDefinition := document doctypeDefinition) notNil
			and: [doctypeDefinition hasAttributeValidators]])
		ifTrue: [
			self allElementsDo: [:each |
				each hasAttributes
					ifTrue: [
						(doctypeDefinition attributeValidatorsAt: each name)
							ifNil: [
								(each hasUndeclaredID: anID)
									ifTrue: [^ each]]
							ifNotNil: [:attributeValidators |
								(each
									hasUndeclaredOrDeclaredID: anID
									declaredWith: attributeValidators)
									ifTrue: [^ each]]]]]
		ifFalse: [
			self allElementsDo: [:each |
				(each hasAttributes
					and: [each hasUndeclaredID: anID])
					ifTrue: [^ each]]].
	^ nil.
]

{ #category : #accessing }
XMLNodeWithElements >> firstElement [
	"returns the first child element of the receiver or nil if there
	isn't one"

	^ self nodes firstElement
]

{ #category : #testing }
XMLNodeWithElements >> hasContentNodes [
	^ self nodes hasContentNodes
]

{ #category : #testing }
XMLNodeWithElements >> hasElements [
	"returns true if the receiver has element children"

	"optimized with a nil test to avoid lazy initializing nodes"
	nodes == nil
		ifTrue: [^ false].
	^ nodes hasElements.
]

{ #category : #testing }
XMLNodeWithElements >> hasStringNodes [
	^ self nodes hasStringNodes
]

{ #category : #testing }
XMLNodeWithElements >> includesElement: aName [
	"returns true if the receiver has a child element whose qualified or local name
	matches aName"

	^ self nodes includesElement: aName
]

{ #category : #testing }
XMLNodeWithElements >> includesElement: aName namespaceURI: aURI [
	"returns true if the receiver has a child element whose qualified or local name
	matches aName and whose namespace URI matches aURI"

	^ self nodes
		includesElement: aName
		namespaceURI: aURI
]

{ #category : #parsing }
XMLNodeWithElements >> innerXML: aStringOrStream [
	"Replaces the node children by parsing new inner XML from a string or stream
	argument. By default the same parser configuration will be used to parse the
	new inner XML."

	self innerXMLParsedWith: (self parserHandlerClass on: aStringOrStream)
]

{ #category : #parsing }
XMLNodeWithElements >> innerXMLParsedWith: aParser [
	| removedNodes |

	removedNodes := self nodes asArray.
	self removeNodes.
	[aParser
		innerXMLRootNode: self;
		parseDocument]
		on: Error
		do: [:error |
			self
				removeNodes;
				addNodes: removedNodes.
			error pass].
]

{ #category : #private }
XMLNodeWithElements >> innerXMLStateClass [
	^ XMLContentState
]

{ #category : #testing }
XMLNodeWithElements >> isContentNode [
	^ true
]

{ #category : #accessing }
XMLNodeWithElements >> lastElement [
	"returns the last child element of the receiver or nil if there
	isn't one"

	^ self nodes lastElement
]

{ #category : #private }
XMLNodeWithElements >> namespaceURIOfAddedElementNamed: aName withScope: aNamespaceScope [
	^ self usesNamespaces
		ifTrue: [aNamespaceScope resolvePrefix: aName xmlPrefixBeforeLocalName]
		ifFalse: ['']
]

{ #category : #private }
XMLNodeWithElements >> newAttributeDictionaryFrom: anAssociationCollection forAddedElementWithScope: aNamespaceScope [
	^ self usesNamespaces
		ifTrue: [
			(XMLNamespacedAttributeDictionary newFrom: anAssociationCollection)
				setNamespaceScope: aNamespaceScope]
		ifFalse: [XMLAttributeDictionary newFrom: anAssociationCollection]
]

{ #category : #private }
XMLNodeWithElements >> newInnerXMLState [
	^ self innerXMLStateClass new
]

{ #category : #private }
XMLNodeWithElements >> newNamespaceScopeForAddedElement [
	^ self usesNamespaces
		ifTrue: [XMLNamespaceScope new]
		ifFalse: [nil]
]

{ #category : #private }
XMLNodeWithElements >> newNamespaceScopeForAddedElementNamed: aName namespaceURI: aURI [
	self ensureUsesNamespaces.

	^ self newNamespaceScopeForAddedElement
		mapPrefix: aName xmlPrefixBeforeLocalName to: aURI;
		yourself.
]

{ #category : #deprecated }
XMLNodeWithElements >> newString: aString [
	"will be deprecated; use #newStringNode: instead"

	^ self newStringNode: aString
]

{ #category : #accessing }
XMLNodeWithElements >> nodeFactory [
	^ self configuration nodeFactory
]

{ #category : #accessing }
XMLNodeWithElements >> nodeFactory: aNodeFactory [
	self configuration nodeFactory: aNodeFactory
]

{ #category : #defaults }
XMLNodeWithElements >> nodeListClass [
	^ self configuration nodeFactory nodeListClass
]

{ #category : #parsing }
XMLNodeWithElements >> outerXML: aStringOrStream forNode: aNode [
	self
		outerXMLForNode: aNode
		parsedWith: (self parserHandlerClass on: aStringOrStream)
]

{ #category : #parsing }
XMLNodeWithElements >> outerXMLForNode: aNode parsedWith: aParser [
	| indexOfNode removedNodes |

	indexOfNode :=
		self nodes
			indexOf: aNode
			ifAbsent: [self errorOuterXMLForAbsentNode].
	removedNodes :=
		self nodes
			copyFrom: indexOfNode
			to: self nodes size.
	self removeNodes: removedNodes.
	[aParser
		innerXMLRootNode: self;
		parseDocument]
		on: Error
		do: [:error |
			[self nodes size >= indexOfNode]
				whileTrue: [self nodes removeLast].
			self addNodes: removedNodes.
			error pass].
	2 to: removedNodes size do: [:i |
		self addNode: (removedNodes at: i)].
]

{ #category : #defaults }
XMLNodeWithElements >> parserHandlerClass [
	^ self configuration parserHandlerClass
]

{ #category : #copying }
XMLNodeWithElements >> postCopyConfiguration [
	configuration
		ifNotNil: [self configuration: configuration copy]
]

{ #category : #printing }
XMLNodeWithElements >> printRawContentOn: aStream [
	self contentNodesDo: [:each | each printRawContentOn: aStream]
]

{ #category : #accessing }
XMLNodeWithElements >> rawContentStringAt: aName [
	"Returns the raw content string (without space inserted) of the first
	element child of the receiver whose qualified or local name matches aName
	or an empty string if there isn't one.

	See also #contentStringAt:"

	^ self nodes rawContentStringAt: aName
]

{ #category : #removing }
XMLNodeWithElements >> removeAllFormattingNodes [
	"This is a convenience method to remove formatting string nodes from the
	receiver and descendant elements. Empty/whitespace string nodes with
	element siblings are assumed to be formatting, unless they have at least
	one non-empty/non-whitespace sibling string node.

	WARNING: 'mixed content' elements that can have both string and element
	children, like this:
		<row>one<sep/> <sep/>three</row>
	aren't properly recognized when all of the string nodes are whitespace,
	so this:
		<row> <sep/> <sep/> </row>
	will become this:
		<row><sep/><sep/></row>
	which might not be acceptable."

	| hasFormattingStringNodes hasElements |

	hasFormattingStringNodes := false.
	hasElements := false.
	self nodesDo: [:each |
		each isStringNode
			ifTrue: [
				(hasFormattingStringNodes :=
					each isWhitespace
						or: [each isEmpty])
					ifFalse: [^ self]]
			ifFalse: [
				hasElements
					ifFalse: [hasElements := each isElement]]].

	(hasFormattingStringNodes
		and: [hasElements])
		ifTrue: [| nodeList |
			nodeList := self nodes.
			nodeList size to: 1 by: -1 do: [:i | | node |
				((node := nodeList at: i) isStringNode
					and: [node isWhitespace
						or: [node isEmpty]])
					ifTrue: [nodeList removeAt: i]]].
	hasElements
		ifTrue: [
			self elementsDo: [:each |
				each removeAllFormattingNodes]].
]

{ #category : #notifying }
XMLNodeWithElements >> renamedElement: anElement from: anOldName to: aNewName [
	self nodes
		renamedElement: anElement
		from: anOldName
		to: aNewName
]

{ #category : #accessing }
XMLNodeWithElements >> stringNodes [
	"returns a new node list of all string node children of the receiver"

	^ self nodes stringNodes
]

{ #category : #enumerating }
XMLNodeWithElements >> stringNodesDo: aBlock [
	"evaluates each string node child of the receiver with aBlock"

	self nodes stringNodesDo: aBlock
]

{ #category : #accessing }
XMLNodeWithElements >> strings [
	"returns an ordered list of the strings of the string nodes of the receiver"

	^ self nodes strings
]

{ #category : #enumerating }
XMLNodeWithElements >> stringsDo: aBlock [
	"evaluates each string of each string node child of the receiver with
	aBlock"

	self nodes stringsDo: aBlock
]

{ #category : #testing }
XMLNodeWithElements >> usesNamespaces [
	"returns true if namespace checking is enabled (default)"

	"optimized to avoid lazy initializing the config"
	configuration == nil
		ifTrue: [^ true].
	^ configuration usesNamespaces.
]

{ #category : #accessing }
XMLNodeWithElements >> usesNamespaces: aBoolean [
	"can be used to disable namespace checking, which is enabled by default"

	self configuration usesNamespaces: aBoolean
]
