Class {
	#name : #FamixTest3StaticallyDeadEntitiesTest,
	#superclass : #FamixTest3SimpleModelTest,
	#category : #'Famix-Test3-Tests'
}

{ #category : #running }
FamixTest3StaticallyDeadEntitiesTest >> setUp [
	super setUp.

	FamixTest3Invocation source: self m1 target: {self m2} model: model
]

{ #category : #tests }
FamixTest3StaticallyDeadEntitiesTest >> testAllBehaviouralsWithDeadCode [
	self assertCollection: model allBehaviouralsWithDeadCode hasSameElements: { self m1 }
]

{ #category : #tests }
FamixTest3StaticallyDeadEntitiesTest >> testDeadChildren [
	self assertCollection: self c1 deadChildren hasSameElements: {self m1}.

	self assertEmpty: self c2 deadChildren
]

{ #category : #tests }
FamixTest3StaticallyDeadEntitiesTest >> testDeadCodeRate [
	self assert: model deadCodeRate equals: 1 / 2
]

{ #category : #tests }
FamixTest3StaticallyDeadEntitiesTest >> testIsDead [
	self assert: self pt2 isDead description: 'Nobody is calling pt2 in the model. Thus it should be statically dead.'.
	self deny: self pt1 isDead description: 'm1 is referencing pt1 in the model. Thus it should not be dead.'
]

{ #category : #tests }
FamixTest3StaticallyDeadEntitiesTest >> testIsDeadWhenCalledFromWithin [
	self assert: self c1 isDead description: 'C1 is referenced but only by m1 that is inside it. Thus we can consider it is dead.'
]

{ #category : #tests }
FamixTest3StaticallyDeadEntitiesTest >> testNumberOfDeadChildren [
	self assert: self c1 numberOfDeadChildren equals: 1.
	self assert: self c2 numberOfDeadChildren equals: 0
]
