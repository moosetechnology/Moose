Class {
	#name : #XMLASCIIStreamConverterTest,
	#superclass : #XMLStreamConverterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLASCIIStreamConverterTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLASCIIStreamConverterTest >> primaryEncodingName [
	^ 'ASCII'
]

{ #category : #accessing }
XMLASCIIStreamConverterTest >> streamConverterClass [
	^ XMLASCIIStreamConverter
]
