Extension { #name : #PPBrowserStream }

{ #category : #'*petitgui-debug' }
PPBrowserStream >> progressIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite morph 
		title: 'Progress';
		display: [:result :sample :stream :parser  | 
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: self asPositionMorph.
			morph ]
]

{ #category : #'*petitgui-debug' }
PPBrowserStream >> tallyIn: composite [
	<gtInspectorPresentationOrder: 30>

	composite table 
		title: 'Tally';
		column: 'Parser' evaluated: [ :each | each first displayName ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ self asFrequencyTable ];
		noSelection;
		showOnly: 50
]
