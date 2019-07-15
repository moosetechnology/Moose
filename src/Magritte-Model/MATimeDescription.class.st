"
I am a description of times, possible values are instances of ==Time==. My visual representation could be a time-picker.
"
Class {
	#name : #MATimeDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MATimeDescription class >> defaultDisplayProperty [

	^ [ :time | 
		time hour greaseString, ':',
		time minute greaseString, ':',
		time second greaseString ].
]

{ #category : #'accessing-defaults' }
MATimeDescription class >> defaultKind [
	^ Time
]

{ #category : #testing }
MATimeDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MATimeDescription class >> label [
	^ 'Time'
]

{ #category : #visiting }
MATimeDescription >> acceptMagritte: aVisitor [
	aVisitor visitTimeDescription: self
]
