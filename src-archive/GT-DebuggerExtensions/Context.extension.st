Extension { #name : #Context }

{ #category : #'*GT-DebuggerExtensions' }
Context >> isHaltContext [

	^ self method selector = #halt
]
