"
I am a root of helper mock roles which are used to intercept all messages for given object for particular purpose.  I transform intercepted message sends to replace it receiver with my object and to replace #anyMessage with Any spec.

My subclasses should implement: 
	processTransformedMessageSend: anOccurredMessage by: aMockBehaviour
	  
Internal Representation and Key Implementation Points.

    Instance Variables
	object:		<Object>
"
Class {
	#name : #MockHelperRole,
	#superclass : #MockRole,
	#instVars : [
		'object'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockHelperRole class >> for: anObject [

	^self new
		object: anObject	
]

{ #category : #accessing }
MockHelperRole >> object [
	^ object
]

{ #category : #accessing }
MockHelperRole >> object: anObject [
	object := anObject
]

{ #category : #processing }
MockHelperRole >> processMessageSend: anOccurredMessage by: aMockBehaviour [

	anOccurredMessage receiver: object.
	anOccurredMessage selector == #anyMessage ifTrue: [ anOccurredMessage selector: Any ].
	
	^self processTransformedMessageSend: anOccurredMessage by: aMockBehaviour
]

{ #category : #processing }
MockHelperRole >> processTransformedMessageSend: anOccurredMessage by: aMockBehaviour [

	self subclassResponsibility 
]
