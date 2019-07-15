Class {
	#name : #XMLEncodingWriteStreamAdapterASCIITest,
	#superclass : #XMLEncodingWriteStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLEncodingWriteStreamAdapterASCIITest >> basicInputCollection [
	^ self decodedASCIIString
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterASCIITest >> basicInvalidInputCollections [
	^ self basicInvalidLatin1InputCollections,
		((16r80 to: 16rFF) asArray collect: [:each |
			String with: each asCharacter])
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterASCIITest >> basicOutputCollection [
	^ self encodedASCIIBinary
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterASCIITest >> streamConverterClass [
	^ XMLASCIIStreamConverter
]
