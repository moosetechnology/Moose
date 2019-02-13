"
RTExampleOpeningEvent  is an event that is trigger when someone browse an example
"
Class {
	#name : #RTExampleOpeningEvent,
	#superclass : #Announcement,
	#instVars : [
		'theClass',
		'theSelector',
		'time'
	],
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #accessing }
RTExampleOpeningEvent >> theClass [
	^ theClass
]

{ #category : #accessing }
RTExampleOpeningEvent >> theClass: aClassnameAsSymbol [
	theClass := aClassnameAsSymbol
]

{ #category : #accessing }
RTExampleOpeningEvent >> theSelector [
	^ theSelector
]

{ #category : #accessing }
RTExampleOpeningEvent >> theSelector: aMethodNameAsSymbol [
	theSelector := aMethodNameAsSymbol
]
