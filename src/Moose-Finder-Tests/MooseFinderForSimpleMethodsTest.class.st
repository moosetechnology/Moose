Class {
	#name : #MooseFinderForSimpleMethodsTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Finder-Tests'
}

{ #category : #running }
MooseFinderForSimpleMethodsTest >> buildModel [

	| class |
	model := MooseModel new.
	class := FamixStClass new.
	class
		addMethod: (FamixStMethod new name: 'name1');
		addMethod: (FamixStMethod new name: 'name2');
		addMethod: (FamixStMethod new name: 'name3')
]
