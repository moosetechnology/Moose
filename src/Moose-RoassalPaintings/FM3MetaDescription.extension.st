Extension { #name : #FM3MetaDescription }

{ #category : #'*Moose-RoassalPaintings' }
FM3MetaDescription >> viewConnectionsOn: view [
	view interaction popupText: #name.
	view shape circle; color: Color blue; size: 20.
	view node: self.
	view shape circle; color: Color lightGray; size: 20.
	view interaction popupText: #name.
	view nodes: ((self complexAttributes collect: #type) \ {self}) asSet.
	view interaction popupText: #name.
	view shape circle color: Color blue.
	view nodes: self complexAttributes.
	view interaction popupText: #name.
	view shape circle color: Color lightGray.
	view nodes: ((self complexAttributes collect: #opposite) reject: #isNil).
	view shape line color: (Color blue alpha: 0.5).
	view edges 
		source: self complexAttributes 
		connectFrom: self 
		to: #yourself.
	view shape line color: (Color lightGray alpha: 0.5).
	view edges 
		source: self complexAttributes 
		connectFrom: #yourself 
		to: #opposite.
	view edges 
		source: ((self complexAttributes collect: #opposite) reject: #isNil)
		connectFrom: #yourself
		to: [ :each | each mmClass ].
	view layout force.
	view view pushBackEdges.
]
