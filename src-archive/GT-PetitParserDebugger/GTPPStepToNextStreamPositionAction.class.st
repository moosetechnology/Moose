Class {
	#name : #GTPPStepToNextStreamPositionAction,
	#superclass : #GTPPDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToNextStreamPositionAction class >> gtNextStreamUpdateActionFor: aDebugger [
	<gtPPStreamDebuggingAction>
	<gtContextPPStreamDebuggingAction>
	
	^ (self forDebugger: aDebugger)
		label: 'Run to next update';
		icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #actions }
GTPPStepToNextStreamPositionAction >> executeAction [
	| currentPosition |

	currentPosition := self session stream position.
	self session
		stepUntil: (self streamToDifferentPositionThan: currentPosition) from: self startContext.
]

{ #category : #predicates }
GTPPStepToNextStreamPositionAction >> streamToDifferentPositionThan: anInteger [

	^ self session createPredicateForBlock: [
		self session stream position ~= anInteger ]
]
