"
I am special ghost behaviour to process messages to objects which class was substituted by mutation.
My purpose is to process meta messages by original implementation of mutated objects instead of delegate it to current meta level (look at comments of GHGhostBehaviour).  Nevertheless I use metal level to detect that intercepted message is meta. Also I consider meta all messages defined by GHTNotNilGhost.
Some meta messages should be overriden with special mutation related logic. For example if #class message is considered as meta then it should return origial class of objects instead of mutation. Such overriden methods can be added to GHVictimMetaMessages in same way like other meta messages defined in GHMetaMessages subclasses. GHVictimMetaMessages methods are used as preferred implementation of meta messages. 
 
Domain messages are processed by my mutationBehavour with which I should be created: 
	GHVictimBehaviour forMutationWith: aGhostBehaviour
 
Internal Representation and Key Implementation Points.

    Instance Variables
	mutationBehaviour:		<GHGhostBehaviour>
"
Class {
	#name : #GHVictimBehaviour,
	#superclass : #GHGhostBehaviour,
	#instVars : [
		'mutationBehaviour'
	],
	#classVars : [
		'OverridenMetaLevel'
	],
	#category : 'Ghost-ObjectMutation'
}

{ #category : #'instance creation' }
GHVictimBehaviour class >> forMutationWith: aGhostBehaviour [
	^self new 
		mutationBehaviour: aGhostBehaviour 
]

{ #category : #initialization }
GHVictimBehaviour class >> initialize [
	OverridenMetaLevel := GHMetaLevel with: GHVictimMetaMessages 
]

{ #category : #'meta level' }
GHVictimBehaviour >> executeMetaMessage: aMessage on: infectedObject [

	^GHCurrentMetaLevelDepth increaseFor: [ 
		(OverridenMetaLevel isMetaMessage: aMessage)
			ifTrue: [ ^OverridenMetaLevel executeMetaMessage: aMessage on: infectedObject ]
			ifFalse: [ GHVictimMetaMessages executeOriginalMethodOf: infectedObject for: aMessage ]
	]
]

{ #category : #'meta level' }
GHVictimBehaviour >> isMetaMessage: aMessage [
	
	(GHTNotNilGhost includesSelector: aMessage selector) ifTrue: [ ^true ].
	aMessage selector == #withArgs:executeMethod: ifTrue: [ ^true ].
	
	^mutationBehaviour isMetaMessage: aMessage
]

{ #category : #accessing }
GHVictimBehaviour >> mutationBehaviour [
	^ mutationBehaviour
]

{ #category : #accessing }
GHVictimBehaviour >> mutationBehaviour: anObject [
	mutationBehaviour := anObject
]

{ #category : #'messages processing' }
GHVictimBehaviour >> send: aMessage to: aGhost [

	^mutationBehaviour send: aMessage to: aGhost
]
