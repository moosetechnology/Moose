Extension { #name : #SmaCCRewriteStringTransformation }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteStringTransformation >> buildInterfaceIn: aPresentation [
	aPresentation text
		display: (self string ifNil: [ '' ]);
		title: 'Replacement Pattern';
		onChangeOfPort: #text act: [ :text | self string: text text asString ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteStringTransformation >> source [
	^ self string
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteStringTransformation class >> type [
	^ #String
]
