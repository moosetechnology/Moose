Extension { #name : #MooseModel }

{ #category : #'*Arki-Reporter-Browser' }
MooseModel >> gtInspectorReportConcernsIn: composite [
	<gtInspectorPresentationOrder: 20>
	composite tree
		title: 'Report';
		titleIcon: MooseIcons mooseSourceText;
		display: [ :concern | self report spec root children ];
		children: #children;
		format: [ :concern | concern status label ];
		selectionAct: [ :list | list selection class browse ] entitled: 'Browse implementation';
		selectionAct: [ :list | 
			list selection update. 
			list update ] entitled: 'Update';
		selectionAct: [ :list | list selection result inspect ] entitled: 'Inspect result';
		when: [ self report notNil ]
]

{ #category : #'*Arki-Reporter-Browser' }
MooseModel >> report [
	^ self privateState attributeAt: #report ifAbsent: [ nil ]
]

{ #category : #'*Arki-Reporter-Browser' }
MooseModel >> report: aReport [
	^ self privateState attributeAt: #report put: aReport
]
