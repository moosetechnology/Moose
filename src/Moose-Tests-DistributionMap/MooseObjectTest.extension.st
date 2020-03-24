Extension { #name : #MooseObjectTest }

{ #category : #'*Moose-Tests-DistributionMap' }
MooseObjectTest >> testAllPropertySelectors [
	| model class |
	model := FamixTest1Model new.
	self assert: (FamixTest1Entity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new.
	model := FAMIXTypeGroup new.
	class := FamixTest1Class named: 'AClass'.
	model add: class.
	self assert: (FamixTest1Entity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new.
	model := MooseAbstractGroup new.
	class := FamixTest1Class named: 'AClass'.
	model add: class.
	self assert: (FamixTest1Entity allPropertySelectorsComputableIn: model) equals: IdentityDictionary new
]
