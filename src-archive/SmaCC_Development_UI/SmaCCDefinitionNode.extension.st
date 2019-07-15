Extension { #name : #SmaCCDefinitionNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> allReferencesTo: aString [
	| refs |
	refs := OrderedCollection new.
	self topParent
		allNodesDo: [ :each | 
			(((each isKindOf: SmaCCSymbolNode) or: [ each isKindOf: SmaCCTokenRegexNode ])
				and: [ each name value = aString ])
				ifTrue: [ refs add: each ] ].
	^ refs
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> buildInterfaceIn: presentation [
	presentation text
		title: 'Definition';
		display: [ self source ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> buildVariableNameInterfaceFor: aString in: presentation [
	| tabulator refs commonName count |
	tabulator := presentation tabulator.
	tabulator title: 'Var Name'.
	tabulator
		row: [ :r | 
			r
				column: #label size: 100;
				column: #commonName ]
		size: 35.
	refs := (self allReferencesTo: aString) select: [ :each | each isKindOf: SmaCCSymbolNode ].
	count := 0.
	commonName := ''.
	(Bag withAll: (refs collect: [ :e | e variableName ]))
		doWithOccurrences: [ :each :occ | 
			(each = '' or: [ occ > count ])
				ifTrue: [ count := occ.
					commonName := each ] ].
	refs doWithIndex: [ :each :i | each buildVariableNameInterfaceIn: tabulator index: i ].
	tabulator row: #last.
	tabulator transmit
		to: #label;
		andShow: [ :a | a label display: 'Default Name:' ].
	tabulator transmit
		to: #commonName;
		andShow: [ :a | 
			a text
				display: commonName;
				onChangeOfPort: #text
					act: [ :text | 
					refs
						do: [ :each | 
							(each variableName = '' or: [ each variableName = commonName ])
								ifTrue: [ each variableName: text text asString ] ].
					commonName := text text asString ] ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> lookupRule: aString [
	self topParent rules
		do: [ :each | 
			((each isKindOf: SmaCCProductionRuleNode) or: [ each isKindOf: SmaCCTokenRuleNode ])
				ifTrue: [ each name value = aString
						ifTrue: [ ^ each ] ] ].
	^ nil
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> rule [
	^ self
		lookupNode: [ :node | (node isKindOf: SmaCCProductionRuleNode) or: [ node isKindOf: SmaCCTokenRuleNode ] ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> ruleReferences [
	^ #()
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> ruleReferencesTo: aString [
	| rules |
	rules := Set new.
	(self allReferencesTo: aString)
		do: [ :ref | ref rule ifNotNil: [ :rule | rules add: rule ] ].
	^ rules
		asSortedCollection: [ :a :b | a startPosition < b startPosition ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> scannerClass [
	^ self topParent attributeNamed: #scannerClass ifAbsent: [ SmaCCScanner ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> tags [
	^ Array new
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> updateSource: aSmaCCString [
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCDefinitionNode >> uses [
	| rules |
	rules := Set new.
	self
		allNodesDo: [ :each | 
			((each isKindOf: SmaCCSymbolNode) or: [ each isKindOf: SmaCCTokenRegexNode ])
				ifTrue: [ (self lookupRule: each name value) ifNotNil: [ :rule | rules add: rule ] ] ].
	^ rules asSortedCollection: [ :a :b | a startPosition < b startPosition ]
]
