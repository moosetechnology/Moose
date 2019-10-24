Class {
	#name : #FMMetaRepositoryTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
FMMetaRepositoryTest >> importedMetaModelWithEmptyPackage [
	^ FMMetaModel fromString: '((FM3.Package))'
]

{ #category : #helpers }
FMMetaRepositoryTest >> importedOfficeMetamodel [
	^ FMMetaModel fromString: '((FM3.Package (id: 1) (name ''Office'')))'
]

{ #category : #tests }
FMMetaRepositoryTest >> testElementNamed [
	| metamodel |
	metamodel := FMMetaModel fromString: '((FM3.Package (name ''EG'') (classes (FM3.Class (name ''Boe'')))))'.
	self assert: (metamodel elementNamed: 'EG') notNil.
	self assert: (metamodel elementNamed: 'EG.Boe') notNil
]

{ #category : #tests }
FMMetaRepositoryTest >> testImportExtension [
	| string metamodel |
	metamodel := self importedOfficeMetamodel.
	string := '((FM3.Class (name ''Employee'') (package (ref: Office))))'.
	(FMImporter model: metamodel)
		fromString: string;
		run.
	self assert: metamodel elements size equals: 2.
	self assert: (metamodel elementNamed: 'Office.Employee') package equals: (metamodel elementNamed: 'Office').
	^ metamodel
]

{ #category : #tests }
FMMetaRepositoryTest >> testImporter [
	| metaModel |
	metaModel := self importedOfficeMetamodel.
	self assert: metaModel elements size equals: 1.
	self assert: metaModel elements anyOne name equals: #Office.
	self assert: metaModel elements anyOne fullName equals: 'Office'
]

{ #category : #tests }
FMMetaRepositoryTest >> testReadEmptyProperties [
	| metamodel package |
	metamodel := self importedMetaModelWithEmptyPackage.
	package := metamodel elements anyOne.
	self assertEmpty: (metamodel get: 'name' element: package).
	self assertEmpty: (metamodel get: 'classes' element: package)
]

{ #category : #tests }
FMMetaRepositoryTest >> testWriteProperties [
	| metamodel package |
	metamodel := self importedMetaModelWithEmptyPackage.
	package := metamodel elements anyOne.
	metamodel set: 'name' element: package values: (Array with: 'Eg').
	self assert: (metamodel get: 'name' element: package) size equals: 1
]
