Class {
	#name : #HismoNamespaceHistoryGroup,
	#superclass : #HismoHistoryGroup,
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoNamespaceHistoryGroup class >> annotation [
	<MSEClass: #NamespaceHistoryGroup super: #HismoHistoryGroup>
	<package: #Hismo>
]

{ #category : #'co-change' }
HismoNamespaceHistoryGroup >> parallelSemantics [
	
	^self
		coChangePatternsUsing:
			[:eachHistory | 
			(eachHistory
				select:
					[:each | 
					each additionOfNumberOfMethods > 0
						and: [each evolutionOfNumberOfClasses isZero]])
				collect: [:each | each referenceVersion]]
]
