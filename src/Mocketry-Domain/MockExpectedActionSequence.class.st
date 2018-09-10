"
I represent sequence of expected actions which should be executed all together when corresponding message send will be intercepted.
I return last action result as execution result.

I am used by MockExpectedMessage as actions variable.

Public API and Key Messages

- add: aMockExpectationAction
 
Internal Representation and Key Implementation Points.

    Instance Variables
	actions:		<Collection of <MockExpectationAction>>

"
Class {
	#name : #MockExpectedActionSequence,
	#superclass : #MockExpectedAction,
	#instVars : [
		'actions'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockExpectedActionSequence class >> new [
	^super new initialize
]

{ #category : #accessing }
MockExpectedActionSequence >> add: aMockAction [ 
	actions add: aMockAction
]

{ #category : #evaluating }
MockExpectedActionSequence >> executeFor: anOccurredMessage [ 

	actions ifEmpty: [ ^anOccurredMessage setUpUnexpectedResult  ].
		
	actions allButLastDo: [:eachPart | eachPart executeFor: anOccurredMessage].
	
	^actions last executeFor: anOccurredMessage
]

{ #category : #'initialize-release' }
MockExpectedActionSequence >> initialize [
	actions := OrderedCollection new
]
