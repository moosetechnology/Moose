Class {
	#name : #MooseMSEImporterTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #util }
MooseMSEImporterTest >> readMSEStream: aStream [ 
	^ MooseModel new importFromMSEStream: aStream
]

{ #category : #tests }
MooseMSEImporterTest >> testComplex [
	| mooseModel |
	mooseModel := self readMSEStream: (
'(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (LOC 2))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))

	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))

	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 202) (name ''aPackage'') (parentPackage (ref: 201)))
)' readStream).
	
	self assert: (mooseModel entities notEmpty).
	self assert: ((mooseModel allPackages collect: #name) includes: 'aPackage').
	self assert: ((mooseModel allClasses collect: #name) includes: 'ClassA').
]

{ #category : #tests }
MooseMSEImporterTest >> testOneClass [
	| mooseModel |
	mooseModel := self readMSEStream: '((FAMIX.Class (name ''ClassA'')))' readStream.
	self assert: mooseModel entities notEmpty.
	self assert: (mooseModel allClasses collect: #name) first equals: 'ClassA'
]

{ #category : #tests }
MooseMSEImporterTest >> testOneClassAndOnePackage [
	| mooseModel |
	mooseModel := self
		readMSEStream:
			'(
	(FAMIX.Class (id: 2) (name ''ClassA'') (parentPackage (ref: 201)))
	(FAMIX.Package (id: 201) (name ''aPackage''))	
)' readStream.
	self assert: mooseModel entities notEmpty.
	self assert: (mooseModel allPackages collect: #name) first equals: 'aPackage'.
	self assert: (mooseModel allClasses collect: #name) first equals: 'ClassA'
]

{ #category : #tests }
MooseMSEImporterTest >> testOnePackage [
	| mooseModel |
	mooseModel := self readMSEStream: ('((FAMIX.Package (name ''PackageA'')))' readStream).
	
	self assert: (mooseModel entities notEmpty).
	self assert: ((mooseModel allPackages collect: #name) includes: 'PackageA').
]

{ #category : #tests }
MooseMSEImporterTest >> testOnePrimitiveType [
	| mooseModel |
	mooseModel := self readMSEStream: '((FAMIX.PrimitiveType (name ''int'')))' readStream.
	self assert: mooseModel entities notEmpty.
	self assert: (mooseModel allPrimitiveTypes collect: #name) first equals: 'int'
]

{ #category : #tests }
MooseMSEImporterTest >> testOnePrimitiveTypeAndMethod [
	| mooseModel |
	mooseModel := self
		readMSEStream:
			'(
(FAMIX.PrimitiveType (id: 1) (name ''int''))
(FAMIX.Class (id: 2) (name ''ClassA''))
(FAMIX.Method (id: 3) (name ''methodA'') (declaredType (ref: 1)) (parentType (ref: 2)))
)' readStream.
	self assert: (mooseModel allPrimitiveTypes collect: #name) first equals: 'int'.
	self assert: mooseModel allMethods first declaredType equals: mooseModel allPrimitiveTypes first
]

{ #category : #tests }
MooseMSEImporterTest >> testPropertyWithNoSetter [
	| mooseModel |
	mooseModel := self readMSEStream: '((FAMIX.Class (name ''ClassA'') (numberOfLinesOfCode 42)))' readStream.
	self assert: mooseModel allClasses first name equals: 'ClassA'.
	self assert: mooseModel allClasses first numberOfLinesOfCode equals: 42
]

{ #category : #tests }
MooseMSEImporterTest >> testSimple [
	| mooseSample mooseModel classA |
	mooseSample := MooseSampleData new.
	mooseModel := self readMSEStream: mooseSample modelVersion1 readStream.
	self assert: mooseModel entities notEmpty.
	self assert: (mooseModel allClasses collect: #name) asSortedCollection asArray equals: {'ClassA' . 'ClassB'}.
	self assert: (mooseModel allPackages collect: #name) asArray equals: {'aPackage' . 'aPackage'}.
	classA := mooseModel entityNamed: #aNamespace::ClassA.
	self assert: classA notNil.
	self assert: classA container == (mooseModel entityNamed: #aNamespace).
	self assert: classA methods size equals: 1.	"====="
	self shouldnt: [ self readMSEStream: mooseSample modelVersion2 readStream ] raise: Error.
	self shouldnt: [ self readMSEStream: mooseSample modelVersion3 readStream ] raise: Error.
	self shouldnt: [ self readMSEStream: mooseSample modelVersion4 readStream ] raise: Error.
	self shouldnt: [ self readMSEStream: mooseSample modelVersion5 readStream ] raise: Error
]

{ #category : #tests }
MooseMSEImporterTest >> testUndeclaredProperty [
	| mooseModel |
	mooseModel := self readMSEStream: '((FAMIX.Class (name ''ClassA'') (Undeclared 42) ))' readStream.
	self assert: mooseModel allClasses first name equals: 'ClassA'.
	self assert: (mooseModel allClasses first propertyNamed: #Undeclared) notNil.
	self assert: (mooseModel allClasses first propertyNamed: #Undeclared) equals: 42
]
