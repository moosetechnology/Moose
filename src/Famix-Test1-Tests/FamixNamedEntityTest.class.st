Class {
	#name : #FamixNamedEntityTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #tests }
FamixNamedEntityTest >> testHasUniqueMooseNameInModel [

	self assert: c1 hasUniqueMooseNameInModel.	
	self assert: c2 hasUniqueMooseNameInModel.
]

{ #category : #tests }
FamixNamedEntityTest >> testMooseNameOn [

	| newEntity |
	
	newEntity := FamixTest1Class new.

	self assert: (String streamContents: [ :s | newEntity mooseNameOn: s ]) equals: ''.
	
	newEntity name: 'NewEntity'.
	self assert: (String streamContents: [ :s | newEntity mooseNameOn: s ]) equals: 'NewEntity'.
]

{ #category : #tests }
FamixNamedEntityTest >> testName [

	self assert: c1 name equals: 'Class1'.
	c1 name: 'NewName'.
	self assert: c1 name equals: 'NewName'.

]

{ #category : #tests }
FamixNamedEntityTest >> testNameResetsNameOfChildren [

	self assert: m1 mooseName equals: 'Class1.method1'.
	c1 name: 'NewName'.
	self assert: m1 mooseName equals: 'NewName.method1'.


]

{ #category : #tests }
FamixNamedEntityTest >> testResetMooseName [

	"more or less a smoke test"
	self assert: c1 name equals: 'Class1'.
	c1 resetMooseName.
	self assert: c1 name equals: 'Class1'.

]
