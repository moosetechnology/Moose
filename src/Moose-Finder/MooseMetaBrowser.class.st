"
self open
"
Class {
	#name : #MooseMetaBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'world menu' }
MooseMetaBrowser class >> menuBrowseMetaOn: aBuilder [

	<worldMenu>
	^ (MooseModel developerTool: self menuCommandOn: aBuilder)
		  order: 35;
		  help: 'Famix compatiblity meta-model browser';
		  withSeparatorAfter;
		  yourself
]

{ #category : #'world menu' }
MooseMetaBrowser class >> menuLabel [
	^'Meta Browser'
]

{ #category : #'instance creation' }
MooseMetaBrowser class >> open [
	^ self new openOn: MooseModel meta
]

{ #category : #private }
MooseMetaBrowser >> acceptComment: aString ofProperty: anFm3Property [	
	| ast pragmas |
	ast := anFm3Property compiledMethod parseTree. 
	pragmas := ast pragmas reject: [ :each | each selector = #MSEComment: ].
	pragmas 
		add: (RBPragmaNode 
			selector: #MSEComment: 
			arguments: { RBLiteralValueNode value: aString } ).
	ast pragmas: pragmas.
	anFm3Property compiledMethod methodClass 
		compile: ast reformatSource
		classified: anFm3Property compiledMethod category
]

{ #category : #building }
MooseMetaBrowser >> addClassLegendOn: view [

	| lb |
	lb := RTLegendBuilder new.
	lb onDemand.
	lb view: view.
	lb addColoredText: 'Moose and FAMIX metamodel' color: Color black.
	lb addText: 'Each box is a meta class (subclass of MooseEntity or FAMIXEntity)'.
	lb addText: 'height = number of complex attributes'.
	lb addText: 'width = number of primitive attributes'.
	lb addColor: Color blue lighter text: 'Selected metaclass'.
	lb addColor: Color lightRed text: 'Metaclass _without_ a class comment'.
	lb addColor: Color white text: 'Metaclass with a class comment'.
	lb build
]

{ #category : #building }
MooseMetaBrowser >> browserActions [
	browser
		morphicAct: [ :b | 
			browser entity: MooseModel meta.
			browser update ]
			icon: GLMUIThemeExtraIcons glamorousRefresh
			entitled: 'Reinitialize meta descriptions';
		morphicAct: [ :b :repo | self openLintBrowserOn: repo ] entitled: 'Check metamodel rules';
		morphicAct: [ :b :repo | MooseFameView new openOn: repo ] entitled: 'View class diagram'
]

{ #category : #building }
MooseMetaBrowser >> buildBrowser [
	browser := GLMTabulator new.
	browser title: 'Moose Meta Browser' translated.
	browser
		column: [ :c | 
			c
				row: #explorer;
				row: #details ]
			span: 3;
		column: #info.
	self browserActions.
	browser transmit
		fromOutsidePort: #entity;
		to: #explorer port: #metarepository.
	browser transmit
		to: #explorer;
		andShow: [ :a | a custom: MooseMetaExplorer new browser noTitle ].
	browser transmit
		to: #details;
		fromOutsidePort: #entity;
		from: #explorer port: #selectedEntity;
		from: #explorer port: #selectedAttribute;
		andShow: [ :a | self metamodelMapIn: a ].
	browser transmit
		to: #info;
		from: #explorer port: #selectedEntity;
		from: #explorer port: #selectedAttribute;
		when: [ :x :p | p isNotNil and: [ p isFM3Property ] ];
		andShow: [ :a | 
			self codeOfGetterMethod: a.
			self codeOfSetterMethod: a.
			self commentsIn: a ].
	browser transmit
		to: #info;
		from: #explorer port: #selectedEntity;
		from: #explorer port: #selectedAttribute;
		when: [ :x :p | p isNotNil and: [ p class = CompiledMethod ] ];
		andShow: [ :a | 
			self codeIn: a.
			self methodCommentsIn: a ].
	browser transmit
		to: #explorer port: #entityToSelect;
		from: #details;
		when: [ :x | x isFM3Class ].
	browser transmit
		to: #explorer port: #entityToSelect;
		fromOutsidePort: #entityToSelect.
	^ browser
]

{ #category : #building }
MooseMetaBrowser >> codeIn: a [
	a text
		title: 'Code' translated;
		display: '';
		useExplicitNotNil;
		when: [ :aFM3Class :fm3Prop | aFM3Class isNotNil and: [ fm3Prop isNil ] ].
	a pharoMethod
		title: 'Code' translated;
		display: [ :aFM3Class :fm3Prop | self codeOfProperty: fm3Prop ];
		smalltalkClass: [ :aFM3Class :fm3Prop | fm3Prop compiledMethod methodClass ];
		when: [ :aFM3Class :fm3Prop | fm3Prop isNotNil ]
]

{ #category : #building }
MooseMetaBrowser >> codeOfGetterMethod: a [
	a text
		title: 'Getter' translated;
		display: '';
		useExplicitNotNil;
		when: [ :aFM3Class :fm3Prop | aFM3Class isNotNil and: [ fm3Prop isNil ] ].
	a pharoMethod
		title: 'Getter' translated;
		display: [ :aFM3Class :fm3Prop | self codeOfProperty: fm3Prop ];
		smalltalkClass: [ :aFM3Class :fm3Prop | fm3Prop compiledMethod methodClass ];
		when: [ :aFM3Class :fm3Prop | fm3Prop isNotNil and: [ fm3Prop hasImplementingSelector ] ]
]

{ #category : #building }
MooseMetaBrowser >> codeOfProperty: fm3Prop [
	^ fm3Prop compiledMethod.
]

{ #category : #building }
MooseMetaBrowser >> codeOfSetterMethod: a [
	a text
		title: 'Setter' translated;
		display: '';
		useExplicitNotNil;
		when: [ :aFM3Class :fm3Prop | aFM3Class isNotNil and: [ fm3Prop isNil ] ].
	a pharoMethod
		title: 'Setter' translated;
		display:
				[ :aFM3Class :fm3Prop | aFM3Class implementingClass methods detect: [ :method | method ast selector trimBoth = (fm3Prop name , ':') ] ifNone: [ nil ] ];
		smalltalkClass: [ :aFM3Class :fm3Prop | fm3Prop compiledMethod methodClass ];
		when: [ :aFM3Class :fm3Prop | fm3Prop isNotNil and: [ fm3Prop hasImplementingSelector ] ]
]

{ #category : #private }
MooseMetaBrowser >> commentOFMethod: method [
	method methodClass ifNil: [ ^ '' ].
	^ ((method ast comments collect: [ :a | a contents ]) inject: '' into: [ :a :b | a , Character linefeed asString , Character linefeed asString , b ]) trimBoth
]

{ #category : #private }
MooseMetaBrowser >> commentOfProperty: fm3Prop [
	fm3Prop implementingClass ifNil: [ ^ '' ].

	^ (fm3Prop compiledMethod pragmaAt: #MSEComment:)
		ifNil: [ '' ]
		ifNotNil: [ :commentPrag | commentPrag argumentAt: 1 ]
]

{ #category : #building }
MooseMetaBrowser >> commentsIn: a [
	a text
		title: 'Comment' translated;
		display: [ :fm3Class | 
			fm3Class implementingClass
				ifNil: [ '' ]
				ifNotNil: [ :class | class comment ] ];
		useExplicitNotNil;
		when: [ :fm3Class :fm3Prop | fm3Class isNotNil and: [ fm3Prop isNil ] ];
		act: [ :text :fm3Class | fm3Class implementingClass ifNotNil: [ :class | class comment: text text ] ]
			icon: MooseIcons mooseAccept
			on: $s
			entitled: 'Accept'.
	a text
		title: 'Comment' translated;
		display: [ :fm3Class :fm3Prop | self commentOfProperty: fm3Prop ];
		act: [ :text :fm3Class :fm3Prop | self acceptComment: text text asString ofProperty: fm3Prop ]
			icon: MooseIcons mooseAccept
			on: $s
			entitled: 'Accept';
		when: [ :fm3Class :fm3Prop | fm3Prop isNotNil ]
]

{ #category : #private }
MooseMetaBrowser >> lintRules: aCollectionOfLintRules group: aString [

	| lintRules |
	lintRules := aCollectionOfLintRules select: [:rule| rule group = aString].
	^ RBCompositeLintRule 
			rules: lintRules asArray
			name: aString

]

{ #category : #private }
MooseMetaBrowser >> metamodelLintRules [

	| basicRules rules |
	basicRules := RBCompositeLintRule rulesFor: RBBasicLintRule.
	rules := RBCompositeLintRule rules: 
		{self lintRules: basicRules group: 'Fame'. 
		self lintRules: basicRules group: 'FAMIX' }
			name: 'Fame/FAMIX checks'.
	^ RBCompositeLintRule rules: {rules} name: 'Metamodel checks'
]

{ #category : #building }
MooseMetaBrowser >> metamodelMapIn: a [
	| b |
	a roassal2
		title: 'Map' translated;
		initializeView: [ RTView new @ RTDraggableView ];
		painting: [ :view :all :fm3Class :fm3Prop | 
			b := RTMondrian new.
			b view: view.
			self
				viewClass: fm3Class
				property: fm3Prop
				in: all
				on: b.
			b build.

			self addClassLegendOn: view ];
		useExplicitNotNil;
		when: [ :fm3Class | fm3Class isNotNil ]
]

{ #category : #building }
MooseMetaBrowser >> methodCommentsIn: a [
	a text
		title: 'Comment' translated;
		display: [ :fm3Class | 
			fm3Class implementingClass
				ifNil: [ '' ]
				ifNotNil: [ :class | class comment ] ];
		useExplicitNotNil;
		when: [ :fm3Class :compiledMethod | fm3Class isNotNil and: [ compiledMethod isNil ] ];
		act: [ :text :fm3Class | fm3Class implementingClass ifNotNil: [ fm3Class implementingClass comment: text text ] ]
			icon: MooseIcons mooseAccept
			on: $s
			entitled: 'Accept'.
	a text
		title: 'Comment' translated;
		display: [ :fm3Class :compiledMethod | self commentOFMethod: compiledMethod ];
		act: [ :text :fm3Class :compiledMethod | self acceptComment: text text asString ofProperty: compiledMethod ]
			icon: MooseIcons mooseAccept
			on: $s
			entitled: 'Accept';
		when: [ :fm3Class :compiledMethod | compiledMethod isNotNil ]
]

{ #category : #private }
MooseMetaBrowser >> openLintBrowserOn: aFMMetaRepository [

	| classes |
	classes := aFMMetaRepository classes collect: [:meta| meta implementingClass].
	CriticBrowser 
		openOnRule: self metamodelLintRules 
		onEnvironment: (RBBrowserEnvironment new forClasses: classes)
]

{ #category : #private }
MooseMetaBrowser >> viewClass: fm3Class property: fm3Prop in: all on: view [
	| edges |
	view interaction popupText: [ :each | each fullName asString ].
	view shape rectangle
		fillColor: [ :each | 
			each = fm3Class
				ifTrue: [ Color blue muchLighter ]
				ifFalse: [ each implementingClass
						ifNil: [ Color lightRed ]
						ifNotNil: [ :aClass | aClass organization classComment ifEmpty: [ Color lightRed ] ifNotEmpty: [ Color white ] ] ] ];
		borderColor: [ :each | 
			each = fm3Class
				ifTrue: [ Color blue lighter ]
				ifFalse: [ Color gray ] ];
		height: [ :each | each complexProperties size * 2 + 5 ];
		width: [ :each | each primitiveProperties size ].
	view nodes: all classes.
	edges := view edgesFrom: #superclass.
	fm3Class
		ifNotNil: [ view shape line
				color: Color blue muchLighter;
				width: [ :each | 
					each = fm3Prop
						ifTrue: [ 3 ]
						ifFalse: [ 1 ] ].
			view edges source: fm3Class allComplexProperties connectFrom: fm3Class to: [ :attr | attr type ] ].
	view treeLayout userDefinedEdges: edges
]
