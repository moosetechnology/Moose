Extension { #name : #DummyUIManager }

{ #category : #'*GT-DebuggerExtensions' }
DummyUIManager >> handleMoldableHalt: anException [

	self unhandledErrorDefaultAction: anException
]
