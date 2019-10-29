Class {
	#name : #LIBRoot,
	#superclass : #Object,
	#category : #'Fame-Example'
}

{ #category : #examples }
LIBRoot class >> library [
	| a1 a4 a2 a5 a3 |
	a1 := LIBPerson named: 'Erich Gamma'.
	a2 := LIBPerson named: 'Richard Helm'.
	a3 := LIBPerson named: 'Ralph Johnson'.
	a4 := LIBPerson named: 'John Vlissides'.
	a5 := LIBPerson named: 'Kent Beck'.
	^ LIBLibrary
		librarian: (LIBPerson named: 'Adrian Kuhn')
		books:
			{(LIBBook title: 'Design Patterns' authors: {a1 . a2 . a3 . a4}) . (LIBBook title: 'Eclipse: Principles, Patterns, and Plug-Ins' authors: {a1 . a5}).
			(LIBBook title: 'Smalltalk Best Practice Patterns' authors: {a5})}
]

{ #category : #examples }
LIBRoot class >> libraryMetaModel [
	^ FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}
]

{ #category : #examples }
LIBRoot class >> libraryModel [
	| library |
	library := self library.
	^ (FMModel withMetamodel: self libraryMetaModel)
		add: library;
		addAll: library books;
		add: library librarian;
		addAll: (library books flatCollectAsSet: #authors);
		yourself
]

{ #category : #printing }
LIBRoot >> prettyString [
	^ self printString
]
