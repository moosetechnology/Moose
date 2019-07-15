Class {
	#name : #FMLibraryExample,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #examples }
FMLibraryExample >> testAddingM2ElementToM2RepositoryMustFail [
	| mm lib |
	mm := self testPragmasAsMetamodel.
	lib := self testCreateSCGLibrary.
	self 
		should: [ mm add: lib ]
		raise: Error.
	self 
		should: [ mm add: lib librarian ]
		raise: Error.
	self 
		should: [ mm add: lib books anyOne ]
		raise: Error
]

{ #category : #running }
FMLibraryExample >> testBookstore [
	| tower names |
	tower := FMTower new.
	tower metamodel importString: FMMSEParserTest sampleMetaMse.
	names := tower metamodel elements collect: [ :each | each fullName ].
	names should include: 'LIB'.
	names should include: 'LIB.Person'.
	names should include: 'LIB.Person.name'.
	names should include: 'LIB.Book'.
	names should include: 'LIB.Book.authors'.
	names should include: 'LIB.Library'.
	names should include: 'LIB.Library.librarian'.
	names should include: 'LIB.Library.books'.
	(tower metamodel elements detect: [ :each | each fullName = 'LIB.Library.books' ]) type should =
			(tower metamodel elements detect: [ :each | each fullName = 'LIB.Book' ]).
	(tower metamodel elements detect: [ :each | each fullName = 'LIB.Person.name' ]) type should =
			(FMMetaRepository fm3 elementNamed: 'String').
	names size should = 10
]

{ #category : #running }
FMLibraryExample >> testBookstore2 [
	| repo package class attribute objectMetaDescription tower |
	tower := FMTower new.
	repo := tower metamodel.
	tower metamodel importString: FMMSEParserTest sampleMetaMse.
	package := repo at: 'LIB'.
	package isFM3Package should beTrue.
	class := package classNamed: 'Book'.
	class isFM3Class should beTrue.	"The superclass of Book should be Object"
	objectMetaDescription := class superclass.
	objectMetaDescription notNil should beTrue.
	objectMetaDescription name should = #Object.
	attribute := class at: 'authors'.
	attribute isFM3Property should beTrue.
	attribute name should = #authors.
	attribute isMultivalued should = true.
	attribute isContainer should = false.
	attribute isDerived should = false.	"self assert: (attribute package == package)."
	FM3 note:
			'Maybe we should rename package to extensionPackage, and make package be derived from [ package or class package ].'.
	attribute mmClass should = class.
	attribute type should = (package classNamed: 'Person').
	attribute opposite notNil should beTrue
]

{ #category : #examples }
FMLibraryExample >> testCreateSCGLibrary [
	| lib a1 a2 a3 a4 a5 |
	a1 := LIBPerson new name: 'Erich Gamma'.
	a2 := LIBPerson new name: 'Richard Helm'.
	a3 := LIBPerson new name: 'Ralph Johnson'.
	a4 := LIBPerson new name: 'John Vlissides'.
	a5 := LIBPerson new name: 'Kent Beck'.
	lib := LIBLibrary new
		librarian: (LIBPerson new name: 'Adrian Kuhn');
		books: (Array 
				with: (LIBBook new
						title: 'Design Patterns';
						authors: (Array 
								with: a1
								with: a2
								with: a3
								with: a4))
				with: (LIBBook new
						title: 'Eclipse: Principles, Patterns, and Plug-Ins';
						authors: (Array 
								with: a1
								with: a5))
				with: (LIBBook new
						title: 'Smalltalk Best Practice Patterns';
						authors: (Array with: a5))).
	lib books size should = 3.
	^ lib
]

{ #category : #examples }
FMLibraryExample >> testGlobalMainTower [
	| lib ttt |
	lib := self testCreateSCGLibrary.
	ttt := lib class reset mainLibrary.	"---- has global side-effect!"
	ttt model add: lib.
	ttt metamodel elements should include: ttt model elements anyOne metaDescription
]

{ #category : #examples }
FMLibraryExample >> testMetaMetamodelIsaM3Repository [
	| mm |
	mm := self testPragmasAsMetamodel.
	mm metamodel should not = mm.
	mm metamodel metamodel should = mm metamodel
]

{ #category : #examples }
FMLibraryExample >> testMetamodelSmalltalkBinding [
	| mm b p lib |
	mm := self testPragmasAsMetamodel.
	mm elements anyOne should beKindOf: FM3Element.
	mm packages anyOne isFM3Package should beTrue.
	mm classes anyOne isFM3Class should beTrue.
	mm properties anyOne isFM3Property should beTrue.
	b := mm elementNamed: 'LIB.Book'.
	b notNil should beTrue.
	b should beKindOf: FM3MetaDescription.
	b name should = #Book.
	b package name should = #LIB.
	b attributes size should = 2.
	b implementingClass should = LIBBook.
	p := mm elementNamed: 'LIB.Person'.
	p notNil should beTrue.
	p should beKindOf: FM3MetaDescription.
	p name should = #Person.
	p package name should = #LIB.
	p attributes size should = 2.
	p implementingClass should = LIBPerson.
	lib := mm elementNamed: 'LIB.Library'.
	lib notNil should beTrue.
	lib should beKindOf: FM3MetaDescription.
	lib name should = #Library.
	lib package name should = #LIB.
	lib attributes size should = 2.
	lib implementingClass should = LIBLibrary.
	b package should = lib package.
	p package should = lib package.
	^ mm
]

{ #category : #examples }
FMLibraryExample >> testPragmaProcessing [
	| pp |
	pp := FMPragmaProcessor new.
	pp queue:
			(Array with: LIBBook
				with: LIBLibrary
				with: LIBPerson).
	pp run.
	pp elements isEmpty should beFalse.
	pp packages isEmpty should beFalse.
	pp packages size should = 1.
	pp packages anyOne name should = #LIB.
	pp classes isEmpty should beFalse.
	pp classes size should = 3.
	pp properties isEmpty should beFalse.
	^ pp
]

{ #category : #examples }
FMLibraryExample >> testPragmasAsMetamodel [
	| mm |
	mm := self testPragmaProcessing asMetamodel.
	mm class should = FMMetaRepository.
	mm elements isEmpty should beFalse.
	mm packages isEmpty should beFalse.
	mm packages size should = 1.
	mm packages anyOne name should = #LIB.
	mm classes isEmpty should beFalse.
	mm classes size should = 3.
	(mm elementNamed: 'LIB.Book.authors') hasOpposite should beTrue.
	(mm elementNamed: 'LIB.Book.authors') opposite should = (mm elementNamed: 'LIB.Person.books').
	^ mm
]

{ #category : #examples }
FMLibraryExample >> testPragmasAsTower [
	| tower |
	tower := self testPragmaProcessing asTower.
	tower metaMetamodel metamodel should = tower metaMetamodel.
	tower metamodel metamodel should = tower metaMetamodel.
	tower model metamodel should = tower metamodel.
	tower metaMetamodel elements isEmpty should beFalse.
	tower metamodel elements isEmpty should beFalse.
	tower model elements isEmpty should beTrue.	"must be empty"
	tower metaMetamodel packages size should = 1.
	tower metaMetamodel packages anyOne name should = #FM3.
	tower metamodel packages size should = 1.
	tower metamodel packages anyOne name should = #LIB.
	^ tower
]

{ #category : #examples }
FMLibraryExample >> testPrintMetamodel [
	| mm string |
	mm := self testPragmasAsMetamodel.
	string := mm exportString.
	string should beginWith: '(
	(FM3.Package (id: 1)
		(name ''LIB'')'

]

{ #category : #examples }
FMLibraryExample >> testPrintModel [
	| m string |
	m := self testSCGLibraryAsModel. 
	string := m exportString.
	string should beginWith: '(
	(LIB.Library (id:'

]

{ #category : #examples }
FMLibraryExample >> testSCGLibraryAsModel [
	| m mm lib |
	mm := self testPragmasAsMetamodel.
	lib := self testCreateSCGLibrary.
	m := FMRepository with: mm.
	m add: lib.
	m metamodel should = mm.
	m elements notEmpty should beTrue.	"----------------- KNOWN TO FAIL ----------------
	should implement a #complete method
	self assert: (m elements size = --------------"
	1 + 1 + 3 + 5.	"library"	"librarian"	"books"	"authors"
	^ m
]
