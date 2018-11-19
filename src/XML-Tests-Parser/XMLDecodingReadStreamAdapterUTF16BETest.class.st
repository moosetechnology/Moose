Class {
	#name : #XMLDecodingReadStreamAdapterUTF16BETest,
	#superclass : #XMLDecodingReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF16BETest >> basicInputCollection [
	^ self encodedUTF16BEBinary
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF16BETest >> basicInvalidInputCollections [
	"code points greater than U+10FFFF can't be encoded using UTF-16, so
	they aren't tested for here"
	^ #(
		#(16rDC 16r00 16rDC 16r00) "first illegal leading surrogate"
		#(16rDF 16rFF 16rDC 16r00) "last illegal leading surrogate"
		#(16rD8 16r00 16rD8 16r00) "first illegal trailing surrogate"
		#(16rD8 16r00 16rDB 16rFF) "last illegal trailing surrogate"
		#(16r00) "incomplete"
		#(16rFF) "incomplete"
		#(16rD8 16r00) "incomplete surrogate pair"
		#(16rD8 16r00 16rDC) "incomplete surrogate pair"
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF16BETest >> basicOutputCollection [
	^ self decodedUTF16String
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF16BETest >> streamConverterClass [
	^ XMLUTF16BigEndianStreamConverter
]
