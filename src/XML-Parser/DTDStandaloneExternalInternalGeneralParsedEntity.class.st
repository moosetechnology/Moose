"
This is a class for standalone externally defined external general entities that cannot be referenced in documents except in ATTLIST attribute declaration default values.
"
Class {
	#name : #DTDStandaloneExternalInternalGeneralParsedEntity,
	#superclass : #DTDInternalGeneralParsedEntity,
	#category : #'XML-Parser-DTD-Standalone'
}

{ #category : #testing }
DTDStandaloneExternalInternalGeneralParsedEntity >> isStandaloneExternal [
	^ true
]
