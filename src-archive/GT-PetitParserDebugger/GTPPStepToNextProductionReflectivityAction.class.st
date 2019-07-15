Class {
	#name : #GTPPStepToNextProductionReflectivityAction,
	#superclass : #GTPPReflectivityStepDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToNextProductionReflectivityAction class >> gtToNextProductionAction [
	"<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>"
]

{ #category : #accessing }
GTPPStepToNextProductionReflectivityAction >> attachBreakpoints [
		
	self beforeMethodBreakpoint
		targetMethod: PPDelegateParser>>#parseOn:
]

{ #category : #initialization }
GTPPStepToNextProductionReflectivityAction >> initialize [
	super initialize.
	self 
		label: 'Next production';
		category: 'Next parser invocation (fast)';
		"icon: GLMUIThemeExtraIcons glamourousNextProduction;"
		order: 195
]
