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
	^ 'Use #allUsing: with Traits'
]
