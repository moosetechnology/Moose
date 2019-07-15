"
I describe objects which propertyMessage returns true.

	#() should be isEmpty
	10 should be beetween: 1 and: 100

My instances can be created by: 

	SpecOfBooleanProperty fromMessage: (Message selector: #isEmpty)
 
Internal Representation and Key Implementation Points.

    Instance Variables
	propertyMessage:		<Message>

"
Class {
	#name : #SpecOfBooleanProperty,
	#superclass : #SpecOfObjectState,
	#instVars : [
		'propertyMessage'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfBooleanProperty class >> fromMessage: aMessage [
	^self new 
		propertyMessage: aMessage 
]

{ #category : #testing }
SpecOfBooleanProperty >> basicMatches: anObject [

	| result |
	result := propertyMessage sendTo: anObject.
	^result == true
]

{ #category : #printing }
SpecOfBooleanProperty >> defaultTitle [ 
	^'be ', propertyMessage printString
]

{ #category : #accessing }
SpecOfBooleanProperty >> propertyMessage [
	^ propertyMessage
]

{ #category : #accessing }
SpecOfBooleanProperty >> propertyMessage: anObject [
	propertyMessage := anObject
]

{ #category : #validation }
SpecOfBooleanProperty >> validationFailureFor: anObject [

	^SpecOfBooleanPropertyValidationFailure spec: self for: anObject
]
