"
SAXParserDriver together with SAXHandler provides a SAX-like API for XML parsing. The driver processes XML tokens and signals SAX events to a SAXHandler. See SAXHandler for more info.
"
Class {
	#name : #SAXParserDriver,
	#superclass : #DTDSubsetParserDriver,
	#instVars : [
		'saxHandler',
		'elementNester',
		'scopeAllocator',
		'validator',
		'externalSubsetSystemID',
		'externalSubsetPublicID',
		'isValidating',
		'usesNamespaces',
		'isStandalone',
		'hasParameterEntityReferences',
		'hasSkippedParameterEntityReferences',
		'hasUnhandledReservedAttributes',
		'externalEntityResolver'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #'instance creation' }
SAXParserDriver class >> saxHandler: aSAXHandler [
	^ self new setSAXHandler: aSAXHandler
]

{ #category : #accessing }
SAXParserDriver >> baseURI [
	"returns a string with the current base URI at this stage of parsing"
	self elementNester hasScopedAttributes
		ifTrue: [
			^ self elementNester
				scopedAttributeAt: 'xml:base'
				ifAbsent: [super baseURI]]
		ifFalse: [^ super baseURI]
]

{ #category : #private }
SAXParserDriver >> checkForReservedAttributesIn: anOrderPreservingDictionary afterIndex: anIndex [
	"validation may add attributes, so this is used to check if reserved
	attributes were added that need handling when there weren't any before"

	self hasUnhandledReservedAttributes
		ifTrue: [^ self].
	anIndex + 1
		to: anOrderPreservingDictionary size
		do: [:i |
			(anOrderPreservingDictionary keyAtIndex: i) isXMLReservedAttributeName
				ifTrue: [^ self haveUnhandledReservedAttributes]].
]

{ #category : #accessing }
SAXParserDriver >> currentElement [
	^ self elementNester currentElement
]

{ #category : #accessing }
SAXParserDriver >> currentElement: anElement [
	self elementNester currentElement: anElement
]

{ #category : #accessing }
SAXParserDriver >> currentScope [
	^ self scopeAllocator currentScope
]

{ #category : #accessing }
SAXParserDriver >> currentScope: aNamespaceScope [
	self scopeAllocator currentScope: aNamespaceScope
]

{ #category : #private }
SAXParserDriver >> declareNamespaces: aSequenceableCollection inScope: aScope [
	1 to: aSequenceableCollection size do: [:i | | association |
		association := aSequenceableCollection at: i.
		(aScope resolvePrefix: association key) = association value
			ifFalse: [
				self saxHandler
					startPrefixMapping: association key
					uri: association value]].
	aScope mapPrefixesAndURIs: aSequenceableCollection.
]

{ #category : #testing }
SAXParserDriver >> decodesCharacters [
	^ self saxHandler decodesCharacters
]

{ #category : #defaults }
SAXParserDriver >> doctypeDefinitionClass [
	^ DTDDoctypeDefinition
]

{ #category : #accessing }
SAXParserDriver >> documentReadLimit [
	^ self saxHandler documentReadLimit
]

{ #category : #accessing }
SAXParserDriver >> documentURI [
	^ self saxHandler documentURI
]

{ #category : #accessing }
SAXParserDriver >> elementNester [
	^ elementNester
]

{ #category : #private }
SAXParserDriver >> errorDocumentConstraintsRequired [
	XMLValidationException signal: 'Document validation constraints required'
]

{ #category : #accessing }
SAXParserDriver >> externalEntityResolver [
	^ externalEntityResolver
		ifNil: [
			externalEntityResolver :=
				self saxHandler externalEntityResolver
					asLimitingExternalEntityResolver]
]

{ #category : #private }
SAXParserDriver >> externalSubsetParserOn: aStringOrStream documentURI: aURIString [
	^ self saxHandler parserClass
		driver:
			(DTDExternalSubsetParserDriver
				saxDriver: self
				documentURI: aURIString)
		on: aStringOrStream
]

{ #category : #accessing }
SAXParserDriver >> externalSubsetPublicID [
	^ externalSubsetPublicID
]

{ #category : #accessing }
SAXParserDriver >> externalSubsetSystemID [
	^ externalSubsetSystemID
]

{ #category : #private }
SAXParserDriver >> extractNamespacesFromAttributes: anOrderPreservingDictionary [
	"returns an ordered collection of namespace prefix/uri associations
	removed from the attribute dictionary or nil if there aren't any"
	| namespaces keysToRemove |

	self haveNoUnhandledReservedAttributes.
	anOrderPreservingDictionary keysDo: [:name |
		"optimized comparison ordering"
		(name at: 1) == $x
			ifTrue: [
				name isXMLNSAttributeName
					ifTrue: [
						"only initialize when needed"
						(namespaces ifNil: [namespaces := OrderedCollection new: 5])
							addLast:
								(name size > 6 "'xmlns:' size"
									ifTrue: [name copyFrom: 7 to: name size]
									ifFalse: ['']) ->
										(anOrderPreservingDictionary at: name).
						"only initialize when needed"
						(keysToRemove ifNil: [keysToRemove := OrderedCollection new: 5])
							addLast: name]
					ifFalse: [
						name isXMLReservedAttributeName
							ifTrue: [
								"at least one xml attr is not an xmlns attr, so there
								will still be reserved attrs to handle after extracting
								the namespaces"
								self haveUnhandledReservedAttributes]]]].

	keysToRemove
		ifNotNil: [
			"use removeKeys: for speed"
			anOrderPreservingDictionary removeKeys: keysToRemove].

	^ namespaces.
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleAttributeDeclaration: anElement name: anAttribute type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	super
		handleAttributeDeclaration: anElement
		name: anAttribute
		type: aType
		defaultPragma: aDefaultPragma
		defaultValue: aDefaultValue.

	self saxHandler
		attributeDeclaration: anElement
		name: anAttribute
		type: aType
		defaultPragma: aDefaultPragma
		defaultValue: aDefaultValue.
]

{ #category : #handling }
SAXParserDriver >> handleCData: aString [
	self isValidating
		ifTrue: [self validator validatePCData: aString].

	self saxHandler
		isInCDataSection: true;
		startCData;
		characters: aString;
		endCData;
		isInCDataSection: false.
]

{ #category : #handling }
SAXParserDriver >> handleComment: aString [
	(self elementNester isInElement
		and: [self isValidating])
		ifTrue: [self validator validateComment: aString].

	self saxHandler comment: aString.
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleElementDeclaration: aName contentModel: aContentModel [
	super
		handleElementDeclaration: aName
		contentModel: aContentModel.

	self saxHandler
		elementDeclaration: aName
		contentModel: aContentModel.
]

{ #category : #handling }
SAXParserDriver >> handleEndContentEntityReplacement: aName [
	self saxHandler endEntity: aName
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleEndDTD [
	(self resolvesExternalEntities
		and: [self hasExternalSubset
			and: [self isValidating
				or: [self isStandalone not]]])
		ifTrue: [self parseExternalSubset].
	self isValidating
		ifTrue: [self doctypeDefinition validateCompletedDefinition].

	self saxHandler
		doctypeDefinition: self doctypeDefinition;
		endDTD.
]

{ #category : #handling }
SAXParserDriver >> handleEndDocument [
	self isValidating
		ifTrue: [self validator validateEndDocument].

	self saxHandler endDocument.
]

{ #category : #handling }
SAXParserDriver >> handleEndTag: anElement [
	"performance critical method"
	| prefix currentScope |

	prefix := anElement xmlPrefixBeforeLocalName.
	self saxHandler 
		endElement: anElement
		prefix: prefix
		uri:
			(self usesNamespaces
				ifTrue: [
					(currentScope := self scopeAllocator exitScope)
						resolvePrefix: prefix]
				ifFalse: [''])
		localName: (anElement xmlLocalNameAfterPrefix: prefix).

	self usesNamespaces
		ifTrue: [
			currentScope hasNamespaces
				ifTrue: [self undeclareNamespacesInScope: currentScope]].
	self isValidating
		ifTrue: [self validator validateEndTag: anElement].
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleGeneralEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotation [
	super
		handleGeneralEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID
		ndata: aNotation.

	self saxHandler
		generalEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID
		ndata: aNotation.
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleGeneralEntityDeclaration: aName replacement: aReplacement [
	super
		handleGeneralEntityDeclaration: aName
		replacement: aReplacement.

	self saxHandler
		generalEntityDeclaration: aName
		replacement: aReplacement.
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleNotationDeclaration: aName publicID: aPublicID systemID: aSystemID [
	super
		handleNotationDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID.

	self saxHandler
		notationDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID.
]

{ #category : #handling }
SAXParserDriver >> handlePCData: aString [
	self isValidating
		ifTrue: [self validator validatePCData: aString].

	self saxHandler characters: aString.
]

{ #category : #handling }
SAXParserDriver >> handlePI: aTargetString data: aDataString [
	(self elementNester isInElement
		and: [self isValidating])
		ifTrue: [
			self validator
				validatePI: aTargetString
				data: aDataString].

	self saxHandler 
		processingInstruction: aTargetString
		data: aDataString.
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleParameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
	super
		handleParameterEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID.

	self saxHandler
		parameterEntityDeclaration: aName
		publicID: aPublicID
		systemID: aSystemID.
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleParameterEntityDeclaration: aName replacement: aReplacement [
	super
		handleParameterEntityDeclaration: aName
		replacement: aReplacement.

	self saxHandler
		parameterEntityDeclaration: aName
		replacement: aReplacement.
]

{ #category : #private }
SAXParserDriver >> handleReservedAttributes: aDictionary [
	aDictionary
		at: 'xml:base'
		ifPresent: [:uri |
			"expand the new base URI using the current"
			aDictionary
				at: 'xml:base'
				put: (self baseURI asXMLURI / uri) asString].
	self isValidating
		ifTrue: [self validator validateXMLIDAttributeIn: aDictionary].

	self elementNester
		setScopedAttributesNamed: self scopedAttributeNames
		from: aDictionary.

	self haveNoUnhandledReservedAttributes.
]

{ #category : #handling }
SAXParserDriver >> handleStartContent [
	self saxHandler startContent
]

{ #category : #handling }
SAXParserDriver >> handleStartContentEntityReplacement: aName [
	self saxHandler startEntity: aName
]

{ #category : #'handling - dtd' }
SAXParserDriver >> handleStartDTD: aRoot publicID: aPublicID systemID: aSystemID [
	externalSubsetPublicID := aPublicID.
	externalSubsetSystemID := aSystemID.

	self doctypeDefinition root: aRoot.
	self saxHandler
		startDTD: aRoot
		publicID: aPublicID
		systemID: aSystemID.
]

{ #category : #handling }
SAXParserDriver >> handleStartDocument [
	self saxHandler startDocument
]

{ #category : #handling }
SAXParserDriver >> handleStartTag: anElement attributes: anAttributeDictionary [
	"performance critical method"
	| prefix totalAttributes namespaceURI currentScope |

	prefix := anElement xmlPrefixBeforeLocalName.
	totalAttributes := anAttributeDictionary size.
	self isValidating
		ifTrue: [
			self elementNester totalOpenElements > 1
				ifFalse: [self validateRootElement: anElement].
			self validator
				validateStartTag: anElement
				attributes: anAttributeDictionary]
		ifFalse: [
			self doctypeDefinition
				processStartTag: anElement
				attributes: anAttributeDictionary].
	"validation and processing can add attributes"
	anAttributeDictionary size > totalAttributes
		ifTrue: [
			self
				checkForReservedAttributesIn: anAttributeDictionary
				afterIndex: totalAttributes.
			totalAttributes := anAttributeDictionary size].
	self usesNamespaces
		ifTrue: [
			anAttributeDictionary setNamespaceScope:
				(currentScope := self scopeAllocator enterScope).
			self hasUnhandledReservedAttributes
				ifTrue: [
					(self extractNamespacesFromAttributes: anAttributeDictionary)
						ifNotNil: [:namespaces |
							self
								declareNamespaces: namespaces
								inScope: currentScope.
							totalAttributes := anAttributeDictionary size]].
			self saxHandler startScope: currentScope.
			namespaceURI :=
				currentScope
					validateAndResolvePrefix: prefix
					ofElement: anElement.
			totalAttributes > 0
				ifTrue: [
					"anAttributeDictionary is an XMLAttributeDictionary, which
					is an OrderPreservingStringDictionary, so use its internal
					#orderedKeys over #keys for speed"
					currentScope
						validatePrefixesOfAttributes: anAttributeDictionary orderedKeys
						from: 1
						to: totalAttributes]].
	self hasUnhandledReservedAttributes
		ifTrue: [self handleReservedAttributes: anAttributeDictionary].

	self saxHandler
		startElement: anElement
		prefix: prefix
		uri: (namespaceURI ifNil: [''])
		localName: (anElement xmlLocalNameAfterPrefix: prefix)
		attributes: anAttributeDictionary.
]

{ #category : #handling }
SAXParserDriver >> handleUnreplacedGeneralEntityReference: aName [
	self saxHandler skippedEntity: aName
]

{ #category : #handling }
SAXParserDriver >> handleWhitespace: aString [
	self isValidating
		ifTrue: [
			self validator isCurrentElementWhitespaceIgnorable
				ifTrue: [
					(self elementNester hasScopedAttributes
						and: [
							(self elementNester scopedAttributeAt: 'xml:space') =
								'preserve'])
						ifTrue: [self saxHandler characters: aString]
						ifFalse: [self saxHandler ignorableWhitespace: aString].
					^ self]
				ifFalse: [
					"only validate if it's not ignorable"
					self validator validatePCData: aString]].
	self saxHandler characters: aString.
]

{ #category : #handling }
SAXParserDriver >> handleXMLVersion: aVersion encoding: anEncoding standalone: aYesOrNo [
	isStandalone := aYesOrNo = 'yes'.

	self saxHandler
		xmlVersion: (self versionFloatFromString: aVersion)
		encoding: anEncoding
		standalone: isStandalone.
]

{ #category : #testing }
SAXParserDriver >> hasExternalSubset [
	^ self externalSubsetPublicID notEmpty
		or: [self externalSubsetSystemID notEmpty]
]

{ #category : #testing }
SAXParserDriver >> hasParameterEntityReferences [
	^ hasParameterEntityReferences
]

{ #category : #testing }
SAXParserDriver >> hasSkippedParameterEntityReferences [
	^ hasSkippedParameterEntityReferences
]

{ #category : #testing }
SAXParserDriver >> hasUnhandledReservedAttributes [
	^ hasUnhandledReservedAttributes
]

{ #category : #accessing }
SAXParserDriver >> haveNoUnhandledReservedAttributes [
	hasUnhandledReservedAttributes := false
]

{ #category : #accessing }
SAXParserDriver >> haveParameterEntityReferences [
	hasParameterEntityReferences := true
]

{ #category : #accessing }
SAXParserDriver >> haveSkippedParameterEntityReferences [
	hasSkippedParameterEntityReferences := true
]

{ #category : #accessing }
SAXParserDriver >> haveUnhandledReservedAttributes [
	hasUnhandledReservedAttributes := true
]

{ #category : #testing }
SAXParserDriver >> isExternal [
	"Definition: An external markup declaration is defined as a markup
	declaration occurring in the external subset or in a parameter entity
	(external or internal, the latter being included because non-validating
	processors are not required to read them)"

	"returning #isParameter instead of 'self currentEntity notNil'
	ensures the correct result when parsing content"
	^ self currentEntity
		ifNil: [false]
		ifNotNil: [:entity | entity isParameter]
]

{ #category : #testing }
SAXParserDriver >> isStandalone [
	^ isStandalone
]

{ #category : #accessing }
SAXParserDriver >> isStandalone: aBoolean [
	isStandalone := aBoolean
]

{ #category : #testing }
SAXParserDriver >> isValidating [
	^ isValidating
]

{ #category : #accessing }
SAXParserDriver >> maxEntityReplacementDepth [
	^ self saxHandler maxEntityReplacementDepth
]

{ #category : #'instance creation' }
SAXParserDriver >> newAttributeDictionary [
	^ (self usesNamespaces
		ifTrue: [XMLNamespacedAttributeDictionary]
		ifFalse: [XMLAttributeDictionary]) new
]

{ #category : #'instance creation' }
SAXParserDriver >> newEmptyAttributeDictionary [
	^ (self usesNamespaces
		ifTrue: [XMLLazyNamespacedAttributeDictionary]
		ifFalse: [XMLLazyAttributeDictionary]) new
]

{ #category : #private }
SAXParserDriver >> parseExternalSubset [
	| externalSubsetURI |

	externalSubsetURI :=
		self externalEntityResolver
			externalEntityURIFromPublicID: self externalSubsetPublicID
			systemID: self externalSubsetSystemID
			baseURI: self baseURI.

	"External subsets are stream-resolved so if they are local (stored on disk),
	they aren't kept entirely in memory during parsing. HTTP entities will be
	kept in memory regardless and this will just return a read stream on them."
	(self
		externalSubsetParserOn:
			(self externalEntityResolver streamResolveExternalEntityURI:
				externalSubsetURI)
		documentURI: externalSubsetURI asString)
		parseDocument.
]

{ #category : #testing }
SAXParserDriver >> preservesUndeclaredEntityReferences [
	^ self saxHandler preservesUndeclaredEntityReferences
]

{ #category : #accessing }
SAXParserDriver >> readLimit [
	^ self documentReadLimit
]

{ #category : #testing }
SAXParserDriver >> replacesContentEntityReferences [
	^ self saxHandler replacesContentEntityReferences
]

{ #category : #testing }
SAXParserDriver >> resolvesExternalEntities [
	^ self saxHandler resolvesExternalEntities
]

{ #category : #accessing }
SAXParserDriver >> saxHandler [
	^ saxHandler
]

{ #category : #accessing }
SAXParserDriver >> scopeAllocator [
	^ scopeAllocator ifNil: [scopeAllocator := XMLNamespaceScopeAllocator new]
]

{ #category : #private }
SAXParserDriver >> scopedAttributeNames [
	"the scoped attributes tracked by this driver"
	^ #('xml:space' 'xml:base')
]

{ #category : #initialization }
SAXParserDriver >> setSAXHandler: aSAXHandler [
	saxHandler := aSAXHandler.
	doctypeDefinition := self doctypeDefinitionClass new.
	validator := (aSAXHandler schema ifNil: [doctypeDefinition]) newValidator.
	elementNester := self newElementNester.
	externalSubsetPublicID := ''.
	externalSubsetSystemID := ''.
	"these are copied to inst vars for faster access"
	isValidating := aSAXHandler isValidating.
	usesNamespaces := aSAXHandler usesNamespaces.
	isStandalone := false.
	hasParameterEntityReferences := false.
	hasSkippedParameterEntityReferences := false.
	hasUnhandledReservedAttributes := false.
]

{ #category : #private }
SAXParserDriver >> undeclareNamespacesInScope: anExitedScope [
	| currentScope |

	currentScope := self scopeAllocator currentScope.
	anExitedScope prefixesAndURIsDo: [:prefix :uri |
		(currentScope resolvePrefix: prefix) = uri
			ifFalse: [self saxHandler endPrefixMapping: prefix]].
]

{ #category : #testing }
SAXParserDriver >> usesNamespaces [
	^ usesNamespaces
]

{ #category : #private }
SAXParserDriver >> validateRootElement: anElement [
	self saxHandler requiresSchema
		ifTrue: [
			(self validator hasElementValidators
				or: [self validator hasAttributeValidators])
				ifFalse: [self errorDocumentConstraintsRequired]].

	self validator validateRootElement: anElement.
]

{ #category : #accessing }
SAXParserDriver >> validator [
	^ validator
]

{ #category : #private }
SAXParserDriver >> versionFloatFromString: aString [
	aString size = 3
		ifTrue: [
			aString = '1.0'
				ifTrue: [^ 1.0].
			aString = '1.1'
				ifTrue: [^ 1.1]].
	^ Float readFrom: aString readStream.
]
