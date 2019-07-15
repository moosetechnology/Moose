Class {
	#name : #MAValidatorVisitor,
	#superclass : #MAVisitor,
	#instVars : [
		'object'
	],
	#category : #'Magritte-Model-Visitor'
}

{ #category : #'instance creation' }
MAValidatorVisitor class >> on: anObject description: aDescription [
	^ self new on: anObject description: aDescription
]

{ #category : #accessing }
MAValidatorVisitor >> object [
	"Answer the currently validated object."

	^ object
]

{ #category : #initialization }
MAValidatorVisitor >> on: anObject description: aDescription [
	self use: anObject during: [ self visit: aDescription ]
]

{ #category : #private }
MAValidatorVisitor >> use: anObject during: aBlock [
	| previous |
	previous := object. object := anObject.
	^ aBlock ensure: [ object := previous ]
]

{ #category : #private }
MAValidatorVisitor >> validate: anObject using: aDescription [
	aDescription validateRequired: anObject.
	anObject isNil ifTrue: [ ^ self ].
	aDescription
		validateKind: anObject;
		validateSpecific: anObject;
		validateConditions: anObject
]

{ #category : #visiting }
MAValidatorVisitor >> visit: aDescription [
	"Only visit objects that are visible and that can be changed."
	
	(aDescription isVisible and: [ aDescription isReadonly not ])
		ifTrue: [ super visit: aDescription ].
	
]

{ #category : #'visiting-descriptions' }
MAValidatorVisitor >> visitContainer: aDescription [
	| errors |
	super visitContainer: aDescription.
	self object isNil ifTrue: [ ^ self ].
	errors := OrderedCollection new.
	aDescription do: [ :description |
		[ self
			use: (self object readUsing: description)
			during: [ self visit: description ] ]
				on: MAValidationError
				do: [ :err | errors add: err ] ].
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: aDescription 
			errors: errors
			signal: aDescription label ]
]

{ #category : #'visiting-descriptions' }
MAValidatorVisitor >> visitDescription: aDescription [
	self validate: self object using: aDescription
]
