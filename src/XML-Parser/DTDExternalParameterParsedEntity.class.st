"
This is a class for external parameter parsed entities with external replacements that can be inserted into an XML document.
"
Class {
	#name : #DTDExternalParameterParsedEntity,
	#superclass : #DTDExternalParsedEntity,
	#category : #'XML-Parser-DTD'
}

{ #category : #testing }
DTDExternalParameterParsedEntity >> isParameter [
	^ true
]
