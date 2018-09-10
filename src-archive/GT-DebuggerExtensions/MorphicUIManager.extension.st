Extension { #name : #MorphicUIManager }

{ #category : #'*GT-DebuggerExtensions' }
MorphicUIManager >> debugProcess: process context: context label: title usingDebuggerClass: debuggerClass initializedSessionWith: aSessionBlock initializedDebuggerWith: aDebuggerBlock [
	"Open a notifier in response to an error, halt, or notify. A notifier view
	just shows a short view of the sender stack and provides a menu that
	lets the user open a full debugger."

	| debugSession |

	debugSession := debuggerClass sessionClass named: title on: process startedAt: context.
	
	debugSession logStackToFileIfNeeded.
	debugSession isAboutUIProcess ifTrue: [ self spawnNewProcess  ].
		
	self defer:	[ 
			"schedule debugger in deferred UI message to address
			redraw problems after opening a debugger e.g. from
			the testrunner."
		[
			aSessionBlock value: debugSession.
			debuggerClass 
				openOn: debugSession withFullView: false notification: nil initializedWith: aDebuggerBlock.
		] on: Error do: [ :ex | 	debugSession signalDebuggerError: ex] 
	].

	process suspend.

]

{ #category : #'*GT-DebuggerExtensions' }
MorphicUIManager >> debugProcess: process context: context label: title usingDebuggerInstance: aDebugger initializedSessionWith: aSessionBlock initializedDebuggerWith: aDebuggerBlock [
	"Open a notifier in response to an error, halt, or notify. A notifier view
	just shows a short view of the sender stack and provides a menu that
	lets the user open a full debugger."

	| debugSession |

	debugSession := aDebugger class sessionClass named: title on: process startedAt: context.
	
	debugSession logStackToFileIfNeeded.
	debugSession isAboutUIProcess ifTrue: [ self spawnNewProcess  ].
		
	self defer:	[ 
			"schedule debugger in deferred UI message to address
			redraw problems after opening a debugger e.g. from
			the testrunner."
		[
			aSessionBlock value: debugSession.
			(aDebugger session: debugSession).
			aDebuggerBlock value: aDebugger.
		] on: Error do: [ :ex | 	debugSession signalDebuggerError: ex] 
	].

	process suspend.

]

{ #category : #'*GT-DebuggerExtensions' }
MorphicUIManager >> handleMoldableHalt: anException [

	^ Smalltalk tools debugMoldableHalt: anException.
]

{ #category : #'*GT-DebuggerExtensions' }
MorphicUIManager >> openDebugger: debuggerClass initializedWith: aBlock on: process context: context label: title contents:  contentsStringOrNil fullView: bool [ 
	"Open a notifier in response to an error, halt, or notify. A notifier view
	just shows a short view of the sender stack and provides a menu that
	lets the user open a full debugger."
	| errorWasInUIProcess  debugger |
	errorWasInUIProcess := self spawnNewProcessIfThisIsUI: process.
	[Smalltalk tools debugger logDebuggerStackToFile
		ifTrue: [Smalltalk
				logError: title
				inContext: context ]] on: Error do: [].
	debugger := debuggerClass new.
	self defer: [[ 
			debugger
				process: process
				controller: nil
				context: context.
			aBlock cull: debugger.
			"schedule debugger in deferred UI message to address
			redraw problems after opening a debugger e.g. from
			the testrunner."
			"self defer: ["
			bool
				ifTrue: [debugger openFullNoSuspendLabel: title]
				ifFalse: [debugger openNotifierContents: contentsStringOrNil label: title].
			debugger errorWasInUIProcess: errorWasInUIProcess.]
				on: Error
				do: [:ex | Smalltalk tools debugger primitiveError: 'Orginal error: ' , title asString , '.
	Smalltalk tools debugger error: '
							, ([ex description]
									on: Error
									do: ['a ' , ex class printString]) , ':']].

	process suspend.
	^ debugger
]
