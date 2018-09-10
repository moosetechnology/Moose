Extension { #name : #TRCanvas }

{ #category : #'*Roassal2GT-Inspector' }
TRCanvas class >> gtExampleEmpty [
	<gtExample>
	<label: 'Empty canvas'>
	
	^ TRCanvas new
]

{ #category : #'*Roassal2GT-Inspector' }
TRCanvas >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal2
		title: 'Canvas';
		initializeView: [ RTView new setCanvas: self ]
		
]
