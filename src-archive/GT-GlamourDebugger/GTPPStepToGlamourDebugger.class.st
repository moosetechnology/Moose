Class {
	#name : #GTPPStepToGlamourDebugger,
	#superclass : #DebugAction,
	#category : #'GT-GlamourDebugger'
}

{ #category : #registration }
GTPPStepToGlamourDebugger class >> gtActionType [
	<gtDebuggingAction>
]

{ #category : #testing }
GTPPStepToGlamourDebugger >> appliesToContext: aContext [
	
	^ self debugger class ~= self debuggerClass
]

{ #category : #accessing }
GTPPStepToGlamourDebugger >> debuggerClass [
	
	^ GTGlamourDebugger
]

{ #category : #accessing }
GTPPStepToGlamourDebugger >> defaultCategory [
	
	^ 'Step to debugger'
]

{ #category : #accessing }
GTPPStepToGlamourDebugger >> defaultLabel [ 
	
	^ self debuggerClass defaultTitle
]

{ #category : #accessing }
GTPPStepToGlamourDebugger >> defaultOrder [

	^ 150
]

{ #category : #actions }
GTPPStepToGlamourDebugger >> executeAction [

	self session
		stepUntil: (self session 
			createStepPredicateForPredicate: self isGlamourDebuggerActivePredicate 
			fromContext: self currentContext ) 
		from: self currentContext.
		
	(self isGlamourDebuggerActivePredicate matches: self interruptedContext) ifTrue: [ 
		self debugger debug: self interruptedContext using: self debuggerClass ]

]

{ #category : #testing }
GTPPStepToGlamourDebugger >> isGlamourDebuggerActivePredicate [

	^ self session createPredicateForBlock: [ :aContext |
		(aContext receiver class inheritsFrom: GLMPresentation) and: [ aContext selector = #startOn: ]  ]
]
