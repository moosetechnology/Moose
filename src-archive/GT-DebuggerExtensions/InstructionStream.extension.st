Extension { #name : #InstructionStream }

{ #category : #'*GT-DebuggerExtensions' }
InstructionStream >> isInitialnstruction [

	^ self pc = self method initialPC
]
