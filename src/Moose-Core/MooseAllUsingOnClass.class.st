Class {
	#name : #MooseAllUsingOnClass,
	#superclass : #Error,
	#category : #'Moose-Core-Exception'
}

{ #category : #private }
MooseAllUsingOnClass >> isResumable [ 
	^ false
]

{ #category : #private }
MooseAllUsingOnClass >> messageText [
	^ 'Use #allWithSubTypesOf: or #allWithType: with Class'
]
