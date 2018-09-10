Class {
	#name : #GHObjectDelegatorTests,
	#superclass : #GHGhostTestCase,
	#instVars : [
		'delegationTarget'
	],
	#category : 'Ghost-ObjectGhost-Tests'
}

{ #category : #running }
GHObjectDelegatorTests >> delegationTarget: anObject [
		
	ghost ghostBehaviour target: anObject
]

{ #category : #running }
GHObjectDelegatorTests >> ghostClass [
	^GHObjectGhostStub
]

{ #category : #running }
GHObjectDelegatorTests >> setUp [
	super setUp.

	delegationTarget := 'delegation target'.
		
	ghost ghostBehaviour: (GHDelegatorBehaviour metaLevel: GHMetaLevel standard target: delegationTarget)
]

{ #category : #tests }
GHObjectDelegatorTests >> testDelegationClassMessageWhenEmptyMetaLevel [

	ghost ghostBehaviour metaLevel: GHMetaLevel empty.
	self delegationTarget: 20@30.
	
	self assert: ghost class equals: Point
]

{ #category : #tests }
GHObjectDelegatorTests >> testDelegationMessages [

	self delegationTarget: 20@30.
	
	self assert: ghost x equals: 20
]

{ #category : #tests }
GHObjectDelegatorTests >> testDelegationUnknownMessage [

	self delegationTarget: 20@30.
	
	self should: [ghost someMessage] raise: MessageNotUnderstood 
]
