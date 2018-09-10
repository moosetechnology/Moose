"
This class is a read stream adapter factory for decoding content compressed with compression schemes like GZip and DEFLATE.
"
Class {
	#name : #XMLHTTPDecompressingReadStreamAdapterFactory,
	#superclass : #Object,
	#category : #'XML-Parser-HTTP'
}

{ #category : #basic }
XMLHTTPDecompressingReadStreamAdapterFactory class >> basicCanDecompressCompression: aCompressionScheme [
	^ self compressionScheme = aCompressionScheme
		and: [self isSupportedImplementation]
]

{ #category : #testing }
XMLHTTPDecompressingReadStreamAdapterFactory class >> canDecompressCompression: aCompressionScheme [
	^ self basicCanDecompressCompression: aCompressionScheme asLowercase
]

{ #category : #accessing }
XMLHTTPDecompressingReadStreamAdapterFactory class >> classForCompression: aCompressionScheme [
	| lowercaseCompressionScheme |

	lowercaseCompressionScheme := aCompressionScheme asLowercase.
	self allSubclassesDo: [:each |
		(each basicCanDecompressCompression: lowercaseCompressionScheme)
			ifTrue: [^ each]].
	^ nil.
]

{ #category : #accessing }
XMLHTTPDecompressingReadStreamAdapterFactory class >> compressionScheme [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPDecompressingReadStreamAdapterFactory class >> decompressingReadStreamAdapterClass [
	self subclassResponsibility
]

{ #category : #'private ' }
XMLHTTPDecompressingReadStreamAdapterFactory class >> errorUnsupportedCompression: aCompressionScheme [
	XMLHTTPException
		formatSignal: 'Unsupported compression scheme "{1}" for HTTP content'
		with: aCompressionScheme
]

{ #category : #testing }
XMLHTTPDecompressingReadStreamAdapterFactory class >> isSupportedImplementation [
	^ self decompressingReadStreamAdapterClass notNil
]

{ #category : #'instance creation' }
XMLHTTPDecompressingReadStreamAdapterFactory class >> on: aReadStream [
	^ self decompressingReadStreamAdapterClass on: aReadStream
]

{ #category : #'instance creation' }
XMLHTTPDecompressingReadStreamAdapterFactory class >> on: aReadStream compression: aCompressionScheme [
	^ (self classForCompression: aCompressionScheme)
		ifNil: [self errorUnsupportedCompression: aCompressionScheme]
		ifNotNil: [:classForCompression |
			classForCompression on: aReadStream]
]

{ #category : #accessing }
XMLHTTPDecompressingReadStreamAdapterFactory class >> supportedCompressionSchemes [
	| supportedCompressionSchemes |

	supportedCompressionSchemes := OrderedCollection new.
	self allSubclassesDo: [:each |
		each isSupportedImplementation
			ifTrue: [supportedCompressionSchemes addLast: each compressionScheme]].
	^ supportedCompressionSchemes.
]
