Extension { #name : #Object }

{ #category : #'*Mocketry-Domain' }
Object >> asOccurredMessageResult [

	^MockOccurredValueReturn value: self
]

{ #category : #'*Mocketry-Domain' }
Object >> asSpecOfArg: argumentNumber of: aMessageSendSpec [

	^SpecOfMessageArgument number: argumentNumber requiredValue: self
]

{ #category : #'*Mocketry-Domain' }
Object >> currentMockBehaviour [

	^MockCurrentBehaviour value
]

{ #category : #'*Mocketry-Domain' }
Object >> isAllowAutoStub [
	^true
]

{ #category : #'*Mocketry-Domain' }
Object >> stub [

	| behaviour mutation |
		
	self hasGHMutation 
		ifTrue: [ behaviour := self ghMutation mutationBehaviour ]
		ifFalse: [ 
			behaviour := MockCurrentBehaviour value.
			behaviour registerObject: self.
			mutation := GHObjectMutation behaviour: behaviour.
			mutation mutate: self].
	
	^behaviour createHelperMockAs: (MockStubTeacher for: self)
]

{ #category : #'*Mocketry-Domain' }
Object >> stubDoesNotExpect: anOccurredMessage [
	
	^GHMetaMessages 
		withReceiver: self 
		perform: anOccurredMessage selector  
		withArguments: anOccurredMessage arguments
		 
]
