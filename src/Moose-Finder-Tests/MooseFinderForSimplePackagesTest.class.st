Class {
	#name : #MooseFinderForSimplePackagesTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Finder-Tests'
}

{ #category : #running }
MooseFinderForSimplePackagesTest >> buildModel [ 
	model := MooseModel new.
	model 
		add: (FAMIXPackage new name: 'name1');
		add: (FAMIXPackage new name: 'name2');
		add: (FAMIXPackage new name: 'name3').
]
