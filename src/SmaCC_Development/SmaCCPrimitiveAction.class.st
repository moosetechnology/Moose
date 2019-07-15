"
SmaCCPrimitiveAction is an abstract class that represents a basic LR state/symbol action (shift, reduce, accept, or reject).

Instance Variables:
	lr1Item	<SmaCCLR1Item>	the item that the action is for


"
Class {
	#name : #SmaCCPrimitiveAction,
	#superclass : #SmaCCAction,
	#instVars : [
		'lr1Item'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCPrimitiveAction class >> id [
	^ nil
]

{ #category : #'instance creation' }
SmaCCPrimitiveAction class >> item: aSmaCCLR1Item [
	^ self new
		lr1Item: aSmaCCLR1Item;
		yourself
]

{ #category : #accessing }
SmaCCPrimitiveAction >> id [
	^ self class id
]

{ #category : #accessing }
SmaCCPrimitiveAction >> lr1Item [
	^ lr1Item
]

{ #category : #'initialize-release' }
SmaCCPrimitiveAction >> lr1Item: aSmaCCLR1Item [
	lr1Item := aSmaCCLR1Item
]
