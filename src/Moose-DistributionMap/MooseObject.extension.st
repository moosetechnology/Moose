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
