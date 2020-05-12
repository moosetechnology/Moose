Extension { #name : #TDependencyQueries }

{ #category : #'*Moose-Core' }
TDependencyQueries >> isDead [
	"Only container entities and behaviourals can be dead"

	<MSEProperty: #isDead type: #Boolean>
	<derived>
	<MSEComment: 'Is the entity dead (not invoked in the system)'>
	^ self isContainerEntity
		ifTrue: [ self lookUpPropertyNamed: #isDead computedAs: [ self hasIncomingDependencies not or: [ self queryIncomingDependencies withoutSelfLoops isEmpty ] ] ]
		ifFalse: [ false ]
]
