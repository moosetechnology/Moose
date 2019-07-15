"
I represent default message send result when special mock is returned.

Internal Representation and Key Implementation Points.

    Instance Variables
	returnedMock:		<MockForMessageReturn>
"
Class {
	#name : #MockOccurredDefaultReturn,
	#superclass : #MockOccurredMessageResult,
	#instVars : [
		'returnedMock'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockOccurredDefaultReturn class >> with: aMockForMessageReturn [
	^self new 
		returnedMock: aMockForMessageReturn 
]

{ #category : #testing }
MockOccurredDefaultReturn >> isReturnOf: anObjectOrSpec [

	^anObjectOrSpec asStateSpec matches: returnedMock
]

{ #category : #testing }
MockOccurredDefaultReturn >> isSignalOf: anExceptionOrSpec [

	^false
]

{ #category : #printing }
MockOccurredDefaultReturn >> printOn: aStream [
	
	aStream << 'returned ' << self stringForSpecTitle
]

{ #category : #accessing }
MockOccurredDefaultReturn >> returnedMock [
	^ returnedMock
]

{ #category : #accessing }
MockOccurredDefaultReturn >> returnedMock: anObject [
	returnedMock := anObject
]

{ #category : #printing }
MockOccurredDefaultReturn >> stringForSpecTitle [
	returnedMock isGhost ifFalse: [ ^returnedMock stringForSpecValidation]. "it is possible that mock was converted into normal object like boolean or number due to boolean logic or arithmetic operations which happens with returned mock"
	
	^'default mock(' , returnedMock ghostIdentityHash asString , ')'
]
