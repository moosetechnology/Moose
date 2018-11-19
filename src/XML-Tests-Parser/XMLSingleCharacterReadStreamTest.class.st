Class {
	#name : #XMLSingleCharacterReadStreamTest,
	#superclass : #XMLAbstractReadStreamTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLSingleCharacterReadStreamTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLSingleCharacterReadStreamTest >> character [
	^ $!
]

{ #category : #accessing }
XMLSingleCharacterReadStreamTest >> inputCollection [
	^ self character asString
]

{ #category : #'instance creation' }
XMLSingleCharacterReadStreamTest >> newStreamOn: aCollection [
	^ self streamClass on: aCollection first
]

{ #category : #accessing }
XMLSingleCharacterReadStreamTest >> streamClass [
	^ XMLSingleCharacterReadStream
]
