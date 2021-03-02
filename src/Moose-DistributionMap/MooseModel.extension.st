Extension { #name : #MooseModel }

{ #category : #'*Moose-DistributionMap' }
MooseModel >> classConcernedByProperty: aSelector appliedTo: aClass [
	| type propertyResult |
	(self allWithType: aClass)
		do: [ :each | 
			[ propertyResult := each perform: aSelector ]
				on: Error
				do: [ :er | ^ nil ].
			propertyResult
				ifNil: [ ^ nil ]
				ifNotNil: [ propertyResult isCollection
						ifFalse: [ ^ nil ]
						ifTrue: [ propertyResult ifNotEmpty: [ type := propertyResult anyOne class ] ] ] ].
	^ type
]

{ #category : #'*Moose-DistributionMap' }
MooseModel >> resultOfProperty: aSelectorOrAblock appliedTo: aClass [

	(self allWithType: aClass) ifNotEmpty: [ :concernedEntities | 
		concernedEntities do: [ :each | 
			(aSelectorOrAblock value: each) ifNotNil: [ :result | ^ result ] ] ].

	^ nil
]
