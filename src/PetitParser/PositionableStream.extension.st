Extension { #name : #PositionableStream }

{ #category : #'*petitparser-core' }
PositionableStream >> peekTwice [
	"Answer what would be returned if the message next were sent to the 
	receiver. If the receiver is at the end, answer nil."

	| array |
	self atEnd 
		ifTrue: [^Array with: nil with: nil].
	array := Array with: (self next) with: (self peek).
	position := position - 1.
	^array
]
