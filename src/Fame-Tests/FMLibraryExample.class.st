Class {
	#name : #FMLibraryExample,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMLibraryExample >> testAddingM2ElementToM2RepositoryMustFail [
	| metamodel lib |
	metamodel := LIBRoot libraryMetaModel.
	lib := LIBRoot library.
	self should: [ metamodel add: lib ] raise: Error.
	self should: [ metamodel add: lib librarian ] raise: Error.
	self should: [ metamodel add: lib books anyOne ] raise: Error
]

{ #category : #tests }
FMLibraryExample >> testBookstore [
	| metamodel names |
	metamodel := FMMetaModel fromString: FMMSEParserTest sampleMetaMse.
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
	self assert: (metamodel elements detect: [ :each | each fullName = 'LIB.Person.name' ]) type equals: (FMMetaMetaModel default elementNamed: 'String').
	self assert: names size equals: 10
]

{ #category : #tests }
FMLibraryExample >> testBookstore2 [
	| package class attribute objectMetaDescription metamodel |
	metamodel := FMMetaModel fromString: FMMSEParserTest sampleMetaMse.
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

{ #category : #tests }
FMLibraryExample >> testLibrary [
	self assert: LIBRoot library books size equals: 3
]

{ #category : #tests }
FMLibraryExample >> testLibraryModel [
	self assert: LIBRoot libraryModel elements size equals: 10	 "1 + 1 + 3 + 5 library librarian books authors"
]

{ #category : #tests }
FMLibraryExample >> testMetaMetamodelIsaM3Repository [
	| metamodel |
	metamodel := LIBRoot libraryMetaModel.
	self deny: metamodel metamodel equals: metamodel.
	self assert: metamodel metaMetaModel equals: metamodel metamodel
]

{ #category : #tests }
FMLibraryExample >> testMetamodelSmalltalkBinding [
	| metamodel b p lib |
	metamodel := LIBRoot libraryMetaModel.
	self assert: (metamodel elements anyOne isKindOf: FM3Element).
	self assert: metamodel packages anyOne isFM3Package.
	self assert: metamodel classes anyOne isFM3Class.
	self assert: metamodel properties anyOne isFM3Property.
	b := metamodel elementNamed: 'LIB.Book'.
	self assert: b notNil.
	self assert: b isFM3Class.
	self assert: b name equals: #Book.
	self assert: b package name equals: #LIB.
	self assert: b properties size equals: 2.
	self assert: b implementingClass equals: LIBBook.
	p := metamodel elementNamed: 'LIB.Person'.
	self assert: p notNil.
	self assert: p isFM3Class.
	self assert: p name equals: #Person.
	self assert: p package name equals: #LIB.
	self assert: p properties size equals: 2.
	self assert: p implementingClass equals: LIBPerson.
	lib := metamodel elementNamed: 'LIB.Library'.
	self assert: lib notNil.
	self assert: lib isFM3Class.
	self assert: lib name equals: #Library.
	self assert: lib package name equals: #LIB.
	self assert: lib properties size equals: 2.
	self assert: lib implementingClass equals: LIBLibrary.
	self assert: b package equals: lib package.
	self assert: p package equals: lib package.
	^ metamodel
]

{ #category : #tests }
FMLibraryExample >> testPragmaProcessing [
	| pragmaProcessor |
	pragmaProcessor := FMMetaModelBuilder new
		queue: {LIBBook . LIBLibrary . LIBPerson};
		run.
	self denyEmpty: pragmaProcessor elements.
	self denyEmpty: pragmaProcessor packages.
	self assert: pragmaProcessor packages size equals: 1.
	self assert: pragmaProcessor packages anyOne name equals: #LIB.
	self denyEmpty: pragmaProcessor classes.
	self assert: pragmaProcessor classes size equals: 3.
	self denyEmpty: pragmaProcessor properties
]

{ #category : #tests }
FMLibraryExample >> testPragmasAsMetamodel [
	| metamodel |
	metamodel := LIBRoot libraryMetaModel.
	self assert: metamodel class equals: FMMetaModel.
	self denyEmpty: metamodel elements.
	self denyEmpty: metamodel packages.
	self assert: metamodel packages size equals: 1.
	self assert: metamodel packages anyOne name equals: #LIB.
	self denyEmpty: metamodel classes.
	self assert: metamodel classes size equals: 3.
	self assert: (metamodel elementNamed: 'LIB.Book.authors') hasOpposite.
	self assert: (metamodel elementNamed: 'LIB.Book.authors') opposite equals: (metamodel elementNamed: 'LIB.Person.books')
]

{ #category : #tests }
FMLibraryExample >> testPrintMetamodel [
	self
		assert:
			(LIBRoot libraryMetaModel exportString
				beginsWith:
					'(
	(FM3.Package (id: 1)
		(name ''LIB'')')
]

{ #category : #tests }
FMLibraryExample >> testPrintModel [
	self
		assert:
			(LIBRoot libraryModel exportString
				beginsWith:
					'(
	(LIB.')
]
