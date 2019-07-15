Class {
	#name : #GTPPStepToStreamPositionAction,
	#superclass : #GTPPDebugAction,
	#instVars : [
		'position'
	],
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToStreamPositionAction class >> gtSelectedStreamPositionActionFor: aDebugger [
	<gtPPStreamDebuggingAction>
	<gtContextPPStreamDebuggingAction>
	
	^ (self forDebugger: aDebugger)
		position: aDebugger streamSelectionInterval last;
		label: 'Run to here'
]

{ #category : #actions }
GTPPStepToStreamPositionAction >> executeAction [
	| currentPosition targetPosition |

	currentPosition := self session stream position.
	targetPosition := self position 
		ifNil: [ currentPosition + 1 ]
		ifNotNil: [ :anInteger | anInteger ].
		
	self session
		stepUntil: (self streamToPosition: targetPosition) from: self startContext.
]

{ #category : #accessing }
GTPPStepToStreamPositionAction >> position [
	
	^ position
]

{ #category : #accessing }
GTPPStepToStreamPositionAction >> position: anInteger [
	
	position := anInteger
]

{ #category : #predicates }
GTPPStepToStreamPositionAction >> streamToPosition: anInteger [

	^ self session createPredicateForBlock: [
		self session stream position = anInteger ]
]
