"
This is a class for automatic encoding detection of streams that infers explicit encodings from a leading byte order mark (BOM) sequence and implicit encodings from a sequence of one or three null bytes before or after a leading ASCII character (implicit UTF 16/32).

(It actually implements the YAML implicit encoding detection algorithm, looking for any leading ASCII char, not just '<', before or after a null byte sequence. This algorithm is more general than the XML one, supporting non-XML text, and since the XML one is in a ""(Non-Normative)"" section of the spec, we don't actually have to implement it.)
"
Class {
	#name : #XMLImplicitEncodingDetector,
	#superclass : #XMLEncodingDetector,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLImplicitEncodingDetector >> detectsImplicitEncodings [
	^ true
]
