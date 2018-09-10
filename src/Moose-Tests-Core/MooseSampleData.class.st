Class {
	#name : #MooseSampleData,
	#superclass : #TestResource,
	#instVars : [
		'moosemodel1',
		'moosemodel2',
		'moosemodel3',
		'moosemodel4',
		'moosemodel5'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #initialization }
MooseSampleData >> initialize [
	moosemodel1 := (self readMSEString: self modelVersion1) name: #'Simple model 1'.
	moosemodel2 := (self readMSEString: self modelVersion2) name: #'Simple model 2'.
	moosemodel3 := (self readMSEString: self modelVersion3) name: #'Simple model 3'.
	moosemodel4 := (self readMSEString: self modelVersion4) name: #'Simple model 4'.
	moosemodel5 := (self readMSEString: self modelVersion5) name: #'Simple model 5'
]

{ #category : #data }
MooseSampleData >> modelVersion1 [
	"
	self new simpleModel1
	"
	
	^
'(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 2))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))

	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #data }
MooseSampleData >> modelVersion2 [
	"
	self new simpleModel2
	"

	^
'(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(FAMIX.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(FAMIX.Class (id: 4) (name ''ClassC'') (container (ref: 1)) (parentPackage (ref: 202)))
	(FAMIX.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))

	(FAMIX.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 202) (name ''anotherPackage''))
	(FAMIX.Package (id: 203) (name ''aPackage'') (parentPackage (ref: 201)))


	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #data }
MooseSampleData >> modelVersion3 [
	"
	self new simpleModel3
	"
	
	^
'(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(FAMIX.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(FAMIX.Class (id: 4) (name ''ClassC'') (container (ref: 1)) (parentPackage (ref: 202)))
	(FAMIX.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))
	(FAMIX.Method (name ''methodC2'') (signature ''methodC2()'') (parentType (ref: 4)) (numberOfLinesOfCode 10))
	(FAMIX.Method (name ''methodC3'') (signature ''methodC3()'') (parentType (ref: 4)) (numberOfLinesOfCode 7))
	(FAMIX.Attribute (name ''attributeC1'') (parentType (ref: 4)))
	(FAMIX.Attribute (name ''attributeC2'') (parentType (ref: 4)))

	(FAMIX.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(FAMIX.Class (id: 5) (name ''ClassD'') (container (ref: 1)) (parentPackage (ref: 202)))
	(FAMIX.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 3))

	(FAMIX.Inheritance (subclass (ref: 5)) (superclass (ref: 4)))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 202) (name ''anotherPackage'')))'
]

{ #category : #data }
MooseSampleData >> modelVersion4 [
	"
	self new simpleModel4
	"
	
	^
'(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(FAMIX.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(FAMIX.Class (id: 4) (name ''ClassC'') (container (ref: 1)) (parentPackage (ref: 203)))
	(FAMIX.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))
	(FAMIX.Method (name ''methodC2'') (signature ''methodC2()'') (parentType (ref: 4)) (numberOfLinesOfCode 10))
	(FAMIX.Attribute (name ''attributeC1'') (parentType (ref: 4)))

	(FAMIX.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(FAMIX.Class (id: 5) (name ''ClassD'') (container (ref: 1)) (parentPackage (ref: 203)))
	(FAMIX.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 15))
	(FAMIX.Method (name ''methodD2'') (signature ''methodD2()'') (parentType (ref: 5)) (numberOfLinesOfCode 7))
	(FAMIX.Attribute (name ''attributeD1'') (parentType (ref: 4)))
	(FAMIX.Inheritance (subclass (ref: 5)) (superclass (ref: 4)))


	(FAMIX.Namespace (id: 101) (name ''anotherNamespace'') (parentScope (ref: 1)))
	(FAMIX.Class (id: 102) (name ''ClassA'') (container (ref: 101)) (parentPackage (ref: 203)))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 203) (name ''yetAnotherPackage'') (parentPackage (ref: 201)))

)'
]

{ #category : #data }
MooseSampleData >> modelVersion5 [
	"
	self new simpleModel5
	"

	^
'(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(FAMIX.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(FAMIX.Class (id: 5) (name ''ClassD'') (container (ref: 1)) (parentPackage (ref: 203)))
	(FAMIX.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 15))
	(FAMIX.Method (name ''methodD2'') (signature ''methodD2()'') (parentType (ref: 5)) (numberOfLinesOfCode 7))
	(FAMIX.Method (name ''methodD3'') (signature ''methodC1()'') (parentType (ref: 5)) (numberOfLinesOfCode 4))
	(FAMIX.Attribute (name ''attributeD1'') (parentType (ref: 5)))
	(FAMIX.Attribute (name ''attributeD2'') (parentType (ref: 5)))

	(FAMIX.Inheritance (subclass (ref: 5)) (superclass (ref: 2)))

	(FAMIX.Class (id: 6) (name ''ClassE'') (container (ref: 1)) (parentPackage (ref: 203)))
	(FAMIX.Attribute (name ''attributeE1'') (parentType (ref: 6)))

	(FAMIX.Inheritance (subclass (ref: 6)) (superclass (ref: 3)))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 203) (name ''yetAnotherPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #util }
MooseSampleData >> readMSEString: aString [ 
	^ MooseModel new importFromMSEStream: aString readStream
]

{ #category : #running }
MooseSampleData >> setUp [
	self initialize
]

{ #category : #accessing }
MooseSampleData >> simpleModel1 [
	^moosemodel1
]

{ #category : #accessing }
MooseSampleData >> simpleModel2 [
	^moosemodel2
]

{ #category : #accessing }
MooseSampleData >> simpleModel3 [
	^moosemodel3
]

{ #category : #accessing }
MooseSampleData >> simpleModel4 [
	^moosemodel4
]

{ #category : #accessing }
MooseSampleData >> simpleModel5 [
	^moosemodel5
]
