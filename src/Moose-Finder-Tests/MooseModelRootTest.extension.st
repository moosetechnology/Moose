Extension { #name : #MooseModelRootTest }

{ #category : #'*Moose-Finder-Tests' }
MooseModelRootTest >> testDelete [
	model := self modelClass new.
	self modelClass root add: model.
	[ model delete ]
		valueSupplyingAnswer:
			{('Are you sure to want to delete ' , model mooseName printString
				, '?').
			true}.
	self deny: (MooseModel root includes: model).
	self deny: (self modelClass root includes: model)
]

{ #category : #'*Moose-Finder-Tests' }
MooseModelRootTest >> testDeleteNonRegisteredModelRaisesError [
	"Raise an error since it is not in the root"
	self
		should: [ [ self modelClass new delete ] valueSupplyingAnswer: true ]
		raise: Error.
]
