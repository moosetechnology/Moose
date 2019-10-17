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
	self assert: (m2 elementNamed: 'EG') notNil.
	self assert: (m2 elementNamed: 'EG.Boe') notNil
]

{ #category : #running }
FMMetaRepositoryTest >> testFM3 [
	| fm3 |
	fm3 := FMMetaRepository fm3.
	self assert: fm3 notNil.
	self assert: fm3 metamodel equals: fm3
]

{ #category : #running }
FMMetaRepositoryTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| repo names |
	repo := FMMetaRepository fm3.
	self assert: repo notNil.	"boot strapping FM3 does internally run the pragma processor"
	names := repo elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').
	self
		assert: (repo elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite
		equals: (repo elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).
	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
	self assert: (names includes: 'FM3.Element').
	self assert: (names includes: 'FM3.Element.name').
	self assert: (names includes: 'FM3.Element.fullName').
	self assert: (names includes: 'FM3.Element.owner').
	self assert: (names includes: 'FM3.Class').
	self assert: (names includes: 'FM3.Class.abstract').
	self assert: (names includes: 'FM3.Class.primitive').
	self assert: (names includes: 'FM3.Class.root').
	self assert: (names includes: 'FM3.Class.superclass').
	self assert: (names includes: 'FM3.Class.subclasses').
	self assert: (names includes: 'FM3.Class.traits').
	self assert: (names includes: 'FM3.Class.package').
	self assert: (names includes: 'FM3.Class.allProperties').
	self assert: (names includes: 'FM3.Class.properties').
	self assert: (names includes: 'FM3.Property').
	self assert: (names includes: 'FM3.Property.composite').
	self assert: (names includes: 'FM3.Property.container').
	self assert: (names includes: 'FM3.Property.derived').
	self assert: (names includes: 'FM3.Property.multivalued').
	self assert: (names includes: 'FM3.Property.class').
	self assert: (names includes: 'FM3.Property.package').
	self assert: (names includes: 'FM3.Property.type').
	self assert: (names includes: 'FM3.Property.opposite').
	self assert: (names includes: 'FM3.Package').
	self assert: (names includes: 'FM3.Package.extensions').
	self assert: (names includes: 'FM3.Package.classes').
	self assert: names size equals: 27.
	self assert: (names select: [ :n | n beginsWith: 'FM3.' ]) size equals: 26
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
	self assert: repo elements size equals: 2.
	self assert: (repo elementNamed: 'Office.Employee') package equals: (repo elementNamed: 'Office').
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
	self assert: repo elements size equals: 1.
	self assert: repo elements anyOne name equals: #Office.
	self assert: repo elements anyOne fullName equals: 'Office'.
	^ repo
]

{ #category : #running }
FMMetaRepositoryTest >> testReadEmptyProperties [
	| tower m2 package |
	tower := FMTower new.
	m2 := tower metamodel.
	m2 importString: '((FM3.Package))'.
	package := m2 elements anyOne.
	self assertEmpty: (m2 get: 'name' element: package).
	self assertEmpty: (m2 get: 'classes' element: package).
	^ m2
]

{ #category : #running }
FMMetaRepositoryTest >> testWriteProperties [
	| m2 package |
	m2 := self testReadEmptyProperties.
	package := m2 elements anyOne.
	m2 set: 'name' element: package values: (Array with: 'Eg').
	self assert: (m2 get: 'name' element: package) size equals: 1
]
