"
The AnnotationAccessor implements a small interface to access annotations for an entity. It does it by providing a bit of magic in #doesNotUnderstand:.
"
Class {
	#name : #MTLAnnotationRegistry,
	#superclass : #Object,
	#instVars : [
		'entity'
	],
	#category : #'Metanool-Core'
}

{ #category : #'instance creation' }
MTLAnnotationRegistry class >> on: anObject [

	^ self new
		entity: anObject;
		yourself
]

{ #category : #'error handling' }
MTLAnnotationRegistry >> doesNotUnderstand: aMessage [

	| property |
	property := self entity mooseDescription 
		attributeNamed: aMessage selector 
		ifAbsent: [nil].
	^ property isNil 
		ifTrue: [nil]
		ifFalse: [self entity mmGetProperty: property]
]

{ #category : #accessing }
MTLAnnotationRegistry >> entity [
	^ entity
]

{ #category : #accessing }
MTLAnnotationRegistry >> entity: anObject [
	entity := anObject
]
