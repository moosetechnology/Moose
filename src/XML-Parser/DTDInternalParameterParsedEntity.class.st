"
This is a class for internal parameter parsed entities with replacements that can be inserted into documents.
"
Class {
	#name : #DTDInternalParameterParsedEntity,
	#superclass : #DTDInternalParsedEntity,
	#category : #'XML-Parser-DTD'
}

{ #category : #testing }
DTDInternalParameterParsedEntity >> isParameter [
	^ true
]
