Extension { #name : #PPParser }

{ #category : #'*petitgui' }
PPParser >> gtAllParsersIn: composite [
	<gtInspectorPresentationOrder: 50>

	composite roassal2
		title: 'Graph'; 
		initializeView: [ RTMondrian new ];
		painting: [ :view |
			self viewAllParsersOn: view.	
		].
]

{ #category : #'*petitgui' }
PPParser class >> gtExampleCharactersParser [
	<gtExample>
	<label: 'Characters parser'>
	
	^ ($a to: $z) asParser
]

{ #category : #'*petitgui' }
PPParser class >> gtExampleEmptyParser [
	<gtExample>
	<label: 'Empty parser'>
	
	^ self new
]

{ #category : #'*petitgui' }
PPParser >> gtInspectorParserInspectorIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite custom: (
		PPVerticalParserInspector new 
			title: 'Sampler';
			startOn: self)
]

{ #category : #'*petitgui' }
PPParser >> gtNamedTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
		title: 'Named Tree';
		children: [:n | n namedChildren ];
		format: [:n| n name ifNil: [ n asString ] ];
		shouldExpandToLevel: 3
]

{ #category : #'*petitgui' }
PPParser >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n name ifNil: [ n asString ] ifNotNil: [n name] ];
			shouldExpandToLevel: 6
]
