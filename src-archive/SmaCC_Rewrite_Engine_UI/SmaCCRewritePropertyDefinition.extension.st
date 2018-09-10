Extension { #name : #SmaCCRewritePropertyDefinition }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewritePropertyDefinition >> addGlobal [
	| variable |
	variable := UITheme builder textEntry: 'Enter variable name:' title: 'Variable' entryText: ''.
	(variable notNil and: [ RBScanner isVariable: variable ])
		ifTrue: [ self addGlobal: variable ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewritePropertyDefinition >> addLocal [
	| variable |
	variable := UITheme builder textEntry: 'Enter variable name:' title: 'Variable' entryText: ''.
	(variable notNil and: [ RBScanner isVariable: variable ])
		ifTrue: [ self addLocal: variable ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewritePropertyDefinition >> buildInterfaceIn: aPresentation [
	| tabulator |
	(tabulator := aPresentation tabulator)
		row: [ :row | 
			row
				column: #label size: 75;
				column: #comment ]
			size: 25;
		row: #locals;
		row: #globals.
	tabulator transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'Comment:' ].
	tabulator transmit
		to: #comment;
		andShow: [ :presentation | 
			presentation text
				display: self comment;
				onChangeOfPort: #text act: [ :text | self comment: text text asString ] ].
	tabulator transmit
		to: #locals;
		andShow: [ :presentation | 
			presentation list
				title: 'Locals';
				updateOn: #locals from: [ self announcer ];
				act: [ self addLocal ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add';
				act: [ :list | self removeLocal: list selection ] icon: GLMUIThemeExtraIcons glamorousRemove entitled: 'Remove';
				display: [ propertyNames asSortedCollection ] ].
	tabulator transmit
		to: #globals;
		andShow: [ :presentation | 
			presentation list
				title: 'Globals';
				updateOn: #globals from: [ self announcer ];
				act: [ self addGlobal ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add';
				act: [ :list | self removeGlobal: list selection ] icon: GLMUIThemeExtraIcons glamorousRemove entitled: 'Remove';
				display: [ globalValues keys asSortedCollection ] ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewritePropertyDefinition >> rewriteForMethod: aMethod [
	^ nil
]
