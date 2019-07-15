Extension { #name : #TestCase }

{ #category : #'*Moose-Algos-LinearAlgebra' }
TestCase >> assertBlock: aBlock raises: anExceptionalEvent [
	
	^[aBlock value.
	false]
		on: anExceptionalEvent
		do: [:ex | ex return: true]
]
