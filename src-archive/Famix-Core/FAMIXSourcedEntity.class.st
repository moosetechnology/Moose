"
FAMIXSourcedEntity models any fact in a program source and it is the superclass (root class) of all source code entities and their relationships. It is a FAMIXEntity and it can hold comments, a source anchor and a source language.
"
Class {
	#name : #FAMIXSourcedEntity,
	#superclass : #FAMIXEntity,
	#instVars : [
		'sourceAnchor'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXSourcedEntity class >> annotation [
	<MSEClass: #SourcedEntity super: #FAMIXEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXSourcedEntity >> addComment: aComment [
	self comments add: aComment asFAMIXComment
]

{ #category : #accessing }
FAMIXSourcedEntity >> comments [
	"VBU - Put in private state because it is not used and so take place in the memory"

	<MSEProperty: #comments type: #FamixComment opposite: #container>
	<multivalued>
	<derived>
	<MSEComment: 'list of comments defined in the entity'>
	^ self privateState
		attributeAt: #comments
		ifAbsentPut: [ FMMultivalueLink on: self opposite: #container: ]
]

{ #category : #accessing }
FAMIXSourcedEntity >> comments: aCollection [
	self comments value: aCollection
]

{ #category : #accessing }
FAMIXSourcedEntity >> declaredSourceLanguage [
	"VBU - Put in private state because it is not used and so take place in the memory"

	<MSEProperty: #declaredSourceLanguage type: #FAMIXSourceLanguage opposite: #sourcedEntities>
	<MSEComment: 'The declared SourceLanguage for the source code of this entity'>
	^ self privateState attributeAt: #declaredSourceLanguage ifAbsent: [  ]
]

{ #category : #accessing }
FAMIXSourcedEntity >> declaredSourceLanguage: aSourceLanguage [
	self privateState
		attributeAt: #declaredSourceLanguage
		put:
			(FMMultivalueLink
				on: self
				update: #sourcedEntities
				from: self declaredSourceLanguage
				to: aSourceLanguage)
]

{ #category : #accessing }
FAMIXSourcedEntity >> removeComment: aComment [
	self comments remove: aComment
]

{ #category : #accessing }
FAMIXSourcedEntity >> sourceAnchor [
	<MSEProperty: #sourceAnchor type: #FAMIXSourceAnchor opposite: #element>
	<MSEComment: 'SourceAnchor entity linking to the original source code for this entity'>
	<derived>
	^sourceAnchor
]

{ #category : #accessing }
FAMIXSourcedEntity >> sourceAnchor: aSourceAnchor [
	sourceAnchor := aSourceAnchor.
	
	sourceAnchor ifNil: [ ^ self ].
	aSourceAnchor element = self ifFalse: [ aSourceAnchor element: self ]
]

{ #category : #accessing }
FAMIXSourcedEntity >> sourceLanguage [
	^ self declaredSourceLanguage ifNil: [
		self mooseModel 
			ifNil: [ FamixUNKNOWNSourceLanguage new ] 
			ifNotNil: [ self mooseModel sourceLanguage ] ]
]
