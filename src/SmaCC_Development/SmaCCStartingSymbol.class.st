Class {
	#name : #SmaCCStartingSymbol,
	#superclass : #SmaCCNonTerminalSymbol,
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCStartingSymbol >> asLRItemSet [
	| itemSet |
	itemSet := self grammar newItemSet.
	productions
		do:
			[ :each | 
			itemSet
				add:
					(SmaCCLR1Item
						rhs: each
						follow:
							(SmaCCSymbolSet new
								add: grammar emptySymbol;
								yourself)) ].
	^ itemSet
]

{ #category : #accessing }
SmaCCStartingSymbol >> compileName [
	^ (productions first at: 1) safeMethodName
]

{ #category : #testing }
SmaCCStartingSymbol >> isStartingSymbol [
	^ true
]

{ #category : #public }
SmaCCStartingSymbol >> symbol [
	^ productions first at: 1
]
