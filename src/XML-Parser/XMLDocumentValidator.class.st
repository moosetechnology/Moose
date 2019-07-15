"
This is a base class for XML document validators.
"
Class {
	#name : #XMLDocumentValidator,
	#superclass : #Object,
	#instVars : [
		'elementValidatorStack',
		'defaultXMLIDValidator'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #accessing }
XMLDocumentValidator >> attributeValidatorsFor: anElement [
	^ self
		attributeValidatorsFor: anElement
		ifNone: [nil]
]

{ #category : #accessing }
XMLDocumentValidator >> attributeValidatorsFor: anElement ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLDocumentValidator >> currentElementValidator [
	^ self elementValidatorStack xmlLastOrNil
]

{ #category : #accessing }
XMLDocumentValidator >> defaultElementValidatorFor: aName [
	^ XMLAnyElementValidator element: aName
]

{ #category : #private }
XMLDocumentValidator >> defaultXMLIDValidator [
	"used to validate xml:id attributes if there's no DTD or other validators"
	^ defaultXMLIDValidator
		ifNil: [
			defaultXMLIDValidator :=
				XMLXMLIDAttributeValidator
					element: ''
					attribute: 'xml:id'
					defaultValidator:
						(XMLAttributeImpliedDefaultValidator attribute: 'xml:id').
			defaultXMLIDValidator
				elementIDValidator: XMLElementIDValidator new;
				yourself]
]

{ #category : #accessing }
XMLDocumentValidator >> elementValidatorFor: anElement [
	^ self
		elementValidatorFor: anElement
		ifNone: [nil]
]

{ #category : #accessing }
XMLDocumentValidator >> elementValidatorFor: anElement ifNone: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLDocumentValidator >> elementValidatorStack [
	^ elementValidatorStack ifNil: [elementValidatorStack := OrderedCollection new]
]

{ #category : #private }
XMLDocumentValidator >> errorUnexpectEndOfElement: anElement [
	XMLValidationException
		formatSignal: 'Element <{1}> terminated prematurely'
		with: anElement
]

{ #category : #testing }
XMLDocumentValidator >> hasAttributeValidators [
	self subclassResponsibility
]

{ #category : #testing }
XMLDocumentValidator >> hasCurrentElementValidator [
	"optimized to avoid lazy initialization"
	elementValidatorStack == nil
		ifTrue: [^ false].
	^ elementValidatorStack size > 0.
]

{ #category : #testing }
XMLDocumentValidator >> hasElementValidators [
	self subclassResponsibility
]

{ #category : #testing }
XMLDocumentValidator >> isCurrentElementWhitespaceIgnorable [
	^ self hasCurrentElementValidator
		and: [self currentElementValidator ignoresWhitespace]
]

{ #category : #printing }
XMLDocumentValidator >> printOn: aStream [
	super printOn: aStream.

	self hasCurrentElementValidator
		ifTrue: [
			aStream
				nextPut: $(;
				print: self currentElementValidator;
				nextPut: $)].
]

{ #category : #validating }
XMLDocumentValidator >> unvalidatedAttributes: anAttributeCollection inElement: anElement [
	"sent when at least one attribute of an element wasn't validated by an
	attribute validator and there are element or attribute validators defined"
]

{ #category : #validating }
XMLDocumentValidator >> unvalidatedElement: anElement [
	"sent when an element was not validated by an element validator
	and there are element or attribute validators defined"
]

{ #category : #validating }
XMLDocumentValidator >> validateAttributes: aDictionary withAttributeValidatorsFor: anElement [
	| totalUnvalidatedAttributes validatedAttributes |

	totalUnvalidatedAttributes := aDictionary size.
	(self attributeValidatorsFor: anElement)
		ifNotNil: [:attributeValidators |
			attributeValidators keysAndValuesDo: [:attribute :validator |
				(aDictionary includesKey: attribute)
					ifTrue: [
						"only initialize if needed, and as an OrderedCollection that
						is only converted to a Set later if needed, for permformance"
						(validatedAttributes
							ifNil: [
								validatedAttributes :=
									OrderedCollection new: totalUnvalidatedAttributes])
							addLast: attribute.
						totalUnvalidatedAttributes := totalUnvalidatedAttributes - 1].
				validator validateAttributes: aDictionary]].

	totalUnvalidatedAttributes > 0
		ifTrue: [
			self
				unvalidatedAttributes:
					(validatedAttributes
						ifNil: [aDictionary keys]
						ifNotNil: [| validatedAttributesSet |
							validatedAttributesSet := validatedAttributes asSet.
							aDictionary keys reject: [:each |
								validatedAttributesSet includes: each]])
				inElement: anElement].
]

{ #category : #validating }
XMLDocumentValidator >> validateComment: aString [
	self hasCurrentElementValidator
		ifTrue: [self currentElementValidator validateComment: aString]
]

{ #category : #validating }
XMLDocumentValidator >> validateEndDocument [
	self validateIDReferences
]

{ #category : #validating }
XMLDocumentValidator >> validateEndTag: anElement [
	self hasCurrentElementValidator
		ifTrue: [
			self currentElementValidator atEnd
				ifFalse: [self errorUnexpectEndOfElement: anElement].
			self elementValidatorStack removeLast]
]

{ #category : #validating }
XMLDocumentValidator >> validateIDReferences [
	self subclassResponsibility
]

{ #category : #validating }
XMLDocumentValidator >> validatePCData: aString [
	self hasCurrentElementValidator
		ifTrue: [self currentElementValidator validatePCData: aString]
]

{ #category : #validating }
XMLDocumentValidator >> validatePI: aTargetString data: aDataString [
	self hasCurrentElementValidator
		ifTrue: [
			self currentElementValidator
				validatePI: aTargetString
				data: aDataString]
]

{ #category : #validating }
XMLDocumentValidator >> validateRootElement: anElement [
]

{ #category : #validating }
XMLDocumentValidator >> validateStartTag: anElement [
	self currentElementValidator
		ifNotNil: [:elementValidator |
			elementValidator validateStartTag: anElement].

	self elementValidatorStack addLast:
		(self
			elementValidatorFor: anElement
			ifNone: [
				self
					unvalidatedElement: anElement;
					defaultElementValidatorFor: anElement]) asReadyElementValidator.
]

{ #category : #validating }
XMLDocumentValidator >> validateStartTag: anElement attributes: aDictionary [
	(self hasElementValidators
		or: [self hasAttributeValidators])
		ifTrue: [
			self validateStartTag: anElement.
			self
				validateAttributes: aDictionary
				withAttributeValidatorsFor: anElement]
]

{ #category : #validating }
XMLDocumentValidator >> validateXMLIDAttributeIn: aDictionary [
	self hasAttributeValidators
		ifFalse: [self defaultXMLIDValidator validateAttributes: aDictionary]
]
