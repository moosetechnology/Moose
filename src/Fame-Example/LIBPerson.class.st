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
	<FMClass: #Person super: #Object>
	<package: #LIB>
]

{ #category : #'instance creation' }
LIBPerson class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
LIBPerson >> books [
	<FMProperty: #books type: #LIBBook opposite: #authors> <multivalued>
	^books
]

{ #category : #accessing }
LIBPerson >> books: aBook [
	books value: aBook
]

{ #category : #initialization }
LIBPerson >> initialize [
	super initialize.
	books := FMMultiMultivalueLink on: self opposite: #authors
]

{ #category : #accessing }
LIBPerson >> name [
	<FMProperty: #name type: #String>
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
