"
This class validates documents using a DTD.
"
Class {
	#name : #DTDDocumentValidator,
	#superclass : #XMLDocumentValidator,
	#instVars : [
		'doctypeDefinition'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDDocumentValidator class >> doctypeDefinition: aDoctypeDefinition [
	^ self new doctypeDefinition: aDoctypeDefinition
]

{ #category : #accessing }
DTDDocumentValidator >> attributeValidatorsFor: anElement ifNone: aBlock [
	^ self doctypeDefinition
		attributeValidatorsAt: anElement
		ifAbsent: aBlock
]

{ #category : #accessing }
DTDDocumentValidator >> doctypeDefinition [
	^ doctypeDefinition
]

{ #category : #accessing }
DTDDocumentValidator >> doctypeDefinition: aDoctypeDefinition [
	doctypeDefinition := aDoctypeDefinition
]

{ #category : #accessing }
DTDDocumentValidator >> elementValidatorFor: anElement ifNone: aBlock [
	^ self doctypeDefinition
		elementValidatorsAt: anElement
		ifAbsent: aBlock
]

{ #category : #private }
DTDDocumentValidator >> errorInvalidRootElement: anElement [
	XMLValidationException
		formatSignal:
			'Root element must be <{1}> according to DOCTYPE declaration, not <{2}>'
		with: self doctypeDefinition root
		with: anElement
]

{ #category : #testing }
DTDDocumentValidator >> hasAttributeValidators [
	^ self doctypeDefinition hasAttributeValidators
]

{ #category : #testing }
DTDDocumentValidator >> hasElementValidators [
	^ self doctypeDefinition hasElementValidators
]

{ #category : #validating }
DTDDocumentValidator >> unvalidatedAttributes: anAttributeCollection inElement: anElement [
	XMLValidationException
		formatSignal: 'Undeclared attribute "{1}" in element <{2}>'
		with: anAttributeCollection anyOne
		with: anElement
]

{ #category : #validating }
DTDDocumentValidator >> unvalidatedElement: anElement [
	XMLValidationException
		formatSignal: 'Undeclared element <{1}>'
		with: anElement
]

{ #category : #validating }
DTDDocumentValidator >> validateIDReferences [
	self doctypeDefinition hasElementIDReferences
		ifTrue: [self doctypeDefinition elementIDValidator validateIDReferences]
]

{ #category : #validating }
DTDDocumentValidator >> validateRootElement: anElement [
	(self doctypeDefinition hasRoot
		and: [self doctypeDefinition root ~= anElement])
		ifTrue: [self errorInvalidRootElement: anElement]
]
