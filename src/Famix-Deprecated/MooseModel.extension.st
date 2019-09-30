Extension { #name : #MooseModel }

{ #category : #'*Famix-Deprecated' }
MooseModel class >> meta [
	self deprecated: 'We do not have one MM anymore. You should explicit one specific MM directly.'.
	^ FamixCompatibilityGenerator metamodel
]
