Extension { #name : #Process }

{ #category : #'*GT-DebuggerExtensions' }
Process >> debugMoldableHalt: context title: title [

	^ (Smalltalk tools debuggerDispatcherFor: context) ifNotNilDo: [ :aDebugger | 
		UIManager default  
			openDebugger: aDebugger
			initializedWith: [  ]
			on: self 
			context: context 
			label: title 
			contents: nil 
			fullView: true ]
]

{ #category : #'*GT-DebuggerExtensions' }
Process >> stepUntil: aPredicate from: aContext [
	"Resume self until the top context safisfy the given condition."

	| ctxt  |
	
	ctxt := aContext.
	[ 
		ctxt notNil and: [aPredicate matches: ctxt]
	] whileFalse: [
		ctxt := self step: ctxt.
	].
	^ ctxt
]
