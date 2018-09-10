Class {
	#name : #OnMooseHardcodedViewRenderer,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseHardcodedViewRenderer >> computeResult [
	| viewRenderer referencingMethods |
	viewRenderer := self model allModelClasses entityNamed: #'Smalltalk::MOViewRenderer'.
	referencingMethods := viewRenderer incomingReferences collect: [:each | each from].
	^ (referencingMethods select: [ :each | 
		each parentType isSUnitTestCase not and: [
			each outgoingInvocations anySatisfy: [:inv | inv signature beginsWith: 'nodes:']]]) asMooseGroup
]

{ #category : #accessing }
OnMooseHardcodedViewRenderer >> explanation [
	^ 'MOViewRenderer should not be instantiated in the same method where the visualization is defined. The pattern should be along the following lines:
	
viewSomething
	| view |
	view := MOViewRenderer new.
	self viewSomethingOn: view.
	view open.
	
viewSomethingOn: view
	view nodes: ... '
]

{ #category : #accessing }
OnMooseHardcodedViewRenderer >> label [
	^ 'Hardcoded MOViewRenderer'
]

{ #category : #accessing }
OnMooseHardcodedViewRenderer >> stakeholder [
	^ OnMoosePeople tudorGirba
]
