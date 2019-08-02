Class {
	#name : #MooseAllWithTypeOnTrait,
	#superclass : #Error,
	#category : #'Moose-Core-Exception'
}

{ #category : #private }
MooseAllWithTypeOnTrait >> isResumable [ 
	^ false
]

{ #category : #private }
MooseAllWithTypeOnTrait >> messageText [
	^ 'Do not use allWithTrait with a Trait. Use allWithSubTypesOf:'
]
