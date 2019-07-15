Class {
	#name : #XMLDecodingReadStreamAdapterUTF32LETest,
	#superclass : #XMLDecodingReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF32LETest >> basicInputCollection [
	^ self encodedUTF32LEBinary
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF32LETest >> basicInvalidInputCollections [
	^ #(
		#(16r00 16rD8 16r00 16r00) "first surrogate code point"
		#(16rFF 16rDB 16r00 16r00) "last surrogate code point"
		#(16r00 16r00 16r11 16r00) "greater than U+10FFFF"
		#(16r01 16r00 16r00) "greater than U+10FFFF"
		#(16r00) "incomplete"
		#(16rFF) "incomplete"
		#(16r00 16r00) "incomplete"
		#(16rFF 16r00) "incomplete"
		#(16r00 16r00 16r00) "incomplete"
		#(16rFF 16r00 16r00) "incomplete"
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF32LETest >> basicOutputCollection [
	^ self decodedUTF32String
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF32LETest >> streamConverterClass [
	^ XMLUTF32LittleEndianStreamConverter
]
