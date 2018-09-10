"
This class is a null read stream that is already #atEnd and also makes sending #atEnd after #close or sending #close more than once safe, which is needed for the XMLNestedStreamReader null stream.
"
Class {
	#name : #XMLNullReadStream,
	#superclass : #XMLAbstractReadStream,
	#classInstVars : [
		'instance'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #'class initialization' }
XMLNullReadStream class >> initialize [
	"self initialize"

	instance := self basicOn: nil
]

{ #category : #'instance creation' }
XMLNullReadStream class >> new [
	^ instance
]

{ #category : #'instance creation' }
XMLNullReadStream class >> on: anObject [
	^ instance
]

{ #category : #testing }
XMLNullReadStream >> atEnd [
	^ true
]

{ #category : #accessing }
XMLNullReadStream >> contents [
	^ String new
]

{ #category : #accessing }
XMLNullReadStream >> next [
	^ nil
]

{ #category : #initialization }
XMLNullReadStream >> on: anObject [
]

{ #category : #accessing }
XMLNullReadStream >> peek [
	^ nil
]

{ #category : #positioning }
XMLNullReadStream >> position [
	^ 0
]

{ #category : #positioning }
XMLNullReadStream >> position: anInteger [
]

{ #category : #positioning }
XMLNullReadStream >> reset [
]
