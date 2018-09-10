"
I am just example of real ghost implementation which is used in tests. 
I define stub behaviour GHGhostBehaviourStub to just return intercepting messages as it result.  I implement new method which is initialized behaviour.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	ghostBehaviour:		<GHGhostBehaviour>
"
Class {
	#name : #GHObjectGhostStub,
	#superclass : #GHObjectGhost,
	#traits : 'GHTNotNilGhost',
	#classTraits : 'GHTNotNilGhost classTrait',
	#instVars : [
		'ghostBehaviour'
	],
	#category : 'Ghost-ObjectGhost-Tests'
}

{ #category : #'instance creation' }
GHObjectGhostStub class >> new [
	^self basicNew
		ghostBehaviour: GHGhostBehaviourStub new 
]

{ #category : #accessing }
GHObjectGhostStub >> ghostBehaviour [
	^ ghostBehaviour
]

{ #category : #accessing }
GHObjectGhostStub >> ghostBehaviour: anObject [
	ghostBehaviour := anObject
]
