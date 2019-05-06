"
I represent learned message with information about implementation method and first sender.

I was introduced to simplify naked ghosts debugging to easily detect source of unexpected messages.

My instance can be created by: 
	GHLearnedMessage from: senderContext method: aMethod
 
Internal Representation and Key Implementation Points.

    Instance Variables
	firstSender:		<Context>
	method:		<Method>
"
Class {
	#name : #GHLearnedMessage,
	#superclass : #Object,
	#instVars : [
		'method',
		'firstSender'
	],
	#category : #'Ghost-Learning'
}

{ #category : #'instance creation' }
GHLearnedMessage class >> from: senderContext method: aMethod [

	^self new 
		method: aMethod;
		firstSender: senderContext 
]

{ #category : #accessing }
GHLearnedMessage >> category [
	^method category
]

{ #category : #accessing }
GHLearnedMessage >> firstSender [
	^ firstSender
]

{ #category : #accessing }
GHLearnedMessage >> firstSender: anObject [
	firstSender := anObject
]

{ #category : #accessing }
GHLearnedMessage >> method [
	^ method
]

{ #category : #accessing }
GHLearnedMessage >> method: anObject [
	method := anObject
]

{ #category : #printing }
GHLearnedMessage >> printOn: aStream [

	^method printOn: aStream 
]

{ #category : #accessing }
GHLearnedMessage >> selector [
	^method selector
]

{ #category : #accessing }
GHLearnedMessage >> sourceCode [
	^method sourceCode
]
