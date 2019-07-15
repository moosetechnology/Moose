Class {
	#name : #GTPPStepToNextNonDelegateParserAction,
	#superclass : #GTPPDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToNextNonDelegateParserAction class >> gtActionType [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>
]

{ #category : #accessing }
GTPPStepToNextNonDelegateParserAction >> defaultCategory [
	
	^ 'Next parser invocation'
]

{ #category : #accessing }
GTPPStepToNextNonDelegateParserAction >> defaultLabel [ 
	
	^ 'any primitive parser'
]

{ #category : #accessing }
GTPPStepToNextNonDelegateParserAction >> defaultOrder [

	^ 201
]

{ #category : #actions }
GTPPStepToNextNonDelegateParserAction >> executeAction [	

	self session 
		stepOverInitialInstructionForContext: self startContext;
		stepToNextNonDelegateParserFromContext: self startContext

]
