Class {
	#name : #HismoMethodHistoryGroup,
	#superclass : #HismoHistoryGroup,
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoMethodHistoryGroup class >> annotation [
	<MSEClass: #MethodHistoryGroup super: #HismoHistoryGroup>
	<package: #Hismo>
]

{ #category : #'co-change' }
HismoMethodHistoryGroup >> dispersedLogic [
	
	^self
		coChangePatternsUsing:
			[:eachHistory | 
			(eachHistory
				select:
					[:each | 
					each evolutionOfCyclomaticComplexity isZero
						and: [each evolutionOfNumberOfStatements > 0]])
				collect: [:each | each referenceVersion]]
]

{ #category : #'co-change' }
HismoMethodHistoryGroup >> parallelComplexity [
	
	^self
		coChangePatternsUsing:
			[:eachHistory | 
			(eachHistory select: [:each | each additionOfCyclomaticComplexity > 0])
				collect: [:each | each referenceVersion]]
]
