Extension { #name : #SmaCCRewriteTreeMatch }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTreeMatch >> buildInterfaceIn: aPresentation [
	| browser states |
	browser := aPresentation tabulator.
	browser
		row: [ :row | 
			row
				column: #label size: 50;
				column: #state;
				column: #empty size: 1 ]
			size: 25;
		row: #value.
	browser transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'State:' ].
	states := self parserStartingStates.
	browser transmit
		to: #state;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ states ];
				selectedIndex: (states indexOf: self startingState);
				onChangeOfPort: #selection act: [ :list | self startingState: list selection ] ].
	browser transmit
		to: #value;
		andShow: [ :presentation | 
			presentation text
				display: (self source ifNil: [ '' ]);
				title: 'Pattern';
				onChangeOfPort: #text act: [ :text | self source: text text asString ] ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTreeMatch >> parserStartingStates [
	^ ((self parserClass class allSelectors select: [ :each | each beginsWith: 'startingStateFor' ])
		collect: [ :each | each asString copyFrom: 17 to: each size ]) asSortedCollection
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteTreeMatch class >> type [
	^ #Pattern
]
