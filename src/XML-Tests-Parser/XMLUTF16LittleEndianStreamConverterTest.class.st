Class {
	#name : #XMLUTF16LittleEndianStreamConverterTest,
	#superclass : #XMLStreamConverterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLUTF16LittleEndianStreamConverterTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLUTF16LittleEndianStreamConverterTest >> primaryEncodingName [
	^ 'UTF-16-LE'
]

{ #category : #accessing }
XMLUTF16LittleEndianStreamConverterTest >> streamConverterClass [
	^ XMLUTF16LittleEndianStreamConverter
]
