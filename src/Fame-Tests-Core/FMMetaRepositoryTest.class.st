Class {
	#name : #FMMetaRepositoryTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMMetaRepositoryTest >> testElementNamed [
	| metamodel |
	metamodel := FMMetaModel new.
	metamodel importString: '((FM3.Package (name ''EG'') (classes (FM3.Class (name ''Boe'')))))'.
	self assert: (metamodel elementNamed: 'EG') notNil.
	self assert: (metamodel elementNamed: 'EG.Boe') notNil
]

{ #category : #running }
FMMetaRepositoryTest >> testImportExtension [
	| string repo |
	repo := self testImporter.
	string := '((FM3.Class (name ''Employee'') (package (ref: Office))))'.
	(FMImporter model: repo)
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
	repo := FMMetaModel new.
	(FMImporter model: repo)
		fromString: string;
		run.
	self assert: repo elements size equals: 1.
	self assert: repo elements anyOne name equals: #Office.
	self assert: repo elements anyOne fullName equals: 'Office'.
	^ repo
]

{ #category : #running }
FMMetaRepositoryTest >> testReadEmptyProperties [
	| metamodel package |
	metamodel := FMMetaModel new.
	metamodel importString: '((FM3.Package))'.
	package := metamodel elements anyOne.
	self assertEmpty: (metamodel get: 'name' element: package).
	self assertEmpty: (metamodel get: 'classes' element: package).
	^ metamodel
]

{ #category : #running }
FMMetaRepositoryTest >> testWriteProperties [
	| m2 package |
	m2 := self testReadEmptyProperties.
	package := m2 elements anyOne.
	m2 set: 'name' element: package values: (Array with: 'Eg').
	self assert: (m2 get: 'name' element: package) size equals: 1
]
