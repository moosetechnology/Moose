Extension { #name : #ReadWriteStream }

{ #category : #'*CollectionExtensions' }
ReadWriteStream >> piecesStartingOnLinesThat: aLineConditionBlock do: aBlock [
	| reader current |
	current := String new.
	reader := ZnFastLineReader on: self.
	reader linesDo: [ :each | 
			current := (aLineConditionBlock value: each)
					ifTrue: [ 
						current notEmpty ifTrue: [ 
							aBlock value: current ].
						each ]
					ifFalse: [ current , each ] ].
	(current notEmpty and: [ aLineConditionBlock value: current ])
		ifTrue: [ aBlock value: current ]
]
