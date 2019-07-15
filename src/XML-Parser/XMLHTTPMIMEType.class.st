"
This is an immutable class for HTTP MIME types. Adapted from ZnMimeType.
"
Class {
	#name : #XMLHTTPMIMEType,
	#superclass : #Object,
	#instVars : [
		'mainType',
		'subType',
		'parameters'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #defaults }
XMLHTTPMIMEType class >> defaultCharset [
	^ 'ISO-8859-1'
]

{ #category : #'instance creation' }
XMLHTTPMIMEType class >> fromString: aString [
	| parser |

	parser := XMLHTTPMIMETypeParser on: aString.
	^ self new
		setMainType: parser parseMainType
		subType: parser parseSubType
		parameters: parser parseParameters.
]

{ #category : #'instance creation' }
XMLHTTPMIMEType class >> mainType: aMainType subType: aSubType [
	^ self
		mainType: aMainType
		subType: aSubType
		parameters: #()
]

{ #category : #'instance creation' }
XMLHTTPMIMEType class >> mainType: aMainType subType: aSubType parameters: anAssociationCollection [
	| parameters attributes totalAttributes |

	"convert the parameters to an OrderedCollection of attribute=value
	associations, ignoring duplicate attributes"
	parameters := OrderedCollection new: anAssociationCollection size.
	totalAttributes := 0.
	anAssociationCollection associationsDo: [:each | | attribute |
		attribute := each key asLowercase.
		"only initialize if needed"
		((attributes ifNil: [attributes := Set new])
			add: attribute;
			size) > totalAttributes
			ifTrue: [
				parameters addLast: attribute -> each value.
				totalAttributes := totalAttributes + 1]].

	^ self new
		setMainType: aMainType asLowercase
		subType: aSubType asLowercase
		parameters: parameters.
]

{ #category : #comparing }
XMLHTTPMIMEType >> = anObject [
	self == anObject
		ifTrue: [^ true].

	self species == anObject species
		ifFalse: [^ false].

	^ self mainType = anObject mainType
		and: [self subType = anObject subType
			and: [self parameters size = anObject parameters size
				and: [
					"order is irrelevant according to the spec"
					self parameters asSet = anObject parameters asSet]]].
]

{ #category : #converting }
XMLHTTPMIMEType >> asString [
	"don't assume Object>>#asString is defined, for portability"
	^ self printString
]

{ #category : #accessing }
XMLHTTPMIMEType >> charset [
	^ self
		parameterAt: 'charset'
		ifAbsent: [self defaultCharset]
]

{ #category : #defaults }
XMLHTTPMIMEType >> defaultCharset [
	^ self class defaultCharset
]

{ #category : #comparing }
XMLHTTPMIMEType >> hash [
	^ self species hash bitXor:
		(self mainType hash bitXor:
			(self subType hash bitXor:
				"OrderedCollection>>#hash depends on order (and even if it
				didn't, assuming it wouldn't in the future is too risky),
				so instead the size is hashed"
				self parameters size hash))
]

{ #category : #accessing }
XMLHTTPMIMEType >> mainType [
	^ mainType
]

{ #category : #accessing }
XMLHTTPMIMEType >> parameterAt: aKey [
	^ self
		parameterAt: aKey
		ifAbsent: ['']
]

{ #category : #accessing }
XMLHTTPMIMEType >> parameterAt: aKey ifAbsent: aBlock [
	self parameterKeysAndValuesDo: [:key :value |
		key = aKey
			ifTrue: [^ value]].
	^ aBlock value.
]

{ #category : #enumerating }
XMLHTTPMIMEType >> parameterKeysAndValuesDo: aTwoArgumentBlock [
	self parameters do: [:each |
		aTwoArgumentBlock
			value: each key
			value: each value]
]

{ #category : #enumerating }
XMLHTTPMIMEType >> parameterKeysDo: aBlock [
	self parameters do: [:each |
		aBlock value: each key]
]

{ #category : #private }
XMLHTTPMIMEType >> parameters [
	^ parameters
]

{ #category : #printing }
XMLHTTPMIMEType >> printOn: aStream [
	aStream
		nextPutAll: self mainType;
		nextPut: $/;
		nextPutAll: self subType.

	self parameterKeysAndValuesDo: [:key :value |
		aStream
			nextPutAll: '; ';
			nextPutAll: key;
			nextPut: $=;
			nextPutAll: value].
]

{ #category : #initialization }
XMLHTTPMIMEType >> setMainType: aMainType subType: aSubType parameters: aParameterCollection [
	mainType := aMainType.
	subType := aSubType.
	parameters := aParameterCollection.
]

{ #category : #accessing }
XMLHTTPMIMEType >> subType [
	^ subType
]
