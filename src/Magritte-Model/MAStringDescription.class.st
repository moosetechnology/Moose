"
I am a description of strings, possible values are instances of ==String==. My visual representation could be a single line text-field. Use ==*MAMemoDescription*== for multi-line strings.
"
Class {
	#name : #MAStringDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAStringDescription class >> defaultKind [
	^ String
]

{ #category : #testing }
MAStringDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAStringDescription class >> label [
	^ 'String'
]

{ #category : #visiting }
MAStringDescription >> acceptMagritte: aVisitor [
	aVisitor visitStringDescription: self
]

{ #category : #testing }
MAStringDescription >> isSortable [
	^ true
]
