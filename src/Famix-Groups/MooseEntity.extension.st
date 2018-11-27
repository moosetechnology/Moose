Extension { #name : #MooseEntity }

{ #category : #'*Famix-Groups' }
MooseEntity class >> relatedGroupType [

	" The entities can specify what is the prefered type of MooseGroup they want to be stored in.
	They do that using a class side method with uniqueName that contains pragma <mooseGroup>. 
	Because such methods are stored mostly in traits and a class can have more than prefered group
	type, only the first one is selected."

	| methodSelectors |
	methodSelectors := (self class allMethods select: [ :each | each hasPragmaNamed: #mooseGroup ]) collect: #selector.
	methodSelectors ifEmpty: [ ^ MooseGroup ].
	^ self perform: methodSelectors first.
]
