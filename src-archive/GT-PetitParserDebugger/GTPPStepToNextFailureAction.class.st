Class {
	#name : #GTPPStepToNextFailureAction,
	#superclass : #GTPPDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPStepToNextFailureAction class >> gtActionType [
	<gtPPDebuggingAction>
	<gtContextPPDebuggingAction>
]

{ #category : #accessing }
GTPPStepToNextFailureAction >> defaultIcon [ 
	
	^ GLMUIThemeExtraIcons glamourousNextFailure
]

{ #category : #accessing }
GTPPStepToNextFailureAction >> defaultLabel [ 
	
	^ 'Next failure'
]

{ #category : #accessing }
GTPPStepToNextFailureAction >> defaultOrder [
	^ 200
]

{ #category : #actions }
GTPPStepToNextFailureAction >> executeAction [

	self session
		stepUntil: (self isPPFailureFollowingPredicate) from: self startContext.
	(self session isActive and: [ 
		self isPPFailureFollowingPredicate matches: self session context ]) ifTrue: [ 
			self session 
				stepOver;
				stepOver;
				stepOver ]
]

{ #category : #predicates }
GTPPStepToNextFailureAction >> isPPFailureFollowingPredicate [

	^ self session createPredicateForBlock: [ :aContext |
		aContext methodClass = PPFailure class and: [ 
			aContext selector = #message:context: ] ] 
]
