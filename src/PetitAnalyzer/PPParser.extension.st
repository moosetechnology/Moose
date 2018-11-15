Extension { #name : #PPParser }

{ #category : #'*petitanalyzer-named' }
PPParser >> allNamedParsers [
	"Answer all the named parse nodes of the receiver."

	| result |
	result := OrderedCollection new.
	self allNamedParsersDo: [ :parser | result addLast: parser ].
	^ result
]

{ #category : #'*petitanalyzer-querying' }
PPParser >> cycleSet [
	"Answer a set of all nodes that are within one or more cycles of left-recursion. This is generally not a problem if at least one of the nodes is memoized, but it might make the grammar very inefficient and should be avoided if possible."
	
	| cycles |
	cycles := IdentitySet new.
	self cycleSet: OrderedCollection new firstSets: self firstSets into: cycles.
	^ cycles
]
