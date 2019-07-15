Class {
	#name : #XMLEncodingDetectorUTF32LETest,
	#superclass : #XMLEncodingDetectorTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLEncodingDetectorUTF32LETest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLEncodingDetectorUTF32LETest >> basicImplicitEncodedInputCollections [
	^ #(
		#(16r01 16r00 16r00 16r00)
		#(16r0F 16r00 16r00 16r00)
		#(16r7F 16r00 16r00 16r00)
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLEncodingDetectorUTF32LETest >> explicitStreamConverterClass [
	^ XMLUTF32LittleEndianStreamConverter
]

{ #category : #accessing }
XMLEncodingDetectorUTF32LETest >> implicitStreamConverterClass [
	^ XMLImplicitUTF32LittleEndianStreamConverter
]
