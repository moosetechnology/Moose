Extension { #name : #GTMoldableDebugger }

{ #category : #'*GT-DebuggerExtensions' }
GTMoldableDebugger class >> openOn: aDebugSession withFullView: aBool notification: aString initializedWith: aBlock [
	
	| debugger |
	
	debugger := self on: aDebugSession.
	
	aBool | self alwaysOpenFullDebugger
		ifTrue: [ debugger openWithFullView ]
		ifFalse: [ debugger openWithNotification: aString].
	aBlock value: debugger.
]
