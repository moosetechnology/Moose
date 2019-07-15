Class {
	#name : #XMLLatin1StreamConverterTest,
	#superclass : #XMLStreamConverterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLLatin1StreamConverterTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLLatin1StreamConverterTest >> primaryEncodingName [
	^ 'Latin-1'
]

{ #category : #accessing }
XMLLatin1StreamConverterTest >> streamConverterClass [
	^ XMLLatin1StreamConverter
]
