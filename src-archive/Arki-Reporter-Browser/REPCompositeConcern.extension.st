Extension { #name : #REPCompositeConcern }

{ #category : #'*Arki-Reporter-Browser' }
REPCompositeConcern >> gtInspectorConcernListIn: a [
	<gtInspectorPresentationOrder: 1>
	^ a table
		title: 'Index';
		display: [ self children ];
		children: #children;
		column: 'Label' evaluated: [ :concern | concern status label ];
		column: 'Stakeholder' evaluated: [''] tags: [:concern | concern stakeholder asStrings ];
		selectionAct: [ :list | list selection class browse ] entitled: 'Browse implementation';
		selectionAct: [ :list | 
			list selection update. 
			list update ] entitled: 'Update';
		selectionAct: [ :list | list selection result inspect ] entitled: 'Inspect result'
]
