Class {
	#name : #LIBPerson,
	#superclass : #LIBRoot,
	#instVars : [
		'books',
		'name'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
LIBPerson class >> annotation [
	<MSEClass: #Person super: #Object>
	<package: #LIB>
]

{ #category : #accessing }
LIBPerson >> books [
	<MSEProperty: #books type: #LIBBook opposite: #authors> <multivalued>
	^books
]

{ #category : #accessing }
LIBPerson >> books: aBook [
	books value: aBook
]

{ #category : #initialization }
LIBPerson >> initialize [
	super initialize.
	books := FMMultiMultivalueLink on: self opposite: #authors.
	name := nil.
]

{ #category : #accessing }
LIBPerson >> name [
	<MSEProperty: #name type: #String>
	^name
]

{ #category : #accessing }
LIBPerson >> name: aString [
	name := aString
]

{ #category : #printing }
LIBPerson >> prettyString [
	^ self name
]
