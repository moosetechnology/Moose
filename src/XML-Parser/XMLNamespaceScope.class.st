"
A namespace scope is a possibly empty set of mappings from namespace prefixes to URIs and an optional default namespace URI to be used for unprefixed elements. Scopes can be created from other scopes by copying. (Uses copy-on-write to reduce memory use.)
"
Class {
	#name : #XMLNamespaceScope,
	#superclass : #Object,
	#instVars : [
		'prefixMappings'
	],
	#category : #'XML-Parser-Namespaces'
}

{ #category : #defaults }
XMLNamespaceScope class >> xmlNamespaceURI [
	^ 'http://www.w3.org/XML/1998/namespace'
]

{ #category : #defaults }
XMLNamespaceScope class >> xmlnsNamespaceURI [
	^ 'http://www.w3.org/2000/xmlns/'
]

{ #category : #comparing }
XMLNamespaceScope >> = anObject [
	self == anObject
		ifTrue: [^ true].

	self species == anObject species
		ifFalse: [^ false].

	self hasNamespaces
		ifFalse: [^ anObject hasNamespaces not].

	"use #hasNamespaces first to avoid initializing anObject's prefixMappings"
	anObject hasNamespaces
		ifFalse: [^ false].

	^ prefixMappings = anObject prefixMappings.
]

{ #category : #private }
XMLNamespaceScope >> copiedPrefixMappings [
	"replaces current mappings with copy for copy-on-write"
	prefixMappings
		ifNil: [^ self prefixMappings]
		ifNotNil: [^ prefixMappings := prefixMappings copy]
]

{ #category : #copying }
XMLNamespaceScope >> copy [
	"copy-on-write allows copies to share state so no postCopy is needed"
	^ self shallowCopy
]

{ #category : #accessing }
XMLNamespaceScope >> defaultNamespace [
	^ prefixMappings
		ifNil: ['']
		ifNotNil: [
			prefixMappings
				at: ''
				ifAbsent: ['']]
]

{ #category : #accessing }
XMLNamespaceScope >> defaultNamespace: aURI [
	self
		validatePrefix: ''
		beforeMappingTo: aURI.

	"copy-on-write"
	self copiedPrefixMappings
		at: ''
		put: aURI.
]

{ #category : #private }
XMLNamespaceScope >> errorAttribute: anAttribute aliasesURI: aURI [
	XMLNamespaceException
		formatSignal: 'Attribute "{1}" has alias for namespace URI "{2}"'
		with: anAttribute
		with: aURI
]

{ #category : #private }
XMLNamespaceScope >> errorCannotAliasPrefix: aFirstPrefix with: aSecondPrefix [
	aSecondPrefix isEmpty
		ifTrue: [
			XMLNamespaceException
				formatSignal:
					'Cannot use the "{1}" namespace URI as a ',
					'default namespace URI'
				with: aFirstPrefix]
		ifFalse: [
			XMLNamespaceException
				formatSignal:
					'Cannot alias the "{1}" namespace URI ',
					'with the "{2}" prefix'
				with: aFirstPrefix
				with: aSecondPrefix]
]

{ #category : #private }
XMLNamespaceScope >> errorCannotAliasXMLNSPrefixWith: aPrefix [
	self
		errorCannotAliasPrefix: 'xmlns'
		with: aPrefix
]

{ #category : #private }
XMLNamespaceScope >> errorCannotAliasXMLPrefixWith: aPrefix [
	self
		errorCannotAliasPrefix: 'xml'
		with: aPrefix
]

{ #category : #private }
XMLNamespaceScope >> errorCannotMapPrefixToEmptyURI [
	XMLNamespaceException signal: 'Cannot map namespace prefixes to empty URIs'
]

{ #category : #private }
XMLNamespaceScope >> errorCannotMapXMLNSPrefix [
	XMLNamespaceException signal:
		'Cannot map "xmlns" prefix to any namespace, even the current "xmlns" namespace'
]

{ #category : #private }
XMLNamespaceScope >> errorCannotRemapXMLPrefix [
	XMLNamespaceException signal: 'Cannot map the "xml" prefix to a new namespace URI'
]

{ #category : #private }
XMLNamespaceScope >> errorCannotUnmapPrefix: aPrefix [
	XMLNamespaceException
		formatSignal: 'Prefix "{1}" was not mapped and cannot be unmapped'
		with: aPrefix
]

{ #category : #private }
XMLNamespaceScope >> errorInvalidPrefix: aPrefix [	
	XMLNamespaceException
		formatSignal: 'Prefix "{1}" contains ":" character'
		with: aPrefix
]

{ #category : #private }
XMLNamespaceScope >> errorInvalidUnprefixedAttribute: anAttribute [
	XMLNamespaceException
		formatSignal: 'Unprefixed attribute "{1}" contains ":" character'
		with: anAttribute
]

{ #category : #private }
XMLNamespaceScope >> errorInvalidUnprefixedElement: anElement [
	XMLNamespaceException
		formatSignal: 'Unprefixed element <{1}> contains ":" character'
		with: anElement
]

{ #category : #private }
XMLNamespaceScope >> errorUnmappedPrefix: aPrefix inAttribute: anAttribute [
	XMLNamespaceException
		formatSignal: 'Unmapped namespace prefix "{1}" in "{2}" attribute'
		with: aPrefix
		with: anAttribute
]

{ #category : #private }
XMLNamespaceScope >> errorUnmappedPrefix: aPrefix inElement: anElement [
	XMLNamespaceException
		formatSignal: 'Unmapped namespace prefix "{1}" in <{2}> element'
		with: aPrefix
		with: anElement
]

{ #category : #private }
XMLNamespaceScope >> errorXMLNSPrefixInAttribute: anAttribute [
	XMLNamespaceException
		formatSignal: 'Attribute "{1}" uses reserved "xmlns" namespace prefix'
		with: anAttribute
]

{ #category : #private }
XMLNamespaceScope >> errorXMLNSPrefixInElement: anElement [
	XMLNamespaceException
		formatSignal: 'Element <{1}> uses reserved "xmlns" namespace prefix'
		with: anElement
]

{ #category : #testing }
XMLNamespaceScope >> hasDefaultNamespace [
	^ self includesPrefix: ''
]

{ #category : #testing }
XMLNamespaceScope >> hasNamespaces [
	"optimized to avoid lazy initialization"
	prefixMappings == nil
		ifTrue: [^ false].
	^ prefixMappings size > 0.
]

{ #category : #comparing }
XMLNamespaceScope >> hash [
	self hasNamespaces
		ifTrue: [^ self species hash bitXor: self prefixMappings hash]
		ifFalse: [^ self species hash]
]

{ #category : #testing }
XMLNamespaceScope >> includesPrefix: aPrefix [
	self
		prefixMappingAt: aPrefix
		ifAbsent: [^ false].
	^ true.
]

{ #category : #testing }
XMLNamespaceScope >> includesPrefix: aPrefix mappedTo: aURI [
	^ (self
		prefixMappingAt: aPrefix
		ifAbsent: [^ false]) = aURI
]

{ #category : #accessing }
XMLNamespaceScope >> inheritMappingsFrom: anEnclosingScope [
	anEnclosingScope hasNamespaces
		ifFalse: [^ self].
	self hasNamespaces
		ifTrue: [| copiedPrefixMappings |
			anEnclosingScope prefixesAndURIsDo: [:prefix :uri |
				(self includesPrefix: prefix)
					ifFalse: [
						"nil test ensures we only copy the first time when needed"
						(copiedPrefixMappings
							ifNil: [copiedPrefixMappings := self copiedPrefixMappings])
							at: prefix
							put: uri]]]
		ifFalse: [
			"can safely share anEnclosingScope's prefixMappings because of
			copy-on-write behavior"
			prefixMappings := anEnclosingScope prefixMappings].
]

{ #category : #accessing }
XMLNamespaceScope >> mapPrefix: aPrefix to: aURI [
	self
		validatePrefix: aPrefix
		beforeMappingTo: aURI.

	"copy-on-write"
	self copiedPrefixMappings
		at: aPrefix
		put: aURI.
]

{ #category : #accessing }
XMLNamespaceScope >> mapPrefixesAndURIs: anAssociationCollection [
	| copiedPrefixMappings |

	anAssociationCollection associationsDo: [:each |
		self
			validatePrefix: each key
			beforeMappingTo: each value.
		"nil test ensures we only copy the first time when needed"
		(copiedPrefixMappings
			ifNil: [copiedPrefixMappings := self copiedPrefixMappings])
			at: each key
			put: each value]
]

{ #category : #accessing }
XMLNamespaceScope >> mappedPrefixes [
	^ prefixMappings
		ifNil: [#()]
		ifNotNil: [prefixMappings keys]
]

{ #category : #accessing }
XMLNamespaceScope >> prefixMappingAt: aPrefix [
	^ self
		prefixMappingAt: aPrefix
		ifAbsent: ['']
]

{ #category : #accessing }
XMLNamespaceScope >> prefixMappingAt: aPrefix ifAbsent: aBlock [
	^ prefixMappings
		ifNil: [aBlock value]
		ifNotNil: [
			prefixMappings
				at: aPrefix
				ifAbsent: aBlock]
]

{ #category : #private }
XMLNamespaceScope >> prefixMappings [
	^ prefixMappings
		ifNil: [prefixMappings := OrderPreservingStringDictionary new: 5]
]

{ #category : #enumerating }
XMLNamespaceScope >> prefixesAndURIsDo: aTwoArgumentBlock [
	prefixMappings
		ifNotNil: [prefixMappings keysAndValuesDo: aTwoArgumentBlock]
]

{ #category : #printing }
XMLNamespaceScope >> printDeclarationsOn: aStream [
	| isFirst |

	isFirst := true.
	self prefixesAndURIsDo: [:prefix :uri |
		isFirst 
			ifTrue: [isFirst := false]
			ifFalse: [aStream space].
		aStream nextPutAll: 'xmlns'.
		prefix
			ifNotEmpty: [
				aStream
					nextPut: $:;
					nextPutAll: prefix].
		aStream
			nextPut: $=;
			nextPut: $";
			nextPutAll: uri;
			nextPut: $"].
]

{ #category : #printing }
XMLNamespaceScope >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self printDeclarationsOn: aStream.
	aStream nextPut: $).
]

{ #category : #resolving }
XMLNamespaceScope >> resolvePrefix: aPrefix [
	"Resolves the namespace URI of aPrefix (the defualt namespace URI if aPrefix
	is empty), including the predefined 'xml' and 'xmlns' prefixes. Returns an
	empty string if aPrefix is unresolvable."

	^ self
		resolvePrefix: aPrefix
		ifUnresolvable: ''
]

{ #category : #resolving }
XMLNamespaceScope >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	"Resolves the namespace URI of aPrefix (the defualt namespace URI if aPrefix
	is empty), including the predefined 'xml' and 'xmlns' prefixes. Returns the
	value of aBlock if aPrefix is unresolvable."

	aPrefix size > 0 "optimization"
		ifTrue: [
			(aPrefix at: 1) == $x "optimization"
				ifTrue: [
					aPrefix = 'xml'
						ifTrue: [^ self xmlNamespaceURI].
					aPrefix = 'xmlns'
						ifTrue: [^ self xmlnsNamespaceURI]]].

	^ self
		prefixMappingAt: aPrefix
		ifAbsent: aBlock.
]

{ #category : #resolving }
XMLNamespaceScope >> resolvePrefixesOfNamespaceURI: aURI [
	| prefixes |

	"the 'xml' and 'xmlns' namespaces URIs can't be aliased"
	aURI = self xmlNamespaceURI
		ifTrue: [^ Set with: 'xml'].
	aURI = self xmlnsNamespaceURI
		ifTrue: [^ Set with: 'xmlns'].

	prefixes := Set new.
	self prefixesAndURIsDo: [:prefix :uri |
		uri = aURI
			ifTrue: [prefixes add: prefix]].
	^ prefixes.
]

{ #category : #accessing }
XMLNamespaceScope >> size [
	^ prefixMappings
		ifNil: [0]
		ifNotNil: [prefixMappings size]
]

{ #category : #unmapping }
XMLNamespaceScope >> unmapPrefix: aPrefix [
	^ self
		unmapPrefix: aPrefix
		ifAbsent: [self errorCannotUnmapPrefix: aPrefix]
]

{ #category : #unmapping }
XMLNamespaceScope >> unmapPrefix: aPrefix ifAbsent: aBlock [
	prefixMappings
		ifNil: [^ aBlock value]
		ifNotNil: [
			"copy-on-write"
			^ self copiedPrefixMappings 
				removeKey: aPrefix
				ifAbsent: aBlock]
]

{ #category : #unmapping }
XMLNamespaceScope >> unmapPrefixes [
	self hasNamespaces
		ifTrue: [
			"copy-on-write"
			self copiedPrefixMappings removeAll]
]

{ #category : #validating }
XMLNamespaceScope >> validateAndResolvePrefix: aPrefix ofAttribute: anAttribute [
	"performance critical method"
	aPrefix size > 0 "optimization"
		ifTrue: [
			^ self
				prefixMappingAt: aPrefix
				ifAbsent: [
					aPrefix = 'xml'
						ifTrue: [self xmlNamespaceURI]
						ifFalse: [					
							aPrefix = 'xmlns'
								ifTrue: [
									"this can't happen during parsing, because
									'xmlns' attributes are treated as namespace
									declarations, but it can happen through DOM tree
									manipulation, for example:
										attributeNode prefix: 'xmlns'
									"
									self errorXMLNSPrefixInAttribute: anAttribute]
								ifFalse: [
									self
										errorUnmappedPrefix: aPrefix
										inAttribute: anAttribute]]]]
		ifFalse: [
			"catch names like ':name' with an empty prefix"
			(anAttribute size > 0
				and: [(anAttribute at: 1) == $:])
				ifTrue: [self errorInvalidUnprefixedAttribute: anAttribute].
			^ '']
]

{ #category : #validating }
XMLNamespaceScope >> validateAndResolvePrefix: aPrefix ofElement: anElement [
	aPrefix size > 0 "optimization"
		ifTrue: [
			^ self
				prefixMappingAt: aPrefix
				ifAbsent: [
					aPrefix = 'xml'
						ifTrue: [self xmlNamespaceURI]
						ifFalse: [					
							aPrefix = 'xmlns'
								ifTrue: [self errorXMLNSPrefixInElement: anElement]
								ifFalse: [
									self
										errorUnmappedPrefix: aPrefix
										inElement: anElement]]]]
		ifFalse: [
			"catch names like ':name' with an empty prefix"
			(anElement size > 0
				and: [(anElement at: 1) == $:])
				ifTrue: [self errorInvalidUnprefixedElement: anElement].
			^ self defaultNamespace]
]

{ #category : #private }
XMLNamespaceScope >> validatePrefix: aPrefix beforeMappingTo: aURI [
	aPrefix size > 0 "optimization"
		ifTrue: ["non-default namespace"
			aPrefix = 'xml' "cannot be remapped"
				ifTrue: [
					aURI = self xmlNamespaceURI
						ifFalse: [self errorCannotRemapXMLPrefix].
					^ self].
			aPrefix = 'xmlns' "cannot be mapped, even to the same URI"
				ifTrue: [self errorCannotMapXMLNSPrefix].
			(aPrefix indexOf: $:) > 0 
				ifTrue: [self errorInvalidPrefix: aPrefix].
			"non-default namespaces cannot be mapped to empty uris, even
			to shadow an inherited namesapce"
			aURI size > 0
				ifFalse: [self errorCannotMapPrefixToEmptyURI]].

	"these URIs cannot be aliased, even by the default namespace"
	aURI = self xmlNamespaceURI
		ifTrue: [self errorCannotAliasXMLPrefixWith: aPrefix].
	aURI = self xmlnsNamespaceURI
		ifTrue: [self errorCannotAliasXMLNSPrefixWith: aPrefix].
]

{ #category : #validating }
XMLNamespaceScope >> validatePrefixesOfAttributes: anAttributeCollection [
	^ self
		validatePrefixesOfAttributes: anAttributeCollection asArray
		from: 1
		to: anAttributeCollection size
]

{ #category : #validating }
XMLNamespaceScope >> validatePrefixesOfAttributes: anAttributeCollection from: aStart to: aStop [
	"performance critical method"
	| attributeLocalNamesAndURIs |

	"#to:do: for speed"
	aStart to: aStop do: [:i | | attribute prefix uri |
		attribute := anAttributeCollection at: i.
		prefix := attribute xmlPrefixBeforeLocalName.
		(uri :=
			self
				validateAndResolvePrefix: prefix
				ofAttribute: attribute) size > 0 "optimization"
			ifTrue: [| oldSize |
				oldSize :=
					(attributeLocalNamesAndURIs
						ifNil: [
							"not initialized unless needed"
							attributeLocalNamesAndURIs := Set new]) size.
				(attributeLocalNamesAndURIs
					add: (attribute xmlLocalNameAfterPrefix: prefix) -> uri;
					size) > oldSize
					ifFalse: [
						self
							errorAttribute: attribute xmlLocalNameAfterPrefix
							aliasesURI: uri]]]
]

{ #category : #defaults }
XMLNamespaceScope >> xmlNamespaceURI [
	^ self class xmlNamespaceURI
]

{ #category : #defaults }
XMLNamespaceScope >> xmlnsNamespaceURI [
	^ self class xmlnsNamespaceURI
]
