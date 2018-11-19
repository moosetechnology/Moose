Class {
	#name : #XMLUTF16BigEndianStreamConverterTest,
	#superclass : #XMLStreamConverterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLUTF16BigEndianStreamConverterTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLUTF16BigEndianStreamConverterTest >> primaryEncodingName [
	^ 'UTF-16'
]

{ #category : #accessing }
XMLUTF16BigEndianStreamConverterTest >> streamConverterClass [
	^ XMLUTF16BigEndianStreamConverter
]
