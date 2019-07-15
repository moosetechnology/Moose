Class {
	#name : #FMCausalConnection,
	#superclass : #Object,
	#instVars : [
		'tower'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'as yet unclassified' }
FMCausalConnection class >> flushAll [

	self allInstances do: [ :each |
		SystemAnnouncer uniqueInstance unsubscribe: each ]
]

{ #category : #private }
FMCausalConnection >> addDescriptionOf: aCompiledMethod [ 
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
FMCausalConnection >> event: anEvent [
	"Called each time the system changes."
	
	(self isWithinScope: anEvent) ifFalse: [ ^self ].
	anEvent itemKind = SystemAnnouncer methodKind ifTrue: [
		anEvent isModified ifTrue: [ 
			^self methodModifiedEvent: anEvent ].
		anEvent isAdded ifTrue: [ 
			^self methodAddedEvent: anEvent ].
		anEvent isRemoved ifTrue: [ 
			^self methodRemovedEvent: anEvent ].
		anEvent halt ].
]

{ #category : #private }
FMCausalConnection >> hasFamePragmas: aCompiledMethod [ 
	
	^aCompiledMethod pragmas anySatisfy: [ :each |
		(each keyword beginsWith: 'MSE') ]
]

{ #category : #'as yet unclassified' }
FMCausalConnection >> isWithinScope: anEvent [

	^tower notNil and: [
		anEvent itemClass notNil and: [
			tower metamodel classes anySatisfy: [ :fameClass |
				fameClass implementingClass notNil ifTrue: [
					fameClass implementingClass = anEvent itemClass theNonMetaClass ]]]].
	

]

{ #category : #'as yet unclassified' }
FMCausalConnection >> methodAddedEvent: anEvent [
	
	(self isWithinScope: anEvent) ifFalse: [ ^self ].
	self removeDescriptionOf: anEvent item.
]

{ #category : #'as yet unclassified' }
FMCausalConnection >> methodModifiedEvent: anEvent [
	
	(self isWithinScope: anEvent) ifFalse: [ ^self ].
	self removeDescriptionOf: anEvent oldItem.
	self addDescriptionOf: anEvent item.
]

{ #category : #'as yet unclassified' }
FMCausalConnection >> methodRemovedEvent: anEvent [
	
	(self isWithinScope: anEvent) ifFalse: [ ^self ].
	self removeDescriptionOf: anEvent item.
]

{ #category : #'as yet unclassified' }
FMCausalConnection >> removeDescriptionOf: aCompiledMethod [
	| pragma meta attr |
	pragma := Pragma 
		inMethod: aCompiledMethod
		named: #(#MSEProperty:type:opposite: #MSEProperty:type: ).
	pragma isNil ifTrue: [ ^ self ].
	meta := tower metamodel descriptionOf: aCompiledMethod methodClass.
	attr := meta attributeNamed: pragma arguments first.
	attr opposite: nil.
	attr package: nil.
	attr mmClass: nil.
]

{ #category : #accessing }
FMCausalConnection >> tower [
	^ tower
]

{ #category : #accessing }
FMCausalConnection >> tower: anObject [
	tower := anObject
]
