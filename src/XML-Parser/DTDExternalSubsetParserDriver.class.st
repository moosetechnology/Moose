"
This class is used by SAXParserDriver for parsing the external subset of a DTD.
"
Class {
	#name : #DTDExternalSubsetParserDriver,
	#superclass : #DTDSubsetParserDriver,
	#instVars : [
		'saxDriver',
		'documentURI'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #'instance creation' }
DTDExternalSubsetParserDriver class >> saxDriver: aSAXDriver documentURI: anExternalSubsetURIString [
	^ self new
		setSAXDriver: aSAXDriver
		documentURI: anExternalSubsetURIString
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> decodesCharacters [
	^ self saxDriver decodesCharacters
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> documentURI [
	^ documentURI
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> externalEntityResolver [
	^ self saxDriver externalEntityResolver
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> hasExternalSubset [
	^ true
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> hasParameterEntityReferences [
	^ self saxDriver hasParameterEntityReferences
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> hasSkippedParameterEntityReferences [
	^ self saxDriver hasSkippedParameterEntityReferences
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> haveParameterEntityReferences [
	self saxDriver haveParameterEntityReferences
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> haveSkippedParameterEntityReferences [
	self saxDriver haveSkippedParameterEntityReferences
]

{ #category : #defaults }
DTDExternalSubsetParserDriver >> initialStateClass [
	^ XMLExternalSubsetTextDeclarationState
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> isExternal [
	"Definition: An external markup declaration is defined as a markup
	declaration occurring in the external subset or in a parameter entity
	(external or internal, the latter being included because non-validating
	processors are not required to read them)"

	^ true
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> isStandalone [
	^ self saxDriver isStandalone
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> isValidating [
	^ self saxDriver isValidating
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> maxEntityReplacementDepth [
	^ self saxDriver maxEntityReplacementDepth
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> preservesUndeclaredEntityReferences [
	^ self saxDriver preservesUndeclaredEntityReferences
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> readLimit [
	^ self externalEntityResolver externalSubsetReadLimit
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> replacesContentEntityReferences [
	^ self saxDriver replacesContentEntityReferences
]

{ #category : #testing }
DTDExternalSubsetParserDriver >> resolvesExternalEntities [
	^ true
]

{ #category : #accessing }
DTDExternalSubsetParserDriver >> saxDriver [
	^ saxDriver
]

{ #category : #initialization }
DTDExternalSubsetParserDriver >> setSAXDriver: aSAXDriver documentURI: anExternalSubsetURIString [
	saxDriver := aSAXDriver.
	documentURI := anExternalSubsetURIString.
	doctypeDefinition := aSAXDriver doctypeDefinition.
]
