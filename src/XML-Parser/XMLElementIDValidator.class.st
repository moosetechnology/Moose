"
This class is shared by attribute validators to validate element IDs and ID references, including xml:id IDs.
"
Class {
	#name : #XMLElementIDValidator,
	#superclass : #Object,
	#instVars : [
		'elementsAndIdAttributes',
		'idReferences',
		'ids'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #accessing }
XMLElementIDValidator >> elementsAndIDAttributes [
	^ elementsAndIdAttributes ifNil: [elementsAndIdAttributes := Dictionary new]
]

{ #category : #private }
XMLElementIDValidator >> errorDuplicateID: anID inAttribute: anAttribute [
	XMLValidationException
		formatSignal: 'Duplicate element ID "{1}" used in attribute "{2}"'
		with: anID
		with: anAttribute
]

{ #category : #private }
XMLElementIDValidator >> errorInvalidID: anID inAttribute: anAttribute [
	XMLValidationException
		formatSignal: 'Invalid element ID value "{1}" in attribute "{2}"'
		with: anID
		with: anAttribute
]

{ #category : #private }
XMLElementIDValidator >> errorMultipleIDAttributesForElement: anElement [
	XMLValidationException
		formatSignal: 'Element <{1}> has multiple ID attributes'
		with: anElement
]

{ #category : #private }
XMLElementIDValidator >> errorUnknownIDReference: anID [
	XMLValidationException
		formatSignal: 'Reference to unknown element ID "{1}"'
		with: anID
]

{ #category : #testing }
XMLElementIDValidator >> hasIDReferences [
	^ idReferences notNil
		and: [idReferences notEmpty]
]

{ #category : #testing }
XMLElementIDValidator >> hasIDs [
	^ ids notNil
		and: [ids notEmpty]
]

{ #category : #accessing }
XMLElementIDValidator >> idReferences [
	^ idReferences ifNil: [idReferences := Set new]
]

{ #category : #accessing }
XMLElementIDValidator >> ids [
	^ ids ifNil: [ids := Set new]
]

{ #category : #removing }
XMLElementIDValidator >> removeIDReferences [
	"Gemstone's Set does not understand removeAll, so nil reassignment
	is used instead (will be lazy initialized by accessors)"
	idReferences := nil
]

{ #category : #removing }
XMLElementIDValidator >> removeIDs [
	"Gemstone's Set does not understand removeAll, so nil reassignment
	is used instead (will be lazy initialized by accessors)"
	ids := nil
]

{ #category : #validating }
XMLElementIDValidator >> validateID: anID inAttribute: anAttribute [
	anID isXMLName
		ifFalse: [
			self
				errorInvalidID: anID
				inAttribute: anAttribute].
	self
		validateUniquenessOfID: anID
		inAttribute: anAttribute.
]

{ #category : #validating }
XMLElementIDValidator >> validateIDAttribute: anAttribute forElement: anElement [
	| oldSize |

	"checking size after is faster than includes test"
	oldSize := self elementsAndIDAttributes size.
	(self elementsAndIDAttributes
		at: anElement
		put: anAttribute;
		size) > oldSize
		ifFalse: [self errorMultipleIDAttributesForElement: anElement].
]

{ #category : #validating }
XMLElementIDValidator >> validateIDReference: anID inAttribute: anAttribute [
	anID isXMLName
		ifFalse: [
			self
				errorInvalidID: anID
				inAttribute: anAttribute].
	self idReferences add: anID.
]

{ #category : #validating }
XMLElementIDValidator >> validateIDReferences [
	self idReferences do: [:each |
		(self ids includes: each)
			ifFalse: [self errorUnknownIDReference: each]]
]

{ #category : #private }
XMLElementIDValidator >> validateUniquenessOfID: anID inAttribute: anAttribute [
	| oldSize |

	"checking size after is faster than includes test"
	oldSize := self ids size.
	(self ids
		add: anID;
		size) > oldSize
		ifFalse: [
			self
				errorDuplicateID: anID
				inAttribute: anAttribute].
]

{ #category : #validating }
XMLElementIDValidator >> validateXMLID: anID [
	anID isXMLNCName
		ifFalse: [
			self
				errorInvalidID: anID
				inAttribute: 'xml:id'].
	self
		validateUniquenessOfID: anID
		inAttribute: 'xml:id'.
]
