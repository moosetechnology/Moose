Extension { #name : #GHVictimMetaMessages }

{ #category : #'*Mocketry-Domain' }
GHVictimMetaMessages >> currentMockBehaviour [
	^self ghMutation mutationBehaviour 
]

{ #category : #'*Mocketry-Domain' }
GHVictimMetaMessages >> stubDoesNotExpect: anOccurredMessage [
	anOccurredMessage selector == #class ifTrue: [ 
		"It is special case because we know that #class will return a mutation instance.
		And we want to avoid it: by default class of infected object should be original class.
		The meta messages logic does not allow to achieve it 
		because we want to be able stub #class message too. 
		Here is default behaviour with idea that #class is normally not overridden"
		^ GHVictimMetaMessages originalClassOf: anOccurredMessage receiver ].
	
	^GHCurrentMetaLevelDepth decreaseFor: [ 	  
		GHVictimMetaMessages executeOriginalMethodOf: ghost for: anOccurredMessage
	] 
]
