Class {
	#name : #XMLEncodingDetectorUTF16LETest,
	#superclass : #XMLEncodingDetectorTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLEncodingDetectorUTF16LETest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLEncodingDetectorUTF16LETest >> basicImplicitEncodedInputCollections [
	^ #(
		#(16r01 16r00)
		#(16r0F 16r00)
		#(16r7F 16r00)
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLEncodingDetectorUTF16LETest >> explicitStreamConverterClass [
	^ XMLUTF16LittleEndianStreamConverter
]

{ #category : #accessing }
XMLEncodingDetectorUTF16LETest >> implicitStreamConverterClass [
	^ XMLImplicitUTF16LittleEndianStreamConverter
]
