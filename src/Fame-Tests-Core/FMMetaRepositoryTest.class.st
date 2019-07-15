Class {
	#name : #FMMetaRepositoryTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMMetaRepositoryTest >> testElementNamed [
	| tower m2 |
	tower := FMTower new.
	m2 := tower metamodel.
	m2 importString: '((FM3.Package (name ''EG'') (classes (FM3.Class (name ''Boe'')))))'.
	(m2 elementNamed: 'EG') notNil should beTrue.
	(m2 elementNamed: 'EG.Boe') notNil should beTrue
]

{ #category : #running }
FMMetaRepositoryTest >> testFM3 [
	| fm3 |
	fm3 := FMMetaRepository fm3.
	fm3 notNil should beTrue.
	fm3 metamodel should = fm3
]

{ #category : #running }
FMMetaRepositoryTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| repo names |
	repo := FMMetaRepository fm3.
	repo notNil should beTrue.	"boot strapping FM3 does internally run the pragma processor"
	names := repo elements collect: [ :each | each fullName ].	"The package"
	names should include: 'FM3'.
	(repo elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite should =
			(repo elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).	
	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
	names should include: 'FM3.Element'.
	names should include: 'FM3.Element.name'.
	names should include: 'FM3.Element.fullName'.
	names should include: 'FM3.Element.owner'.
	names should include: 'FM3.Class'.
	names should include: 'FM3.Class.abstract'.
	names should include: 'FM3.Class.primitive'.
	names should include: 'FM3.Class.root'.
	names should include: 'FM3.Class.superclass'.
	names should include: 'FM3.Class.subclasses'.
	names should include: 'FM3.Class.package'.
	names should include: 'FM3.Class.allAttributes'.
	names should include: 'FM3.Class.attributes'.
	names should include: 'FM3.Property'.
	names should include: 'FM3.Property.composite'.
	names should include: 'FM3.Property.container'.
	names should include: 'FM3.Property.derived'.
	names should include: 'FM3.Property.multivalued'.
	names should include: 'FM3.Property.class'.
	names should include: 'FM3.Property.package'.
	names should include: 'FM3.Property.type'.
	names should include: 'FM3.Property.opposite'.
	names should include: 'FM3.Package'.
	names should include: 'FM3.Package.extensions'.
	names should include: 'FM3.Package.classes'.
	names size should = 26.
	(names select: [ :n | n beginsWith: 'FM3.' ]) size should = 25
]

{ #category : #running }
FMMetaRepositoryTest >> testImportExtension [
	| string repo imp |
	repo := self testImporter.
	string := '((FM3.Class (name ''Employee'') (package (ref: Office))))'.
	imp := FMImporter new.
	imp repository: repo.
	imp fromString: string.
	imp run.
	repo elements size should = 2.
	(repo elementNamed: 'Office.Employee') package should = (repo elementNamed: 'Office').
	^ repo
]

{ #category : #running }
FMMetaRepositoryTest >> testImporter [
	| string repo imp |
	string := '((FM3.Package (id: 1) (name ''Office'')))'.
	repo := FMMetaRepository with: FMMetaRepository fm3.
	imp := FMImporter new.
	imp repository: repo.
	imp fromString: string.
	imp run.
	repo elements size should = 1.
	repo elements anyOne name should = #Office.
	repo elements anyOne fullName should = 'Office'.
	^ repo
]

{ #category : #running }
FMMetaRepositoryTest >> testReadEmptyProperties [
	| tower m2 package |
	tower := FMTower new.
	m2 := tower metamodel.
	m2 importString: '((FM3.Package))'.
	package := m2 elements anyOne.
	(m2 get: 'name' element: package) isEmpty should beTrue.
	(m2 get: 'classes' element: package) isEmpty should beTrue.
	^ m2
]

{ #category : #running }
FMMetaRepositoryTest >> testWriteProperties [
	| m2 package |
	m2 := self testReadEmptyProperties.
	package := m2 elements anyOne.
	m2 
		set: 'name'
		element: package
		values: (Array with: 'Eg').
	(m2 
		get: 'name'
		element: package) size should = 1
]
