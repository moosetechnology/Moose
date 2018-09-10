"
An XPathContext controls evaluation of XPath expressions. Contexts have a function library, variable bindings, and namespace mappings.

By default, qualified name tests like 'prefix:name' and wildcard tests like 'prefix:*' will match against the prefix directly. This isn't like the standard, where prefixes in node tests must be declared in the context before evaluation and the namespace they're bound to is matched against the (non-default) namespace of the node, but it's easier to use.

To get standard behavior, just declare at least one prefix in the context before evaluation (then every prefix must be declared in the context and the namespace URIs are matched instead of the literal prefixes).
"
Class {
	#name : #XPathContext,
	#superclass : #Object,
	#instVars : [
		'variables',
		'namespaceScope',
		'functions'
	],
	#classInstVars : [
		'defaultFunctions'
	],
	#category : #'XPath-Core'
}

{ #category : #accessing }
XPathContext class >> defaultFunctions [
	^ defaultFunctions
		ifNil: [defaultFunctions := XPathFunctionSet default]
]

{ #category : #accessing }
XPathContext class >> defaultFunctions: aFunctionSetOrNil [
	"can be used to specify a custom default function set"

	defaultFunctions := aFunctionSetOrNil
]

{ #category : #'instance creation' }
XPathContext class >> functions: aFunctionSet [
	^ self new functions: aFunctionSet
]

{ #category : #'class initialization' }
XPathContext class >> initialize [
	"self initialize"

	self defaultFunctions: nil.
]

{ #category : #'instance creation' }
XPathContext class >> namespaces: anAssociationCollection [
	^ self new declareNamespaces: anAssociationCollection
]

{ #category : #'instance creation' }
XPathContext class >> variables: anAssociationCollection [
	^ self new variables: anAssociationCollection
]

{ #category : #'instance creation' }
XPathContext class >> variables: aVariableAssociationCollection namespaces: aNamepsaceAssociationCollection [
	^ self new
		variables: aVariableAssociationCollection;
		declareNamespaces: aNamepsaceAssociationCollection
]

{ #category : #'instance creation' }
XPathContext class >> variables: aVariableAssociationCollection namespaces: aNamepsaceAssociationCollection functions: aFunctionSet [
	^ self new
		variables: aVariableAssociationCollection;
		declareNamespaces: aNamepsaceAssociationCollection;
		functions: aFunctionSet
]

{ #category : #adding }
XPathContext >> addFunction: aFunction [
	"use copy-on-write so the default function set isn't modified"
	^ self copiedFunctions add: aFunction
]

{ #category : #private }
XPathContext >> attributeTestForPrefix: aPrefix [
	self hasNamespaces
		ifTrue: [
			^ XPathAttributeNodeTestForNamespaceURI namespaceURI:
				(self resolvePrefixReference: aPrefix)]
		ifFalse: [
			^ XPathAttributeNodeTestForPrefix prefix: aPrefix]
]

{ #category : #private }
XPathContext >> attributeTestForPrefix: aPrefix localName: aLocalName [
	self hasNamespaces
		ifTrue: [
			^ XPathAttributeNodeTestForNamespaceURIAndLocalName
				namespaceURI: (self resolvePrefixReference: aPrefix)
				localName: aLocalName]
		ifFalse: [
			^ XPathAttributeNodeTestForName name:
				(aLocalName qualifyWithXMLPrefix: aPrefix)]
]

{ #category : #private }
XPathContext >> copiedFunctions [
	"used to implement copy-on-write for functions"
	^ functions := self functions copy
]

{ #category : #namespacing }
XPathContext >> declareNamespaces: anAssociationCollection [
	self namespaceScope mapPrefixesAndURIs: anAssociationCollection
]

{ #category : #namespacing }
XPathContext >> declarePrefix: aPrefix uri: aURI [
	self namespaceScope
		mapPrefix: aPrefix
		to: aURI
]

{ #category : #private }
XPathContext >> elementTestForPrefix: aPrefix [
	self hasNamespaces
		ifTrue: [
			^ XPathElementNodeTestForNamespaceURI namespaceURI:
				(self resolvePrefixReference: aPrefix)]
		ifFalse: [
			^ XPathElementNodeTestForPrefix prefix: aPrefix]
]

{ #category : #private }
XPathContext >> elementTestForPrefix: aPrefix localName: aLocalName [
	self hasNamespaces
		ifTrue: [
			^ XPathElementNodeTestForNamespaceURIAndLocalName
				namespaceURI: (self resolvePrefixReference: aPrefix)
				localName: aLocalName]
		ifFalse: [
			^ XPathElementNodeTestForName name:
				(aLocalName qualifyWithXMLPrefix: aPrefix)]
]

{ #category : #private }
XPathContext >> errorUndeclaredFunction: aFunctionName [
	XPathUndeclaredFunctionException
		formatSignal: 'Undeclared function {1}()'
		with: aFunctionName
]

{ #category : #private }
XPathContext >> errorUndeclaredPrefix: aPrefix [
	XPathUndeclaredPrefixException
		formatSignal: 'Prefix "{1}" was not declared in the XPath context'
		with: aPrefix
]

{ #category : #private }
XPathContext >> errorUndeclaredVariable: aVariableName [
	XPathUndeclaredVariableException
		formatSignal: 'Undeclared variable reference ${1}'
		with: aVariableName
]

{ #category : #accessing }
XPathContext >> functionNamed: aFunctionName [
	^ self functions functionNamed: aFunctionName
]

{ #category : #accessing }
XPathContext >> functionNamed: aFunctionName ifAbsent: aBlock [
	^ self functions 
		functionNamed: aFunctionName
		ifAbsent: aBlock
]

{ #category : #private }
XPathContext >> functions [
	"the default function set won't be directly modified because the add/remove
	methods use copy-on-write semantics"
	^ functions ifNil: [functions := self class defaultFunctions]
]

{ #category : #accessing }
XPathContext >> functions: aFunctionSet [
	"will only be modified by copy-on-write"
	functions := aFunctionSet asXPathFunctionSet
]

{ #category : #testing }
XPathContext >> hasFunctions [
	^ self functions notEmpty
]

{ #category : #testing }
XPathContext >> hasNamespaces [
	^ namespaceScope notNil
		and: [namespaceScope hasNamespaces]
]

{ #category : #testing }
XPathContext >> hasVariables [
	^ self variables notEmpty
]

{ #category : #testing }
XPathContext >> includesFunction: aFunction [
	^ self functions includes: aFunction
]

{ #category : #testing }
XPathContext >> includesVariable: aVariableName [
	^ self variables includesKey: aVariableName
]

{ #category : #testing }
XPathContext >> isDeclaredPrefix: aPrefix [
	^ self namespaceScope includesPrefix: aPrefix
]

{ #category : #testing }
XPathContext >> isDeclaredPrefix: aPrefix uri: aURI [
	^ self namespaceScope
		includesPrefix: aPrefix
		mappedTo: aURI
]

{ #category : #private }
XPathContext >> namespaceScope [
	^ namespaceScope ifNil: [namespaceScope := XMLNamespaceScope new]
]

{ #category : #private }
XPathContext >> namespaceTestForPrefix: aPrefix [
	self hasNamespaces
		ifTrue: [
			^ XPathNamespaceTestForNamespaceURI namespaceURI:
				(self resolvePrefixReference: aPrefix)]
		ifFalse: [
			^ XPathNamespaceTestForPrefix prefix: aPrefix]
]

{ #category : #private }
XPathContext >> namespaceTestForPrefix: aPrefix localName: aLocalName [
	self hasNamespaces
		ifTrue: [
			^ XPathNamespaceTestForNamespaceURIAndLocalName
				namespaceURI: (self resolvePrefixReference: aPrefix)
				localName: aLocalName]
		ifFalse: [
			^ XPathNamespaceTestForName name:
				(aLocalName qualifyWithXMLPrefix: aPrefix)]
]

{ #category : #removing }
XPathContext >> removeFunction: aFunction [
	"use copy-on-write so the default function set isn't modified"
	^ self copiedFunctions remove: aFunction
]

{ #category : #removing }
XPathContext >> removeFunction: aFunction ifAbsent: aBlock [
	"use copy-on-write so the default function set isn't modified"
	^ self copiedFunctions
		remove: aFunction
		ifAbsent: aBlock
]

{ #category : #removing }
XPathContext >> removeFunctions [
	self copiedFunctions removeAll
]

{ #category : #removing }
XPathContext >> removeVariable: aVariable [
	^ self variables removeKey: aVariable
]

{ #category : #removing }
XPathContext >> removeVariable: aVariable ifAbsent: aBlock [
	^ self variables
		removeKey: aVariable
		ifAbsent: aBlock
]

{ #category : #removing }
XPathContext >> removeVariables [
	self variables removeAll
]

{ #category : #private }
XPathContext >> resolveFunctionReference: aFunctionName contextNode: aContextNode arguments: anArgumentArray [
	^ (self
		functionNamed: aFunctionName
		ifAbsent: [self errorUndeclaredFunction: aFunctionName])
			context: self
			contextNode: aContextNode
			arguments: anArgumentArray
]

{ #category : #namespacing }
XPathContext >> resolvePrefix: aPrefix [
	^ self namespaceScope resolvePrefix: aPrefix
]

{ #category : #namespacing }
XPathContext >> resolvePrefix: aPrefix ifUnresolvable: aBlock [
	^ self namespaceScope
		resolvePrefix: aPrefix
		ifUnresolvable: aBlock
]

{ #category : #private }
XPathContext >> resolvePrefixReference: aPrefix [
	^ self
		resolvePrefix: aPrefix
		ifUnresolvable: [self errorUndeclaredPrefix: aPrefix]
]

{ #category : #namespacing }
XPathContext >> resolvePrefixesOfNamespaceURI: aURI [
	^ self namespaceScope resolvePrefixesOfNamespaceURI: aURI
]

{ #category : #private }
XPathContext >> resolveVariableReference: aVariableName [
	^ self
		variableAt: aVariableName
		ifAbsent: [self errorUndeclaredVariable: aVariableName]
]

{ #category : #namespacing }
XPathContext >> undeclarePrefix: aPrefix [
	self namespaceScope
		unmapPrefix: aPrefix
		ifAbsent: [nil]
]

{ #category : #namespacing }
XPathContext >> undeclarePrefixes [
	self namespaceScope unmapPrefixes
]

{ #category : #accessing }
XPathContext >> variableAt: aVariableName [
	^ self variables
		at: aVariableName
		ifAbsent: [nil]
]

{ #category : #accessing }
XPathContext >> variableAt: aVariableName ifAbsent: aBlock [
	^ self variables
		at: aVariableName
		ifAbsent: aBlock
]

{ #category : #accessing }
XPathContext >> variableAt: aVariableName ifAbsentPut: aBlock [
	^ self variables
		at: aVariableName
		ifAbsentPut: aBlock
]

{ #category : #accessing }
XPathContext >> variableAt: aVariableName put: aValue [
	^ self variables
		at: aVariableName
		put: aValue
]

{ #category : #private }
XPathContext >> variables [
	^ variables ifNil: [variables := Dictionary new]
]

{ #category : #accessing }
XPathContext >> variables: anAssociationCollection [
	variables := Dictionary new: anAssociationCollection size.
	anAssociationCollection associationsDo: [:each |
		variables
			at: each key
			put: each value].
]
