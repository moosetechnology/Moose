Extension { #name : #SmaCCParser }

{ #category : #'*SmaCC_Development_UI' }
SmaCCParser class >> definitionAST [
	^ [ SmaCCDefinitionParser parse: self definitionString ]
		on: SmaCCParserError
		do: [ :ex | ex return: nil ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCParser class >> definitionString [
	| scannerClass source |
	scannerClass := [ self scannerClass ]
		on: Error
		do: [ :ex | ex return: nil ].
	(self class includesSelector: #definitionComment)
		ifTrue: [ source := self removeCommentedPartOf: (self class sourceCodeAt: #definitionComment) ]
		ifFalse: [ source := ''.
			(self class includesSelector: #parserDefinitionComment)
				ifTrue: [ source := self removeCommentedPartOf: (self class sourceCodeAt: #parserDefinitionComment) ].
			(scannerClass notNil and: [ scannerClass class includesSelector: #scannerDefinitionComment ])
				ifTrue:
					[ source := (self removeCommentedPartOf: (scannerClass class sourceCodeAt: #scannerDefinitionComment)) , '\' withCRs , source ] ].
	^ source
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCParser class >> gtDefinitionEditorViewIn: composite [
	<gtInspectorPresentationOrder: 10>
	| tree tabulator items keywords |
	tree := self definitionAST.
	tree isNil
		ifTrue: [ ^ nil ].
	items := OrderedCollection withAll: tree rules.
	keywords := Set new.
	tree allNodesOfType: SmaCCKeywordSymbolNode do: [ :each | keywords add: each name value ].
	items addAll: keywords asSortedCollection.
	[ tree attributeNamed: #scannerClass put: self scannerClass ]
		on: Error
		do: [ :ex | ex return ].
	tabulator := composite tabulator.
	tabulator
		title: 'Editor';
		column: #rules;
		column: #value span: 2.
	tabulator transmit
		to: #rules;
		andShow: [ :presentation | 
			presentation list
				title: 'Rules';
				addAction:
					(GLMGenericAction new
						action: [ | string |
							string := SmaCCString on: tree completeSource.
							tree allNodesDo: [ :node | node updateSource: string ].
							string asString inspect ];
						title: 'Save';
						showTitle);
				filterOn: [ :text :each | 
					each isString
						ifTrue: [ (each asLowercase indexOfSubCollection: text asLowercase) > 0 ]
						ifFalse: [ (each source asLowercase indexOfSubCollection: text asLowercase) > 0 ] ];
				display: items;
				format: [ :each | 
					each isString
						ifTrue: [ each ]
						ifFalse: [ each displayString ] ];
				tags: [ :each | 
					each isString
						ifTrue: [ #() ]
						ifFalse: [ each tags ] ] ].
	tabulator transmit
		from: #rules port: #selection;
		to: #value;
		andShow: [ :presentation :rule | 
			presentation pager
				show: [ :pres :each | 
					each notNil
						ifTrue: [ each isString
								ifTrue: [ tree buildVariableNameInterfaceFor: each in: pres.
									pres list
										title: 'References';
										display: [ tree ruleReferencesTo: each ];
										format: [ :e | e displayString ];
										tags: [ :e | e tags ] ]
								ifFalse: [ each buildInterfaceIn: pres ] ] ];
				startOn: rule ]
]

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

{ #category : #'*SmaCC_Development_UI' }
SmaCCParser class >> removeCommentedPartOf: aString [
	| inStream outStream |
	inStream := ReadStream on: aString.
	outStream := WriteStream with: String new.
	inStream upTo: $".
	[ inStream atEnd ]
		whileFalse: [ (inStream peekFor: $")
				ifTrue: [ outStream nextPut: $" ].
			outStream nextPutAll: (inStream upTo: $") ].
	^ outStream contents
]
