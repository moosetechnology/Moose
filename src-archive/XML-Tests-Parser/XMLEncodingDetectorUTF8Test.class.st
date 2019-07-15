Class {
	#name : #XMLEncodingDetectorUTF8Test,
	#superclass : #XMLEncodingDetectorTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLEncodingDetectorUTF8Test class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLEncodingDetectorUTF8Test >> basicImplicitEncodedInputCollections [
	^ #(
		#(16r01)
		#(16r0F)
		#(16r7F)
		#(16rC2 16r80)
		#(16rDF 16rBF)
		#(16rE0 16rA0 16r80)
		#(16rEF 16rBB 16rBE)
		#(16rEF 16rBF 16rBF)
		#(16rF0 16r90 16r80 16r80)
		#(16rF4 16r8F 16rBF 16rBF)
		#(16r0 16rC2 16r80)
		#(16r0 16rDF 16rBF)
		#(16r0 16rE0 16rA0 16r80)
		#(16r0 16rEF 16rBB 16rBE)
		#(16r0 16rEF 16rBF 16rBF)
		#(16r0 16rF0 16r90 16r80 16r80)
		#(16r0 16rF4 16r8F 16rBF 16rBF)
		#(16r0 16r0 16rC2 16r80)
		#(16r0 16r0 16rDF 16rBF)
		#(16r0 16r0 16rE0 16rA0 16r80)
		#(16r0 16r0 16rEF 16rBB 16rBE)
		#(16r0 16r0 16rEF 16rBF 16rBF)
		#(16r0 16r0 16rF0 16r90 16r80 16r80)
		#(16r0 16r0 16rF4 16r8F 16rBF 16rBF)
		#(16r0 16r0 16r0 16rC2 16r80)
		#(16r0 16r0 16r0 16rDF 16rBF)
		#(16r0 16r0 16r0 16rE0 16rA0 16r80)
		#(16r0 16r0 16r0 16rEF 16rBB 16rBE)
		#(16r0 16r0 16r0 16rEF 16rBF 16rBF)
		#(16r0 16r0 16r0 16rF0 16r90 16r80 16r80)
		#(16r0 16r0 16r0 16rF4 16r8F 16rBF 16rBF)
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLEncodingDetectorUTF8Test >> basicInvalidImplicitEncodedInputCollections [
	^ #(
		#(16r80)
		#(16rBF)
		#(16rF8)
		#(16rFF)
		#(16rEF 16rFB 16rBF) "BOM with both partiy bits in the second byte set"
		#(16rEF 16r3B 16rBF) "BOM with both parity bits in the second byte unset"
		#(16rEF 16rBB 16rFF) "BOM with both partiy bits in the third byte set"
		#(16rEF 16rBB 16r3F) "BOM with both parity bits in the third byte unset"
	) collect: [:each | each asByteArray]
]

{ #category : #accessing }
XMLEncodingDetectorUTF8Test >> explicitStreamConverterClass [
	^ XMLUTF8StreamConverter
]

{ #category : #accessing }
XMLEncodingDetectorUTF8Test >> implicitStreamConverterClass [
	^ XMLImplicitUTF8StreamConverter
]
