"
""
FamixSandboxGenerator new generate.
""
| model c c2 m m2 sa1 | 

model := MooseModel new.
c := FamixSandClass named: 'Class1'.
c2 := FamixSandClass named: 'Class2'.
m := FamixSandMethod named: 'method1'.
m2 := FamixSandMethod named: 'method2'.
""sa1 := FamixSandSourceTextAnchor new source: 'method1 source' .""
sa1 := FamixSandIndexedFileAnchor new fileName: '/tmp/s/source.txt'.
sa1 startPos: 3.
sa1 endPos: 10.

model addAll: { c. c2. m. m2. sa1 }.

m parentType: c.
m2 parentType: c2.

m sourceAnchor: sa1.

model.
"
Class {
	#name : #FamixTest1Generator,
	#superclass : #FamixFileBasedLanguageGenerator,
	#instVars : [
		'classEntity',
		'method'
	],
	#category : #'Famix-TestGenerators'
}

{ #category : #accessing }
FamixTest1Generator class >> packageName [

	^ #'Famix-Test1-Entities'
]

{ #category : #accessing }
FamixTest1Generator class >> prefix [

	^ #'FamixTest1'
]

{ #category : #definition }
FamixTest1Generator >> defineClasses [

	super defineClasses.

	classEntity := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.


]

{ #category : #definition }
FamixTest1Generator >> defineHierarchy [

	super defineHierarchy.

	method --|> namedEntity.
	method --|> #TMethod.

	classEntity --|> namedEntity.
	classEntity --|> #TClass.
	classEntity --|> #TWithMethods.

	


]

{ #category : #definition }
FamixTest1Generator >> newBuilder [

	^ self builderWithStandardTraits
		withImportingContext;
		yourself
		
		
	
]
