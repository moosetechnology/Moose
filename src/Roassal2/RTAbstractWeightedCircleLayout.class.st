"
I am the abstract root class of weighted circle layout. Look at the class comments of my subclasses for more details.
"
Class {
	#name : #RTAbstractWeightedCircleLayout,
	#superclass : #RTCircleLayout,
	#category : #'Roassal2-Layouts'
}

{ #category : #hook }
RTAbstractWeightedCircleLayout >> doExecute: elements [
	"This method is used polymorphically"
]

{ #category : #hook }
RTAbstractWeightedCircleLayout >> weightSum: elements [
	"Computes the sum of all elements 'weight' or size"
	| sum |
	sum := 0.
	elements
		do: [ :each |
			sum := sum + (each height)
		].
	^sum
]
