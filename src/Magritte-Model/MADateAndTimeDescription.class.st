"
I am a description of date and times, possible values are instances of ==DateAndTime==. My visual representation could be a date- and time-picker.
"
Class {
	#name : #MADateAndTimeDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MADateAndTimeDescription class >> defaultKind [
	^ DateAndTime
]

{ #category : #testing }
MADateAndTimeDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MADateAndTimeDescription class >> label [
	^ 'Date and Time'
]

{ #category : #visiting }
MADateAndTimeDescription >> acceptMagritte: aVisitor [
	aVisitor visitDateAndTimeDescription: self
]
