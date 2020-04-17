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
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'method',
		'attribute',
		'association',
		'file',
		'fileAnchor',
		'folder',
		'indexedFileAnchor',
		'multipleFileAnchor',
		'class'
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

	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	association := builder newClassNamed: #Association.

	file := builder newClassNamed: #File.
	fileAnchor := builder newClassNamed: #FileAnchor.
	folder := builder newClassNamed: #Folder.
	indexedFileAnchor := builder newClassNamed: #IndexedFileAnchor.
	multipleFileAnchor := builder newClassNamed: #MultipleFileAnchor
]

{ #category : #definition }
FamixTest1Generator >> defineHierarchy [
	super defineHierarchy.

	association --|> #TAssociation.

	attribute --|> namedEntity.
	attribute --|> #TAttribute.

	class --|> namedEntity.
	class --|> #TClass.

	file --|> namedEntity.
	file --|> #TFile.

	fileAnchor --|> sourceAnchor.
	fileAnchor --|> #TFileNavigation.

	folder --|> namedEntity.
	folder --|> #TFolder.

	indexedFileAnchor --|> sourceAnchor.
	indexedFileAnchor --|> #TIndexedFileNavigation.

	method --|> namedEntity.
	method --|> #TMethod.

	multipleFileAnchor --|> sourceAnchor.
	multipleFileAnchor --|> #TMultipleFileAnchor.

	sourcedEntity --|> #TWithFiles
]

{ #category : #definition }
FamixTest1Generator >> newBuilder [
	^ super newBuilder
		withImportingContext;
		yourself
]
