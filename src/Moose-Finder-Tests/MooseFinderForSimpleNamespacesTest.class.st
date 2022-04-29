Class {
	#name : #MooseFinderForSimpleNamespacesTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Finder-Tests'
}

{ #category : #running }
MooseFinderForSimpleNamespacesTest >> buildModel [

	model := MooseModel new.
	model
		add: (FamixStNamespace new name: 'name1');
		add: (FamixStNamespace new name: 'name2');
		add: (FamixStNamespace new name: 'name3')
]
