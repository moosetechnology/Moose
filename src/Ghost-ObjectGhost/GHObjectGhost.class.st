"
I am abstract ghost implementation which uses #doesNotUnderstand: approach to intercept all messages.

My subclasses should decide how ghost behaviour should be defined. Should it be singleton for all ghosts? Or should it be specific for each ghost?

Subclasses should implement single method #ghostBehaviour to return GHGhostBehaviour instance. 
Also they should implement instance creation method by #basicNew to create correctly initialized instances. 
"
Class {
	#name : #GHObjectGhost,
	#superclass : #nil,
	#traits : 'GHTMinimalGhost',
	#classTraits : 'GHTMinimalGhost classTrait',
	#category : 'Ghost-ObjectGhost'
}

{ #category : #'instance creation' }
GHObjectGhost class >> new [ 
	"It is special naked abstract class. Simple new will hang image because #initialize will be called.
	It which will produce infinite recursion due to abstracted DNU handling. 
	We prevent it by making new subclass responsibility. 
	Subclasses should use basicNew to implement it correctly"
	
	self subclassResponsibility.
]

{ #category : #dispatching }
GHObjectGhost >> doesNotUnderstand: aMessage [ 
	
	^self ghostBehaviour intercept: aMessage to: self
]

{ #category : #accessing }
GHObjectGhost >> ghostBehaviour [
	nil subclassResponsibility 
]
