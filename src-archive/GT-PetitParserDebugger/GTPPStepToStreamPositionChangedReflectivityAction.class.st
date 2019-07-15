Class {
	#name : #GTPPStepToStreamPositionChangedReflectivityAction,
	#superclass : #GTPPReflectivityStepDebugAction,
	#instVars : [
		'initialPosition'
	],
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToStreamPositionChangedReflectivityAction class >> gtStreamPositionChangedActionFor: aDebugger [
	"<gtPPStreamDebuggingAction>
	<gtContextPPStreamDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
		label: 'Run to next update (fast)';
		icon: GLMUIThemeExtraIcons glamorousInto;
		initialPosition: aDebugger session stream position
]

{ #category : #actions }
GTPPStepToStreamPositionChangedReflectivityAction >> attachBreakpoints [

	self afterMethodBreakpoint
		targetMethod: PPContext>>#next;
		whenReceiver: [ :aPPContext | aPPContext position ~= self initialPosition ]
]

{ #category : #accessing }
GTPPStepToStreamPositionChangedReflectivityAction >> initialPosition [

	^ initialPosition
]

{ #category : #accessing }
GTPPStepToStreamPositionChangedReflectivityAction >> initialPosition: anInteger [

	initialPosition := anInteger
]
