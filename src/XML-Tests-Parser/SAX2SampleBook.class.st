"
The sample book object parsed by the SAX2ElementParser.
"
Class {
	#name : #SAX2SampleBook,
	#superclass : #Object,
	#instVars : [
		'title',
		'isbn',
		'authors'
	],
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #adding }
SAX2SampleBook >> addAuthor: aString [
	^ self authors addLast: aString
]

{ #category : #accessing }
SAX2SampleBook >> authors [
	^ authors
]

{ #category : #initialization }
SAX2SampleBook >> initialize [
	super initialize.

	title := ''.
	isbn := ''.
	authors := OrderedCollection new.
]

{ #category : #accessing }
SAX2SampleBook >> isbn [
	^ isbn
]

{ #category : #accessing }
SAX2SampleBook >> isbn: aString [
	isbn := aString
]

{ #category : #accessing }
SAX2SampleBook >> title [
	^ title
]

{ #category : #accessing }
SAX2SampleBook >> title: aString [
	title := aString
]
