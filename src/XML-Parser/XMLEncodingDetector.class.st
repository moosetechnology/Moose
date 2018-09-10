"
This is a class for automatic encoding detection of streams that infers encodings from a leading byte order mark (BOM) sequence.
"
Class {
	#name : #XMLEncodingDetector,
	#superclass : #Object,
	#instVars : [
		'stream',
		'startPosition'
	],
	#classVars : [
		'UTF16BigEndianBOMBytes',
		'UTF32BigEndianBOMBytes',
		'UTF32LittleEndianBOMBytes',
		'UTF8BOMBytes'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #'class initialization' }
XMLEncodingDetector class >> initialize [
	"self initialize"

	"stored in class vars for faster access"
	UTF8BOMBytes :=
		XMLUTF8StreamConverter byteOrderMarkBytes.
	UTF16BigEndianBOMBytes :=
		XMLUTF16BigEndianStreamConverter byteOrderMarkBytes.
	UTF32BigEndianBOMBytes :=
		XMLUTF32BigEndianStreamConverter byteOrderMarkBytes.
	UTF32LittleEndianBOMBytes :=
		XMLUTF32LittleEndianStreamConverter byteOrderMarkBytes.
]

{ #category : #'instance creation' }
XMLEncodingDetector class >> on: aStream [
	^ self new on: aStream
]

{ #category : #private }
XMLEncodingDetector >> atEnd [
	^ stream atEnd
]

{ #category : #private }
XMLEncodingDetector >> detectBigEndianUTF16BOM [
	2 to: UTF16BigEndianBOMBytes size do: [:i |
		self next == (UTF16BigEndianBOMBytes at: i)
			ifFalse: [
				self resetStreamToStartPosition.
				"no legal UTF-8 byte sequence begins with 16rFE, and:
					UTF16BigEndianBOMBytes first = 16rFE
				so it can't be implicit UTF-8"
				^ nil]].
	^ XMLUTF16BigEndianStreamConverter new.
]

{ #category : #private }
XMLEncodingDetector >> detectBigEndianUTF32BOMOrImplicitEncoding [
	2 to: UTF32BigEndianBOMBytes size do: [:i |
		self peek == (UTF32BigEndianBOMBytes at: i)
			ifTrue: [self next]
			ifFalse: [| implicitConverterClass |
				self detectsImplicitEncodings
					ifTrue: [
						i = 2
							ifTrue: [
								"(UTF32BigEndianBOMBytes at: 1) isZero"
								self peekForASCII
									ifTrue: [
										"null char followed by an ASCII char;
										implicit UTF-16 BE"
										implicitConverterClass :=
											XMLImplicitUTF16BigEndianStreamConverter]]
							ifFalse: [
								i = 3
									ifTrue: [
										"(UTF32BigEndianBOMBytes at: 2) isZero"
										(self peekForNull
											and: [self peekForASCII]) 
											ifTrue: [
												"three null chars followed by an ASCII char;
												implicit UTF-32 BE"
												implicitConverterClass :=
													XMLImplicitUTF32BigEndianStreamConverter]]].
						(implicitConverterClass isNil
							and: [self peekForUTF8LeadingByte])
							ifTrue: [
								"any number of null chars followed by a leading UTF-8
								byte char; implicit UTF-8"
								implicitConverterClass :=
									XMLImplicitUTF8StreamConverter]].
				self resetStreamToStartPosition.
				^ implicitConverterClass
					ifNotNil: [implicitConverterClass new]]].
	^ XMLUTF32BigEndianStreamConverter new.
]

{ #category : #private }
XMLEncodingDetector >> detectLittleEndianImplicitEncoding [
	| implicitConverterClass |

	self detectsImplicitEncodings
		ifTrue: [
			implicitConverterClass :=
				self peekForNull
					ifTrue: [		
						(self peekForNull
							and: [self peekForNull])
							ifTrue: [
								"a leading ASCII char followed by three nulls;
								implicit little endian UTF-32"
								XMLImplicitUTF32LittleEndianStreamConverter]
							ifFalse: [
								"a leading ASCII char followed by just one null;
								implicit little endian UTF-16"
								XMLImplicitUTF16LittleEndianStreamConverter]]
					ifFalse: [
						"an ASCII char; assume it's UTF-8"
						XMLImplicitUTF8StreamConverter]].

	self resetStreamToStartPosition.
	^ implicitConverterClass
		ifNotNil: [implicitConverterClass new].
]

{ #category : #private }
XMLEncodingDetector >> detectLittleEndianUTF32Or16BOM [
	2 to: UTF32LittleEndianBOMBytes size do: [:i |
		self peek == (UTF32LittleEndianBOMBytes at: i)
			ifTrue: [self next]
			ifFalse: [
				i > 2
					ifTrue: [
						"the 2 byte UTF-16 BOM begins the 4 byte UTF-32 BOM:
							UTF32LittleEndianBOMBytes beginsWith:
								XMLUTF16LittleEndianStreamConverter byteOrderMarkBytes"
						stream position: startPosition + 2.
						^ XMLUTF16LittleEndianStreamConverter new]
					ifFalse: [
						self resetStreamToStartPosition.
						"no legal UTF-8 byte sequence begins with 16rFF, and:
							UTF32LittleEndianBOMBytes first = 16rFF
						so it can't be implicit UTF-8"
						^ nil]]].
	^ XMLUTF32LittleEndianStreamConverter new.
]

{ #category : #private }
XMLEncodingDetector >> detectUTF8BOM [
	2 to: UTF8BOMBytes size do: [:i |
		self peek == (UTF8BOMBytes at: i)
			ifTrue: [self next]
			ifFalse: [| implicitConverter |
				(self detectsImplicitEncodings
					and: [self peekForUTF8NonLeadingByte])
					ifTrue: [implicitConverter := XMLImplicitUTF8StreamConverter new].
				self resetStreamToStartPosition.
				^ implicitConverter]].
	^ XMLUTF8StreamConverter new.
]

{ #category : #testing }
XMLEncodingDetector >> detectsImplicitEncodings [
	^ false
]

{ #category : #private }
XMLEncodingDetector >> isUTF8LeadingByte: aByte [
	^ aByte < 16r80
		or: [aByte < 16rF8
			and: [(aByte bitAnd: 16rE0) == 16rC0
				or: [(aByte bitAnd: 16rF0) == 16rE0
					or: [(aByte bitAnd: 16rF8) == 16rF0]]]]
]

{ #category : #private }
XMLEncodingDetector >> next [
	stream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ stream next asInteger]
]

{ #category : #initialization }
XMLEncodingDetector >> on: aStream [
	stream := aStream.
	startPosition := aStream position.
]

{ #category : #private }
XMLEncodingDetector >> peek [
	stream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ stream peek asInteger]
]

{ #category : #private }
XMLEncodingDetector >> peekForASCII [
	| byte |

	((byte := self peek) notNil
		and: [byte < 16r80])
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #private }
XMLEncodingDetector >> peekForNull [
	self peek == 0
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #private }
XMLEncodingDetector >> peekForUTF8LeadingByte [
	| byte |

	((byte := self peek) notNil
		and: [self isUTF8LeadingByte: byte])
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #private }
XMLEncodingDetector >> peekForUTF8NonLeadingByte [
	| byte |

	((byte := self peek) notNil
		and: [byte < 16rC0
			and: [byte > 16r80]])
		ifTrue: [
			self next.
			^ true]
		ifFalse: [^ false]
]

{ #category : #private }
XMLEncodingDetector >> resetStreamToStartPosition [
	stream position: startPosition
]

{ #category : #detecting }
XMLEncodingDetector >> streamConverterForEncoding [
	| byte |

	(byte := self next)
		ifNil: [^ nil].

	byte == 0
		ifTrue: [^ self detectBigEndianUTF32BOMOrImplicitEncoding].

	byte < 16r80
		ifTrue: [^ self detectLittleEndianImplicitEncoding].

	"(UTF8BOMBytes at: 1) >= 16r80"
	byte == (UTF8BOMBytes at: 1)
		ifTrue: [^ self detectUTF8BOM].

	"(UTF16BigEndianBOMBytes at: 1) >= 16r80"
	byte == (UTF16BigEndianBOMBytes at: 1)
		ifTrue: [^ self detectBigEndianUTF16BOM].

	"(UTF32LittleEndianBOMBytes at: 1) >= 16r80"
	byte == (UTF32LittleEndianBOMBytes at: 1)
		ifTrue: [^ self detectLittleEndianUTF32Or16BOM].

	self resetStreamToStartPosition.
	^ (self detectsImplicitEncodings
		and: [self isUTF8LeadingByte: byte])
		ifTrue: [XMLImplicitUTF8StreamConverter new]
		ifFalse: [nil].
]
