Class {
	#name : #HismoClassHistoryGroup,
	#superclass : #HismoHistoryGroup,
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoClassHistoryGroup class >> annotation [
	<MSEClass: #ClassHistoryGroup super: #HismoHistoryGroup>
	<package: #Hismo>
]

{ #category : #'ui support' }
HismoClassHistoryGroup >> emptyNodeOn: aView [ 

	aView shape rectangle color: Color transparent; size: 5.
	^ aView node: ''.
]

{ #category : #cochange }
HismoClassHistoryGroup >> historiesThatChangedLOCTogether [
	
	| fca |
	fca := MalFormalContext new.
	fca
		with: self
		using: #yourself
		using: [:each | each referenceVersionsThatChangedPropertyNamed: #WLOC].
	^fca concepts
]

{ #category : #cochange }
HismoClassHistoryGroup >> parallelInheritancePatterns [
	
	| patterns toRemove |
	patterns := self
		coChangePatternsUsing:
			[:each | each referenceVersionsThatChangedPropertyNamed: #WNOC].
	patterns
		do:
			[:each | 
			toRemove := OrderedCollection new.
			each histories
				do:
					[:eachHistory | 
					(each histories
						anySatisfy:
							[:eachOtherHistory | eachHistory subHierarchy includes: eachOtherHistory])
						ifTrue: [toRemove addLast: eachHistory]].
			each histories removeAll: toRemove].
	^patterns select: [:each | each histories size > 2]
]

{ #category : #cochange }
HismoClassHistoryGroup >> parallelSemantics [
	
	^self
		coChangePatternsUsing:
			[:eachHistory | 
			(eachHistory select: [:each | each additionOfNumberOfMethods > 0])
				collect: [:each | each referenceVersion]]
]

{ #category : #cochange }
HismoClassHistoryGroup >> shotgunSurgeryPatterns [
	
	^self
		coChangePatternsUsing:
			[:eachHistory | 
			(eachHistory
				select:
					[:each | 
					each evolutionOfNumberOfMethods isZero
						and: [each evolutionOfNumberOfStatements > 0]])
				collect: [:each | each referenceVersion]]
]

{ #category : #view }
HismoClassHistoryGroup >> viewEvolutionMatrix [
	| view |	
	view := RTMondrian new.
	self viewEvolutionMatrixOn: view.
	^ view openWithToolbarEntitled: 'Evolution Matrix'
]

{ #category : #view }
HismoClassHistoryGroup >> viewEvolutionMatrixOn: view [ 
	| temp y x matrix |

	matrix := Matrix rows: self size columns: self referenceHistory size.
	temp := self sorted: [:a :b | a first referenceVersion < b first referenceVersion].
	y := 1.
	temp
		do: [ :eachHistory | 
			x := 1.
			eachHistory
				completeHistoryDo: [ :eachVersion | 
					view shape rectangle 
						width: #numberOfLinesOfCode;
						height: #numberOfMethods.
					matrix at: y at: x put: (view node: eachVersion).
					x := x + 1 ]
				ifNotPresent: [ :zzz | 
					matrix at: y at: x put: (self emptyNodeOn: view).
					x := x + 1 ].
			y := y + 1 ].
	view layout cell lineItemsCount: matrix columnCount; gapSize: 3; leftCentered.
]

{ #category : #view }
HismoClassHistoryGroup >> viewHierarchyEvolution [
	<menuItem: 'Hierarchy evolution' category: 'Visualize'>
	
	| view |
	
	view := RTMondrian new.
	self viewHierarchyEvolutionOn: view.
	^ view open setLabel: 'Hierarchy evolution'
]

{ #category : #view }
HismoClassHistoryGroup >> viewHierarchyEvolutionOn: view [

	view shape rectangle 
					width: #evolutionOfNumberOfMethods;
					height: [ :each | each evolutionOfNumberOfLinesOfCode / 8 ];
					fillColor: [ :each | each isRemoved
							ifTrue: [Color cyan]
							ifFalse: [(RTNColorLinearNormalizer
									inContext: [ :x | self ]
									withCommand: [ :entity | entity age ])
									lowColor: Color veryVeryLightGray;
									highColor: Color black;
									rtValue: each ] ].
	view nodes: self.
	
	view shape line 
				color: [ :each | each value isRemoved
						ifTrue: [ Color cyan ]
						ifFalse: [ (RTNColorLinearNormalizer
								inContext: [ :x | self ]
								withCommand: [ :entity | entity value age ])
								lowColor: Color veryVeryLightGray;
								highColor: Color black;
								rtValue: each ] ].
	view
		edges 
		source: self referenceHistory allInheritanceDefinitionHistories
		connectFrom: #superHistory
		to: #subHistory.
	view layout tree.
]
