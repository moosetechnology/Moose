"
FAMIXSourceLanguage represents the programming language in which an entity is written. It is used for dispatching entity actions for specific languages. For example, formatting a source text will be performed according to the language. A project may have multiple languages. 

A source language has a name and entities that are written in this language. 
One can create a default source language for a project by not associating any entities to it. In this case, all entities that do not have specific source langauge, belong to the default source language. One can attach entities to a sourceLanguage using addSourceEntity:.
"
Class {
	#name : #FAMIXSourceLanguage,
	#superclass : #FAMIXEntity,
	#instVars : [
		'sourcedEntities'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXSourceLanguage class >> annotation [
	<MSEClass: #SourceLanguage super: #FAMIXEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXSourceLanguage >> addSourcedEntity: aSourcedEntity [
	^ sourcedEntities add: aSourcedEntity
]

{ #category : #utility }
FAMIXSourceLanguage >> format: aSourceString from: anEntity [
	^ aSourceString
	
	
]

{ #category : #'initialize-release' }
FAMIXSourceLanguage >> initialize [
	super initialize.
	sourcedEntities := FMNullMultivalueLink on: self opposite: #declaredSourceLanguage: selector: #sourcedEntities
]

{ #category : #testing }
FAMIXSourceLanguage >> isAttached [
	"Returns whether the receiver (a language) has some entities associated with it. By default, if there are no entities attached, it means that all of them are of this language."

	^ self sourcedEntities notEmpty  
]

{ #category : #testing }
FAMIXSourceLanguage >> isUnknown [ 
	^ false
]

{ #category : #accessing }
FAMIXSourceLanguage >> name [
	"The name of the language that is not modeled explicitly"
	
	<MSEProperty: #name type: #String> <derived>
	<MSEComment: 'The name of the language that is not modeled explicitly.'>
	
	^ (self class name removePrefix: 'FAMIX') removeSuffix: 'SourceLanguage'
]

{ #category : #accessing }
FAMIXSourceLanguage >> sourcedEntities [
	"Returns the list of entities associated to the source language. Useful when you have multiple languages projects and need to query them."
	
	<MSEProperty: #sourcedEntities type: #FAMIXSourcedEntity opposite: #declaredSourceLanguage> <multivalued> <derived>
	<MSEComment: 'References to the entities saying explicitly that are written in this language.'>

	^ sourcedEntities
]

{ #category : #accessing }
FAMIXSourceLanguage >> sourcedEntities: aCollection [
	sourcedEntities := aCollection
]
