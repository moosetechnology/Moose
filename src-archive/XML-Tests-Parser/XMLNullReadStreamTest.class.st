Class {
	#name : #XMLNullReadStreamTest,
	#superclass : #XMLAbstractReadStreamTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLNullReadStreamTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLNullReadStreamTest >> inputCollection [
	^ ''
]

{ #category : #accessing }
XMLNullReadStreamTest >> streamClass [
	^ XMLNullReadStream
]

{ #category : #tests }
XMLNullReadStreamTest >> testNew [
	self assert: self streamClass new class == self streamClass
]
