"
I am a memento that forwards read- and write-access directly to the model. I can mostly be replaced with the model itself.
"
Class {
	#name : #MAStraightMemento,
	#superclass : #MAMemento,
	#category : #'Magritte-Model-Memento'
}

{ #category : #testing }
MAStraightMemento class >> isAbstract [
	^ false
]

{ #category : #private }
MAStraightMemento >> readUsing: aDescription [
	^ (self model readUsing: aDescription)
		ifNil: [ aDescription default ]
]

{ #category : #private }
MAStraightMemento >> write: anObject using: aDescription [
	self model write: anObject using: aDescription
]
