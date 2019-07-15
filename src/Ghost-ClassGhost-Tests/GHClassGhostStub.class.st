"
I am just example of real class ghost implementation which is used in tests. 
When I substitute class of real objects I intercept instance messages and process it by same stub behaviour which I use for direct messages. 
So real objects with class which was substituted by me will return sent messages as it result.
    
Internal Representation and Key Implementation Points.

    Instance Variables
	ghostBehaviour:		<GHGhostBehavior>
"
Class {
	#name : #GHClassGhostStub,
	#superclass : #GHClassGhost,
	#instVars : [
		'ghostBehaviour',
		'realClass'
	],
	#category : 'Ghost-ClassGhost-Tests'
}

{ #category : #'instance variables' }
GHClassGhostStub class >> new [
	^self basicNew
		ghostBehaviour: GHGhostBehaviourStub new 
]

{ #category : #accessing }
GHClassGhostStub >> ghostBehaviour [
	^ ghostBehaviour
]

{ #category : #accessing }
GHClassGhostStub >> ghostBehaviour: anObject [
	ghostBehaviour := anObject.
	self initializeClassProxy
]

{ #category : #accessing }
GHClassGhostStub >> instancesBehaviour [
	^ ghostBehaviour
]

{ #category : #accessing }
GHClassGhostStub >> name [
"This override is here to make stub usable for tests. In tests we substitute real system class GHClassStub. And it should have #name method working properly. So this method is here to skip all proxy mechanics. it just return ready to use name"

	^'a ', GHClassGhostStub name
]
