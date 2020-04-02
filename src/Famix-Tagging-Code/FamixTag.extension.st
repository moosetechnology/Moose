Extension { #name : #FamixTag }

{ #category : #'*Famix-Tagging-Code' }
FamixTag >> tagInterval: anInterval forEntity: anEntity sourceAnchor: anAnchor [ 
	FamixTagCodeAssociation newInterval: anInterval forEntity: anEntity sourceAnchor: anAnchor tag: self
]
