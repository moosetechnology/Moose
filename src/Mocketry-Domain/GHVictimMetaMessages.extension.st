Extension { #name : #GHVictimMetaMessages }

{ #category : #'*Mocketry-Domain' }
GHVictimMetaMessages >> currentMockBehaviour [
	^self ghMutation mutationBehaviour 
]

{ #category : #'*Mocketry-Domain' }
GHVictimMetaMessages >> stubDoesNotExpect: anOccurredMessage [
	
	^GHCurrentMetaLevelDepth decreaseFor: [ 	  
		GHVictimMetaMessages executeOriginalMethodOf: ghost for: anOccurredMessage
	] 
]
