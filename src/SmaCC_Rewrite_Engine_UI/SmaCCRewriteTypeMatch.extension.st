Extension { #name : #SmaCCRewriteTypeMatch }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTypeMatch >> buildInterfaceIn: aPresentation [
	| browser classes |
	browser := aPresentation tabulator.
	browser
		row: [ :row | 
			row
				column: #label size: 50;
				column: #class;
				column: #debug size: 50 ]
			size: 25;
		row: [ :row | 
			row
				column: #value span: 2;
				column: #variables ].
	browser transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'Class:' ].
	classes := SmaCCParseNode withAllSubclasses asSortedCollection: [ :a :b | a name < b name ].
	browser transmit
		to: #class;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ classes ];
				selectedIndex: (classes indexOf: self nodeClass);
				onChangeOfPort: #selection act: [ :list | self nodeClass: list selection ] ].
	browser transmit
		to: #debug;
		andShow: [ :presentation | 
			| button |
			presentation morph
				morph:
					((button := SimpleSwitchMorph new)
						target: self;
						actionSelector: #enableDebug:;
						arguments: #();
						setSwitchState: self enableDebug;
						label: 'Debug';
						yourself) ].
	browser transmit
		to: #value;
		andShow: [ :presentation | 
			presentation pharoScript
				display: (self code ifNil: [ '' ]);
				title: 'Code';
				smalltalkClass: [ rewrite contextClass ];
				onChangeOfPort: #text act: [ :text | self code: text text asString ];
				morphicSelectionAct: [ :text | 
						text
							text: (RBParser parseExpression: text text asString) formattedCode;
							update ]
					icon: GLMUIThemeExtraIcons glamorousPlay
					on: $t
					entitled: 'Format' ].
	browser transmit
		from: #class port: #selection;
		to: #variables;
		andShow: [ :presentation | 
			presentation fastList
				title: [ :selection | selection ifNil: [ 'Variables' ] ifNotNil: [ selection name ] ];
				display: [ :selection | 
					selection notNil
						ifTrue: [ (Set new
								addAll: selection allInstVarNames;
								removeAll: SmaCCParseNode allInstVarNames;
								yourself) asSortedCollection ]
						ifFalse: [ #() ] ];
				act: [ :list | ((browser paneNamed: #class) port: #selection) value ifNotNil: [ :sel | Smalltalk tools browser openOnClass: sel ] ]
					icon: GLMUIThemeExtraIcons glamorousBrowse
					entitled: 'Browse' ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTypeMatch >> source [
	^ self code
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTypeMatch >> title [
	^ 'Match'
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTypeMatch class >> type [
	^ #Type
]
