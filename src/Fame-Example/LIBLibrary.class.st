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
	<FMClass: #Library super: #Object>
	<package: #LIB>
	
]

{ #category : #'instance creation' }
LIBLibrary class >> librarian: aPerson books: aCollection [
	^ self new
		librarian: aPerson;
		books: aCollection;
		yourself
]

{ #category : #accessing }
LIBLibrary >> books [
	<FMProperty: #books type: #LIBBook> <multivalued>
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
	<FMProperty: #librarian type: #LIBPerson>
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
