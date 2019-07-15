Extension { #name : #REPConcern }

{ #category : #'*Arki-Reporter-Browser' }
REPConcern >> browser [
	| browser |
	browser := GLMTabulator new.
	browser title: #label.
	browser column: #explanation.
	browser transmit to: #explanation; andShow: [:a | 
		a text 
			display: #explanation ].
	^ browser 
]

{ #category : #'*Arki-Reporter-Browser' }
REPConcern >> gtInspectorExplanationIn: composite [
	<gtInspectorPresentationOrder: 9>
	composite text
		title: 'Explanation';
		display: [ self explanation ]
]

{ #category : #'*Arki-Reporter-Browser' }
REPConcern >> open [
	| spec |
	spec := REPConcernSpecification on: self model.
	spec concern: self.
	spec open
]

{ #category : #'*arki-reporter-browser' }
REPConcern class >> openOn: aModel [
	^ (self on: aModel) open
]
