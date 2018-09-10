Class {
	#name : #GTReflectivityDebugAction,
	#superclass : #DebugAction,
	#instVars : [
		'breakpoints',
		'debuggerData'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #adding }
GTReflectivityDebugAction >> addBreakpoint: aBreakpoint [

	aBreakpoint targetAction: self.
	self breakpoints add: aBreakpoint.
	^ aBreakpoint
]

{ #category : #scripting }
GTReflectivityDebugAction >> afterMethodBreakpoint [
	^ self addBreakpoint: GTDebuggerMethodAfterBreakpoint new
]

{ #category : #callbacks }
GTReflectivityDebugAction >> attachBreakpoints [
	"I am a callback used to add breakpoints to this debugging action."
	
]

{ #category : #scripting }
GTReflectivityDebugAction >> beforeMethodBreakpoint [
	^ self addBreakpoint: GTDebuggerMethodBeforeBreakpoint new
]

{ #category : #callbacks }
GTReflectivityDebugAction >> breakpointReachedFrom: aBreakpoint [
	"Callback method called when any one of the breakpoints installed 
	by this action is reached."

	self uninstallBreakpoints.
	self openDebuggerForBreakpoint: aBreakpoint
]

{ #category : #accessing }
GTReflectivityDebugAction >> breakpoints [

	^ breakpoints ifNil: [ breakpoints := OrderedCollection new ]
]

{ #category : #accessing }
GTReflectivityDebugAction >> debuggerClass [
	"I return the debugger class that this action will open when 
	one of its breakpoints is reached. Subclasses should override
	me if they need to open a specific debugger."
	^ Smalltalk tools debugger
]

{ #category : #accessing }
GTReflectivityDebugAction >> debuggerData [

	^ debuggerData ifNil: [ debuggerData := Dictionary new ]
]

{ #category : #actions }
GTReflectivityDebugAction >> executeAction [

	self attachBreakpoints.
	self installBreakpoints.
	self resumeDebugger.
]

{ #category : #initialization }
GTReflectivityDebugAction >> initialize [
	super initialize.
	self needsUpdate: false
]

{ #category : #actions }
GTReflectivityDebugAction >> installBreakpoints [
	self breakpoints do: #install.
]

{ #category : #opening }
GTReflectivityDebugAction >> openDebuggerForBreakpoint: aBreakpoint [
	"FIX ME: consider moving this method to the actual breakpoint 
	so that actions become more lighweight"
	|ctxt|
	ctxt := thisContext.
	
	UIManager default 
		debugProcess: Processor activeProcess 
		context: (aBreakpoint instrumentationContextFrom: ctxt)
		label: (self debuggerData at: #title)
		usingDebuggerClass: self debuggerClass
		initializedSessionWith: [ :aSession | 
			self updateDebuggingSession: aSession forBreakpoint: aBreakpoint. ]
		initializedDebuggerWith: [ :aDebugger | 
			aDebugger window 
				position: (self debuggerData at: #position);
				extent: (self debuggerData at: #extent) ]
]

{ #category : #actions }
GTReflectivityDebugAction >> resumeDebugger [

	self saveDebuggerData.
	self session 
		resume;
		clear.
	self debugger close. 
]

{ #category : #actions }
GTReflectivityDebugAction >> saveDebuggerData [

	self debuggerData at: #title put: self debugger title.
	self debuggerData at: #position put: self debugger window position.
	self debuggerData at: #extent put: self debugger window extent.
]

{ #category : #actions }
GTReflectivityDebugAction >> uninstallBreakpoints [
	self breakpoints do: #uninstall.
]

{ #category : #callbacks }
GTReflectivityDebugAction >> updateDebuggingSession: aSession forBreakpoint: aBreakpoint [
	"I update the session based on the breakpoint that was reached.
	Subclasses that want to provide custom update for the session
	should override me."
	aBreakpoint updateDebuggingSession: aSession
]
