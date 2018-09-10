Extension { #name : #Class }

{ #category : #'*Magritte-Model' }
Class >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self label;
		yourself
]

{ #category : #'*Magritte-Model' }
Class >> label [
	"Answer a human-readable name of the receiving class. This implementation tries to be smart and return a nice label, unfortunately for a lot of classes this doesn't work well so subclasses might want to override this method and return soemthing more meaningfull to end-users."

	| start input |
	start := self name findFirst: [ :each | each isLowercase ].
	input := (self name copyFrom: (1 max: start - 1) to: self name size)
		readStream.
	^ String streamContents: [ :stream |
		[ input atEnd ] whileFalse: [
			stream nextPut: input next.
			(input atEnd or: [ input peek isLowercase ])
				ifFalse: [ stream nextPut: Character space ] ] ]
]
