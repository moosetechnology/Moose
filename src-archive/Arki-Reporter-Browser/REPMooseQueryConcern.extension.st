Extension { #name : #REPMooseQueryConcern }

{ #category : #'*arki-reporter-browser' }
REPMooseQueryConcern >> browser [
	^ (MooseFinder new first noTitle startOn: self result) 
]

{ #category : #'*arki-reporter-browser' }
REPMooseQueryConcern >> gtInspectorResultIn: composite [
	<gtInspectorPresentationOrder: 5>
	composite list
		title: 'Result';
		display: [ self result ];
		format: [ :each | each gtDisplayString ];
		when: [ self result notNil ]
]
