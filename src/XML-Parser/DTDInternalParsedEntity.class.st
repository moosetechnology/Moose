"
This is an abstract base class for internal parsed entities with replacements that can be inserted into an XML document.
"
Class {
	#name : #DTDInternalParsedEntity,
	#superclass : #DTDParsedEntity,
	#instVars : [
		'replacement'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDInternalParsedEntity class >> name: aName replacement: aReplacementString [
	^ self
		name: aName
		replacement: aReplacementString
		uri: ''
]

{ #category : #'instance creation' }
DTDInternalParsedEntity class >> name: aName replacement: aReplacementString uri: aURIString [
	^ self new
		setName: aName
		replacement: aReplacementString
		uri: aURIString
]

{ #category : #testing }
DTDInternalParsedEntity >> hasReplacement [
	^ self replacement notEmpty
]

{ #category : #accessing }
DTDInternalParsedEntity >> replacement [
	^ replacement ifNil: [replacement := '']
]

{ #category : #accessing }
DTDInternalParsedEntity >> replacement: aReplacementString [
	replacement := aReplacementString
]

{ #category : #accessing }
DTDInternalParsedEntity >> replacementStream [
	^ self replacement readStream
]

{ #category : #initialization }
DTDInternalParsedEntity >> setName: aName replacement: aReplacementString uri: aURIString [
	name := aName.
	replacement := aReplacementString.
	uri := aURIString.
]
