Class {
	#name : #MooseFinderForSimpleClassesTest,
	#superclass : #MooseFinderTest,
	#category : #'Moose-Tests-Finder'
}

{ #category : #running }
MooseFinderForSimpleClassesTest >> buildModel [ 
	| class1 m1 m2 m3 class2 m4 m5 m6 class3 m7 m8 m9 famixInheritance |
	model := MooseModel new.
	class1 := FAMIXClass new.
	class1 name: 'A'.
	class1
		addMethod: (m1 := FAMIXMethod new name: 'name1'; signature: 'name1');
		addMethod: (m2 := FAMIXMethod new name: 'name2'; signature: 'name2');
		addMethod: (m3 := FAMIXMethod new name: 'name3'; signature: 'name3').

	class2 := FAMIXClass new.
	class2 name: 'B'.
	class2
		addMethod: (m4 := FAMIXMethod new name: 'name1'; signature: 'name1');
		addMethod: (m5 := FAMIXMethod new name: 'name2'; signature: 'name2');
		addMethod: (m6 := FAMIXMethod new name: 'name3'; signature: 'name3').

	class3 := FAMIXClass new.
	class3 name: 'C'.
	class3
		addMethod: (m7 := FAMIXMethod new name: 'name1'; signature: 'name1');
		addMethod: (m8 := FAMIXMethod new name: 'name2'; signature: 'name2');
		addMethod: (m9 := FAMIXMethod new name: 'name3'; signature: 'name3').

	famixInheritance := FAMIXInheritance new
			subclass: class3;
			superclass: class2.
	class3 addSuperInheritance: famixInheritance.

	model addAll: {class1 . class2 . class3 . m1 . m2 . m3 . m4 . m5 . m6 . m7 . m8 .m9 }.
	^ model
]
