Extension { #name : #Magnitude }

{ #category : #'*Roassal2-Core' }
Magnitude >> max: max in: anInterval [ 
	"
	(0 max: 20 in: (1 to: 10)) == 1
	(0 max: 20 in: (0 to: 10)) == 0
	(0 max: 20 in: (1 to: 10)) == 1
	(2 max: 20 in: (0 to: 10)) == 1 
	(4 max: 20 in: (0 to: 10)) == 2
	(20 max: 20 in: (0 to: 10)) == 10
	"
	^ self min: 0 max: max in: anInterval
]

{ #category : #'*Roassal2-Core' }
Magnitude >> min: min max: max in: anInterval [ 
	"
	(0 max: 20 in: (1 to: 10)) == 1
	(0 max: 20 in: (0 to: 10)) == 0
	(0 max: 20 in: (1 to: 10)) == 1
	(2 max: 20 in: (0 to: 10)) == 1 
	(4 max: 20 in: (0 to: 10)) == 2
	(19 max: 20 in: (0 to: 10)) == 10
	"
	min = max ifTrue: [ ^ min ].
	^ (self - min) / (max - min) * (anInterval last - anInterval first) + anInterval first

]
