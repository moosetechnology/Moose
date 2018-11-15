Extension { #name : #PPToken }

{ #category : #'*PetitGui' }
PPToken >> gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 10> 

	^ composite text 
		title: 'Source';
		display: [ self collection asString ];
		initialize: [ :presentation | 
			presentation selectionInterval: (self start to: self stop) ];
		when: [ self collection notNil ]
]
