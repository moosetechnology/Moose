Extension { #name : #PositionableStream }

{ #category : #'*PetitParser' }
PositionableStream >> asPetitStream [
	"Some of my subclasses do not use the instance-variables collection, position and readLimit but instead have a completely different internal representation. In these cases just use the super implementation that is inefficient but should work in all cases."

"
	Disabled until we agree on some way how to optimize this

	^ (collection isNil or: [ position isNil or: [ readLimit isNil ] ])
		ifFalse: [ PPStream on: collection from: ( position + 1 ) to: readLimit ]
      ifTrue: [ super asPetitStream ]
"
	^ super asPetitStream
]

{ #category : #'*PetitParser' }
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
