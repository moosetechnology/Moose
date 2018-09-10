"
This class will put a default value for an attribute if the attribute is absent and also makes sure that any value matches the default (the #FIXED constraint).
"
Class {
	#name : #XMLAttributeFixedValueDefaultValidator,
	#superclass : #XMLAttributeValueDefaultValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLAttributeFixedValueDefaultValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalAttributeFixedValueDefaultValidator
]

{ #category : #private }
XMLAttributeFixedValueDefaultValidator >> errorFixedAttributeValueCannotChange [
	XMLValidationException
		formatSignal: 'Fixed attribute "{1}" can only have "{2}" as its value'
		with: self attribute
		with: self value
]

{ #category : #testing }
XMLAttributeFixedValueDefaultValidator >> isFixedValue [
	^ true
]

{ #category : #processing }
XMLAttributeFixedValueDefaultValidator >> processedDefaultForPresentAttributeValue: anAttributeValue [
	^ self value
]

{ #category : #validating }
XMLAttributeFixedValueDefaultValidator >> validatedDefaultForPresentAttributeValue: anAttributeValue [
	anAttributeValue = self value
		ifFalse: [self errorFixedAttributeValueCannotChange].
	^ anAttributeValue.
]
