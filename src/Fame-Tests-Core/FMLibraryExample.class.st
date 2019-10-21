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
	self should: [ mm add: lib ] raise: Error.
	self should: [ mm add: lib librarian ] raise: Error.
	self should: [ mm add: lib books anyOne ] raise: Error
]

{ #category : #running }
FMLibraryExample >> testBookstore [
	| tower names |
	tower := FMTower new.
	tower metamodel importString: FMMSEParserTest sampleMetaMse.
	names := tower metamodel elements collect: [ :each | each fullName ].
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Person.name').
	self assert: (names includes: 'LIB.Book').
	self assert: (names includes: 'LIB.Book.authors').
	self assert: (names includes: 'LIB.Library').
	self assert: (names includes: 'LIB.Library.librarian').
	self assert: (names includes: 'LIB.Library.books').
	self
		assert: (tower metamodel elements detect: [ :each | each fullName = 'LIB.Library.books' ]) type
		equals: (tower metamodel elements detect: [ :each | each fullName = 'LIB.Book' ]).
	self assert: (tower metamodel elements detect: [ :each | each fullName = 'LIB.Person.name' ]) type equals: (FMMetaMetaRepository new elementNamed: 'String').
	self assert: names size equals: 10
]

{ #category : #running }
FMLibraryExample >> testBookstore2 [
	| repo package class attribute objectMetaDescription tower |
	tower := FMTower new.
	repo := tower metamodel.
	tower metamodel importString: FMMSEParserTest sampleMetaMse.
	package := repo packageNamed: 'LIB'.
	self assert: package isFM3Package.
	class := package classNamed: 'Book'.
	self assert: class isFM3Class.	"The superclass of Book should be Object"
	objectMetaDescription := class superclass.
	self assert: objectMetaDescription notNil.
	self assert: objectMetaDescription name equals: #Object.
	attribute := class propertyNamed: 'authors'.
	self assert: attribute isFM3Property.
	self assert: attribute name equals: #authors.
	self assert: attribute isMultivalued equals: true.
	self assert: attribute isContainer equals: false.
	self assert: attribute isDerived equals: false.	"self assert: (attribute package == package)."
	self flag: 'Maybe we should rename package to extensionPackage, and make package be derived from [ package or class package ].'.
	self assert: attribute mmClass equals: class.
	self assert: attribute type equals: (package classNamed: 'Person').
	self assert: attribute opposite notNil
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
		books:
			(Array
				with:
					(LIBBook new
						title: 'Design Patterns';
						authors:
							(Array
								with: a1
								with: a2
								with: a3
								with: a4))
				with:
					(LIBBook new
						title: 'Eclipse: Principles, Patterns, and Plug-Ins';
						authors: (Array with: a1 with: a5))
				with:
					(LIBBook new
						title: 'Smalltalk Best Practice Patterns';
						authors: (Array with: a5))).
	self assert: lib books size equals: 3.
	^ lib
]

{ #category : #examples }
FMLibraryExample >> testMetaMetamodelIsaM3Repository [
	| mm |
	mm := self testPragmasAsMetamodel.
	self deny: mm metamodel equals: mm.
	self assert: mm metamodel metamodel equals: mm metamodel
]

{ #category : #examples }
FMLibraryExample >> testMetamodelSmalltalkBinding [
	| mm b p lib |
	mm := self testPragmasAsMetamodel.
	self assert: (mm elements anyOne isKindOf: FM3Element).
	self assert: mm packages anyOne isFM3Package.
	self assert: mm classes anyOne isFM3Class.
	self assert: mm properties anyOne isFM3Property.
	b := mm elementNamed: 'LIB.Book'.
	self assert: b notNil.
	self assert: b isFM3Class.
	self assert: b name equals: #Book.
	self assert: b package name equals: #LIB.
	self assert: b properties size equals: 2.
	self assert: b implementingClass equals: LIBBook.
	p := mm elementNamed: 'LIB.Person'.
	self assert: p notNil.
	self assert: p isFM3Class.
	self assert: p name equals: #Person.
	self assert: p package name equals: #LIB.
	self assert: p properties size equals: 2.
	self assert: p implementingClass equals: LIBPerson.
	lib := mm elementNamed: 'LIB.Library'.
	self assert: lib notNil.
	self assert: lib isFM3Class.
	self assert: lib name equals: #Library.
	self assert: lib package name equals: #LIB.
	self assert: lib properties size equals: 2.
	self assert: lib implementingClass equals: LIBLibrary.
	self assert: b package equals: lib package.
	self assert: p package equals: lib package.
	^ mm
]

{ #category : #examples }
FMLibraryExample >> testPragmaProcessing [
	| pp |
	pp := FMPragmaProcessor new
		queue: {LIBBook . LIBLibrary . LIBPerson};
		run.
	self denyEmpty: pp elements.
	self denyEmpty: pp packages.
	self assert: pp packages size equals: 1.
	self assert: pp packages anyOne name equals: #LIB.
	self denyEmpty: pp classes.
	self assert: pp classes size equals: 3.
	self denyEmpty: pp properties.
	^ pp
]

{ #category : #examples }
FMLibraryExample >> testPragmasAsMetamodel [
	| mm |
	mm := self testPragmaProcessing asMetamodel.
	self assert: mm class equals: FMMetaRepository.
	self denyEmpty: mm elements.
	self denyEmpty: mm packages.
	self assert: mm packages size equals: 1.
	self assert: mm packages anyOne name equals: #LIB.
	self denyEmpty: mm classes.
	self assert: mm classes size equals: 3.
	self assert: (mm elementNamed: 'LIB.Book.authors') hasOpposite.
	self assert: (mm elementNamed: 'LIB.Book.authors') opposite equals: (mm elementNamed: 'LIB.Person.books').
	^ mm
]

{ #category : #examples }
FMLibraryExample >> testPragmasAsTower [
	| tower |
	tower := self testPragmaProcessing asTower.
	self assert: tower metaMetamodel metamodel equals: tower metaMetamodel.
	self assert: tower metamodel metamodel equals: tower metaMetamodel.
	self assert: tower model metamodel equals: tower metamodel.
	self denyEmpty: tower metaMetamodel elements.
	self denyEmpty: tower metamodel elements.
	self assertEmpty: tower model elements.	"must be empty"
	self assert: tower metaMetamodel packages size equals: 1.
	self assert: tower metaMetamodel packages anyOne name equals: #FM3.
	self assert: tower metamodel packages size equals: 1.
	self assert: tower metamodel packages anyOne name equals: #LIB.
	^ tower
]

{ #category : #examples }
FMLibraryExample >> testPrintMetamodel [
	| mm string |
	mm := self testPragmasAsMetamodel.
	string := mm exportString.
	self
		assert:
			(string
				beginsWith:
					'(
	(FM3.Package (id: 1)
		(name ''LIB'')')
]

{ #category : #examples }
FMLibraryExample >> testPrintModel [
	| m string |
	m := self testSCGLibraryAsModel.
	string := m exportString.
	self
		assert:
			(string
				beginsWith:
					'(
	(LIB.Library (id:')
]

{ #category : #examples }
FMLibraryExample >> testSCGLibraryAsModel [
	| m mm lib |
	mm := self testPragmasAsMetamodel.
	lib := self testCreateSCGLibrary.
	m := FMRepository with: mm.
	m add: lib.
	self assert: m metamodel equals: mm.
	self assert: m elements notEmpty.	"----------------- KNOWN TO FAIL ----------------
	should implement a #complete method
	self assert: (m elements size = --------------"
	1 + 1 + 3 + 5.	"library"	"librarian"	"books"	"authors"
	^ m
]
