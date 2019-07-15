"
I am a description of Smalltalk classes, possible values can be any of ==Smalltalk allClasses==.
"
Class {
	#name : #MAClassDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAClassDescription class >> defaultKind [
	^ Class
]

{ #category : #testing }
MAClassDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAClassDescription class >> label [
	^ 'Class'
]

{ #category : #visiting }
MAClassDescription >> acceptMagritte: aVisitor [
	aVisitor visitClassDescription: self
]
