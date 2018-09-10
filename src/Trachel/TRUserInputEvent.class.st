Class {
	#name : #TRUserInputEvent,
	#superclass : #TRShapeEvent,
	#instVars : [
		'commandKeyPressed',
		'controlKeyPressed',
		'shiftKeyPressed',
		'optionKeyPressed'
	],
	#category : #'Trachel-Events'
}

{ #category : #'instance creation' }
TRUserInputEvent class >> fromEvent: aUserInputEvent [
	^ self new
		commandKeyPressed: aUserInputEvent commandKeyPressed;
		controlKeyPressed: aUserInputEvent controlKeyPressed;
		shiftKeyPressed: aUserInputEvent shiftPressed;
		optionKeyPressed: aUserInputEvent optionKeyPressed;
		yourself
]

{ #category : #accessing }
TRUserInputEvent >> altKeyPressed [
	"Answer true if the alt/option key on the keyboard was being held down when this event occurred."

	^ self optionKeyPressed
]

{ #category : #accessing }
TRUserInputEvent >> anyModifierKeyPressed [
	"Answer true if command, option/alt or control key on the keyboard was being held down when this event occurred. Ignores shift key."

	^ self commandKeyPressed or: [ self optionKeyPressed or: [ self controlKeyPressed ] ]
]

{ #category : #accessing }
TRUserInputEvent >> commandKeyPressed [
	"Answer true if the command key on the keyboard was being held down when this event occurred."

	^ commandKeyPressed
]

{ #category : #'private - accessing' }
TRUserInputEvent >> commandKeyPressed: aBoolean [
	commandKeyPressed := aBoolean
]

{ #category : #accessing }
TRUserInputEvent >> controlKeyPressed [
	"Answer true if the control key on the keyboard was being held down when this event occurred."

	^ controlKeyPressed
]

{ #category : #'private - accessing' }
TRUserInputEvent >> controlKeyPressed: aBoolean [
	controlKeyPressed := aBoolean
]

{ #category : #initialization }
TRUserInputEvent >> initialize [
	super initialize.
	commandKeyPressed := false.
	controlKeyPressed := false.
	optionKeyPressed := false.
	shiftKeyPressed := false
]

{ #category : #'private - accessing' }
TRUserInputEvent >> modifiers: modifiers [
	commandKeyPressed := modifiers anyMask: 2r01000000.
	controlKeyPressed := modifiers anyMask: 2r00010000.
	optionKeyPressed := modifiers anyMask: 2r00100000.
	shiftKeyPressed := modifiers anyMask: 2r00001000
]

{ #category : #accessing }
TRUserInputEvent >> optionKeyPressed [
	"Answer true if the alt/option key on the keyboard was being held down when this event occurred."

	^ optionKeyPressed
]

{ #category : #'private - accessing' }
TRUserInputEvent >> optionKeyPressed: aBoolean [
	optionKeyPressed := aBoolean
]

{ #category : #accessing }
TRUserInputEvent >> shiftKeyPressed [
	"Answer true if the shift key on the keyboard was being held down when this event occurred"

	^ shiftKeyPressed
]

{ #category : #'private - accessing' }
TRUserInputEvent >> shiftKeyPressed: aBoolean [
	shiftKeyPressed := aBoolean
]

{ #category : #accessing }
TRUserInputEvent >> shiftPressed [
	"Answer true if the shift key on the keyboard was being held down when this event occurred.
	This method is here for Morphic compatibility"

	^ self shiftKeyPressed
]
