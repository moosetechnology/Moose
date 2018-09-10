Extension { #name : #Class }

{ #category : #'*Roassal2' }
Class >> visualworksName [
	^ self == Behavior 
		ifTrue: [ 'Core.Behavior' ]
		ifFalse: [ self name ]
]
