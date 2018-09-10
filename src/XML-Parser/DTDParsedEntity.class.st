"
This is an abstract base class for parsed entities with replacements that can be inserted into an XML document.
"
Class {
	#name : #DTDParsedEntity,
	#superclass : #DTDEntity,
	#category : #'XML-Parser-DTD'
}

{ #category : #converting }
DTDParsedEntity >> asPushedBackEntity [
	^ self isParameter
		ifTrue: [XMLPushedBackParameterEntity entity: self]
		ifFalse: [XMLPushedBackGeneralEntity entity: self]
]

{ #category : #testing }
DTDParsedEntity >> hasReplacement [
	self subclassResponsibility
]

{ #category : #accessing }
DTDParsedEntity >> replacement [
	self subclassResponsibility
]

{ #category : #accessing }
DTDParsedEntity >> replacementStream [
	self subclassResponsibility
]
