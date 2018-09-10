Class {
	#name : #GTPPStepToStreamPositionReflectivityAction,
	#superclass : #GTPPReflectivityStepDebugAction,
	#instVars : [
		'position'
	],
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToStreamPositionReflectivityAction class >> gtSelectedStreamPositionActionFor: aDebugger [
	"<gtPPStreamDebuggingAction>
	<gtContextPPStreamDebuggingAction>"
	
	^ (self forDebugger: aDebugger)
		position: aDebugger streamSelectionInterval last;
		label: 'Run to here (fast)'
]

{ #category : #actions }
GTPPStepToStreamPositionReflectivityAction >> attachBreakpoints [

	self afterMethodBreakpoint
		targetMethod: PPContext>>#next;
		whenReceiver: [ :aPPContext | aPPContext position = self position ]
]

{ #category : #accessing }
GTPPStepToStreamPositionReflectivityAction >> position [
	
	^ position
]

{ #category : #accessing }
GTPPStepToStreamPositionReflectivityAction >> position: anInteger [
	
	position := anInteger
]
