Class {
	#name : #GTPPStepToSameParserAction,
	#superclass : #GTPPDebugAction,
	#instVars : [
		'parser'
	],
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToSameParserAction class >> gtActionFor: aDebugger [
"	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>
	"
	^ (self forDebugger: aDebugger)
		parser: aDebugger currentContext receiver
]

{ #category : #testing }
GTPPStepToSameParserAction >> appliesToContext: aContext [

	^ (super appliesToContext: aContext) and: [ 
		aContext receiver class inheritsFrom: PPParser ]
]

{ #category : #accessing }
GTPPStepToSameParserAction >> defaultCategory [

	^ 'Next parser invocation'
]

{ #category : #accessing }
GTPPStepToSameParserAction >> defaultLabel [ 

	^ 'same parser'
]

{ #category : #accessing }
GTPPStepToSameParserAction >> defaultOrder [

	^ 30
]

{ #category : #actions }
GTPPStepToSameParserAction >> executeAction [

	self session
		stepOverInitialInstructionForContext: self startContext;
		stepUntil: self sameParserPredicate from: self startContext.
]

{ #category : #accessing }
GTPPStepToSameParserAction >> parser [

	^ parser
]

{ #category : #accessing }
GTPPStepToSameParserAction >> parser: anObject [

	parser := anObject
]

{ #category : #predicates }
GTPPStepToSameParserAction >> sameParserObjectPredicate [

	^ self session createPredicateForBlock: [ :aContext |
		aContext receiver == self parser ]
]

{ #category : #predicates }
GTPPStepToSameParserAction >> sameParserPredicate [

	^ self session parseMethodEntryPredicate and: self sameParserObjectPredicate
]
