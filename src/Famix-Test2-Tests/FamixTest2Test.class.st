Class {
	#name : #FamixTest2Test,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'c3',
		'c4',
		'c5',
		'i1',
		'i2',
		'i3',
		'i4',
		'i5'
	],
	#category : #'Famix-Test2-Tests'
}

{ #category : #running }
FamixTest2Test >> setUp [

	super setUp.

	model := FamixTest2Model new.
	c1 := FamixTest2Class named: 'Class1'.
	c2 := FamixTest2Class named: 'Class2'.
	c3 := FamixTest2Class named: 'Class3'.
	c4 := FamixTest2Class named: 'Class4'.
	c5 := FamixTest2Class named: 'Class5'.
	
	i1 := FamixTest2Inheritance new. 
	i2 := FamixTest2Inheritance new. 
	i3 := FamixTest2Inheritance new. 
	i4 := FamixTest2Inheritance new. 
	i5 := FamixTest2Inheritance new. 
	
	model addAll: { c1. c2. c3. c4. c5. i1. i2. i3. i4. i5 }.
	
	i1 superclass: c1; subclass: c2.
	"opposite way"
	c1 addSubInheritance: i2. 	
	c3 addSuperInheritance: i2.
	
	i3 superclass: c2; subclass: c4.
	i4 superclass: c2; subclass: c5.
	i5 superclass: c3; subclass: c5.
]

{ #category : #tests }
FamixTest2Test >> testInheritances [

	self assertCollection: (c1 subInheritances collect: #subclass) hasSameElements: { c2. c3 }.
	self assertCollection: (c2 subInheritances collect: #subclass) hasSameElements: { c4. c5 }.	
	self assertCollection: (c3 subInheritances collect: #subclass) hasSameElements: { c5 }.	

]
