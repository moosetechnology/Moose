Extension { #name : #Trait }

{ #category : #'*Roassal2' }
Trait >> visualworksName [
	^ self == Behavior 
		ifTrue: [ 'Core.Behavior' ]
		ifFalse: [ self name ]
]
