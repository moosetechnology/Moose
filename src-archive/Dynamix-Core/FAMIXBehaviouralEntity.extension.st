Extension { #name : #FAMIXBehaviouralEntity }

{ #category : #'*Dynamix-Core' }
FAMIXBehaviouralEntity >> activations [
	<MSEProperty: #activations type: #DynamixActivation opposite: #behaviour> <multivalued> <derived>
	<MSEComment: 'The activations associated with the behavioural entity'>
	<package: #Dynamix>

	^ self privateState 
			attributeAt: #activations
			ifAbsentPut: [FMMultivalueLink 
							on: self
							opposite: #behaviour:.]
]

{ #category : #'*Dynamix-Core' }
FAMIXBehaviouralEntity >> activations: aCollection [
	^ (self privateState attributeAt: #activations ifAbsent: [nil]) value: aCollection 
]
