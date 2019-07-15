Extension { #name : #UIManager }

{ #category : #'*GT-DebuggerExtensions' }
UIManager >> handleMoldableHalt: anException [

	"See UIManager>>unhandledErrorDefaultAction:"
		
	Smalltalk snapshot: false andQuit: true.
]
