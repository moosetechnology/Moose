Class {
	#name : #RTTable,
	#superclass : #RTTabTable,
	#category : #'Roassal2-Table'
}

{ #category : #'as yet unclassified' }
RTTable class >> inputWithComma: aString [
	self assert: [ aString isString ] description: 'Please, provide a string'.
	^ self new input: aString usingDelimiter: $,
]

{ #category : #'as yet unclassified' }
RTTable class >> inputWithTab: aString [
	self assert: [ aString isString ] description: 'Please, provide a string'.
	^ self new input: aString usingDelimiter: Character tab
]

{ #category : #'as yet unclassified' }
RTTable >> convertColumnsToFloat: collectionOfIntegers [
	^ self convertColumns: collectionOfIntegers to: [ :s | Float readFrom: s ]
]
