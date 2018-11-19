"
This class writes <?xml ...?> declarations, but not if canonical XML is enabled.
"
Class {
	#name : #XMLXMLDeclarationWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'encoding',
		'version',
		'standalone'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLXMLDeclarationWriter >> encoding [
	^ encoding ifNil: [encoding := '']
]

{ #category : #accessing }
XMLXMLDeclarationWriter >> encoding: anEncoding [
	encoding := anEncoding
]

{ #category : #testing }
XMLXMLDeclarationWriter >> hasEncoding [
	^ self encoding notEmpty
]

{ #category : #testing }
XMLXMLDeclarationWriter >> isOmittable [
	^ self isCanonical
]

{ #category : #testing }
XMLXMLDeclarationWriter >> isStandalone [
	^ self standalone
]

{ #category : #accessing }
XMLXMLDeclarationWriter >> isStandalone: aBoolean [
	self standalone: aBoolean
]

{ #category : #accessing }
XMLXMLDeclarationWriter >> standalone [
	^ standalone ifNil: [standalone := false]
]

{ #category : #accessing }
XMLXMLDeclarationWriter >> standalone: aBooleanOrString [
	standalone :=
		aBooleanOrString isString
			ifTrue: [aBooleanOrString = 'yes']
			ifFalse: [aBooleanOrString]
]

{ #category : #accessing }
XMLXMLDeclarationWriter >> version [
	(version isNil
		or: [version isEmpty])
		ifTrue: [version := '1.0'].
	^ version.
]

{ #category : #accessing }
XMLXMLDeclarationWriter >> version: aVersionNumberOrString [
	version :=
		aVersionNumberOrString isNumber
			ifTrue: [aVersionNumberOrString printShowingDecimalPlaces: 1]
			ifFalse: [| string |
				string := (aVersionNumberOrString ifNil: ['1.0']) asString.
				"avoid #first: for portability"
				string
					copyFrom: 1
					to: (string size min: 3)]
]

{ #category : #private }
XMLXMLDeclarationWriter >> writeBody [
	self isOmittable
		ifFalse: [
			self
				writeVersion;
				writeEncoding;
				writeStandalone]
]

{ #category : #private }
XMLXMLDeclarationWriter >> writeEncoding [
	self hasEncoding
		ifTrue: [
			self writer
				writeAttributeName: 'encoding'
				unescapedValue: self encoding]
]

{ #category : #private }
XMLXMLDeclarationWriter >> writeEpilogue [
	self isOmittable
		ifFalse: [
			self writer
				nextPutAll: '?>';
				formatAfterXMLDeclaration: self]
]

{ #category : #private }
XMLXMLDeclarationWriter >> writePrologue [
	self isOmittable
		ifFalse: [
			self writer
				formatBeforeXMLDeclaration: self;
				nextPutAll: '<?xml']
]

{ #category : #private }
XMLXMLDeclarationWriter >> writeStandalone [
	self standalone
		ifTrue: [
			self writer
				writeAttributeName: 'standalone'
				unescapedValue: 'yes']
]

{ #category : #private }
XMLXMLDeclarationWriter >> writeVersion [
	self writer
		writeAttributeName: 'version'
		unescapedValue: self version
]
