Class {
	#name : #LIBBook,
	#superclass : #LIBRoot,
	#instVars : [
		'title',
		'authors'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
LIBBook class >> annotation [
	<MSEClass: #Book super: #Object>
	<package: #LIB>
	
]

{ #category : #accessing }
LIBBook >> authors [
	<MSEProperty: #authors type: #LIBPerson opposite: #books> <multivalued>
	^authors
]

{ #category : #accessing }
LIBBook >> authors: aPerson [
	authors value: aPerson
]

{ #category : #initialization }
LIBBook >> initialize [
	super initialize.
	title := nil.
	authors := FMMultiMultivalueLink on: self opposite: #books.
]

{ #category : #printing }
LIBBook >> prettyString [
	^ self title
]

{ #category : #accessing }
LIBBook >> title [
	<MSEProperty: #title type: #String>
	^title
]

{ #category : #accessing }
LIBBook >> title: aString [
	title := aString
]
