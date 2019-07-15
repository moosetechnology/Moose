Class {
	#name : #GTPPStepToSameNamedProductionAction,
	#superclass : #GTPPStepToNextNamedProductionAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToSameNamedProductionAction class >> gtActionType [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>

	
]

{ #category : #testing }
GTPPStepToSameNamedProductionAction >> appliesToContext: aContext [

	^ (super appliesToContext: aContext) and: [ 
		self session isPPProduction: aContext receiver ]
]

{ #category : #accessing }
GTPPStepToSameNamedProductionAction >> defaultCategory [

	^ 'Next parser invocation'
]

{ #category : #accessing }
GTPPStepToSameNamedProductionAction >> defaultLabel [

	^ 'same production'
]

{ #category : #accessing }
GTPPStepToSameNamedProductionAction >> defaultOrder [

	^ 204
]

{ #category : #accessing }
GTPPStepToSameNamedProductionAction >> defaultProduction [

	^ self currentContext receiver name
]
