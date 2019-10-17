Extension { #name : #FM3Class }

{ #category : #'*Moose-Finder' }
FM3Class >> gtInspectorConnectionsIn: composite [
	<gtInspectorPresentationOrder: 3>
	composite roassal2
		title: 'Connections';
		initializeView: [RTMondrian new];
		painting: [ :view | self viewConnectionsOn: view ];
		when: [ self allComplexProperties notEmpty ]
]
