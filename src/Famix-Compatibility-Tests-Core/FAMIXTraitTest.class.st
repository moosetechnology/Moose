Class {
	#name : #FAMIXTraitTest,
	#superclass : #FAMIXTypeTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXTraitTest >> actualClass [
	^ FAMIXTrait
]

{ #category : #tests }
FAMIXTraitTest >> testBackReferences [
	| trait user traitUsage |
	trait := FAMIXTrait new.
	user := FAMIXClass new.
	traitUsage := FAMIXTraitUsage new user: user; trait: trait.
	self assert: user outgoingTraitUsages size equals: 1.
	self assert: trait incomingTraitUsages size equals: 1.
]
