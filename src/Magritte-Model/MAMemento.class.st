"
I am an abstract memento. I reference the model I am working on and the description currently used to describe this model.
"
Class {
	#name : #MAMemento,
	#superclass : #MAObject,
	#instVars : [
		'model',
		'description'
	],
	#category : #'Magritte-Model-Memento'
}

{ #category : #'instance creation' }
MAMemento class >> model: aModel [
	^ self model: aModel description: aModel magritteDescription
]

{ #category : #'instance creation' }
MAMemento class >> model: aModel description: aDescription [
	^ self new
		setModel: aModel;
		setDescription: aDescription;
		reset; yourself
]

{ #category : #actions }
MAMemento >> commit [
	"Commit the receiver into the model."
]

{ #category : #private }
MAMemento >> isDifferent: firstDictionary to: secondDictionary [
	| firstValue secondValue |
	self magritteDescription do: [ :each |
		(each isVisible and: [ each isReadonly not ]) ifTrue: [
			firstValue := firstDictionary at: each ifAbsent: [ nil ].
			secondValue := secondDictionary at: each ifAbsent: [ nil ].
			firstValue = secondValue ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : #accessing }
MAMemento >> magritteDescription [
	^ description
]

{ #category : #accessing }
MAMemento >> model [
	^ model
]

{ #category : #printing }
MAMemento >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' model: '; print: self model
]

{ #category : #private }
MAMemento >> pull [
	"Utility method to pull the model into a dictionary mapping descriptions to values. nil values are replaced with the default ones of the model."

	| result |
	result := self pullRaw.
	result keysAndValuesDo: [ :key :value |
		value isNil
			ifTrue: [ result at: key put: key default yourself ] ].
	^ result
]

{ #category : #private }
MAMemento >> pullRaw [
	| result |
	result := Dictionary new.
	self magritteDescription do: [ :each |
		result at: each put: (self model
			readUsing: each) ].
	^ result
]

{ #category : #private }
MAMemento >> push: aDictionary [
	"Utility method to push a dictionary mapping descriptions to values into the model."

	aDictionary keysAndValuesDo: [ :key :value |
		(key isVisible and: [ key isReadonly not ]) 
			ifTrue: [ self model write: value using: key ] ]
]

{ #category : #actions }
MAMemento >> reset [
	"Reset the memento from the model."
]

{ #category : #initialization }
MAMemento >> setDescription: aDescription [
	description := aDescription
]

{ #category : #initialization }
MAMemento >> setModel: aModel [
	model := aModel
]

{ #category : #actions }
MAMemento >> validate [
	"Check if the data in the receiver would be valid if committed. In case of problems an exception is raised."

	self magritteDescription validate: self
]
