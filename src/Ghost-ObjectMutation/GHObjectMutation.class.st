"
I am mutation which infects real objects to intercept all their messages.
I replace class of victim object and use cannotInterpret:  trick  from my superclass GHClassGhost.

From the meta level point of view mutated objects should be like normal ones. For this I use original implementation of meta messages from mutated objects. So GHMetaMessages approach is only used to detect that particular message belongs to meta level but execution of meta messages is performed by mutated objects themselfs.
But some meta messages should be overriden (or new added) to see that object is mutated and to manage it specifically. For this purpose  all methods of GHVictimMetaMessages class are used as preferred implementation of meta messages.
All describing logic of meta level is implemented by GHVictimBehaviour which created with actual mutation behaviour to perform actual processing of intercepted domain messages. But meta messages are processed by victim behaviour with help of mutation current meta level.

Since I substitute class of mutated object I play role of original object class. I delegate all messages to victim class by classDelegator behaviour.

To infect object you can perform: 
	mutation mutate: anObject 
And to heal infected object: 
	mutation heal: mutatedObject
or just ask object 
	mutatedObject recoverFromGHMutation
To check that object infected use 
	object hasGHMutation 
You can ask object for it mutation 
	object ghMutation
(returns nil for not mutated objects).

To create my instances use 
	GHObjectMutation behaviour: aGhostBehaviour
	
Internal Representation and Key Implementation Points.

    Instance Variables
	classDelegator:		<GHDelegatorBehaviour>
	victimBehaviour:		<GHVictimBehaviour>
"
Class {
	#name : #GHObjectMutation,
	#superclass : #GHClassGhost,
	#instVars : [
		'classDelegator',
		'victimBehaviour'
	],
	#category : 'Ghost-ObjectMutation'
}

{ #category : #'instance creation' }
GHObjectMutation class >> behaviour: aGhostBehaviour [
	^self basicNew 
		mutationBehaviour: aGhostBehaviour 
]

{ #category : #comparison }
GHObjectMutation >> = anObject [
	anObject ghostClass == GHObjectMutation ifTrue: [ ^self victimClass == anObject victimClass ].
	
	^self victimClass = anObject
]

{ #category : #accessing }
GHObjectMutation >> ghostBehaviour [
	^ classDelegator
]

{ #category : #infecting }
GHObjectMutation >> heal: anObject [
	anObject ghMutation == self ifFalse: [ 
		anObject ghMutation == nil ifTrue: [ ^self ].
		self error: 'I cant heal object which was infected by sombody else!'
	].
	
	GHMetaMessages setClass: self victimClass to: anObject
]

{ #category : #comparison }
GHObjectMutation >> inheritsFrom: aClass [
	
	^self victimClass inheritsFrom: aClass
]

{ #category : #accessing }
GHObjectMutation >> instancesBehaviour [
	^ victimBehaviour 
]

{ #category : #infecting }
GHObjectMutation >> mutate: anObject [

	anObject ghMutation ifNotNil: [ :existedMutation |
		existedMutation == self ifTrue: [ ^self ].
		self error: 'I cant infect infected object!'].
	
	self victimClass: anObject class.
	anObject injectGHMutation: self
]

{ #category : #accessing }
GHObjectMutation >> mutationBehaviour [
	^victimBehaviour mutationBehaviour
]

{ #category : #accessing }
GHObjectMutation >> mutationBehaviour: aGhostBehaviour [
	victimBehaviour := GHVictimBehaviour forMutationWith: aGhostBehaviour.
	classDelegator := GHDelegatorBehaviour new.
	self initializeClassProxy 
]

{ #category : #accessing }
GHObjectMutation >> victimBehaviour [
	^ victimBehaviour
]

{ #category : #accessing }
GHObjectMutation >> victimClass [
	^classDelegator target
]

{ #category : #accessing }
GHObjectMutation >> victimClass: aClass [
	(self victimClass == nil) | (self victimClass == aClass) ifFalse: [ 
		^self error: 'Victim class should not be changed. It instances can be already infected'  ].
	
	classDelegator target: aClass.
	superclass := GHInstanceMessagesInterceptor for: aClass
]
