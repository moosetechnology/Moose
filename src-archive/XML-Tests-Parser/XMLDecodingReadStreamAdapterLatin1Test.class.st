Class {
	#name : #XMLDecodingReadStreamAdapterLatin1Test,
	#superclass : #XMLDecodingReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLDecodingReadStreamAdapterLatin1Test >> basicInputCollection [
	^ self encodedLatin1Binary
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterLatin1Test >> basicOutputCollection [
	^ self decodedLatin1String
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterLatin1Test >> streamConverterClass [
	^ XMLLatin1StreamConverter
]
