Extension { #name : #MessageTally }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
MessageTally >> gtInspectorMessageTreeIn: composite [
	<gtInspectorPresentationOrder: 40>
	| methods normalizer |
	methods := self withDeepCollect: #children.
	normalizer := RTNColorLinearNormalizer 
						inContext: methods 
						withCommand: #tally 
						lowColor: Color gray 
						highColor: Color red.
	^ (composite tree)
		title: 'Tree';
		children: [ :each | each children ];
		"rootsExpanded;"
		format: [ :each | 
			Text 
				string: each gtDisplayString
				attributes: { TextColor color: (normalizer rtValue: each)}];
		when: [ self children notEmpty ];
		filterOn: [ :text :each | each gtDisplayString includesSubstring: text caseSensitive: false ];
		morphicSelectionAct: [ :list | list selection method browse ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			on: $b
			entitled: 'Browse (b)'
		
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
MessageTally >> gtInspectorPerformanceChartIn: composite [
	<gtInspectorPresentationOrder: 40>
	| metric |
	metric := #localTally.
	^ composite roassal2
		title: 'Top tallies';
		initializeView: [ RTDoubleBarBuilder new ];
		painting: [ :builder :presentation |
			GTInspectorMessageTallyCharter new 
				performanceOf: self 
				with: builder
				in: presentation ];
		when: [ self children notEmpty ]
]

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
MessageTally >> gtInspectorSunburstIn: composite [
	<gtInspectorPresentationOrder: 40>
	| methods normalizer |
	methods := self withDeepCollect: #children.
	normalizer := RTNColorLinearNormalizer 
						inContext: methods 
						withCommand: #tally 
						lowColor: Color veryLightGray 
						highColor: Color red.
	^ composite roassal2
		title: 'Sunburst';
		initializeView: [ RTSunburstBuilder new ];
		painting: [ :b :presentation |
			b strategy radialSpacing: 1.
			b shape current
				color: normalizer.
			b
				leafWeight: #tally;
				angularSpacing: 1;
				from: (Array with: self) using: #children ];
		when: [ self children notEmpty ]
]
