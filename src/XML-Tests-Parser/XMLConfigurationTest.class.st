Class {
	#name : #XMLConfigurationTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser'
}

{ #category : #testing }
XMLConfigurationTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLConfigurationTest >> configurationClass [
	^ XMLConfiguration
]

{ #category : #accessing }
XMLConfigurationTest >> externalEntityResolverClass [
	^ DTDCachingExternalEntityResolver
]

{ #category : #'instance creation' }
XMLConfigurationTest >> newConfiguration [
	^ self configurationClass new
]

{ #category : #accessing }
XMLConfigurationTest >> otherParserHandlerClass [
	^ SAX2Parser
]

{ #category : #accessing }
XMLConfigurationTest >> parserHandlerClass [
	^ SAXHandler
]

{ #category : #tests }
XMLConfigurationTest >> testCopy [
	| configuration externalEntityResolver copy |

	externalEntityResolver := self externalEntityResolverClass new.
	(configuration := self newConfiguration)
		isValidating: false;
		usesNamespaces: false;
		decodesCharacters: false;
		parserHandlerClass: self otherParserHandlerClass;
		documentReadLimit: XMLParserLimits defaultDocumentReadLimit - 1;
		maxEntityReplacementDepth: XMLParserLimits defaultMaxEntityReplacementDepth - 1;
		preservesUndeclaredEntityReferences: true;
		replacesContentEntityReferences: false;
		resolvesExternalEntities: true;
		externalEntityResolver: externalEntityResolver.
	copy := configuration copy.
	self
		deny: copy == configuration;
		assert: copy isValidating = configuration isValidating;
		assert: copy usesNamespaces = configuration usesNamespaces;
		assert: copy decodesCharacters = configuration decodesCharacters;
		assert: copy requiresSchema = configuration requiresSchema;
		assert: copy parserHandlerClass == configuration parserHandlerClass.

	self
		deny: copy parserLimits == configuration parserLimits;
		assert: copy documentReadLimit = configuration documentReadLimit;
		assert: copy maxEntityReplacementDepth = configuration maxEntityReplacementDepth.

	self
		deny: copy entityConfiguration == configuration entityConfiguration;
		assert: copy preservesUndeclaredEntityReferences = configuration preservesUndeclaredEntityReferences;
		assert: copy replacesContentEntityReferences = configuration replacesContentEntityReferences;
		assert: copy resolvesExternalEntities = configuration resolvesExternalEntities;
		deny: copy externalEntityResolver == configuration externalEntityResolver;
		assert: copy externalEntityResolver class == configuration externalEntityResolver class.
]

{ #category : #tests }
XMLConfigurationTest >> testDecodesCharacters [
	| configuration |

	configuration := self newConfiguration.
	self
		assert: configuration decodesCharacters;
		assert: (configuration decodesCharacters: false) == configuration;
		deny: configuration decodesCharacters;
		assert: (configuration decodesCharacters: true) == configuration;
		assert: configuration decodesCharacters.
]

{ #category : #tests }
XMLConfigurationTest >> testDocumentReadLimit [
	| configuration |

	configuration := self newConfiguration.
	self
		assert: configuration documentReadLimit = XMLParserLimits defaultDocumentReadLimit;
		assert: (configuration documentReadLimit: 100000) == configuration;
		assert: configuration documentReadLimit = 100000;
		assert: (configuration documentReadLimit: nil) == configuration;
		assert: configuration documentReadLimit isNil.
]

{ #category : #tests }
XMLConfigurationTest >> testEntityConfiguration [
	| configuration newEntityConfiguration |

	configuration := self newConfiguration.
	self assert: configuration entityConfiguration class == DTDEntityConfiguration.

	newEntityConfiguration := DTDEntityConfiguration new.
	self assert:
		(configuration entityConfiguration: newEntityConfiguration) ==
			configuration.
	self assert: configuration entityConfiguration == newEntityConfiguration.
]

{ #category : #tests }
XMLConfigurationTest >> testExternalEntityResolver [
	| configuration oldResolver newResolver |

	configuration := self newConfiguration.
	oldResolver := configuration externalEntityResolver.
	self assert: oldResolver class == self externalEntityResolverClass.

	newResolver := self externalEntityResolverClass new.
	self
		assert: (configuration externalEntityResolver: newResolver) == configuration;
		assert: configuration externalEntityResolver == newResolver.
]

{ #category : #tests }
XMLConfigurationTest >> testIsValidating [
	| configuration |
	
	configuration := self newConfiguration.
	self
		assert: configuration isValidating;
		assert: (configuration isValidating: false) == configuration;
		deny: configuration isValidating;
		assert: (configuration isValidating: true) == configuration;
		assert: configuration isValidating.
]

{ #category : #tests }
XMLConfigurationTest >> testMaxEntityReplacementDepth [
	| configuration |

	configuration := self newConfiguration.
	self assert:
		configuration maxEntityReplacementDepth =
			XMLParserLimits defaultMaxEntityReplacementDepth.
	self
		assert: (configuration maxEntityReplacementDepth: 20) == configuration;
		assert: configuration maxEntityReplacementDepth = 20;
		assert: (configuration maxEntityReplacementDepth: nil) == configuration;
		assert: configuration maxEntityReplacementDepth isNil.
]

{ #category : #tests }
XMLConfigurationTest >> testParserHandlerClass [
	| configuration |

	configuration := self newConfiguration.
	self assert: configuration parserHandlerClass == self parserHandlerClass.
	self assert:
		(configuration parserHandlerClass: self otherParserHandlerClass) ==
			configuration.
	self assert: configuration parserHandlerClass == self otherParserHandlerClass.
]

{ #category : #tests }
XMLConfigurationTest >> testParserLimits [
	| configuration newParserLimits |

	configuration := self newConfiguration.
	self assert: configuration parserLimits class == XMLParserLimits.

	newParserLimits := XMLParserLimits new.
	self
		assert: (configuration parserLimits: newParserLimits) == configuration;
		assert: configuration parserLimits == newParserLimits.
]

{ #category : #tests }
XMLConfigurationTest >> testPreservesUndeclaredEntityReferences [
	| configuration |

	configuration := self newConfiguration.
	self deny: configuration preservesUndeclaredEntityReferences.

	"enabling should disable validation"
	self assert:
		(configuration preservesUndeclaredEntityReferences: true) ==
			configuration.
	self
		assert: configuration preservesUndeclaredEntityReferences;
		deny: configuration isValidating.

	self
		assert: (configuration isValidating: true) == configuration;
		assert: configuration isValidating;
		deny: configuration preservesUndeclaredEntityReferences.
]

{ #category : #tests }
XMLConfigurationTest >> testReplacesContentEntityReferences [
	| configuration |
	
	configuration := self newConfiguration.
	self assert: configuration replacesContentEntityReferences.
	self assert:
		(configuration replacesContentEntityReferences: false) ==
			configuration.
	self deny: configuration replacesContentEntityReferences.
	self assert:
		(configuration replacesContentEntityReferences: true) ==
			configuration.
	self assert: configuration replacesContentEntityReferences.
]

{ #category : #tests }
XMLConfigurationTest >> testRequiresSchema [
	| configuration |

	(configuration := self newConfiguration) isValidating: false.
	self deny: configuration requiresSchema.

	"enabling should force validation"
	self
		assert: (configuration requiresSchema: true) == configuration;
		assert: configuration requiresSchema;
		assert: configuration isValidating.

	self
		assert: (configuration isValidating: false) == configuration;
		deny: configuration isValidating;
		deny: configuration requiresSchema.
]

{ #category : #tests }
XMLConfigurationTest >> testResolvesExternalEntities [
	| configuration |

	configuration := self newConfiguration.
	"should not resolve external entities by default for security"
	self
		deny: configuration resolvesExternalEntities;
		assert: (configuration resolvesExternalEntities: true) == configuration;
		assert: configuration resolvesExternalEntities;
		assert: (configuration resolvesExternalEntities: false) == configuration;
		deny: configuration resolvesExternalEntities.
]

{ #category : #tests }
XMLConfigurationTest >> testUsesNamespaces [
	| configuration |

	configuration := self newConfiguration.
	self
		assert: configuration usesNamespaces;
		assert: (configuration usesNamespaces: false) == configuration;
		deny: configuration usesNamespaces;
		assert: (configuration usesNamespaces: true) == configuration;
		assert: configuration usesNamespaces.
]
