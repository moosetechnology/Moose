Class {
	#name : #XMLEncodingWriteStreamAdapterUTF32BETest,
	#superclass : #XMLEncodingWriteStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF32BETest >> basicInputCollection [
	^ self decodedUTF32String
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF32BETest >> basicInvalidInputCollections [
	^ self basicInvalidUTFInputCollections
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF32BETest >> basicOutputCollection [
	^ self encodedUTF32BEBinary
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterUTF32BETest >> streamConverterClass [
	^ XMLUTF32BigEndianStreamConverter
]
