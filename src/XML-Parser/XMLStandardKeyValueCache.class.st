"
This class is the standard key-value cache implementation used on Pharo/Squeak.
"
Class {
	#name : #XMLStandardKeyValueCache,
	#superclass : #XMLKeyValueCache,
	#category : #'XML-Parser-Utils'
}

{ #category : #testing }
XMLStandardKeyValueCache class >> isSupportedImplementation [
	"need some type of reentrant mutex"
	XMLReentrantMutex hasSupportedImplementation
		ifFalse: [^ false].

	"MUST use the transient class on GS to avoid persisting and causing
	write conflicts"
	XMLClassFinder
		classNamed: #XMLTransientKeyValueCache
		ifPresent: [:transientKeyValueCacheClass |
			transientKeyValueCacheClass isSupportedImplementation
				ifTrue: [^ false]].

	^ true.
]

{ #category : #accessing }
XMLStandardKeyValueCache >> collection [
	^ collection
]

{ #category : #initialization }
XMLStandardKeyValueCache >> setCollection: aKeyValueCollection [
	collection := aKeyValueCollection
]
