"
OnMooseUsagesOfMOViewRenderer openOn: MooseModel root allModels last 
"
Class {
	#name : #OnMooseUsagesOfMOViewRenderer,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #private }
OnMooseUsagesOfMOViewRenderer >> allowedClassNamePatterns [
	^ #('Smalltalk::MO*')
]

{ #category : #accessing }
OnMooseUsagesOfMOViewRenderer >> computeResult [
	| viewRenderer unwantedReferences |
	viewRenderer := self model allClasses entityNamed: 'Smalltalk::MOViewRenderer'.
	unwantedReferences := viewRenderer incomingReferences
		select: [ :each | self allowedClassNamePatterns noneSatisfy: [ :allowedPattern | allowedPattern match: each from mooseName ] ].
	^ ((unwantedReferences collect: [:each | each from ]) sorted: [:a :b | a mooseName < b mooseName ]) asMooseGroup
]

{ #category : #accessing }
OnMooseUsagesOfMOViewRenderer >> explanation [ 
	^ 'Mondrian should be replaced with Roassal inside the Moose distribution. The references to MOViewRenderer indicate places that need to be refactored.
	
The only allowed patterns are ', (', ' join: self allowedClassNamePatterns)
]

{ #category : #accessing }
OnMooseUsagesOfMOViewRenderer >> label [
	^ 'Usages of MOViewRenderer'
]

{ #category : #accessing }
OnMooseUsagesOfMOViewRenderer >> stakeholder [
	^ OnMoosePeople tudorGirba
]
