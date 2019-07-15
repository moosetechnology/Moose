"
I am a description of timestamps, possible values are instances of ==TimeStamp==. My visual representation could be a date- and time-picker.
"
Class {
	#name : #MATimeStampDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MATimeStampDescription class >> defaultKind [
	^ GRPlatform current magritteTimeStampClass
]

{ #category : #testing }
MATimeStampDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MATimeStampDescription class >> label [
	^ 'Timestamp'
]

{ #category : #visiting }
MATimeStampDescription >> acceptMagritte: aVisitor [
	aVisitor visitTimeStampDescription: self
]
