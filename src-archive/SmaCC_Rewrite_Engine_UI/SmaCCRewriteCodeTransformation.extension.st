Extension { #name : #SmaCCRewriteCodeTransformation }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteCodeTransformation >> buildInterfaceIn: aPresentation [
	| updating |
	updating := false.
	aPresentation pharoScript
		display: (self code ifNil: [ '' ]);
		title: 'Code';
		smalltalkClass: [ rewrite contextClass ];
		onChangeOfPort: #text
			act: [ :text | 
			updating
				ifFalse: [ self code: text text asString ] ];
		morphicSelectionAct: [ :text | 
				self code: (RBParser parseExpression: text text asString) formattedCode.
				updating := true.
				[ text update ]
					ensure: [ updating := false ] ]
			icon: GLMUIThemeExtraIcons glamorousPlay
			on: $t
			entitled: 'Format'
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteCodeTransformation >> source [
	^ self code
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteCodeTransformation >> title [
	^ 'Transformation'
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteCodeTransformation class >> type [
	^ #Code
]
