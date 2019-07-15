Class {
	#name : #XMLNullStreamConverterTest,
	#superclass : #XMLStreamConverterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLNullStreamConverterTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLNullStreamConverterTest >> streamConverterClass [
	^ XMLNullStreamConverter
]
