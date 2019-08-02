Class {
	#name : #MooseJavaSampleData,
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
MooseJavaSampleData >> initialize [
	moosemodel1 := (self readMSEString: self modelVersion1) name: #'Simple model 1'.
	moosemodel2 := (self readMSEString: self modelVersion2) name: #'Simple model 2'.
	moosemodel3 := (self readMSEString: self modelVersion3) name: #'Simple model 3'.
	moosemodel4 := (self readMSEString: self modelVersion4) name: #'Simple model 4'.
	moosemodel5 := (self readMSEString: self modelVersion5) name: #'Simple model 5'
]

{ #category : #data }
MooseJavaSampleData >> modelVersion1 [
	"
	self new simpleModel1
	"
	
	^
'(
	(Famix-Java-Entities.Class (id: 2) (name ''ClassA'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 2))
	(Famix-Java-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Famix-Java-Entities.Class (id: 3) (name ''ClassB'') (parentPackage (ref: 201)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Famix-Java-Entities.Package (id: 201) (name ''aPackage''))
	(Famix-Java-Entities.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #data }
MooseJavaSampleData >> modelVersion2 [
	"
	self new simpleModel2
	"

	^
'(
	(Famix-Java-Entities.Class (id: 2) (name ''ClassA'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Famix-Java-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Famix-Java-Entities.Class (id: 3) (name ''ClassB'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 4) (name ''ClassC'') (container (ref: 1)) (parentPackage (ref: 202)))
	(Famix-Java-Entities.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))

	(Famix-Java-Entities.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(Famix-Java-Entities.Package (id: 201) (name ''aPackage''))
	(Famix-Java-Entities.Package (id: 202) (name ''anotherPackage''))
	(Famix-Java-Entities.Package (id: 203) (name ''aPackage'') (parentPackage (ref: 201)))


	(Famix-Java-Entities.Package (id: 201) (name ''aPackage''))
	(Famix-Java-Entities.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #data }
MooseJavaSampleData >> modelVersion3 [
	"
	self new simpleModel3
	"
	
	^
'(
	(Famix-Java-Entities.Class (id: 2) (name ''ClassA'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Famix-Java-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Famix-Java-Entities.Class (id: 3) (name ''ClassB'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 4) (name ''ClassC'') (container (ref: 1)) (parentPackage (ref: 202)))
	(Famix-Java-Entities.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Method (name ''methodC2'') (signature ''methodC2()'') (parentType (ref: 4)) (numberOfLinesOfCode 10))
	(Famix-Java-Entities.Method (name ''methodC3'') (signature ''methodC3()'') (parentType (ref: 4)) (numberOfLinesOfCode 7))
	(Famix-Java-Entities.Attribute (name ''attributeC1'') (parentType (ref: 4)))
	(Famix-Java-Entities.Attribute (name ''attributeC2'') (parentType (ref: 4)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 5) (name ''ClassD'') (container (ref: 1)) (parentPackage (ref: 202)))
	(Famix-Java-Entities.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 3))

	(Famix-Java-Entities.Inheritance (subclass (ref: 5)) (superclass (ref: 4)))

	(Famix-Java-Entities.Package (id: 201) (name ''aPackage''))
	(Famix-Java-Entities.Package (id: 202) (name ''anotherPackage'')))'
]

{ #category : #data }
MooseJavaSampleData >> modelVersion4 [
	"
	self new simpleModel4
	"
	
	^
'(
	(Famix-Java-Entities.Class (id: 2) (name ''ClassA'')  (parentPackage (ref: 201)))
	(Famix-Java-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Famix-Java-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Famix-Java-Entities.Class (id: 3) (name ''ClassB'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 4) (name ''ClassC'') (parentPackage (ref: 203)))
	(Famix-Java-Entities.Method (name ''methodC1'') (signature ''methodC1()'') (parentType (ref: 4)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Method (name ''methodC2'') (signature ''methodC2()'') (parentType (ref: 4)) (numberOfLinesOfCode 10))
	(Famix-Java-Entities.Attribute (name ''attributeC1'') (parentType (ref: 4)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 4)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 5) (name ''ClassD'') (container (ref: 1)) (parentPackage (ref: 203)))
	(Famix-Java-Entities.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 15))
	(Famix-Java-Entities.Method (name ''methodD2'') (signature ''methodD2()'') (parentType (ref: 5)) (numberOfLinesOfCode 7))
	(Famix-Java-Entities.Attribute (name ''attributeD1'') (parentType (ref: 4)))
	(Famix-Java-Entities.Inheritance (subclass (ref: 5)) (superclass (ref: 4)))


	(Famix-Java-Entities.Class (id: 102) (name ''ClassA'') (parentPackage (ref: 203)))

	(Famix-Java-Entities.Package (id: 201) (name ''aPackage''))
	(Famix-Java-Entities.Package (id: 203) (name ''yetAnotherPackage'') (parentPackage (ref: 201)))

)'
]

{ #category : #data }
MooseJavaSampleData >> modelVersion5 [
	"
	self new simpleModel5
	"

	^
'(
	(Famix-Java-Entities.Class (id: 2) (name ''ClassA'') (parentPackage (ref: 201)))
	(Famix-Java-Entities.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Method (name ''methodA2'') (signature ''methodA2()'') (parentType (ref: 2)) (numberOfLinesOfCode 5))
	(Famix-Java-Entities.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(Famix-Java-Entities.Class (id: 3) (name ''ClassB'')  (parentPackage (ref: 201)))
	(Famix-Java-Entities.Attribute (name ''attributeB1'') (parentType (ref: 3)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 5) (name ''ClassD'')  (parentPackage (ref: 203)))
	(Famix-Java-Entities.Method (name ''methodD1'') (signature ''methodD1()'') (parentType (ref: 5)) (numberOfLinesOfCode 15))
	(Famix-Java-Entities.Method (name ''methodD2'') (signature ''methodD2()'') (parentType (ref: 5)) (numberOfLinesOfCode 7))
	(Famix-Java-Entities.Method (name ''methodD3'') (signature ''methodC1()'') (parentType (ref: 5)) (numberOfLinesOfCode 4))
	(Famix-Java-Entities.Attribute (name ''attributeD1'') (parentType (ref: 5)))
	(Famix-Java-Entities.Attribute (name ''attributeD2'') (parentType (ref: 5)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 5)) (superclass (ref: 2)))

	(Famix-Java-Entities.Class (id: 6) (name ''ClassE'') (parentPackage (ref: 203)))
	(Famix-Java-Entities.Attribute (name ''attributeE1'') (parentType (ref: 6)))

	(Famix-Java-Entities.Inheritance (subclass (ref: 6)) (superclass (ref: 3)))

	(Famix-Java-Entities.Package (id: 201) (name ''aPackage''))
	(Famix-Java-Entities.Package (id: 203) (name ''yetAnotherPackage'') (parentPackage (ref: 201)))
)'
]

{ #category : #util }
MooseJavaSampleData >> readMSEString: aString [ 
	^ FamixJavaMooseModel new importFromMSEStream: aString readStream
]

{ #category : #running }
MooseJavaSampleData >> setUp [
	self initialize
]

{ #category : #accessing }
MooseJavaSampleData >> simpleModel1 [
	^moosemodel1
]

{ #category : #accessing }
MooseJavaSampleData >> simpleModel2 [
	^moosemodel2
]

{ #category : #accessing }
MooseJavaSampleData >> simpleModel3 [
	^moosemodel3
]

{ #category : #accessing }
MooseJavaSampleData >> simpleModel4 [
	^moosemodel4
]

{ #category : #accessing }
MooseJavaSampleData >> simpleModel5 [
	^moosemodel5
]
