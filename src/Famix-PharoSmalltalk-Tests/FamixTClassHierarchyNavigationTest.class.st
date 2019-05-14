"
A FamixTClassHierarchyNavigationTest is a test class for testing the behavior of FamixTClassHierarchyNavigation
"
Class {
	#name : #FamixTClassHierarchyNavigationTest,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #test }
FamixTClassHierarchyNavigationTest >> testWithSuperclassHierarchy [
	| class superclass model |
	model := MooseModel new.
	model sourceLanguage: FamixStSourceLanguage new.
	superclass := FamixStClass new
		name: 'SuperClass';
		mooseModel: model;
		yourself.
	class := FamixStClass new
		name: 'Class';
		mooseModel: model;
		yourself.
	FamixStInheritance new
		mooseModel: model;
		superclass: superclass;
		subclass: class.
	self assert: class superclassHierarchy size equals: 1.
	self assert: class withSuperclassHierarchy size equals: 2.
]
