Extension { #name : #PositionableStream }

{ #category : #'*Grease-Pharo30-Core' }
PositionableStream >> greaseUpToAll: aCollection [ 
	"Needed for Seaside ports to other dialects where #upToAll: may have
	different semantics"
	^ self upToAll: aCollection
]
