Extension { #name : #MalHits }

{ #category : #'*Moose-RoassalPaintings-displaying' }
MalHits >> display [

	| view |
	view := RTMondrian new.
	self displayOn: view.
	^ view open
]

{ #category : #'*Moose-RoassalPaintings-displaying' }
MalHits >> displayOn: view [

	view shape label text: [:n| n printString].
	view nodes: nodes.
	view shape arrowedLine.
	view edges connectFrom: #yourself toAll: #nextNodes.
	view layout circle
]
