Class {
	#name : #XMLEncodingWriteStreamAdapterUTF16BETest,
	#superclass : #XMLEncodingWriteStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16BETest >> basicInputCollection [
	^ self decodedUTF16String
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16BETest >> basicInvalidInputCollections [
	^ self basicInvalidUTFInputCollections
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16BETest >> basicOutputCollection [
	^ self encodedUTF16BEBinary
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16BETest >> streamConverterClass [
	^ XMLUTF16BigEndianStreamConverter
]
