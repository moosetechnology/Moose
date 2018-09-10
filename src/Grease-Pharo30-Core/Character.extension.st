Extension { #name : #Character }

{ #category : #'*Grease-Pharo30-Core' }
Character >> greaseInteger [
	"Answer an unicode code point of the receiver."
	^ self charCode
]
