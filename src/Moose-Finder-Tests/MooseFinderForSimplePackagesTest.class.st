Class {
	#name : #MooseFinderForSimplePackagesTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Finder-Tests'
}

{ #category : #running }
MooseFinderForSimplePackagesTest >> buildModel [

	model := MooseModel new.
	model
		add: (FamixStPackage new name: 'name1');
		add: (FamixStPackage new name: 'name2');
		add: (FamixStPackage new name: 'name3')
]
