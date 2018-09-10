Extension { #name : #RTBuilder }

{ #category : #'*Roassal2GT-Inspector' }
RTBuilder class >> gtExampleBuilder [
	<gtExample>
	<label: 'Example builder'>
	
	^ self new
]

{ #category : #'*Roassal2GT-Inspector' }
RTBuilder >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal2
		title: 'View';
		initializeView: [ self ]
]

{ #category : #'*Roassal2GT-Glamour' }
RTBuilder >> openWithToolbar [
	^ GLMCompositePresentation new 
		title: 'Roassal';
		with: [:composite |
			composite roassal2 title: 'Painting'; initializeView: [ self ] ];
		openOn: self
]

{ #category : #'*Roassal2GT-Glamour' }
RTBuilder >> openWithToolbarEntitled: aTitle [
	^ self openWithToolbar title: aTitle
]
