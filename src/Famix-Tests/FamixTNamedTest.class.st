"
Concrete test using TFamixTNamedTest trait.
Got a unique method, the set up that creates a MooseEntity with a FamixTNamed talent.
"
Class {
	#name : #FamixTNamedTest,
	#superclass : #TestCase,
	#traits : 'TFamixTNamedTest',
	#classTraits : 'TFamixTNamedTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #running }
FamixTNamedTest >> setUp [
	self entity: (MooseEntity new copyWithTalent: FamixTNamed ).
]
