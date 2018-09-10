Class {
	#name : #XMLFileHandleUTF16LETest,
	#superclass : #XMLFileHandleTest,
	#category : #'XML-Tests-Parser-Files'
}

{ #category : #accessing }
XMLFileHandleUTF16LETest >> decodedFileContents [
	^ XMLStreamAdapterTest decodedUTF16String
]

{ #category : #accessing }
XMLFileHandleUTF16LETest >> encodedFileContents [
	^ XMLStreamAdapterTest encodedUTF16LEBinary
]

{ #category : #accessing }
XMLFileHandleUTF16LETest >> streamConverterClass [
	^ XMLUTF16LittleEndianStreamConverter
]
