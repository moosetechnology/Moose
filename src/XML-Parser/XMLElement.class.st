"
The class represents an element node, which has a qualified or unqualified name and optionally attributes, namespace declarations and child nodes.

Element names can be tested using #isNamed: and #isNamedAny:, which test both the qualified and local name.

If the name is qualified and namespace support is enabled (the default), then the prefix must be mapped to a namespace URI in the element or an ancestor. The class-side instance creation #name:namespaceURI:* and #name:namespaces:* messages and the instance-side #name:namespaceURI: message can set both simultaneously. If namespace support is disabled, prefixes are not checked.

The #attribute* messages provide a Dictionary-like protocol for manipulating attribute nodes. Unlike the #elementAt:* messages, they match qualified names only, and attribute value accessors return empty strings if the attribute is absent. The underlying attribute node list can be accessed using #attributeNodes (copy before modifying if you don't want to change the element's attributes), and the names/values can be obtained as an (order-preserving) dictionary using #attributes.

See the superclasses for more info.
"
Class {
	#name : #XMLElement,
	#superclass : #XMLNodeWithElements,
	#instVars : [
		'name',
		'localName',
		'attributes',
		'namespaceScope'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLElement class >> name: aLocalName [
	^ self named: aLocalName
]

{ #category : #'instance creation' }
XMLElement class >> name: aLocalName attributes: anAssociationCollection [
	"Returns a new element with the specified name and attributes.

	Both aLocalName and the attributes must not be prefixed or a namespace
	exception will be thrown.

	The anAssociationCollection argument can be a dictionary or any collection
	of associations."

	^ (self named: aLocalName)
		setAttributes: anAssociationCollection
]

{ #category : #'instance creation' }
XMLElement class >> name: aQualifiedName namespaceURI: aURI [
	"Returns a new element with the specified name and namespace URI.

	If aQualifiedName has a prefix, then aURI must be non-empty and the prefix
	will be bound to it. Otherwise aURI will be declared as the default namespace."

	^ self new
		name: aQualifiedName
		namespaceURI: aURI
]

{ #category : #'instance creation' }
XMLElement class >> name: aQualifiedName namespaceURI: aURI attributes: anAssociationCollection [
	"Returns a new element with the specified name, namespace URI, and attributes.

	If aQualifiedName has a prefix, then aURI must be non-empty and the prefix
	will be bound to it. Otherwise aURI will be declared as the default namespace.
	If the attributes are prefixed, then aQualifiedName must have the same prefix
	or a namespace exception will be thrown.

	The anAssociationCollection argument can be a dictionary or any collection
	of associations."

	^ (self
		name: aQualifiedName
		namespaceURI: aURI)
			setAttributes: anAssociationCollection
]

{ #category : #'instance creation' }
XMLElement class >> name: aQualifiedName namespaces: anAssociationCollection [
	"Returns a new element with the specified name and namespaces.

	If aQualifiedName has a prefix, then anAssociationCollection must contain
	an association for it or a namespace exception will be thrown.

	The anAssociationCollection argument can be a dictionary or any collection
	of associations. An association with an empty string key sets the default
	namespace."

	^ self new
		declareNamespaces: anAssociationCollection;
		name: aQualifiedName
]

{ #category : #'instance creation' }
XMLElement class >> name: aQualifiedName namespaces: aNamespaceAssociationCollection attributes: anAttributeAssociationCollection [
	"Returns a new element with the specified name, namespaces, and attributes.

	If aQualifiedName or one of the attributes has a prefix, then
	aNamespaceAssociationCollection must contain an association for it or a
	namespace exception will be thrown.

	The aNamespaceAssociationCollection and anAttributeAssociationCollection
	arguments can be dictionaries or any collection of associations. An
	association with an empty string key sets the default namespace."

	^ (self
		name: aQualifiedName
		namespaces: aNamespaceAssociationCollection)
			setAttributes: anAttributeAssociationCollection
]

{ #category : #'instance creation' }
XMLElement class >> named: aLocalName [
	"Returns a new element with the specified name.

	The argument must not be prefixed or a namespace exception will be thrown."

	^ self new name: aLocalName
]

{ #category : #visiting }
XMLElement >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElement: self
]

{ #category : #notifying }
XMLElement >> addedAttribute: anAttribute [
	anAttribute element
		ifNotNil: [:element |
			element == self
				ifFalse: [element removeAttributeNode: anAttribute]].
	anAttribute element: self.
	self validateNamespacePrefixOfAttribute: anAttribute.
]

{ #category : #private }
XMLElement >> addedElement: anElement [
	(self hasNamespaces
		and: [self namespaceScope ~= anElement namespaceScope])
		ifTrue: [
			anElement allElementsDo: [:each |
				each namespaceScope inheritMappingsFrom: self namespaceScope]]
]

{ #category : #enumerating }
XMLElement >> allElementsDo: aBlock [
	"evaluates aBlock for the receiver and all descendant elements"

	aBlock value: self.
	self hasChildren
		ifTrue: [self elementsDo: [:each | each allElementsDo: aBlock]].
]

{ #category : #private }
XMLElement >> allNamespaceScopesRemapPrefix: aPrefix from: anOldURIOrNil to: aNewURI [
	(self namespaceScope
		prefixMappingAt: aPrefix
		ifAbsent: [anOldURIOrNil]) = anOldURIOrNil
		ifTrue: [
			self namespaceScope
				mapPrefix: aPrefix
				to: aNewURI.
			"we only need to check the attributes if we've remapped an
			existing, non-default namespace"
			(anOldURIOrNil notNil
				and: [aPrefix size > 0])
				ifTrue: [self validateNamespacePrefixesOfAttributes].
			self elementsDo: [:each |
				each
					allNamespaceScopesRemapPrefix: aPrefix
					from: anOldURIOrNil
					to: aNewURI]]
]

{ #category : #private }
XMLElement >> allNamespaceScopesUnmapPrefix: aPrefix mappedTo: aURI [
	(self namespaceScope
		includesPrefix: aPrefix
		mappedTo: aURI)
		ifTrue: [
			self namespaceScope unmapPrefix: aPrefix.
			self
				validateNamespacePrefix;
				validateNamespacePrefixesOfAttributes.
			self elementsDo: [:each |
				each
					allNamespaceScopesUnmapPrefix: aPrefix
					mappedTo: aURI]]
]

{ #category : #accessing }
XMLElement >> attributeAssociations [
	"returns attribute name->value associations"

	^ self attributeNodes attributeAssociations
]

{ #category : #accessing }
XMLElement >> attributeAt: aName [
	"returns the value of the attribute whose full name matches aName or an
	empty string if there isn't any"

	^ self attributeNodes attributeValueAt: aName
]

{ #category : #accessing }
XMLElement >> attributeAt: aName ifAbsent: aBlock [
	"returns the value of the attribute whose full name matches aName or the
	value of aBlock if there isn't any"

	^ self attributeNodes
		attributeValueAt: aName
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLElement >> attributeAt: aName ifAbsentPut: aBlock [
	"sets the value of the attribute whose full name matches aName to the value
	of aBlock if there isn't one already"

	^ self attributeNodes
		attributeValueAt: aName
		ifAbsentPut: aBlock
]

{ #category : #accessing }
XMLElement >> attributeAt: aName put: aValue [
	"sets the value of the attribute whose full name matches aName to the value
	aValue"

	^ self attributeNodes
		attributeValueAt: aName
		put: aValue
]

{ #category : #defaults }
XMLElement >> attributeListClass [
	^ self configuration nodeFactory attributeListClass
]

{ #category : #accessing }
XMLElement >> attributeNames [
	^ self attributeNodes attributeNames
]

{ #category : #enumerating }
XMLElement >> attributeNamesAndValuesDo: aTwoArgumentBlock [
	self attributeNodes attributeNamesAndValuesDo: aTwoArgumentBlock
]

{ #category : #enumerating }
XMLElement >> attributeNamesDo: aBlock [
	self attributeNodes attributeNamesDo: aBlock
]

{ #category : #accessing }
XMLElement >> attributeNodeAt: aName [
	"returns the attribute node whose qualified or local name matches aName
	(unlike attributeAt:, which matches the full name exactly), or nil if there
	isn't any"

	^ self attributeNodes attributeNodeAt: aName
]

{ #category : #accessing }
XMLElement >> attributeNodeAt: aName ifAbsent: aBlock [
	"returns the attribute node whose qualified or local name matches aName
	(unlike attributeAt:ifAbsent:, which matches the full name exactly), or
	the value of aBlock if there isn't any"

	^ self attributeNodes
		attributeNodeAt: aName
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLElement >> attributeNodeAt: aName namespaceURI: aURI [
	"returns the attribute node whose qualified or local name matches aName
	(unlike attributeAt:, which matches the full name exactly) and whose
	namespace URI matches aURI, or nil if there isn't any"

	^ self attributeNodes
		attributeNodeAt: aName
		namespaceURI: aURI
]

{ #category : #accessing }
XMLElement >> attributeNodeAt: aName namespaceURI: aURI ifAbsent: aBlock [
	"returns the attribute node whose qualified or local name matches aName
	(unlike attributeAt:ifAbsent:, which matches the full name exactly) and
	whose namespace URI matches aURI, or the value of aBlock if there isn't any"

	^ self attributeNodes
		attributeNodeAt: aName
		namespaceURI: aURI
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLElement >> attributeNodes [
	"Returns the attribute node list. Can be modified, but adding or removing
	attributes also adds or removes them from the element. Copy before
	modifying if you don't want that."

	^ attributes ifNil: [attributes := self attributeListClass observer: self]
]

{ #category : #enumerating }
XMLElement >> attributeNodesDo: aBlock [
	self attributeNodes do: aBlock
]

{ #category : #accessing }
XMLElement >> attributes [
	"returns a new order preserving dictionary of attribute names and values"

	^ self attributeNodes attributes
]

{ #category : #namespacing }
XMLElement >> declareNamespaces: anAssociationCollection [
	self ensureUsesNamespaces.
	anAssociationCollection associationsDo: [:each |
		self
			declarePrefix: each key
			uri: each value]
]

{ #category : #namespacing }
XMLElement >> declarePrefix: aPrefix uri: aURI [
	self ensureUsesNamespaces.
	self
		allNamespaceScopesRemapPrefix: aPrefix
		from:
			(self namespaceScope
				prefixMappingAt: aPrefix
				ifAbsent: [nil])
		to: aURI.
]

{ #category : #namespacing }
XMLElement >> declaredPrefixes [
	^ self usesNamespaces "avoid lazy initializing the scope"
		ifTrue: [self namespaceScope mappedPrefixes]
		ifFalse: [#()]
]

{ #category : #testing }
XMLElement >> declaresDefaultNamespace [
	"Did the receiver declare a new default namespace rather than inheriting one?"

	^ self namespaceScope hasDefaultNamespace
		and: [self isRoot
			or: [self defaultNamespace ~= self parent defaultNamespace]]
]

{ #category : #testing }
XMLElement >> declaresPrefix: aPrefix uri: aURI [
	"Did the receiver declare a new prefix/uri pair rather than inheriting it?"

	^ (self isDeclaredPrefix: aPrefix uri: aURI)
		and: [self isRoot
			or: [(self parent isDeclaredPrefix: aPrefix uri: aURI) not]]
]

{ #category : #namespacing }
XMLElement >> defaultNamespace [
	^ self usesNamespaces "avoid lazy initializing the scope"
		ifTrue: [self namespaceScope defaultNamespace]
		ifFalse: ['']
]

{ #category : #namespacing }
XMLElement >> defaultNamespace: aURI [
	self
		declarePrefix: ''
		uri: aURI
]

{ #category : #accessing }
XMLElement >> expandedName [
	"Returns the expanded name of the element as a string in the form of
	'{namespaceURI}localName' if there's a namespace URI or 'localName' if there
	isn't"

	^ self localName expandWithXMLNamespaceURI: self namespaceURI
]

{ #category : #testing }
XMLElement >> hasAttributes [
	"returns true if this element has attribute"

	"optimized to avoid lazy initialization"
	attributes == nil
		ifTrue: [^ false].
	^ attributes size > 0.
]

{ #category : #testing }
XMLElement >> hasID: anID [
	| document doctypeDefinition attributeValidators |

	self hasAttributes
		ifFalse: [^ false].

	((document := self document) notNil
		and: [(doctypeDefinition := document doctypeDefinition) notNil
			and: [doctypeDefinition hasAttributeValidators
				and: [
					(attributeValidators :=
						doctypeDefinition attributeValidatorsAt: self name) notNil]]])
		ifTrue: [
			^ self
				hasUndeclaredOrDeclaredID: anID
				declaredWith: attributeValidators]
		ifFalse: [^ self hasUndeclaredID: anID].
]

{ #category : #testing }
XMLElement >> hasNamespaceURI [
	^ self namespaceURI notEmpty
]

{ #category : #testing }
XMLElement >> hasNamespaces [
	"returns true if the receiver declared or inherited namespace declarations"

	"optimized to avoid lazy initialization"
	namespaceScope == nil
		ifTrue: [^ false].
	^ namespaceScope hasNamespaces.
]

{ #category : #testing }
XMLElement >> hasPrefix [
	"returns true if the receiver's name is a qualified name with a prefix"

	^ self name size > self localName size
]

{ #category : #private }
XMLElement >> hasUndeclaredID: anID [
	"just look for an 'xml:id' attribute if there were no declarations"
	^ (self
		attributeAt: 'xml:id'
		ifAbsent: [^ false]) = anID
]

{ #category : #private }
XMLElement >> hasUndeclaredOrDeclaredID: anID declaredWith: anAttributeValidatorDictionary [
	self attributeNamesAndValuesDo: [:attributeName :attributeValue |
		"only check its value if it's been declared as an ID attribute
		or if it's named 'xml:id'"
		((anAttributeValidatorDictionary
			at: attributeName
			ifAbsent: [nil])
				ifNil: [attributeName = 'xml:id']
				ifNotNil: [:attributeValidator | attributeValidator isID])
			ifTrue: [
				attributeValue = anID
					ifTrue: [^ true]]].
	^ false.
]

{ #category : #testing }
XMLElement >> includesAttribute: aName [
	^ self attributeNodes includesAttribute: aName
]

{ #category : #testing }
XMLElement >> includesAttributeNode: aName [
	^ self attributeNodes includesAttributeNode: aName
]

{ #category : #testing }
XMLElement >> includesAttributeNode: aName namespaceURI: aURI [
	^ self attributeNodes
		includesAttributeNode: aName
		namespaceURI: aURI
]

{ #category : #testing }
XMLElement >> isDeclaredPrefix: aPrefix [
	"is the namespace prefix aPrefix declared for the receiver and its descendants?"

	^ self usesNamespaces
		and: [self namespaceScope includesPrefix: aPrefix]
]

{ #category : #testing }
XMLElement >> isDeclaredPrefix: aPrefix uri: aURI [
	"is the namespace prefix aPrefix mapped to aURI for the receiver and
	its descendants?"

	^ self usesNamespaces
		and: [
			self namespaceScope
				includesPrefix: aPrefix
				mappedTo: aURI]
]

{ #category : #testing }
XMLElement >> isElement [
	^ true
]

{ #category : #testing }
XMLElement >> isElementNamed: aName [
	"returns true if the receiver's qualified name or local name matches aName"

	^ self isNamed: aName
]

{ #category : #testing }
XMLElement >> isElementNamedAny: aNameCollection [
	"returns true if the receiver's qualified name or local name matches any
	name in aNameCollection"

	^ self isNamedAny: aNameCollection
]

{ #category : #testing }
XMLElement >> isInLanguage: aLanguageTag [
	"Returns true if the receiver or one of its ancestors has an xml:lang
	attribute, and if the value is an IETF language tag, like 'En-US', that matches
	aLanguageTag. Matching is case-insensitive, and aLanguageTag can be partial,
	like 'En', and use wildcards, like 'En-*'"

	^ (self
		attributeNodeAt: 'xml:lang'
		ifAbsent: [
			^ self hasParent
				and: [self parent isInLanguage: aLanguageTag]])
			matchesLanguage: aLanguageTag
]

{ #category : #testing }
XMLElement >> isNamed: aName [
	"Does the receiver's qualified or local name match aName?"

	^ self name isXMLQualifiedOrLocalName: aName
]

{ #category : #testing }
XMLElement >> isNamedAny: aNameCollection [
	"Does the receiver's qualified or local name match any of the names
	in aNameCollection?"

	^ aNameCollection includesXMLName: self name
]

{ #category : #testing }
XMLElement >> isRoot [
	"Is the receiver the root element of a DOM tree?"

	^ (self hasParent and: [self parent isElement]) not
]

{ #category : #accessing }
XMLElement >> localName [
	"Returns the local name of the receiver, the name minus any leading
	prefix and colon like 'local' in 'prefix:local'"

	^ localName ifNil: [localName := self name xmlLocalNameAfterPrefix]
]

{ #category : #accessing }
XMLElement >> name [
	"returns the full name of the element, either a qualified name if it has a
	prefix or just a local name if it doesn't"

	^ name ifNil: [name := '']
]

{ #category : #accessing }
XMLElement >> name: aName [
	"Renames the element. If aName is a qualified name and namespace checking is
	enabled (default), then the prefix must already have been declared. This can
	be done while renaming using name:namespaceURI."

	self renameWith: [
		name := aName.
		localName := aName xmlLocalNameAfterPrefix]
]

{ #category : #accessing }
XMLElement >> name: aName namespaceURI: aURI [
	"Renames the element and also declares a namespace URI in one step. If aName
	is qualified, then it declares the prefix to be mapped to aURI. If aName has
	no prefix, then aURI is declared as the default namespace URI."

	self
		declarePrefix: (aName xmlPrefixBeforeLocalName) uri: aURI;
		name: aName
]

{ #category : #private }
XMLElement >> namespaceScope [
	^ namespaceScope ifNil: [namespaceScope := XMLNamespaceScope new]
]

{ #category : #accessing }
XMLElement >> namespaceURI [
	^ self resolvePrefix: self prefix
]

{ #category : #private }
XMLElement >> newNamespaceScopeForAddedElement [
	^ self usesNamespaces
		ifTrue: [self namespaceScope copy]
		ifFalse: [nil]
]

{ #category : #accessing }
XMLElement >> nextElement [
	"returns the first element after the receiver that is a child of the same
	parent if there is one, nil otherwise"

	^ self parent ifNotNil: [:node | node elementAfter: self]
]

{ #category : #copying }
XMLElement >> postCopy [
	super postCopy.

	namespaceScope
		ifNotNil: [namespaceScope := namespaceScope copy].
	attributes
		ifNotNil: [| copiedAttributes |
			copiedAttributes := attributes copyEmpty observer: self.
			attributes do: [:each | copiedAttributes addLast: each copy].
			attributes := copiedAttributes].
]

{ #category : #accessing }
XMLElement >> prefix [
	"Returns the prefix of the receiver's name or an empty string if there
	isn't one."

	"this is recomputed from the qualified and local name instead of being
	stored in an inst var to save memory."
	^ self name xmlPrefixBeforeLocalName: self localName
]

{ #category : #accessing }
XMLElement >> prefix: aPrefix [
	"Changes the prefix of the name of the receiver to aPrefix. If namespace
	checking is enabled (default) and aPrefix is non-empty, then aPrefix must
	have been declared."

	self renameWith: [name := self localName qualifyWithXMLPrefix:  aPrefix]
]

{ #category : #accessing }
XMLElement >> previousElement [
	"returns the first element before the receiver that is a child of the same
	parent if there is one, nil otherwise"

	^ self parent ifNotNil: [:node | node elementBefore: self]
]

{ #category : #removing }
XMLElement >> removeAttribute: aName [
	"Removes and returns the value of the attribute whose full name matches
	aName or raises an error if it's absent."

	^ (self attributeNodes removeAttribute: aName) value.
]

{ #category : #removing }
XMLElement >> removeAttribute: aName ifAbsent: aBlock [
	"Removes and returns the value of the attribute whose full name matches
	aName or returns the value of aBlock if it's absent."

	^ self attributeNodes
		removeAttribute: aName
		ifAbsent: aBlock
]

{ #category : #removing }
XMLElement >> removeAttributeNode: aNode [
	"Removes and returns the attribute node aNode or raises an error if
	it's absent."

	^ self attributeNodes remove: aNode
]

{ #category : #removing }
XMLElement >> removeAttributeNode: aNode ifAbsent: aBlock [
	"Removes and returns the attribute node aNode or returns the value
	of aBlock if it's absent."

	^ self attributeNodes
		remove: aNode
		ifAbsent: aBlock
]

{ #category : #removing }
XMLElement >> removeAttributes [
	self attributeNodes removeAll
]

{ #category : #notifying }
XMLElement >> removedAttribute: anAttribute [
	anAttribute element: nil
]

{ #category : #private }
XMLElement >> renameWith: aBlock [
	| oldName |

	oldName := self name.
	aBlock value.
	self name = oldName
		ifFalse: [
			self validateNamespacePrefix.
			self hasParent
				ifTrue: [
					self parent
						renamedElement: self
						from: oldName
						to: self name]].
]

{ #category : #notifying }
XMLElement >> renamedAttribute: anAttribute from: anOldName to: aNewName [
	self attributeNodes	
		renamedAttribute: anAttribute
		from: anOldName
		to: aNewName.
	self validateNamespacePrefixOfAttribute: anAttribute.
]

{ #category : #namespacing }
XMLElement >> resolvePrefix: aPrefix [
	"Resolves the namespace URI of aPrefix (the defualt namespace URI if aPrefix
	is empty), including the predefined 'xml' and 'xmlns' prefixes. Returns an
	empty string if aPrefix is unresolvable."

	^ self
		resolvePrefix: aPrefix
		ifUnresolvable: ''
]

{ #category : #namespacing }
XMLElement >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	"Resolves the namespace URI of aPrefix (the defualt namespace URI if aPrefix
	is empty), including the predefined 'xml' and 'xmlns' prefixes. Returns the
	value of aBlock if aPrefix is unresolvable."

	^ self hasNamespaces "avoid lazy initializing the scope"
		ifTrue: [
			self namespaceScope
				resolvePrefix: aPrefix
				ifUnresolvable: aBlock]
		ifFalse: [aBlock value]
]

{ #category : #namespacing }
XMLElement >> resolvePrefixesOfNamespaceURI: aURI [
	"returns a set of all the namespace prefixes of aURI"
	^ self usesNamespaces
		ifTrue: [self namespaceScope resolvePrefixesOfNamespaceURI: aURI]
		ifFalse: [Set new]
]

{ #category : #initialization }
XMLElement >> setAttributes: anAssociationCollection [
	self attributeNodes setAttributes: anAssociationCollection
]

{ #category : #private }
XMLElement >> setConfiguration: aConfiguration name: aName localName: aLocalName attributes: anAttributeDictionary namespaceScope: aNamespaceScope [
	"This should only be sent by DOM parsers/builders, not public API users"

	configuration := aConfiguration.
	name := aName.
	localName := aLocalName.
	anAttributeDictionary size > 0 "optimization"
		ifTrue: [
			"This consumes anAttributeDictionary, so it can never be used
			again safely"
			(attributes :=
				self attributeListClass new: anAttributeDictionary size)
				observer: self;
				setAttributesFromOrderPreservingDictionary: 
					anAttributeDictionary].
	namespaceScope := aNamespaceScope.
]

{ #category : #private }
XMLElement >> setNamespaceScope: aNamespaceScope [
	namespaceScope := aNamespaceScope
]

{ #category : #accessing }
XMLElement >> sortKey [
	^ self name
]

{ #category : #namespacing }
XMLElement >> undeclareDefaultNamespace [
	self undeclarePrefix: ''
]

{ #category : #namespacing }
XMLElement >> undeclarePrefix: aPrefix [
	self ensureUsesNamespaces.
	self
		allNamespaceScopesUnmapPrefix: aPrefix
		mappedTo:
			(self namespaceScope
				prefixMappingAt: aPrefix
				ifAbsent: [^ self]).
]

{ #category : #namespacing }
XMLElement >> undeclarePrefixes [
	self ensureUsesNamespaces.
	self declaredPrefixes do: [:each |
		self undeclarePrefix: each].
]

{ #category : #private }
XMLElement >> validateNamespacePrefix [
	(self usesNamespaces
		and: [self hasPrefix])
		ifTrue: [
			self namespaceScope
				validateAndResolvePrefix: self prefix
				ofElement: self name]
]

{ #category : #private }
XMLElement >> validateNamespacePrefixOfAttribute: anAttribute [
	| attributePrefix attributeLocalName attributeNamespaceURI |

	self usesNamespaces
		ifFalse: [^ self].

	attributePrefix := anAttribute prefix.
	"send #validateAndResolvePrefix:ofAttribute: even if attributePrefix is
	empty, to catch names like ':name', and return if the resolved URI is empty,
	since non-default namespace URIs can't be empty, and attribute namespaces
	are always non-default"
	(attributeNamespaceURI :=
		self namespaceScope
			validateAndResolvePrefix: attributePrefix
			ofAttribute: anAttribute name) size > 0
		ifFalse: [^ self].
	attributeLocalName :=
		anAttribute name xmlLocalNameAfterPrefix: attributePrefix.
	self attributeNodesDo: [:each | | eachLocalName |
		(each ~= anAttribute
			and: [(eachLocalName := each localName) = attributeLocalName])
			ifTrue: [
				(self namespaceScope resolvePrefix:
					(each name xmlPrefixBeforeLocalName: eachLocalName)) =
						attributeNamespaceURI
					ifTrue: [
						self namespaceScope
							errorAttribute: each
							aliasesURI: attributeNamespaceURI]]].
]

{ #category : #private }
XMLElement >> validateNamespacePrefixesOfAttributes [
	(self usesNamespaces
		and: [self hasAttributes])
		ifTrue: [
			self namespaceScope validatePrefixesOfAttributes:
				self attributeNames]
]

{ #category : #printing }
XMLElement >> writeXMLOn: aWriter [
	| tagWriter |

	tagWriter := aWriter tag: self name.
	self hasNamespaces
		ifTrue: [
			"non-standard setXMLNSDeclarations: use for performance"
			tagWriter setXMLNSDeclarations: self namespaceScope prefixMappings].
	self hasAttributes
		ifTrue: [
			"non-standard setAttributes: use for performance"
			tagWriter setAttributes: self attributeNodes].
	self hasChildren
		ifTrue: [tagWriter with: [self writeInnerXMLOn: aWriter]]
		ifFalse: [tagWriter write].
]
