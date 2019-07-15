"
I am delegation behaviour for ghost. I just resend intercepted message to my target object

My instance can be creation by:
	GHDelegatorBehaviour metaLevel: aGHMetaLevel target: anObject
	GHDelegatorBehaviour target: anObject

Internal Representation and Key Implementation Points.

    Instance Variables
	metaLevel:		<GHMetaLevel>
	target:		<Object>
"
Class {
	#name : #GHDelegatorBehaviour,
	#superclass : #GHGhostBehaviour,
	#instVars : [
		'metaLevel',
		'target'
	],
	#category : 'Ghost-ObjectGhost'
}

{ #category : #'instance creation' }
GHDelegatorBehaviour class >> metaLevel: aGHMetaLevel target: anObject [ 
	^(self target: anObject)
		metaLevel: aGHMetaLevel
]

{ #category : #'instance creation' }
GHDelegatorBehaviour class >> target: anObject [ 
	^self new 
		target: anObject
]

{ #category : #accessing }
GHDelegatorBehaviour >> currentMetaLevel [
	^metaLevel
]

{ #category : #initialization }
GHDelegatorBehaviour >> initialize [
	super initialize.
	
	metaLevel := GHMetaLevel empty
]

{ #category : #accessing }
GHDelegatorBehaviour >> metaLevel [
	^ metaLevel
]

{ #category : #accessing }
GHDelegatorBehaviour >> metaLevel: anObject [
	metaLevel := anObject
]

{ #category : #'message interception' }
GHDelegatorBehaviour >> send: aMessage to: aGhost [
	^aMessage sendTo: target
]

{ #category : #accessing }
GHDelegatorBehaviour >> target [
	^ target
]

{ #category : #accessing }
GHDelegatorBehaviour >> target: anObject [
	target := anObject
]
