Extension { #name : #GHTMinimalGhost }

{ #category : #'*Mocketry-Domain' }
GHTMinimalGhost >> asOccurredMessageResult [

	^MockOccurredValueReturn value: self
]

{ #category : #'*Mocketry-Domain' }
GHTMinimalGhost >> asSpecOfArg: argumentNumber of: aMessageSendSpec [

	^SpecOfMessageArgument number: argumentNumber requiredValue: self
]

{ #category : #'*Mocketry-Domain' }
GHTMinimalGhost >> currentMockBehaviour [
	^MockCurrentBehaviour value
]

{ #category : #'*Mocketry-Domain' }
GHTMinimalGhost >> stubDoesNotExpect: anOccurredMessage [
	
	^GHMetaMessages 
		withReceiver: self 
		perform: anOccurredMessage selector  
		withArguments: anOccurredMessage arguments
]
