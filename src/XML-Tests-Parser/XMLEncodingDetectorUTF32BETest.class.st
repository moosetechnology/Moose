Class {
	#name : #XMLEncodingDetectorUTF32BETest,
	#superclass : #XMLEncodingDetectorTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLEncodingDetectorUTF32BETest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLEncodingDetectorUTF32BETest >> basicImplicitEncodedInputCollections [
	^ #(
		#(16r00 16r00 16r00 16r01)
		#(16r00 16r00 16r00 16r0F)
		#(16r00 16r00 16r00 16r7F)
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLEncodingDetectorUTF32BETest >> explicitStreamConverterClass [
	^ XMLUTF32BigEndianStreamConverter
]

{ #category : #accessing }
XMLEncodingDetectorUTF32BETest >> implicitStreamConverterClass [
	^ XMLImplicitUTF32BigEndianStreamConverter
]
