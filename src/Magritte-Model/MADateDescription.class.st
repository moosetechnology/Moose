"
I am a description of dates, possible values are instances of ==Date==. My visual representation could be a date-picker.
"
Class {
	#name : #MADateDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MADateDescription class >> defaultDisplayProperty [
	^ [ :aDateOrNil | 
				aDateOrNil
					ifNotNil: [ aDateOrNil greaseString ]
					ifNil: [ '' ] ]
]

{ #category : #'accessing-defaults' }
MADateDescription class >> defaultKind [
	^ Date
]

{ #category : #testing }
MADateDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MADateDescription class >> label [
	^ 'Date'
]

{ #category : #visiting }
MADateDescription >> acceptMagritte: aVisitor [
	aVisitor visitDateDescription: self
]
