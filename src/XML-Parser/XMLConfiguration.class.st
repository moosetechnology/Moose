"
This class stores the settings and components of a parser. For performance it uses separate inst vars instead of a dictionary and lazy initializes some components.
"
Class {
	#name : #XMLConfiguration,
	#superclass : #Object,
	#instVars : [
		'isValidating',
		'usesNamespaces',
		'decodesCharacters',
		'requiresSchema',
		'parserHandlerClass',
		'parserLimits',
		'entityConfiguration'
	],
	#category : #'XML-Parser'
}

{ #category : #accessing }
XMLConfiguration >> decodesCharacters [
	^ decodesCharacters
]

{ #category : #accessing }
XMLConfiguration >> decodesCharacters: aBoolean [
	decodesCharacters := aBoolean
]

{ #category : #defaults }
XMLConfiguration >> defaultParserHandlerClass [
	^ SAXHandler
]

{ #category : #accessing }
XMLConfiguration >> documentReadLimit [
	^ self parserLimits documentReadLimit
]

{ #category : #accessing }
XMLConfiguration >> documentReadLimit: anInteger [
	self parserLimits documentReadLimit: anInteger
]

{ #category : #accessing }
XMLConfiguration >> entityConfiguration [
	^ entityConfiguration ifNil: [entityConfiguration := DTDEntityConfiguration new]
]

{ #category : #accessing }
XMLConfiguration >> entityConfiguration: anEntityConfiguration [
	entityConfiguration := anEntityConfiguration
]

{ #category : #accessing }
XMLConfiguration >> externalEntityResolver [
	^ self entityConfiguration externalEntityResolver
]

{ #category : #accessing }
XMLConfiguration >> externalEntityResolver: anExternalEntityResolver [
	self entityConfiguration externalEntityResolver: anExternalEntityResolver
]

{ #category : #initialization }
XMLConfiguration >> initialize [
	super initialize.

	"always used, so explicitly initialized"
	isValidating := true.
	usesNamespaces := true.
	decodesCharacters := true.
	requiresSchema := false.
	parserLimits := XMLParserLimits new.
]

{ #category : #accessing }
XMLConfiguration >> isValidating [
	^ isValidating
]

{ #category : #accessing }
XMLConfiguration >> isValidating: aBoolean [
	(isValidating := aBoolean)
		ifTrue: [self preservesUndeclaredEntityReferences: false]
		ifFalse: [self requiresSchema: false]
]

{ #category : #accessing }
XMLConfiguration >> maxEntityReplacementDepth [
	^ self parserLimits maxEntityReplacementDepth
]

{ #category : #accessing }
XMLConfiguration >> maxEntityReplacementDepth: anInteger [
	self parserLimits maxEntityReplacementDepth: anInteger
]

{ #category : #accessing }
XMLConfiguration >> parserHandlerClass [
	^ parserHandlerClass ifNil: [parserHandlerClass := self defaultParserHandlerClass]
]

{ #category : #accessing }
XMLConfiguration >> parserHandlerClass: aClass [
	parserHandlerClass := aClass
]

{ #category : #accessing }
XMLConfiguration >> parserLimits [
	^ parserLimits
]

{ #category : #accessing }
XMLConfiguration >> parserLimits: aParserLimits [
	parserLimits := aParserLimits
]

{ #category : #copying }
XMLConfiguration >> postCopy [
	super postCopy.

	parserLimits := parserLimits copy.
	entityConfiguration
		ifNotNil: [entityConfiguration := entityConfiguration copy].
]

{ #category : #accessing }
XMLConfiguration >> preservesUndeclaredEntityReferences [
	^ self entityConfiguration preservesUndeclaredEntityReferences
]

{ #category : #accessing }
XMLConfiguration >> preservesUndeclaredEntityReferences: aBoolean [
	self entityConfiguration preservesUndeclaredEntityReferences: aBoolean.
	aBoolean
		ifTrue: [self isValidating: false].
]

{ #category : #removing }
XMLConfiguration >> removeLimits [
	self parserLimits removeAll.
	self externalEntityResolver removeLimits.
]

{ #category : #accessing }
XMLConfiguration >> replacesContentEntityReferences [
	^ self entityConfiguration replacesContentEntityReferences
]

{ #category : #accessing }
XMLConfiguration >> replacesContentEntityReferences: aBoolean [
	self entityConfiguration replacesContentEntityReferences: aBoolean
]

{ #category : #deprecated }
XMLConfiguration >> requiresDocumentConstraints [
	^ self requiresSchema
]

{ #category : #deprecated }
XMLConfiguration >> requiresDocumentConstraints: aBoolean [
	"will be deprecated; use #requiresSchema: instead"
	self requiresSchema: aBoolean
]

{ #category : #accessing }
XMLConfiguration >> requiresSchema [
	^ requiresSchema
]

{ #category : #accessing }
XMLConfiguration >> requiresSchema: aBoolean [
	(requiresSchema := aBoolean)
		ifTrue: [self isValidating: true]
]

{ #category : #accessing }
XMLConfiguration >> resolvesExternalEntities [
	^ self entityConfiguration resolvesExternalEntities
]

{ #category : #accessing }
XMLConfiguration >> resolvesExternalEntities: aBoolean [
	self entityConfiguration resolvesExternalEntities: aBoolean
]

{ #category : #accessing }
XMLConfiguration >> usesNamespaces [
	^ usesNamespaces
]

{ #category : #accessing }
XMLConfiguration >> usesNamespaces: aBoolean [
	usesNamespaces := aBoolean
]
