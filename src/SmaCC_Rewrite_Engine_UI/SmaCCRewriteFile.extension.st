Extension { #name : #SmaCCRewriteFile }

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteFile >> buildInterfaceIn: aPresentation [
	| classes tabulator |
	classes := SmaCCParser allSubclasses asSortedCollection: [ :a :b | a name < b name ].
	(tabulator := aPresentation tabulator)
		row: [ :row | 
			row
				column: #label size: 75;
				column: #parser size: 250;
				column: #ignore1 ]
			size: 25;
		row: #ignore.
	tabulator transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'Parser:' ].
	tabulator transmit
		to: #parser;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ classes ];
				selectedIndex: (classes indexOf: self parserClass);
				onChangeOfPort: #selection
					act: [ :list | 
					| parser |
					parser := classes at: list selectedIndex ifAbsent: [ nil ].
					self parserClass ~= parser
						ifTrue: [ self parserClass: parser ] ] ]
]

{ #category : #'*SmaCC_Rewrite_Engine_UI' }
SmaCCRewriteFile >> rewriteForMethod: aMethod [
	rewrites do: [ :each | (each rewriteForMethod: aMethod) ifNotNil: [ :rewrite | ^ rewrite ] ].
	^ nil
]
