"
I am a description of durations, possible values are instances of ==Duration==.
"
Class {
	#name : #MADurationDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MADurationDescription class >> defaultKind [
	^ Duration
]

{ #category : #testing }
MADurationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MADurationDescription class >> label [
	^ 'Duration'
]

{ #category : #visiting }
MADurationDescription >> acceptMagritte: aVisitor [
	aVisitor visitDurationDescription: self
]
