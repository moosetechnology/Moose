Extension { #name : #MooseObject }

{ #category : #'*Moose-DistributionMap' }
MooseObject class >> allPropertySelectors [
	"Return a dictionary with all properties of this kind of entity, including metamodel properties, metrics, and navigation groups. Keys are abstract names of properties, values are implementing selectors"

	| props |
	props := IdentityDictionary new.
	self allDeclaredProperties do: [ :prop | props at: prop name put: prop implementingSelector ].
	(Pragma allNamed: #navigation: from: self to: MooseObject) do: [ :p | props at: p selector put: p selector ].
	(Pragma allNamed: #property:longName:description: from: self to: MooseObject) do: [ :p | props at: (p argumentAt: 1) put: p selector ].
	^ props
]

{ #category : #'*Moose-DistributionMap' }
MooseObject class >> allPropertySelectorsComputableIn: aMooseModel [ 

	"return a list of selectors not returning nil when applied on aMooseModel. Usefull for the ditributionMap wizard. Whith this method, it can provide in a sure way all the available property selectors that will not crash the visu by returning nil. But it takes a lot of time. (Maybe a better solution would be to make the distributionMap resistant to properties returning nil?)"
	|result|
	result := OrderedCollection new.
	^ self allPropertySelectors  do: [:aSelector |
		(aMooseModel allWithSmalltalkType: self) detect: [:each | (each perform: aSelector) isNil] ifNone: [result add: aSelector].
		]
		

]
