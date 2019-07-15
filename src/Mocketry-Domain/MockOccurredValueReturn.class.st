"
I represent simple value return from message send

Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<Object>
"
Class {
	#name : #MockOccurredValueReturn,
	#superclass : #MockOccurredMessageResult,
	#instVars : [
		'value'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOccurredValueReturn class >> value: anObject [
	^self new 
		value: anObject
]

{ #category : #testing }
MockOccurredValueReturn >> isReturnOf: anObjectOrSpec [

	^anObjectOrSpec asStateSpec matches: value
]

{ #category : #testing }
MockOccurredValueReturn >> isSignalOf: anExceptionOrSpec [

	^false
]

{ #category : #printing }
MockOccurredValueReturn >> printOn: aStream [
	
	aStream << 'returned ' << value stringForSpecTitle
]

{ #category : #printing }
MockOccurredValueReturn >> stringForSpecValidation [
	^'"', value stringForSpecValidation , '"'
]

{ #category : #accessing }
MockOccurredValueReturn >> value [
	^ value
]

{ #category : #accessing }
MockOccurredValueReturn >> value: anObject [
	value := anObject
]
