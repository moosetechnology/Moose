"
I am abstract behaviour of ghosts.

Ghosts area special objects which process messages in unnatural Smalltalk way. My subclasses implement actual processing logic which define how gosts are behave.
They should implement processing method:
	send: aMessage to: aGhost

Concrete ghost implementation can define set of meta messages. It is messages which should not be processed by ghost logic and instead should be performed in natural Smalltalk way. For example it can be #printString method which are used by inspectors to show object. Some ghosts are not need to intercept it. Instead inspector should show usual string presentation of such objects. 
To split metal level and domain level of ghosts my subclasses should implement  #currentMetaLevel method to return GHMetaLevel instance with specific set of meta messages. Meta messages are defined by explicit methods of GHMetaMessages hierarhy. 
There is GHStandardMetaMessages which for example contains #printString implementation. And there is GHEmptyMetaMessages which will intercept any message to ghosts.  Standard and empty meta levels are defined as singletons:
	GHMetaLevel standard.
	GHMetaLEvel empty 
Look at GHMetaLevel comments for details.

Public API and Key Messages

- intercept: aMessage to: aGhost
it intercepts all messages   
- send: aMessage to: aGhost 
it should process intercepted domain messages. It should be implemented by subclasses.
- currentMetaLevel 
it should return GHMetaLevel instance which make sense for concrete ghost implementation
"
Class {
	#name : #GHGhostBehaviour,
	#superclass : #Object,
	#category : 'Ghost-ObjectGhost'
}

{ #category : #accessing }
GHGhostBehaviour >> currentMetaLevel [
	^GHMetaLevel standard
	"Standard meta level disables interception of messages from standard dev tools. 
	With such default behaviour it possible to use tools on ghosts with broken interception logic.
	When it will be done meta level can be changed to GHMetaLevel empty (or more suitable)"
	
]

{ #category : #'meta level' }
GHGhostBehaviour >> executeMetaMessage: aMessage on: anObject [  
	
	^GHCurrentMetaLevelDepth increaseFor: [ 
		self currentMetaLevel executeMetaMessage: aMessage on: anObject 
	]
]

{ #category : #'message interception' }
GHGhostBehaviour >> intercept: aMessage to: anObject [
		
	^(self isMetaMessage: aMessage)
		ifTrue: [ self executeMetaMessage: aMessage on: anObject  ]
	 	ifFalse: [ self send: aMessage to: anObject  ]
]

{ #category : #'meta level' }
GHGhostBehaviour >> isMetaMessage: aMessage [

	GHCurrentMetaLevelDepth value > 0 ifTrue: [ ^true ]. 
	
	^self currentMetaLevel isMetaMessage: aMessage
]

{ #category : #'message interception' }
GHGhostBehaviour >> send: aMessage to: aGhost [

	nil subclassResponsibility 
]
