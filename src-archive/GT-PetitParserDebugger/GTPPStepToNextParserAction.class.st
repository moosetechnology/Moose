Class {
	#name : #GTPPStepToNextParserAction,
	#superclass : #GTPPDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToNextParserAction class >> gtActionType [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>
]

{ #category : #accessing }
GTPPStepToNextParserAction >> defaultCategory [

	^ 'Next parser invocation'
]

{ #category : #accessing }
GTPPStepToNextParserAction >> defaultIcon [

	^ GLMUIThemeExtraIcons glamourousNextParser
]

{ #category : #accessing }
GTPPStepToNextParserAction >> defaultLabel [ 

	^ 'Next parser'
]

{ #category : #accessing }
GTPPStepToNextParserAction >> defaultOrder [

	^ 190
]

{ #category : #actions }
GTPPStepToNextParserAction >> executeAction [
	
	self session 
		stepOverInitialInstructionForContext: self startContext;
		stepToNextParserFromContext: self startContext
]
