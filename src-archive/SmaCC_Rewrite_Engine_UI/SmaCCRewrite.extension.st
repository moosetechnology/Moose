Extension { #name : #SmaCCRewrite }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> buildInterfaceIn: aPresentation [
	| tabulator |
	(tabulator := aPresentation tabulator)
		row: [ :row | 
			row
				column: #label size: 75;
				column: #comment ]
			size: 25;
		row: #search;
		row: #replace.
	tabulator transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'Comment:' ].
	tabulator transmit
		to: #comment;
		andShow: [ :presentation | 
			presentation text
				display: self comment;
				onChangeOfPort: #text act: [ :text | self comment: text text asString ] ].
	tabulator updateOn: #match from: #yourself.
	tabulator updateOn: #transformation from: #yourself.
	tabulator transmit
		to: #search;
		transformed: [ :rewrite | rewrite match ];
		andShow: [ :presentation | self buildSearchIn: presentation ].
	tabulator transmit
		to: #replace;
		transformed: [ :rewrite | rewrite transformation ];
		andShow: [ :presentation | self buildReplaceIn: presentation ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> buildReplaceIn: aPresentation [
	| browser types |
	browser := aPresentation tabulator.
	browser
		row: #type size: 25;
		row: #value.
	types := self transformationTypes.
	browser transmit
		to: #type;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ types ];
				selectedIndex: (types indexOf: self transformation class type);
				onChangeOfPort: #selection act: [ :list | self changedReplaceTo: list selection ] ].
	browser transmit
		to: #value;
		andShow: [ :presentation | 
			presentation dynamic
				updateOn: #transformation from: [ self announcer ];
				display: [ | composite |
					composite := GLMCompositePresentation new.
					transformation buildInterfaceIn: composite.
					composite startOn: match.
					composite ] ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> buildSearchIn: aPresentation [
	| browser types |
	browser := aPresentation tabulator.
	browser
		row: #type size: 25;
		row: #value.
	types := self matchTypes.
	browser transmit
		to: #type;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ types ];
				selectedIndex: (types indexOf: self match class type);
				onChangeOfPort: #selection act: [ :list | self changedSearchTo: list selection ] ].
	browser transmit
		to: #value;
		andShow: [ :presentation | 
			presentation dynamic
				updateOn: #match from: [ self announcer ];
				display: [ | composite |
					composite := GLMCompositePresentation new.
					match buildInterfaceIn: composite.
					composite startOn: match.
					composite ] ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> changedReplaceTo: aSymbol [
	| class rewrite |
	class := SmaCCRewriteTransformation withAllSubclasses detect: [ :each | each type = aSymbol ].
	self transformation class == class
		ifTrue: [ ^ self ].
	rewrite := class new.
	self transformation: rewrite
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> changedSearchTo: aSymbol [
	| class newMatch |
	class := SmaCCRewriteMatch withAllSubclasses detect: [ :each | each type = aSymbol ].
	self match class == class
		ifTrue: [ ^ self ].
	newMatch := class new.
	self match: newMatch
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> matchTypes [
	^ (SmaCCRewriteMatch allSubclasses collect: [ :each | each type ])
		asSet asSortedCollection
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> rewriteForMethod: aMethod [
	(match method == aMethod or: [ transformation method == aMethod ])
		ifTrue: [ ^ self ].
	^ nil
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewrite >> transformationTypes [
	^ ((SmaCCRewriteTransformation allSubclasses
		collect: [ :each | each type ]) asSet
		remove: nil ifAbsent: [  ];
		yourself) asSortedCollection
]
