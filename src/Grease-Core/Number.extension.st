Extension { #name : #Number }

{ #category : #'*grease-core' }
Number >> greaseInteger [
	"Answer an integer of the receiver, in our case we simply truncate the number."
	^ self truncated
]
