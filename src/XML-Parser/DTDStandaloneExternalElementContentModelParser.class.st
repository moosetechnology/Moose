"
This class parses standalone externally defined element content models and returns XMLElementValidators for them. Validators for content models that specify element content like ""(one|two+)"" won't treat whitespace as ignorable.
"
Class {
	#name : #DTDStandaloneExternalElementContentModelParser,
	#superclass : #DTDElementContentModelParser,
	#category : #'XML-Parser-DTD-Standalone'
}

{ #category : #defaults }
DTDStandaloneExternalElementContentModelParser >> elementValidatorClass [
	^ XMLStandaloneExternalDFAElementContentElementValidator
]
