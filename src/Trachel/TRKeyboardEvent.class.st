"
A base class for keyboard events.
"
Class {
	#name : #TRKeyboardEvent,
	#superclass : #TRUserInputEvent,
	#instVars : [
		'keyValue',
		'keyCombination'
	],
	#category : #'Trachel-Events'
}

{ #category : #comparing }
TRKeyboardEvent >> = anotherKeyDown [
	"Do we really need this method? It has been imported from Roassal1"
	(self class == anotherKeyDown) ifFalse: [  ^ false ].
	^ self keyValue = anotherKeyDown keyValue
]

{ #category : #initialization }
TRKeyboardEvent >> initialize [
	super initialize.
	keyValue := 0
]

{ #category : #accessing }
TRKeyboardEvent >> keyCombination [
	^ keyCombination
]

{ #category : #accessing }
TRKeyboardEvent >> keyCombination: anObject [
	keyCombination := anObject
]

{ #category : #accessing }
TRKeyboardEvent >> keyValue [
	^ keyValue
]

{ #category : #accessing }
TRKeyboardEvent >> keyValue: anObject [
	keyValue := anObject
]
