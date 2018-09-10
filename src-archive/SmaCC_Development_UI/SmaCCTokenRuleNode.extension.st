Extension { #name : #SmaCCTokenRuleNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCTokenRuleNode >> buildInterfaceIn: presentation [
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
		display: [ self source ].
	self isMethod
		ifTrue: [ presentation text
				title: 'Method';
				display: [ (self scannerClass whichClassIncludesSelector: self selector) sourceCodeAt: self selector ] ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCTokenRuleNode >> displayString [
	^ name value
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCTokenRuleNode >> isMethod [
	^ self scannerClass canUnderstand: self selector
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCTokenRuleNode >> ruleReferences [
	^ self ruleReferencesTo: self name value
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCTokenRuleNode >> selector [
	^ (self name value copyFrom: 2 to: self name value size - 1) asSymbol
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCTokenRuleNode >> tags [
	^ self isMethod
		ifTrue: [ #('#') ]
		ifFalse: [ #() ]
]
