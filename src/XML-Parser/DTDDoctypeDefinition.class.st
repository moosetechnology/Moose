"
This class represents the parsed internal and external subset of a DTD taken together.
"
Class {
	#name : #DTDDoctypeDefinition,
	#superclass : #Object,
	#instVars : [
		'root',
		'elementValidators',
		'attributeValidators',
		'generalEntities',
		'parameterEntities',
		'unparsedEntities',
		'notations',
		'elementIDValidator',
		'unparsedEntityValidator'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #adding }
DTDDoctypeDefinition >> addExternalGeneralEntity: aName resolver: aResolver publicID: aPublicID systemID: aSystemID baseURI: aBaseURIString [
	(self generalEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self generalEntities
		at: aName
		put:
			(DTDExternalGeneralParsedEntity
				name: aName
				resolver: aResolver
				publicID: aPublicID
				systemID: aSystemID
				baseURI: aBaseURIString).
]

{ #category : #adding }
DTDDoctypeDefinition >> addExternalParameterEntity: aName resolver: aResolver publicID: aPublicID systemID: aSystemID baseURI: aBaseURIString [
	(self parameterEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self parameterEntities
		at: aName
		put:
			(DTDExternalParameterParsedEntity
				name: aName
				resolver: aResolver
				publicID: aPublicID
				systemID: aSystemID
				baseURI: aBaseURIString).
]

{ #category : #adding }
DTDDoctypeDefinition >> addGeneralEntitiesFrom: aDoctypeDefinition [
	aDoctypeDefinition generalEntities keysAndValuesDo: [:name :entity |
		self generalEntities
			at: name
			ifAbsentPut: [entity]]
]

{ #category : #adding }
DTDDoctypeDefinition >> addInternalGeneralEntity: aName replacement: aReplacement baseURI: aBaseURIString [
	(self generalEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self generalEntities
		at: aName
		put:
			(DTDInternalGeneralParsedEntity 
				name: aName
				replacement: aReplacement
				uri: aBaseURIString).
]

{ #category : #adding }
DTDDoctypeDefinition >> addInternalParameterEntity: aName replacement: aReplacement baseURI: aBaseURIString [
	(self parameterEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self parameterEntities
		at: aName
		put:
			(DTDInternalParameterParsedEntity
				name: aName
				replacement: aReplacement
				uri: aBaseURIString).
]

{ #category : #adding }
DTDDoctypeDefinition >> addNotation: aName publicID: aPublicID systemID: aSystemID [
	(self notations includesKey: aName)
		ifTrue: [^ nil].
	^ self notations
		at: aName
		put:
			(DTDNotation
				name: aName
				publicID: aPublicID
				systemID: aSystemID).
]

{ #category : #adding }
DTDDoctypeDefinition >> addStandaloneExternalExternalGeneralEntity: aName resolver: aResolver publicID: aPublicID systemID: aSystemID baseURI: aBaseURIString [
	(self generalEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self generalEntities
		at: aName
		put:
			(DTDStandaloneExternalExternalGeneralParsedEntity
				name: aName
				resolver: aResolver
				publicID: aPublicID
				systemID: aSystemID
				baseURI: aBaseURIString).
]

{ #category : #adding }
DTDDoctypeDefinition >> addStandaloneExternalInternalGeneralEntity: aName replacement: aReplacement baseURI: aBaseURIString [
	(self generalEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self generalEntities
		at: aName
		put:
			(DTDStandaloneExternalInternalGeneralParsedEntity 
				name: aName
				replacement: aReplacement
				uri: aBaseURIString).
]

{ #category : #adding }
DTDDoctypeDefinition >> addStandaloneExternalValidatorForAttributeIn: anElement named: anAttribute type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	| attributes |

	attributes :=
		self attributeValidators
			at: anElement
			ifAbsentPut: [Dictionary new].
	(attributes includesKey: anAttribute)
		ifTrue: [^ nil].
	^ attributes
		at: anAttribute
		put:
			((DTDStandaloneExternalAttributeDefinitionParser
				element: anElement
				attribute: anAttribute
				type: aType
				defaultPragma: aDefaultPragma
				defaultValue: aDefaultValue) parse
					initializeWithValidatorsFrom: self).
]

{ #category : #adding }
DTDDoctypeDefinition >> addStandaloneExternalValidatorForElement: anElement contentModel: aContentModel [
	(self elementValidators includesKey: anElement)
		ifTrue: [^ nil].
	^ self elementValidators
		at: anElement
		put:
			((DTDContentModelParser parserClassForContentModel: aContentModel)
				standaloneExternalClass
					element: anElement
					contentModel: aContentModel) parse.
]

{ #category : #adding }
DTDDoctypeDefinition >> addUnparsedEntity: aName publicID: aPublicID systemID: aSystemID ndata: aNotation [
	(self generalEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self generalEntities
		at: aName
		put:
			(self unparsedEntities
				at: aName
				put:
					(DTDUnparsedEntity
						name: aName
						publicID: aPublicID
						systemID: aSystemID
						ndata: aNotation)).
]

{ #category : #adding }
DTDDoctypeDefinition >> addUnresolvableExternalGeneralEntity: aName [
	(self generalEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self generalEntities
		at: aName
		put: (DTDUnresolvableExternalGeneralParsedEntity named: aName).
]

{ #category : #adding }
DTDDoctypeDefinition >> addUnresolvableExternalParameterEntity: aName [
	(self parameterEntities includesKey: aName)
		ifTrue: [^ nil].
	^ self parameterEntities
		at: aName
		put: (DTDUnresolvableExternalParameterParsedEntity named: aName).
]

{ #category : #adding }
DTDDoctypeDefinition >> addValidatorForAttributeIn: anElement named: anAttribute type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	| attributes |

	attributes :=
		self attributeValidators
			at: anElement
			ifAbsentPut: [Dictionary new].
	(attributes includesKey: anAttribute)
		ifTrue: [^ nil].
	^ attributes
		at: anAttribute
		put:
			((DTDAttributeDefinitionParser
				element: anElement
				attribute: anAttribute
				type: aType
				defaultPragma: aDefaultPragma
				defaultValue: aDefaultValue) parse
					initializeWithValidatorsFrom: self).
]

{ #category : #adding }
DTDDoctypeDefinition >> addValidatorForElement: anElement contentModel: aContentModel [
	(self elementValidators includesKey: anElement)
		ifTrue: [^ nil].
	^ self elementValidators
		at: anElement
		put:
			((DTDContentModelParser parserClassForContentModel: aContentModel)
				element: anElement
				contentModel: aContentModel) parse.
]

{ #category : #accessing }
DTDDoctypeDefinition >> attributeValidators [
	^ attributeValidators ifNil: [attributeValidators := Dictionary new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> attributeValidatorsAt: aName [
	^ self
		attributeValidatorsAt: aName
		ifAbsent: [nil]
]

{ #category : #accessing }
DTDDoctypeDefinition >> attributeValidatorsAt: aName ifAbsent: aBlock [
	^ self attributeValidators
		at: aName
		ifAbsent: aBlock
]

{ #category : #accessing }
DTDDoctypeDefinition >> elementIDValidator [
	^ elementIDValidator ifNil: [elementIDValidator := XMLElementIDValidator new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> elementValidators [
	^ elementValidators ifNil: [elementValidators := Dictionary new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> elementValidatorsAt: aName [
	^ self
		elementValidatorsAt: aName
		ifAbsent: [nil]
]

{ #category : #accessing }
DTDDoctypeDefinition >> elementValidatorsAt: aName ifAbsent: aBlock [
	^ self elementValidators
		at: aName
		ifAbsent: aBlock
]

{ #category : #accessing }
DTDDoctypeDefinition >> generalEntities [
	^ generalEntities ifNil: [generalEntities := Dictionary new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> generalEntityAt: aName [
	^ self
		generalEntityAt: aName
		ifAbsent: [nil]
]

{ #category : #accessing }
DTDDoctypeDefinition >> generalEntityAt: aName ifAbsent: aBlock [
	^ self generalEntities
		at: aName
		ifAbsent: aBlock
]

{ #category : #testing }
DTDDoctypeDefinition >> hasAttributeValidators [
	"optimized to avoid lazy initialization"
	attributeValidators == nil
		ifTrue: [^ false].
	^ attributeValidators size > 0.
]

{ #category : #testing }
DTDDoctypeDefinition >> hasElementIDReferences [
	"direct access to avoid lazy initialization"
	^ elementIDValidator notNil
		and: [elementIDValidator hasIDReferences]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasElementIDs [
	"direct access to avoid lazy initialization"
	^ elementIDValidator notNil
		and: [elementIDValidator hasIDs]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasElementValidators [
	"optimized to avoid lazy initialization"
	elementValidators == nil
		ifTrue: [^ false].
	^ elementValidators size > 0.
]

{ #category : #testing }
DTDDoctypeDefinition >> hasEntities [
	^ self hasGeneralEntities
		or: [self hasParameterEntities
			or: [self hasUnparsedEntities]]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasGeneralEntities [
	"direct access to avoid lazy initialization"
	^ generalEntities notNil
		and: [generalEntities notEmpty]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasNotationAttributeValidators [
	^ self hasAttributeValidators
		and: [self unparsedEntityValidator hasNotationAttributeValidators]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasNotations [
	"direct access to avoid lazy initialization"
	^ notations notNil
		and: [notations notEmpty]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasParameterEntities [
	"direct access to avoid lazy initialization"
	^ parameterEntities notNil
		and: [parameterEntities notEmpty]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasRoot [
	^ root notNil and: [root notEmpty]
]

{ #category : #testing }
DTDDoctypeDefinition >> hasUnparsedEntities [
	"direct access to avoid lazy initialization"
	^ unparsedEntities notNil
		and: [unparsedEntities notEmpty]
]

{ #category : #'instance creation' }
DTDDoctypeDefinition >> newValidator [
	^ DTDDocumentValidator doctypeDefinition: self
]

{ #category : #accessing }
DTDDoctypeDefinition >> notations [
	^ notations ifNil: [notations := Dictionary new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> parameterEntities [
	^ parameterEntities ifNil: [parameterEntities := Dictionary new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> parameterEntityAt: aName [
	^ self
		parameterEntityAt: aName
		ifAbsent: [nil]
]

{ #category : #accessing }
DTDDoctypeDefinition >> parameterEntityAt: aName ifAbsent: aBlock [
	^ self parameterEntities
		at: aName
		ifAbsent: aBlock
]

{ #category : #processing }
DTDDoctypeDefinition >> processStartTag: anElement attributes: aDictionary [
	self hasAttributeValidators
		ifFalse: [^ self].
	(self
		attributeValidatorsAt: anElement
		ifAbsent: [^ self])
		valuesDo: [:each | each processAttributes: aDictionary]
]

{ #category : #removing }
DTDDoctypeDefinition >> removeElementIDReferences [
	self hasElementIDReferences
		ifTrue: [self elementIDValidator removeIDReferences]
]

{ #category : #removing }
DTDDoctypeDefinition >> removeElementIDs [
	self hasElementIDs
		ifTrue: [self elementIDValidator removeIDs]
]

{ #category : #accessing }
DTDDoctypeDefinition >> root [
	^ root ifNil: [root := '']
]

{ #category : #accessing }
DTDDoctypeDefinition >> root: aRootElement [
	root := aRootElement
]

{ #category : #accessing }
DTDDoctypeDefinition >> unparsedEntities [
	^ unparsedEntities ifNil: [unparsedEntities := Dictionary new]
]

{ #category : #accessing }
DTDDoctypeDefinition >> unparsedEntityValidator [
	^ unparsedEntityValidator
		ifNil: [
			unparsedEntityValidator :=
				XMLUnparsedEntityValidator
					unparsedEntities: self unparsedEntities
					notations: self notations]
]

{ #category : #validation }
DTDDoctypeDefinition >> validateCompletedDefinition [
	self hasUnparsedEntities
		ifTrue: [self unparsedEntityValidator validateUnparsedEntityDeclarations].
	self hasNotationAttributeValidators
		ifTrue: [self unparsedEntityValidator validateNotationAttributeDeclarationDefaults].
]
