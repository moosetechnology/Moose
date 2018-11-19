Class {
	#name : #XMLFileHandleUTF32LETest,
	#superclass : #XMLFileHandleTest,
	#category : #'XML-Tests-Parser-Files'
}

{ #category : #accessing }
XMLFileHandleUTF32LETest >> decodedFileContents [
	^ XMLStreamAdapterTest decodedUTF32String
]

{ #category : #accessing }
XMLFileHandleUTF32LETest >> encodedFileContents [
	^ XMLStreamAdapterTest encodedUTF32LEBinary
]

{ #category : #accessing }
XMLFileHandleUTF32LETest >> streamConverterClass [
	^ XMLUTF32LittleEndianStreamConverter
]
