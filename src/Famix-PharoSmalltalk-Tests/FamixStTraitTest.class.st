Class {
	#name : #FamixStTraitTest,
	#superclass : #FamixStTypeTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStTraitTest >> actualClass [ 
		^ FamixStTrait
]

{ #category : #tests }
FamixStTraitTest >> testBackReferences [
	| trait user traitUsage |
	self skip: 'Traits are not yet managed in St'.
	trait := FamixStTrait new.
	user := FamixStClass new.
	traitUsage := FamixStTraitUsage new user: user; trait: trait.
	self assert: user outgoingTraitUsages size equals: 1.
	self assert: trait incomingTraitUsages size equals: 1.
]
