"
DynamixTrace is an event that has a name. Typically, a trace is the root of an event tree.
A trace entity can be used to model a feature or a use case.
"
Class {
	#name : #DynamixTrace,
	#superclass : #DynamixEvent,
	#instVars : [
		'name'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixTrace class >> annotation [
	<MSEClass: #Trace super: #DynamixEvent>
	<package: #Dynamix>
]

{ #category : #testing }
DynamixTrace >> isTrace [ 
	^ true
]

{ #category : #accessing }
DynamixTrace >> name [
	^name ifNil: [ 'n/a' ]
]

{ #category : #accessing }
DynamixTrace >> name: anObject [
	name := anObject
]

{ #category : #'accessing-derived' }
DynamixTrace >> trace [ 
	^ self
]
