Extension { #name : #MetacelloVersion }

{ #category : #'*GT-InspectorExtensions-CoreRoassal' }
MetacelloVersion >> gtInspectorProjectMapIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite roassal2
		title: 'Project map';
		when: [ self projects notEmpty ];
		initializeView: [ RTMondrian new ];
		painting: [ :view |
			view shape label text: [:each | (each asString copyReplaceAll: 'ConfigurationOf' with: '') copyReplaceAll: ' ' with: String cr]; color: Color black.
			view nodes: ((self 
							withDeepCollect: [ :each | each projects collect: #version ] 
							as: Set) 	reject: #isNil).
			view shape line color: (Color lightGray alpha: 0.2).
			view edges
				 connectFrom: #yourself toAll: [:each | each projects collect: #version].
			view layout horizontalDominanceTree layered verticalGap: 20.
			view view pushBackEdges ]
		
	
]
