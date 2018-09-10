"
I am a ghost implementation which can substitute class of objects. For this I should has special object layout with variables superclass, methodDict and format.
I use special trick with canNotInterpret: method to intercept instance messages from object which class I substitute. 
To make this trick working my subclasses should call method initializeClassProxy during instance creation. 
This method set up superclass variable with GHInstanceMessagesInterceptor which will perform  #canNotInterpret:. method  Look at it comment

As usual ghost my subclasses should implement #ghostBehaviour method and instance creation method. #ghostBehaviour will process direct messages to ghost.
And to substitute real objects class ghosts should implement #instancesBehaviour which will process messages from real object instances.
"
Class {
	#name : #GHClassGhost,
	#superclass : #GHObjectGhost,
	#traits : 'GHTNotNilGhost',
	#classTraits : 'GHTNotNilGhost classTrait',
	#instVars : [
		'superclass',
		'methodDict',
		'format'
	],
	#category : 'Ghost-ClassGhost'
}

{ #category : #accessing }
GHClassGhost >> findGhostInHierarchy [

	^self
]

{ #category : #initialization }
GHClassGhost >> initializeClassProxy [
	superclass := GHInstanceMessagesInterceptor.
	methodDict := nil.
	format := GHClassGhost format.
]

{ #category : #accessing }
GHClassGhost >> instancesBehaviour [
	nil subclassResponsibility 
]

{ #category : #'simulation trick' }
GHClassGhost >> lookupSelector: selector [
	"this method is overriden to allow debugging method calls to objects which classes was proxified by me"
	
	^GHInstanceMessagesInterceptor prepareCannotInterpretMethodFor: selector  
]
