"
I represent expected message result which will return given value for intercepted messages

My instances can be created by 
	MockExpectedValueReturn value: anObject

Internal Representation and Key Implementation Points.

    Instance Variables
	value:		<Object>
"
Class {
	#name : #MockExpectedValueReturn,
	#superclass : #MockExpectedAction,
	#instVars : [
		'value'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockExpectedValueReturn class >> value: anObject [ 
	^self new value: anObject
]

{ #category : #evaluating }
MockExpectedValueReturn >> executeFor: anOccurredMessage [ 
	^value
]

{ #category : #accessing }
MockExpectedValueReturn >> value [
	^value
]

{ #category : #accessing }
MockExpectedValueReturn >> value: anObject [
	value := anObject
]
