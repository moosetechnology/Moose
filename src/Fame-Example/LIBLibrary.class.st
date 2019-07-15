Class {
	#name : #LIBLibrary,
	#superclass : #LIBRoot,
	#instVars : [
		'librarian',
		'books'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
LIBLibrary class >> annotation [
	<MSEClass: #Library super: #Object>
	<package: #LIB>
	
]

{ #category : #accessing }
LIBLibrary >> books [
	<MSEProperty: #books type: #LIBBook> <multivalued>
	^books
]

{ #category : #accessing }
LIBLibrary >> books: aBook [
	books := aBook
]

{ #category : #initialization }
LIBLibrary >> initialize [
	super initialize.
	librarian := nil.
	books := OrderedCollection new.
]

{ #category : #accessing }
LIBLibrary >> librarian [
	<MSEProperty: #librarian type: #LIBPerson>
	^librarian
]

{ #category : #accessing }
LIBLibrary >> librarian: aPerson [
	librarian := aPerson
]

{ #category : #printing }
LIBLibrary >> prettyString [
	^ 'Library'
]
