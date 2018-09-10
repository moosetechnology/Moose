Class {
	#name : #GTPPStepToPPDebugger,
	#superclass : #DebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToPPDebugger class >> gtActionType [
	<gtDebuggingAction>
]

{ #category : #testing }
GTPPStepToPPDebugger >> appliesToContext: aContext [
	self flag: 'A better mechanism for determining if an action is active or not is needed.'.
	
	^ self debugger class ~= self debuggerClass
]

{ #category : #accessing }
GTPPStepToPPDebugger >> debuggerClass [
	
	^ GTPPDebugger
]

{ #category : #accessing }
GTPPStepToPPDebugger >> defaultCategory [
	
	^ 'Step to debugger'
]

{ #category : #accessing }
GTPPStepToPPDebugger >> defaultLabel [ 
	
	^ self debuggerClass defaultTitle
]

{ #category : #accessing }
GTPPStepToPPDebugger >> defaultOrder [

	^ 150
]

{ #category : #actions }
GTPPStepToPPDebugger >> executeAction [

	self session
		stepUntil: (self session 
			createStepPredicateForPredicate: self isPPDebuggerActivePredicate 
			fromContext: self currentContext ) 
		from: self currentContext.
		
	(self isPPDebuggerActivePredicate matches: self interruptedContext) ifTrue: [ 
		self debugger debug: self interruptedContext using: self debuggerClass ]

]

{ #category : #'as yet unclassified' }
GTPPStepToPPDebugger >> initialize [ 
	super initialize.
	
	self needsUpdate: false
]

{ #category : #testing }
GTPPStepToPPDebugger >> isPPDebuggerActivePredicate [

	^ self session createPredicateForBlock: [ :aContext |
		aContext isPPParseMethodContext ]
]
