"
This notification is signaled whenever a deprecated message is sent.

see WAObject>>#greaseDeprecatedApi:details: 
"
Class {
	#name : #GRDeprecatedApiNotification,
	#superclass : #GRNotification,
	#instVars : [
		'details'
	],
	#category : #'Grease-Core-Exceptions'
}

{ #category : #accessing }
GRDeprecatedApiNotification >> details [
	^ details
]

{ #category : #accessing }
GRDeprecatedApiNotification >> details: anObject [
	details := anObject
]
