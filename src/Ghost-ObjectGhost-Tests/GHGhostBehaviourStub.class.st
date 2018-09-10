"
I am just example of ghost behaviour which just returns intercepting messages as it result. Look at method #send:to: .
I define meta level as standart meta messages.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	metaLevel:		<GHMetaLevel>

"
Class {
	#name : #GHGhostBehaviourStub,
	#superclass : #GHGhostBehaviour,
	#instVars : [
		'metaLevel'
	],
	#category : 'Ghost-ObjectGhost-Tests'
}

{ #category : #initialization }
GHGhostBehaviourStub >> clearMetaMessages [
	metaLevel := GHMetaLevel with: GHEmptyMetaMessages 
]

{ #category : #accessing }
GHGhostBehaviourStub >> currentMetaLevel [
	^metaLevel
]

{ #category : #initialization }
GHGhostBehaviourStub >> initialize [
	super initialize.
	
	metaLevel := GHMetaLevel standard
]

{ #category : #accessing }
GHGhostBehaviourStub >> metaLevel [
	^metaLevel
]

{ #category : #accessing }
GHGhostBehaviourStub >> metaLevel: anObject [
	metaLevel := anObject
]

{ #category : #'message interception' }
GHGhostBehaviourStub >> send: aMessage to: aGhost [
	^aMessage
]
