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
