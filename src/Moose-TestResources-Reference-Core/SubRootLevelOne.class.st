Class {
	#name : #SubRootLevelOne,
	#superclass : #TheRoot,
	#instVars : [
		'k'
	],
	#classInstVars : [
		'mk'
	],
	#category : #'Moose-TestResources-Reference-Core'
}

{ #category : #'accessing superclassinstance on class side' }
SubRootLevelOne class >> accessSharedVariableOfSuperClassClassSide [

	TheRootSharedVariable := 6
]

{ #category : #'accessing superclassinstance on class side' }
SubRootLevelOne class >> accessSharedVariableOfSuperSuperClassClassSide [

	DependentsFields := 6
]

{ #category : #accessingSuperclassInstVar }
SubRootLevelOne >> accessSharedVariableOfSuperclassInstanceSide [

	TheRootSharedVariable := 5
]

{ #category : #accessingSuperclassInstVar }
SubRootLevelOne >> accessSuperclassInstVar [

	k := x + y
]

{ #category : #accessingSuperclassInstVar }
SubRootLevelOne >> accessTwiceTheSameVariable [

	k + 1.
	k + 2.
]

{ #category : #accessingSuperclassInstVar }
SubRootLevelOne >> accessTwiceTheSameVariableReadAndWrite [

	k := k+ 1.
]
