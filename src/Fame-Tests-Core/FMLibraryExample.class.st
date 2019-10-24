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
	| metamodel names |
	metamodel := FMMetaRepository new.
	metamodel importString: FMMSEParserTest sampleMetaMse.
	names := metamodel elements collect: [ :each | each fullName ].
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Person.name').
	self assert: (names includes: 'LIB.Book').
	self assert: (names includes: 'LIB.Book.authors').
	self assert: (names includes: 'LIB.Library').
	self assert: (names includes: 'LIB.Library.librarian').
	self assert: (names includes: 'LIB.Library.books').
	self
		assert: (metamodel elements detect: [ :each | each fullName = 'LIB.Library.books' ]) type
		equals: (metamodel elements detect: [ :each | each fullName = 'LIB.Book' ]).
	self assert: (metamodel elements detect: [ :each | each fullName = 'LIB.Person.name' ]) type equals: (FMMetaMetaRepository new elementNamed: 'String').
	self assert: names size equals: 10
]

{ #category : #running }
FMLibraryExample >> testBookstore2 [
	| package class attribute objectMetaDescription metamodel |
	metamodel := FMMetaRepository new.
	metamodel importString: FMMSEParserTest sampleMetaMse.
	package := metamodel packageNamed: 'LIB'.
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
	a1 := LIBPerson named: 'Erich Gamma'.
	a2 := LIBPerson named: 'Richard Helm'.
	a3 := LIBPerson named: 'Ralph Johnson'.
	a4 := LIBPerson named: 'John Vlissides'.
	a5 := LIBPerson named: 'Kent Beck'.
	lib := LIBLibrary new
		librarian: (LIBPerson named: 'Adrian Kuhn');
		books:
			{(LIBBook new
				title: 'Design Patterns';
				authors: {a1 . a2 . a3 . a4}) . (LIBBook new
				title: 'Eclipse: Principles, Patterns, and Plug-Ins';
				authors: {a1 . a5}) . (LIBBook new
				title: 'Smalltalk Best Practice Patterns';
				authors: {a5})}.
	self assert: lib books size equals: 3.
	^ lib
]

{ #category : #examples }
FMLibraryExample >> testMetaMetamodelIsaM3Repository [
	| mm |
	mm := self testPragmasAsMetamodel.
	self deny: mm metamodel equals: mm.
	self assert: mm metaMetaModel equals: mm metamodel
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
	| metamodel |
	metamodel := self testPragmaProcessing asMetamodel.
	self assert: metamodel class equals: FMMetaRepository.
	self denyEmpty: metamodel elements.
	self denyEmpty: metamodel packages.
	self assert: metamodel packages size equals: 1.
	self assert: metamodel packages anyOne name equals: #LIB.
	self denyEmpty: metamodel classes.
	self assert: metamodel classes size equals: 3.
	self assert: (metamodel elementNamed: 'LIB.Book.authors') hasOpposite.
	self assert: (metamodel elementNamed: 'LIB.Book.authors') opposite equals: (metamodel elementNamed: 'LIB.Person.books').
	^ metamodel
]

{ #category : #examples }
FMLibraryExample >> testPrintMetamodel [
	| metamodel string |
	metamodel := self testPragmasAsMetamodel.
	string := metamodel exportString.
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
	| model string |
	model := self testSCGLibraryAsModel.
	string := model exportString.
	self
		assert:
			(string
				beginsWith:
					'(
	(LIB.Library (id:')
]

{ #category : #examples }
FMLibraryExample >> testSCGLibraryAsModel [
	| model metamodel lib |
	metamodel := self testPragmasAsMetamodel.
	lib := self testCreateSCGLibrary.
	model := FMRepository with: metamodel.
	model add: lib.
	self assert: model metamodel equals: metamodel.
	self denyEmpty: model elements.	"----------------- KNOWN TO FAIL ----------------
	should implement a #complete method
	self assert: (m elements size = --------------"
	1 + 1 + 3 + 5.	"library"	"librarian"	"books"	"authors"
	^ model
]
