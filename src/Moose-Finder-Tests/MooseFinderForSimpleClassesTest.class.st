Class {
	#name : #MooseFinderForSimpleClassesTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Finder-Tests'
}

{ #category : #running }
MooseFinderForSimpleClassesTest >> buildModel [ 
	| class1 m1 m2 m3 class2 m4 m5 m6 class3 m7 m8 m9 famixInheritance |
	model := MooseModel new.
	class1 := FamixStClass new.
	class1 name: 'A'.
	class1
		addMethod: (m1 := FamixStMethod new name: 'name1'; signature: 'name1');
		addMethod: (m2 := FamixStMethod new name: 'name2'; signature: 'name2');
		addMethod: (m3 := FamixStMethod new name: 'name3'; signature: 'name3').

	class2 := FamixStClass new.
	class2 name: 'B'.
	class2
		addMethod: (m4 := FamixStMethod new name: 'name1'; signature: 'name1');
		addMethod: (m5 := FamixStMethod new name: 'name2'; signature: 'name2');
		addMethod: (m6 := FamixStMethod new name: 'name3'; signature: 'name3').

	class3 := FamixStClass new.
	class3 name: 'C'.
	class3
		addMethod: (m7 := FamixStMethod new name: 'name1'; signature: 'name1');
		addMethod: (m8 := FamixStMethod new name: 'name2'; signature: 'name2');
		addMethod: (m9 := FamixStMethod new name: 'name3'; signature: 'name3').

	famixInheritance := FamixStInheritance new
			subclass: class3;
			superclass: class2.
	class3 addSuperInheritance: famixInheritance.

	model addAll: {class1 . class2 . class3 . m1 . m2 . m3 . m4 . m5 . m6 . m7 . m8 .m9 }.
	^ model
]
