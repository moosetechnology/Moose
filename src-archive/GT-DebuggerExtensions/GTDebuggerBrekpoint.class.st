Class {
	#name : #GTDebuggerBrekpoint,
	#superclass : #Object,
	#instVars : [
		'metaLink',
		'condition',
		'conditionArguments',
		'targetAction'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #actions }
GTDebuggerBrekpoint >> breakpointReached [
	"I am called when the breakpoint is reached. If there is an 
	associated condition with the breakpoint I am only called if
	the conditions holds."
	
	self targetAction breakpointReachedFrom: self 
]

{ #category : #'adding/removing methods' }
GTDebuggerBrekpoint >> detachFromAction [
	self targetAction: nil
]

{ #category : #actions }
GTDebuggerBrekpoint >> install [
	self subclassResponsibility
]

{ #category : #accessing }
GTDebuggerBrekpoint >> instrumentationContextFrom: aContext [
	"The action of opening the debugger will be called from the debugging action.
	Hence the top context will not be the one where the metalink was declared,
	but the one were the debugger was opened. To avoid that we give the breakpoint a
	chance to return the correct context that contains the metalink instrumentation."
	
	^ aContext
]

{ #category : #accessing }
GTDebuggerBrekpoint >> metaLink [
	^ metaLink
]

{ #category : #accessing }
GTDebuggerBrekpoint >> metaLink: anObject [
	metaLink := anObject
]

{ #category : #accessing }
GTDebuggerBrekpoint >> targetAction [
	^ targetAction
]

{ #category : #accessing }
GTDebuggerBrekpoint >> targetAction: anObject [
	targetAction := anObject
]

{ #category : #actions }
GTDebuggerBrekpoint >> uninstall [
	self metaLink uninstall 
]

{ #category : #actions }
GTDebuggerBrekpoint >> updateDebuggingSession: aSession [
	"I am a callback that is called before the debugger is opened.
	I can be used to remove the instrumentation from the displayed methods.
	At this point the debugger process is suspended."
]

{ #category : #conditions }
GTDebuggerBrekpoint >> whenReceiver: aBlock [

	condition := aBlock.
	conditionArguments := #(receiver)
]
