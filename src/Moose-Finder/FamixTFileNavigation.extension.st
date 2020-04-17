Extension { #name : #FamixTFileNavigation }

{ #category : #'*Moose-Finder' }
FamixTFileNavigation >> intervalAsCharPos [
	| start end index |
	index := 0.
	start := 1.
	end := 0.
	self completeText lineIndicesDo: [:lineStart :lineEnd :y | 
		index := index + 1.
		self startLine = index ifTrue: [ start := lineStart ].
		self endLine = index ifTrue: [end := lineEnd ] ].
	^ start to: end
]
