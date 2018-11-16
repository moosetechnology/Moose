Extension { #name : #SmaCCParser }

{ #category : #'*SmaCC_Development_UI' }
SmaCCParser class >> gtDefinitionStringViewIn: composite [
	<gtInspectorPresentationOrder: 11>
	composite text
		title: 'Source';
		display: [ self definitionString ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCParser class >> gtGraphReferencesViewIn: composite [
	<gtInspectorPresentationOrder: 13>
	| tree nodes |
	(Smalltalk includesKey: #RTBundleBuilder)
		ifFalse: [ ^ nil ].
	tree := self definitionAST.
	tree isNil
		ifTrue: [ ^ nil ].
	nodes := tree rules select: [ :each | (each isKindOf: SmaCCProductionRuleNode) or: [ each isKindOf: SmaCCTokenRuleNode ] ].
	composite roassal2
		title: 'References';
		initializeView: [ | b view |
			view := (Smalltalk at: #RTView) new.
			b := (Smalltalk at: #RTBundleBuilder) new.
			b view: view.
			b labelShape text: #displayString.
			b
				explore: ''
				using: [ :e | 
					e == ''
						ifTrue: [ nodes ]
						ifFalse: [ #() ] ].
			b elements do: [ :each | each attributes at: #depth put: 2 ].
			b
				useBezierlineWith: [ :e | 
					e = ''
						ifTrue: [ #() ]
						ifFalse: [ e ruleReferences ] ].
			b bezier color: Color blue trans.
			b withoutSlider.
			b build.
			view ]
]
