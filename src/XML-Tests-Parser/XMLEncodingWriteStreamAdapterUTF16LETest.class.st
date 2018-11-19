Class {
	#name : #XMLEncodingWriteStreamAdapterUTF16LETest,
	#superclass : #XMLEncodingWriteStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16LETest >> basicInputCollection [
	^ self decodedUTF16String
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16LETest >> basicInvalidInputCollections [
	^ self basicInvalidUTFInputCollections
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16LETest >> basicOutputCollection [
	^ self encodedUTF16LEBinary
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF16LETest >> streamConverterClass [
	^ XMLUTF16LittleEndianStreamConverter
]
