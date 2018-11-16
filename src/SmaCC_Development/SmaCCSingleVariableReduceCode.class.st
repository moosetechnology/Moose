Class {
	#name : #SmaCCSingleVariableReduceCode,
	#superclass : #SmaCCReduceCode,
	#instVars : [
		'indices'
	],
	#category : #'SmaCC_Development'
}

{ #category : #private }
SmaCCSingleVariableReduceCode >> basicModelTypes: aSet [
	| types isCollection |
	isCollection := false.
	types := Set new.
	self indices size <= 1
		ifTrue:
			[ rhs productionSymbol
				productionsDo:
					[ :each | 
					(isCollection := isCollection
						or: [ each reduceAction indices size > 1 ])
						ifFalse:
							[ each reduceAction indices notEmpty
								ifTrue:
									[ types
										addAll:
											(each reduceAction
												basicModelTypes: aSet
												forIndex: each reduceAction indices first) ] ] ] ]
		ifFalse: [ isCollection := true ].
	^ isCollection
		ifTrue: [ Array with: (self model classFor: OrderedCollection) ]
		ifFalse: [ types asArray ]
]

{ #category : #private }
SmaCCSingleVariableReduceCode >> computeIndices [
	indices := OrderedCollection new.
	1 to: rhs size do:
		[ :i | 
		| symbol |
		symbol := rhs at: i.
		(rhs variableNameForIndex: i) notNil
			ifTrue: [ indices add: i ]
			ifFalse: [ symbol returnsSingleVariable
					ifTrue: [ indices add: i ] ] ].
	^ indices
]

{ #category : #accessing }
SmaCCSingleVariableReduceCode >> index [
	^ indices isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ indices first ]
]

{ #category : #accessing }
SmaCCSingleVariableReduceCode >> indices [
	^ indices ifNil: [ self computeIndices ]
]

{ #category : #testing }
SmaCCSingleVariableReduceCode >> returnsSingleVariable [
	^ true
]

{ #category : #accessing }
SmaCCSingleVariableReduceCode >> source [
	^ (indices size < 2
		and:
			[ rhs productionSymbol variableDefinitions asArray first isCollection
				not ])
		ifTrue: [ self codeGenerator defaultNodeReductionSource: self ]
		ifFalse: [ self codeGenerator singleVariableCollectionFor: self ]
]
