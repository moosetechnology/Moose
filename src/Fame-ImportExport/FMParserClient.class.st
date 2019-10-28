Class {
	#name : #FMParserClient,
	#superclass : #Object,
	#category : #'Fame-ImportExport'
}

{ #category : #parsing }
FMParserClient >> beginAttribute: name [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> beginDocument [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> beginElement: name [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> endAttribute: name [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> endDocument [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> endElement: name [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> inAttribute: aString do: aBlock [
	self beginAttribute: aString.
	aBlock value.
	self endAttribute: aString
]

{ #category : #parsing }
FMParserClient >> inDocumentDo: aBlock [
	self beginDocument.
	aBlock value.
	self endDocument
]

{ #category : #parsing }
FMParserClient >> inElement: aString do: aBlock [
	self beginElement: aString.
	aBlock value.
	self endElement: aString
]

{ #category : #parsing }
FMParserClient >> primitive: value [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> referenceName: name [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> referenceNumber: index [
	^self subclassResponsibility
]

{ #category : #parsing }
FMParserClient >> serial: index [
	^self subclassResponsibility
]
