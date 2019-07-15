Class {
	#name : #GTDebuggerMethodAfterBreakpoint,
	#superclass : #GTDebuggerBrekpoint,
	#instVars : [
		'targetMethod'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #actions }
GTDebuggerMethodAfterBreakpoint >> install [

	self metaLink: (MetaLink new
		metaObject: self;
		selector: #breakpointReached;
		condition: condition arguments: conditionArguments;
		control: #after).
	targetMethod ast link: self metaLink.

]

{ #category : #accessing }
GTDebuggerMethodAfterBreakpoint >> instrumentationContextFrom: aContext [

	^ aContext  "--(GTReflectivityDebugAction)>>openDebuggerForBreakpoint:" 
		sender   "--(GTReflectivityDebugAction)>>breakpointReachedFrom:"
		sender   "--(GTDebuggerBrekpoint)>>breakpointReached"
		sender   "instrumented method -> ensure block calling breakpointReached"
		sender   "Context>>#resume:through:"
		sender   "Context>>ensure:"
		sender   "instrumented method -> before exiting"
]

{ #category : #accessing }
GTDebuggerMethodAfterBreakpoint >> targetMethod [
	^ targetMethod
]

{ #category : #accessing }
GTDebuggerMethodAfterBreakpoint >> targetMethod: anObject [
	targetMethod := anObject
]

{ #category : #actions }
GTDebuggerMethodAfterBreakpoint >> updateDebuggingSession: aSession [
	super updateDebuggingSession: aSession.
	
	aSession stepOver. "instrumented method -> ensure block calling breakpointReached"
	aSession stepOver. "ReflectiveMethod>>run:with:in:"
]
