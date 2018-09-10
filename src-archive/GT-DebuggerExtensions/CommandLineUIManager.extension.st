Extension { #name : #CommandLineUIManager }

{ #category : #'*GT-DebuggerExtensions' }
CommandLineUIManager >> handleMoldableHalt: anException [

	self unhandledErrorDefaultAction: anException


]
