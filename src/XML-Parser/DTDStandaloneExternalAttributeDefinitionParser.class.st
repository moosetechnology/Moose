"
This class parses standalone externally defined ATTLIST attribute definitions and returns XMLAttributeValidators for them that disallow attributes needing further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #DTDStandaloneExternalAttributeDefinitionParser,
	#superclass : #DTDAttributeDefinitionParser,
	#category : #'XML-Parser-DTD-Standalone'
}

{ #category : #private }
DTDStandaloneExternalAttributeDefinitionParser class >> attributeDefaultValidatorClassForPragma: aDefaultPragma [
	^ (super attributeDefaultValidatorClassForPragma: aDefaultPragma)
		standaloneExternalClass
]

{ #category : #private }
DTDStandaloneExternalAttributeDefinitionParser >> attributeValidatorClassForType [
	^ super attributeValidatorClassForType standaloneExternalClass
]
