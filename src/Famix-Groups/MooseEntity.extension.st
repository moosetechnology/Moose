Extension { #name : #MooseEntity }

{ #category : #'*Famix-Groups' }
MooseEntity class >> relatedGroupType [

	" The entities can specify what is the prefered type of MooseGroup they want to be stored in.
	They do that using a class side method with uniqueName that contains pragma <mooseGroup>. 
	Because such methods are stored mostly in traits and a class can have more than prefered group
	type, the most specialize one selected."

	| definingMethods selectedMethod |
	definingMethods := (self class allMethods select: [ :each | each hasPragmaNamed: #mooseGroup ]).
	definingMethods ifEmpty: [ ^ MooseGroup ].
	selectedMethod := definingMethods detectMax: [ :each | each methodClass withAllSuperclasses size ].

	^ self perform: selectedMethod selector.
]
