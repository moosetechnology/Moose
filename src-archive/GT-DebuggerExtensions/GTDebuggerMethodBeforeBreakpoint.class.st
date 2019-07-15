Class {
	#name : #GTDebuggerMethodBeforeBreakpoint,
	#superclass : #GTDebuggerBrekpoint,
	#instVars : [
		'targetMethod'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #actions }
GTDebuggerMethodBeforeBreakpoint >> install [

	self metaLink: (MetaLink new
		metaObject: self;
		selector: #breakpointReached;
		condition: condition arguments: conditionArguments;
		control: #before).
	targetMethod ast link: self metaLink.

]

{ #category : #accessing }
GTDebuggerMethodBeforeBreakpoint >> instrumentationContextFrom: aContext [

	^ aContext  "GTPPStepToNextProductionReflectivityAction(GTReflectivityDebugAction)>>openDebuggerForBreakpoint:"
		sender   "GTPPStepToNextProductionReflectivityAction(GTReflectivityDebugAction)>>breakpointReachedFrom:"
		sender   "GTDebuggerMethodEntryBreakpoint(GTDebuggerBrekpoint)>>breakpointReached"
		sender   "Instrumented method -> at the beginning after sending breakpointReached"
]

{ #category : #accessing }
GTDebuggerMethodBeforeBreakpoint >> targetMethod [
	^ targetMethod
]

{ #category : #accessing }
GTDebuggerMethodBeforeBreakpoint >> targetMethod: anObject [
	targetMethod := anObject
]

{ #category : #actions }
GTDebuggerMethodBeforeBreakpoint >> updateDebuggingSession: aSession [
	"I remove the reflectivity instrumentation from the top of the stack.
	The at this point the stack in the <suspended context> from the <interrupted process> has this shape: 
	   [1] suspended: MorphicUIManager>>debugProcess:context:label:fullView:notification:usingDebugger:initializedWith:
		[2] sender:    GTPPStepToNextProductionReflectivityAction(GTReflectivityDebugAction)>>openDebuggerForBreakpoint:
		[3] sender:    GTPPStepToNextProductionReflectivityAction(GTReflectivityDebugAction)>>breakpointReachedFrom:
		[4] sender:    GTDebuggerMethodEntryBreakpoint(GTDebuggerBrekpoint)>>breakpointReached
      [5] sender:    <targetMethod> called from the reflective method; this contains the reflectivity metalink. 
	-> [6] sender:    ReflectiveMethod>>run:with:in: -> [this is the context that needs to be removed]
		[7] sender:    method calling the reflective method -> [this needs to call directly <targetMethod>].
		
	At this point the <interrupted context> from the session has at the context [5]."
	super updateDebuggingSession: aSession.
	
	"Step over to ensure that the context that opened the debugger is no longer on the stack"
	aSession stepOver.
	"After this call both the interrupted context and suspended context point to [5]"
	
	"Remote the sender containing the reflectivity method calling the target methodd"
	"The current interrupted context is the target method"
	"The sender is the reflectivity method that calls the method"
	"The sender of the sender is the context calling the method"
	aSession interruptedContext 
		swapSender: aSession interruptedContext sender sender.
		
	aSession interruptedProcess restartTopWith: self targetMethod. "Restart the top context to remove the instrumented code"
	aSession interruptedProcess stepToSendOrReturn. "Find the first sender to simulate how the debugger actions work"
	aSession updateContextTo: aSession interruptedProcess suspendedContext. "Update the session as a normal debugging action"
]
