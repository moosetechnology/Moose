Extension { #name : #Collection }

{ #category : #'*Moose-Algos-Clustering' }
Collection >> cross: aCollection do: aBlock [

	self do: [:each |
		aCollection do: [:another |
			aBlock value: each value: another.
			]
		]
]
