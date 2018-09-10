Class {
	#name : #XMLDecodingReadStreamAdapterUTF8Test,
	#superclass : #XMLDecodingReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF8Test >> basicInputCollection [
	^ self encodedUTF8Binary
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF8Test >> basicInvalidInputCollections [
	^ #(
		#(16rC0 16r80) "first two byte overlong"
		#(16rC1 16rBF) "last two byte overlong"
		#(16rE0 16r80 16r80) "first three byte overlong"
		#(16rE0 16r9F 16rBF) "last three byte overlong"
		#(16rED 16rA0 16r80) "first surrogate"
		#(16rED 16rBF 16rBF) "last surrogate"
		#(16rF0 16r80 16r80 16r80) "first four byte overlong"
		#(16rF0 16r8F 16rBF 16rBF) "last four byte overlong"
		#(16rF4 16r9F 16rBF 16rBF) "greater than U+10FFFF"
		#(16r80) "illegal lead byte"
		#(16r8F) "illegal lead byte"
		#(16rF8) "illegal lead byte"
		#(16rF8 16r80 16r80 16r80) "illegal lead byte"
		#(16rF8 16r80 16r80 16r80 16r80) "illegal lead byte"
		#(16rFF) "illegal lead byte"
		#(16rFF 16r80 16r80 16r80) "illegal lead byte"
		#(16rFF 16r80 16r80 16r80 16r80) "illegal lead byte"
		#(16rC0) "missing second byte"
		#(16rC0 16r00) "illegal second byte"
		#(16rC0 16rC0) "illegal second byte"
		#(16rC0 16rFF) "illegal second byte"
		#(16rE0 16r80) "missing third byte"
		#(16rE0 16r80 16r00) "illegal third byte"
		#(16rE0 16r80 16rC0) "illegal third byte"
		#(16rE0 16r80 16rFF) "illegal third byte"
		#(16rF0 16r80 16r80) "missing fourth byte"
		#(16rF0 16r80 16r80 16r00) "illegal fourth byte"
		#(16rF0 16r80 16r80 16rC0) "illegal fourth byte"
		#(16rF0 16r80 16r80 16rFF) "illegal fourth byte"
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF8Test >> basicOutputCollection [
	^ self decodedUTF8String
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterUTF8Test >> streamConverterClass [
	^ XMLUTF8StreamConverter
]
