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
FMMetaRepositoryTest >> testImportExtension [
	| string repo |
	repo := self testImporter.
	string := '((FM3.Class (name ''Employee'') (package (ref: Office))))'.
	(FMImporter repository: repo)
		fromString: string;
		run.
	self assert: repo elements size equals: 2.
	self assert: (repo elementNamed: 'Office.Employee') package equals: (repo elementNamed: 'Office').
	^ repo
]

{ #category : #running }
FMMetaRepositoryTest >> testImporter [
	| string repo |
	string := '((FM3.Package (id: 1) (name ''Office'')))'.
	repo := FMMetaRepository new.
	(FMImporter repository: repo)
		fromString: string;
		run.
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
