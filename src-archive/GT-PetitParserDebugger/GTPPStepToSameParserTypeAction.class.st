Class {
	#name : #GTPPStepToSameParserTypeAction,
	#superclass : #GTPPStepToParserTypeAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToSameParserTypeAction class >> gtActionType [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>
]

{ #category : #testing }
GTPPStepToSameParserTypeAction >> appliesToContext: aContext [

	^ (super appliesToContext: aContext) and: [ 
		aContext receiver class inheritsFrom: PPParser ]
]

{ #category : #accessing }
GTPPStepToSameParserTypeAction >> defaultCategory [

	^ 'Next parser invocation'
]

{ #category : #accessing }
GTPPStepToSameParserTypeAction >> defaultLabel [ 

	^ 'same parser type'
]

{ #category : #accessing }
GTPPStepToSameParserTypeAction >> defaultOrder [

	^ 205
]

{ #category : #accessing }
GTPPStepToSameParserTypeAction >> defaultParserClass [

	^ self currentContext receiver class
]
