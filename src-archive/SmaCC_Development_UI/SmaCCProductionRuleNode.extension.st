Extension { #name : #SmaCCProductionRuleNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionRuleNode >> buildASTNodeInterfaceIn: presentation [
	| tabulator |
	tabulator := presentation tabulator.
	tabulator title: 'AST'.
	self expressions do: [ :each | each buildASTNodeInterfaceIn: tabulator ].
	tabulator row: #last
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionRuleNode >> buildInterfaceIn: presentation [
	self buildASTNodeInterfaceIn: presentation.
	self buildVariableNameInterfaceFor: name value in: presentation.
	presentation list
		title: 'References';
		display: [ self ruleReferences ];
		format: [ :each | each displayString ];
		tags: [ :each | each tags ].
	presentation list
		title: 'Uses';
		display: [ self uses ];
		format: [ :each | each displayString ];
		tags: [ :each | each tags ].
	presentation text
		title: 'Definition';
		display: [ self source ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionRuleNode >> displayString [
	^ name value
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionRuleNode >> ruleReferences [
	^ self ruleReferencesTo: self name value
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCProductionRuleNode >> tags [
	| hasClass noClass code tags |
	hasClass := noClass := code := false.
	self expressions
		do: [ :each | 
			(each isKindOf: SmaCCClassProductionExpressionNode)
				ifTrue: [ hasClass := true ]
				ifFalse: [ (each isKindOf: SmaCCCodeProductionExpressionNode)
						ifTrue: [ code := true ]
						ifFalse: [ noClass := true ] ] ].
	tags := OrderedCollection new.
	hasClass
		ifTrue: [ tags add: 'C' ].
	code
		ifTrue: [ tags add: 'E' ].
	noClass
		ifTrue: [ tags add: 'U' ].
	^ tags asArray
]
