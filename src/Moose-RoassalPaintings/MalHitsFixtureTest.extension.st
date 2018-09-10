Extension { #name : #MalHitsFixtureTest }

{ #category : #'*Moose-RoassalPaintings-Test' }
MalHitsFixtureTest >> testDisplay [

	MalGraphFixture complexCycleGraph: hits.
	self shouldnt: [(hits run; display) delete] raise: Error.
]
