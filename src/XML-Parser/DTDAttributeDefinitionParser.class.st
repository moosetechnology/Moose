"
This class parses an attribute definition in an ATTLIST declaration and returns a new XMLAttributeValidator for it. It assumes the type has already been checked for well-formedness by the tokenizer and that it contains a value like ""ID"", ""ENTITY"", or an enumeration list.
"
Class {
	#name : #DTDAttributeDefinitionParser,
	#superclass : #Object,
	#instVars : [
		'element',
		'attribute',
		'type',
		'defaultValidator',
		'enumerationListParserClass'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #private }
DTDAttributeDefinitionParser class >> attributeDefaultValidatorClassForPragma: aDefaultPragma [
	"the default pragma should have been checked for well-formedness by the
	tokenizer so it's either empty, 'FIXED', 'REQUIRED', or 'IMPLIED'"
	aDefaultPragma size > 0
		ifTrue: [
			(aDefaultPragma at: 1) == $F
				ifTrue: [^ XMLAttributeFixedValueDefaultValidator].
			(aDefaultPragma at: 1) == $I
				ifTrue: [^ XMLAttributeImpliedDefaultValidator].
			^ XMLAttributeRequiredDefaultValidator].
	^ XMLAttributeValueDefaultValidator.
]

{ #category : #'instance creation' }
DTDAttributeDefinitionParser class >> element: anElement attribute: anAttribute type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	^ self new
		setElement: anElement
		attribute: anAttribute
		type: aType
		defaultValidator:
			((self attributeDefaultValidatorClassForPragma: aDefaultPragma)
				attribute: anAttribute
				value: aDefaultValue)
]

{ #category : #private }
DTDAttributeDefinitionParser >> attributeValidatorClassForType [
	"the tokenizer should have checked the type for well-formedness
	so it's only one of CDATA, ID, IDREF, IDREFS, etc"
	
	| nextChar |

	(nextChar := type at: 1) == $C
		ifTrue: [^ XMLCDataAttributeValidator].
	nextChar == $I
		ifTrue: [
			type size = 2 "'ID' size"
				ifTrue: [
					attribute = 'xml:id'
						ifTrue: [^ XMLXMLIDAttributeValidator].
					^ XMLIDAttributeValidator].
			type size = 5 "'IDREF' size"
				ifTrue: [^ XMLIDRefAttributeValidator].
			"'IDREF' size < 'IDREFS' size"
			^ XMLIDRefsAttributeValidator].
	nextChar == $E
		ifTrue: [
			type size = 6 "'ENTITY' size"
				ifTrue: [^ XMLEntityAttributeValidator].
			"'ENTITY' size < 'ENTITIES' size"
			^ XMLEntitiesAttributeValidator].
	nextChar == $N
		ifTrue: [
			type size = 7 "'NMTOKEN' size"
				ifTrue: [^ XMLNmtokenAttributeValidator].
			type size = 8 "'NMTOKENS' size"
				ifTrue: [^ XMLNmtokensAttributeValidator].
			"'NMTOKENS' size < 'NOTATION (' size"
			enumerationListParserClass := DTDNotationEnumerationListParser.
			^ XMLNotationEnumerationAttributeValidator].

	"otherwise it's a (one|two|...) enumeration attribute"
	enumerationListParserClass := DTDEnumerationListParser.
	^ XMLEnumerationAttributeValidator.
]

{ #category : #parsing }
DTDAttributeDefinitionParser >> parse [
	| validator |
	
	validator :=
		self attributeValidatorClassForType
			element: element
			attribute: attribute
			defaultValidator: defaultValidator.

	enumerationListParserClass
		ifNotNil: [
			validator allowedValues:
				(enumerationListParserClass on: type) parse].

	^ validator.
]

{ #category : #initialization }
DTDAttributeDefinitionParser >> setElement: anElement attribute: anAttribute type: aType defaultValidator: aDefaultValidator [
	element := anElement.
	attribute := anAttribute.
	type := aType.
	defaultValidator := aDefaultValidator.
]
