"
An abstract class for handling internal and external DTD subset events.
"
Class {
	#name : #DTDSubsetParserDriver,
	#superclass : #XMLParserDriver,
	#instVars : [
		'doctypeDefinition'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #accessing }
DTDSubsetParserDriver >> doctypeDefinition [
	^ doctypeDefinition
]

{ #category : #private }
DTDSubsetParserDriver >> errorImproperParameterEntityNesting [
	XMLValidationException signal:
		'Improper nesting of parameter entity replacement within DTD subset'
]

{ #category : #private }
DTDSubsetParserDriver >> errorInvalidUndeclaredGeneralEntityReference: aName [
	XMLValidationException
		formatSignal: 'Undeclared general entity reference &{1};'
		with: aName
]

{ #category : #private }
DTDSubsetParserDriver >> errorInvalidUndeclaredParameterEntityReference: aName [
	XMLValidationException
		formatSignal: 'Undeclared parameter entity reference %{1};'
		with: aName
]

{ #category : #private }
DTDSubsetParserDriver >> errorMultipleDeclarationsForElement: aName [
	XMLValidationException
		formatSignal: 'Multiple declarations for <{1}> element'
		with: aName
]

{ #category : #private }
DTDSubsetParserDriver >> errorMultipleDeclarationsForNotation: aName [
	"Unlike redundant entity declarations which are just ignored,
	redundant notation declarations are invalid"
	XMLValidationException
		formatSignal: 'Multiple declarations for notation "{1}"'
		with: aName
]

{ #category : #private }
DTDSubsetParserDriver >> errorReferenceToStandaloneExternalEntity: anEntity [
	XMLValidationException
		formatSignal:
			'Internal reference to externally defined ',
			'entity {1} in standalone="yes" document'
		with: anEntity asReference
]

{ #category : #private }
DTDSubsetParserDriver >> errorUndeclaredGeneralEntityReference: aName [
	XMLWellFormednessException
		formatSignal: 'Undeclared general entity reference &{1};'
		with: aName
]

{ #category : #accessing }
DTDSubsetParserDriver >> externalEntityResolver [
	self subclassResponsibility
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleAttributeDeclaration: anElement name: anAttribute type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	| newAttributeValidator |

	self mustSkipEntityAndAttributeDeclarations
		ifTrue: [^ self].

	newAttributeValidator :=
		self isStandaloneExternal
			ifTrue: [
				self doctypeDefinition
					addStandaloneExternalValidatorForAttributeIn: anElement
					named: anAttribute
					type: aType
					defaultPragma: aDefaultPragma
					defaultValue: aDefaultValue]
			ifFalse: [
				self doctypeDefinition
					addValidatorForAttributeIn: anElement
					named: anAttribute
					type: aType
					defaultPragma: aDefaultPragma
					defaultValue: aDefaultValue].

	(self isValidating
		and: [newAttributeValidator notNil])
		ifTrue: [newAttributeValidator validateAttributeDeclaration].
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleElementDeclaration: aName contentModel: aContentModel [
	| newElementValidator |

	newElementValidator :=
		self isStandaloneExternal
			ifTrue: [
				self doctypeDefinition
					addStandaloneExternalValidatorForElement: aName
					contentModel: aContentModel]
			ifFalse: [
				self doctypeDefinition
					addValidatorForElement: aName
					contentModel: aContentModel].

	self isValidating
		ifTrue: [
			newElementValidator
				ifNil: [self errorMultipleDeclarationsForElement: aName].
			newElementValidator validateElementDeclaration].
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleGeneralEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotation [
	self mustSkipEntityAndAttributeDeclarations
		ifTrue: [^ self].

	aNotation isEmpty
		ifTrue: [
			self resolvesExternalEntities
				ifTrue: [
					self isStandaloneExternal
						ifTrue: [
							self doctypeDefinition
								addStandaloneExternalExternalGeneralEntity: aName
								resolver: self externalEntityResolver
								publicID: aPublicID
								systemID: aSystemID
								baseURI: self baseURI]
						ifFalse: [
							self doctypeDefinition
								addExternalGeneralEntity: aName
								resolver: self externalEntityResolver
								publicID: aPublicID
								systemID: aSystemID
								baseURI: self baseURI]]
				ifFalse: [
					self isValidating
						ifTrue: [
							self doctypeDefinition
								addUnresolvableExternalGeneralEntity: aName]]]
		ifFalse: [
			self doctypeDefinition
				addUnparsedEntity: aName
				publicID: aPublicID
				systemID: aSystemID
				ndata: aNotation].
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleGeneralEntityDeclaration: aName replacement: aReplacement [
	self mustSkipEntityAndAttributeDeclarations
		ifTrue: [^ self].

	self isStandaloneExternal
		ifTrue: [
			self doctypeDefinition
				addStandaloneExternalInternalGeneralEntity: aName
				replacement: aReplacement
				baseURI: self baseURI]
		ifFalse: [
			self doctypeDefinition
				addInternalGeneralEntity: aName
				replacement: aReplacement
				baseURI: self baseURI].
]

{ #category : #handling }
DTDSubsetParserDriver >> handleGeneralEntityReference: aName [
	| entity |

	entity :=
		self doctypeDefinition
			generalEntityAt: aName
			ifAbsent: [
				"WFC: In a document without any DTD, a document with only an
				internal DTD subset which contains no parameter entity references,
				or a document with ''standalone='yes''', for an entity reference
				(general) that does not occur within the external subset or a
				parameter entity (meaning DTD 'external')"
				self isExternal
					ifFalse: [
						((self hasExternalSubset not
							and: [self hasParameterEntityReferences not])
								or: [self isStandalone])
							ifTrue: [self errorUndeclaredGeneralEntityReference: aName]].
				"all general entity refs must be declared when validating"
				self isValidating
					ifTrue: [self errorInvalidUndeclaredGeneralEntityReference: aName].
				^ nil].

	"'VC: Standalone Document Declaration
		The standalone document declaration MUST have the value 'no' if any
		external markup declarations contain declarations of:
			...
		entities ... if references to those entities appear in the document'
	LibXML2 doesn't flag these at all, and Xerces only does for references
	in the content, but the specification says in the 'document', so we
	consider all non-external references, even inside the DTD internal subset"
	(entity isStandaloneExternal
		and: [self isValidating
			and: [self isExternal not]])
		ifTrue: [self errorReferenceToStandaloneExternalEntity: entity].

	^ entity.
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleImproperParameterEntityNesting [
	"this is a validity constraint and is only checked when validating"
	self isValidating
		ifTrue: [self errorImproperParameterEntityNesting]
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleNotationDeclaration: aName publicID: aPublicID systemID: aSystemID [
	(self doctypeDefinition
		addNotation: aName
		publicID: aPublicID
		systemID: aSystemID)
		ifNil: [
			self isValidating
				ifTrue: [self errorMultipleDeclarationsForNotation: aName]]
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleParameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self mustSkipEntityAndAttributeDeclarations
		ifFalse: [
			self resolvesExternalEntities
				ifTrue: [
					self doctypeDefinition
						addExternalParameterEntity: aName
						resolver: self externalEntityResolver
						publicID: aPublicID
						systemID: aSystemID
						baseURI: self baseURI]
				ifFalse: [
					self isValidating
						ifTrue: [
							self doctypeDefinition
								addUnresolvableExternalParameterEntity: aName]]]
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleParameterEntityDeclaration: aName replacement: aReplacement [
	self mustSkipEntityAndAttributeDeclarations
		ifFalse: [
			self doctypeDefinition
				addInternalParameterEntity: aName
				replacement:aReplacement
				baseURI: self baseURI]
]

{ #category : #'handling - dtd' }
DTDSubsetParserDriver >> handleParameterEntityReference: aName [
	self haveParameterEntityReferences.
	^ self doctypeDefinition
		parameterEntityAt: aName
		ifAbsent: [
			self isValidating
				ifTrue: [self errorInvalidUndeclaredParameterEntityReference: aName].
			self haveSkippedParameterEntityReferences.
			nil]
]

{ #category : #handling }
DTDSubsetParserDriver >> handleParseError: aString [
	XMLWellFormednessException signal: aString
]

{ #category : #testing }
DTDSubsetParserDriver >> hasExternalSubset [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> hasParameterEntityReferences [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> hasSkippedParameterEntityReferences [
	self subclassResponsibility
]

{ #category : #accessing }
DTDSubsetParserDriver >> haveParameterEntityReferences [
	self subclassResponsibility
]

{ #category : #accessing }
DTDSubsetParserDriver >> haveSkippedParameterEntityReferences [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> isExternal [
	"Definition: An external markup declaration is defined as a markup
	declaration occurring in the external subset or in a parameter entity
	(external or internal, the latter being included because non-validating
	processors are not required to read them)"

	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> isStandalone [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> isStandaloneExternal [
	^ self isStandalone
		and: [self isExternal]
]

{ #category : #testing }
DTDSubsetParserDriver >> isValidating [
	self subclassResponsibility
]

{ #category : #accessing }
DTDSubsetParserDriver >> maxEntityReplacementDepth [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> mustSkipEntityAndAttributeDeclarations [
	"'Except when standalone=''yes'', they (non-validating parsers) MUST NOT
	process entity declarations or attribute-list declarations encountered
	after a reference to a parameter entity that is not read...'"
	^ self isValidating not
		and: [self isStandalone not
			and: [self hasSkippedParameterEntityReferences]]
]

{ #category : #testing }
DTDSubsetParserDriver >> preservesUndeclaredEntityReferences [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> replacesContentEntityReferences [
	self subclassResponsibility
]

{ #category : #testing }
DTDSubsetParserDriver >> resolvesExternalEntities [
	self subclassResponsibility
]
