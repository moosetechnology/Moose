Class {
	#name : #GTGlamourStepToPresentationBuildAction,
	#superclass : #DebugAction,
	#category : #'GT-GlamourDebugger'
}

{ #category : #registration }
GTGlamourStepToPresentationBuildAction class >> gtActionType [
	"<gtContextGlamourDebuggingAction>"
]

{ #category : #testing }
GTGlamourStepToPresentationBuildAction >> appliesToContext: aContext [

	^ aContext locateBrowserContext notNil
]

{ #category : #actions }
GTGlamourStepToPresentationBuildAction >> executeAction [
	| presentationCreation presentationCode |
	presentationCreation := self presentationCreationPredicate.
	presentationCode := self presentationCodePredicate.

	self session stepUntil: presentationCreation from: self currentContext.
	self session stepUntil: presentationCode from: self interruptedContext.
	self session isActive ifTrue: [ 
		self session stepInto ]
		
	
]

{ #category : #'initialize-release' }
GTGlamourStepToPresentationBuildAction >> initialize [

	self label: 'Next presentation build'.
	self icon: GLMUIThemeExtraIcons glamorousPlay.
]

{ #category : #predicates }
GTGlamourStepToPresentationBuildAction >> presentationCodePredicate [
	^ self session
		createPredicateForBlock: [ :aContext | 
			aContext selector = #glamourValueWithArgs:
				and: [ 
					aContext peekInstruction arguments notEmpty
						and: [ #(#value #valueWithArguments:) includes: aContext peekInstruction argument ] ] ]
]

{ #category : #predicates }
GTGlamourStepToPresentationBuildAction >> presentationCreationPredicate [

	^ self session createPredicateForBlock: [ :aContext |
			aContext methodClass = GLMPresentStrategy and: [ 
				aContext selector = #presentations and: [ 
					aContext isInitialnstruction ] ] ]


]
