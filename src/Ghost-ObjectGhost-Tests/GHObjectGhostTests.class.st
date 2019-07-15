Class {
	#name : #GHObjectGhostTests,
	#superclass : #GHGhostTestCase,
	#category : 'Ghost-ObjectGhost-Tests'
}

{ #category : #running }
GHObjectGhostTests >> ghostClass [
	^GHObjectGhostStub
]

{ #category : #tests }
GHObjectGhostTests >> testInterceptingClassMessage [

	| actual |
	ghost ghostBehaviour clearMetaMessages.
	
	actual := ghost class.
	
	self assert: actual selector equals: #class
]

{ #category : #tests }
GHObjectGhostTests >> testInterceptingMessage [

	| actual |
	actual := ghost someMessage.
	
	self assert: actual selector equals: #someMessage
]

{ #category : #tests }
GHObjectGhostTests >> testInterceptingMessageByPerform [

	| actual |
	actual := ghost perform: #someMessage.
	
	self assert: actual selector equals: #someMessage
]

{ #category : #tests }
GHObjectGhostTests >> testProcessingClassMetaMessage [

	| actual |
	actual := ghost class.
	
	self assert: actual equals: GHObjectGhostStub
]

{ #category : #tests }
GHObjectGhostTests >> testShouldDefineRealGhostClass [

	| actual |
	actual := ghost ghostClass.
	
	self assert: actual equals: GHObjectGhostStub 
]
