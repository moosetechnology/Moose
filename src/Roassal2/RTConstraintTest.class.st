Class {
	#name : #RTConstraintTest,
	#superclass : #RTTest,
	#instVars : [
		'shape2',
		'shape1'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTConstraintTest >> setUp [
	super setUp.
	shape1 := (RTBox new size: 50) element.
	shape2 := (RTBox new size: 10) element.
	
	
]

{ #category : #running }
RTConstraintTest >> testStickAbove [

	RTConstraint new fix: shape1; movable: shape2; above; stick.
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ -30).
	
	shape1 translateBy: 10 @ 10.
	self assert: shape1 center = (10 @ 10).
	self assert: shape2 center = (10 @ -20).

]

{ #category : #running }
RTConstraintTest >> testStickBelow [

	RTConstraint new
		fix: shape1;
		movable: shape2;
		below;
		stick.
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ 30).

	shape1 translateBy: 10 @ 10.
	self assert: shape1 center = (10 @ 10).
	self assert: shape2 center = (10 @ 40).

]

{ #category : #running }
RTConstraintTest >> testStickToTheCenter [

	RTConstraint new
		fix: shape2;
		movable: shape1;
		center;
		stick.
		
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ 0).

	shape2 translateBy: 10 @ 15.
	self assert: shape1 center = (10 @ 15).
	self assert: shape2 center = (10 @ 15).

]
