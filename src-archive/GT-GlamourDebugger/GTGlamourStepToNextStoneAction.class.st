Class {
	#name : #GTGlamourStepToNextStoneAction,
	#superclass : #DebugAction,
	#instVars : [
		'debugStoneType'
	],
	#category : #'GT-GlamourDebugger'
}

{ #category : #accessing }
GTGlamourStepToNextStoneAction class >> debuggingStonePragma [

	^ #debuggingStone:label:
]

{ #category : #registration }
GTGlamourStepToNextStoneAction class >> gtActionFor: aDebugger [
	<gtGlamourDebuggingAction>
	<gtContextGlamourDebuggingAction>
	

	^ (self forDebugger: aDebugger)
		label: 'Any action'
	
	
]

{ #category : #registration }
GTGlamourStepToNextStoneAction class >> gtGoToDebugingStoneActionsFor: aDebugger [
	<gtGlamourDebuggingAction>
	<gtContextGlamourDebuggingAction>
	
	^(PragmaCollector filter: [:prag | 
		prag keyword = self debuggingStonePragma ]) reset collected collect: [ :aPragma |
			(self forDebugger: aDebugger)
				label: (aPragma argumentAt: 2);
				"category: 'Debugging Stone';"
				debugStoneType: (aPragma argumentAt: 1) ]

	
]

{ #category : #testing }
GTGlamourStepToNextStoneAction >> appliesToContext: aContext [

	^ aContext locateBrowserContext notNil
]

{ #category : #accessing }
GTGlamourStepToNextStoneAction >> debugStoneType [
	
	^ debugStoneType
]

{ #category : #accessing }
GTGlamourStepToNextStoneAction >> debugStoneType: anObject [
	
	debugStoneType := anObject
]

{ #category : #predicates }
GTGlamourStepToNextStoneAction >> debuggingStonePredicate [

	^ self session createPredicateForBlock: [ :aContext |
			aContext isInitialnstruction and: [ | pragma |
				pragma := aContext method pragmaAt: self class debuggingStonePragma.
				pragma notNil and: [ 
					self debugStoneType isNil or: [ (pragma argumentAt: 1) = self debugStoneType ] ] ] ]
]

{ #category : #actions }
GTGlamourStepToNextStoneAction >> executeAction [
	| debugingStone |
	
	"The first time start searching for a debuging stone from the context selected by the user."
	debugingStone := self stepToDebuggingStoneFrom: self currentContext.

	[ debugingStone notNil ]
		whileTrue: [ 
			(debugingStone reachedTarget and: [ 
				debugingStone isActive and: [ 
					debugingStone completeAction ] ]) 
						"After the first time use the interruptedContext (start the search from where it was left of).
						Here the interruptedContext it is the same as the suspended context of the process."
						ifFalse: [ debugingStone := self stepToDebuggingStoneFrom: self interruptedContext ]
						"If a debuging stone reached its destination stop the search."
						ifTrue: [ ^ self ] ]
	
]

{ #category : #actions }
GTGlamourStepToNextStoneAction >> stepToDebuggingStoneFrom: aContext [

	"Make sure the execution advances, and does not check the same context."
	self session stepInto: aContext.

	self session 
		stepUntil: self debuggingStonePredicate
		from: self interruptedContext.
		
	^ self session isActive 
		ifTrue: [ 
			GTGlamourDebuggingStone 
				"Here interruptedContext is the same as the suspended context of the process."
				forPragma: (self interruptedContext method pragmaAt: self class debuggingStonePragma) 
				forSession: self session  ]
		ifFalse: [ nil ]
]
