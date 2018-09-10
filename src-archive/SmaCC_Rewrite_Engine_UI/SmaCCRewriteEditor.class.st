Class {
	#name : #SmaCCRewriteEditor,
	#superclass : #GLMCompositePresentation,
	#instVars : [
		'treeInitializer'
	],
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #private }
SmaCCRewriteEditor >> addFileRuleTo: aRewriteFile [
	| rewrite filename |
	aRewriteFile isNil
		ifTrue: [ ^ self ].
	filename := UITheme current
		fileSaveIn: UITheme builder
		title: 'Enter rewrite rule file name'
		extensions: #('rw')
		path: nil.
	filename isNil
		ifTrue: [ ^ self ].
	rewrite := filename asFileReference exists
		ifTrue: [ SmaCCRewriteRuleFileParser parseFile: filename ]
		ifFalse: [ SmaCCRewriteFile new filename: filename ].
	self addRewrite: rewrite to: aRewriteFile
]

{ #category : #private }
SmaCCRewriteEditor >> addMethodRuleTo: aRewrite [
	| rewrite |
	aRewrite isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewriteMethodDefinition new.
	self addRewrite: rewrite to: aRewrite
]

{ #category : #private }
SmaCCRewriteEditor >> addPropertyRuleTo: aRewrite [
	| rewrite |
	aRewrite isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewritePropertyDefinition new.
	self addRewrite: rewrite to: aRewrite
]

{ #category : #private }
SmaCCRewriteEditor >> addRewrite: newRewrite to: aRewrite [
	aRewrite isComposite
		ifTrue: [ aRewrite addTransformation: newRewrite ]
		ifFalse: [ aRewrite parent notNil
				ifTrue: [ aRewrite parent addTransformation: newRewrite before: aRewrite ] ]
]

{ #category : #private }
SmaCCRewriteEditor >> addRuleTo: aRewrite [
	| rewrite |
	aRewrite isNil
		ifTrue: [ ^ self ].
	rewrite := SmaCCRewrite newInstance.
	self addRewrite: rewrite to: aRewrite
]

{ #category : #building }
SmaCCRewriteEditor >> compose [
	| tabulator file |
	tabulator := self tabulator.
	tabulator
		column: #rewrites;
		column: #rule span: 3.
	tabulator transmit
		to: #rewrites;
		transformed: [ :rewriteFile | 
			"Hack to get the value since sometimes it passes the wrong value"
			file := (rewriteFile isKindOf: SmaCCTransformationToolkitModel)
				ifTrue: [ rewriteFile rewrites ]
				ifFalse: [ rewriteFile ].
			Array with: file ];
		andShow: [ :presentation | 
			| tree |
			tree := presentation tree.
			tree
				title: 'Rewrites';
				updateOn: #display from: [ file announcer ];
				act: [ :t | self deleteRule: t selection ] icon: GLMUIThemeExtraIcons glamorousTrash entitled: 'Delete';
				act: [ :t | self addRuleTo: t selection ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add Rule';
				act: [ :t | self addFileRuleTo: t selection ] entitled: 'Add File';
				act: [ :t | self addMethodRuleTo: t selection ] entitled: 'Add Method';
				act: [ :t | self addPropertyRuleTo: t selection ] entitled: 'Add Property';
				allExpanded;
				filterOn: [ :text :each | each matches: text ];
				format: [ :rewrite | rewrite displayString ];
				children: [ :rewrite | rewrite rewrites ].
			treeInitializer value: tree ].
	tabulator transmit
		from: #rewrites port: #selection;
		to: #rule;
		andShow: [ :presentation :rewrite | 
			rewrite notNil
				ifTrue: [ rewrite buildInterfaceIn: presentation ] ].
	tabulator transmit
		fromOutsidePort: #rewriteToSelect;
		to: #rewrites port: #selection
]

{ #category : #private }
SmaCCRewriteEditor >> deleteRule: aRewrite [
	(aRewrite isNil or: [ aRewrite parent isNil ])
		ifTrue: [ ^ self ].
	(self confirm: 'Do you want to delete: ' , aRewrite displayString)
		ifFalse: [ ^ self ].
	aRewrite parent removeTransformation: aRewrite.
	self update
]

{ #category : #'initialize-release' }
SmaCCRewriteEditor >> initialize [
	super initialize.
	treeInitializer := [ :tree |  ]
]

{ #category : #'initialize-release' }
SmaCCRewriteEditor >> treeInitializer: aBlock [
	treeInitializer := aBlock
]
