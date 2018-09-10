"
A read stram adapter factory for the GZip compression scheme. Uses GZipReadStream if available.
"
Class {
	#name : #XMLHTTPGZipDecompressingReadStreamAdapterFactory,
	#superclass : #XMLHTTPDecompressingReadStreamAdapterFactory,
	#category : #'XML-Parser-HTTP'
}

{ #category : #accessing }
XMLHTTPGZipDecompressingReadStreamAdapterFactory class >> compressionScheme [
	^ 'gzip'
]

{ #category : #accessing }
XMLHTTPGZipDecompressingReadStreamAdapterFactory class >> decompressingReadStreamAdapterClass [
	^ XMLClassFinder classNamed: #GZipReadStream
]
