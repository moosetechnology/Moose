"
This class writes <?...?> processing instructions, but not in DTD internal subsets if canonical XML is enabled.
"
Class {
	#name : #XMLPIWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'target',
		'data'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLPIWriter >> data [
	^ data ifNil: ['']
]

{ #category : #accessing }
XMLPIWriter >> data: aString [
	data := aString
]

{ #category : #testing }
XMLPIWriter >> hasData [
	^ self data notEmpty
]

{ #category : #testing }
XMLPIWriter >> isDataOmittable [
	^ self hasData not
]

{ #category : #testing }
XMLPIWriter >> isOmittable [
	^ self isCanonical
		and: [self isEmbeddedInDoctypeDeclaration]
]

{ #category : #accessing }
XMLPIWriter >> target [
	^ target ifNil: ['']
]

{ #category : #accessing }
XMLPIWriter >> target: aString [
	target := aString
]

{ #category : #private }
XMLPIWriter >> writeBody [
	(self isOmittable
		or: [self isDataOmittable])
		ifFalse: [self writeData]
]

{ #category : #private }
XMLPIWriter >> writeData [
	| dataString dataStringSize quotedStringStart quotedStringNameStart quote |

	self writer space.
	dataString := self data.
	dataStringSize := dataString size.
	1 to: dataStringSize do: [:i | | nextChar |
		nextChar := dataString at: i.
		quotedStringStart
			ifNil: [
				quotedStringNameStart
					ifNil: [
						nextChar isXMLWriterNameStartChar
							ifTrue: [quotedStringNameStart := i]
							ifFalse: [
								(nextChar == $"
									or: [nextChar == $'])
									ifTrue: [
										quote := nextChar.
										quotedStringStart := i]
									ifFalse: [self writer nextPut: nextChar]]]
					ifNotNil: [
						nextChar isXMLWriterNameChar
							ifFalse: [
								self writer writeStringName:
									(dataString
										copyFrom: quotedStringNameStart
										to: i - 1).
								quotedStringNameStart := nil.
								(nextChar == $"
									or: [nextChar == $'])
									ifTrue: [
										quote := nextChar.
										quotedStringStart := i]
									ifFalse: [self writer nextPut: nextChar]]]]
			ifNotNil: [
				nextChar == quote
					ifTrue: [
						self writer
							writeUnescapedString:
								(dataString
									copyFrom: quotedStringStart + 1
									to: i - 1)
							quotedBy: quote.
						quotedStringStart := nil]]].

	quotedStringStart
		ifNil: [
			quotedStringNameStart
				ifNotNil: [
					self writer writeStringName:
						(dataString
							copyFrom: quotedStringNameStart
							to: dataStringSize)]]
		ifNotNil: [
			"allow unterminated strings, because PIs can contain arbitrary data"
			self writer nextPutAll:
				(dataString
					copyFrom: quotedStringStart
					to: dataStringSize)].
]

{ #category : #private }
XMLPIWriter >> writeEpilogue [
	self isOmittable
		ifFalse: [
			self writer
				nextPutAll: '?>';
				formatAfterPI: self]
]

{ #category : #private }
XMLPIWriter >> writePrologue [
	self isOmittable
		ifFalse: [
			self writer
				formatBeforePI: self;
				nextPutAll: '<?';
				"do not treat PI targets as names to be consistent
				with XMLXMLDeclarationWriter"
				nextPutAll: self target]
]
