Class {
	#name : #FMMetaModelTest,
	#superclass : #FMModelTest,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMMetaModelTest >> actualClass [
	^ FMMetaModel
]

{ #category : #tests }
FMMetaModelTest >> importedMetaModelWithEmptyPackage [
	^ FMMetaModel fromString: '((FM3.Package))'
]

{ #category : #helpers }
FMMetaModelTest >> importedOfficeMetamodel [
	^ FMMetaModel fromString: '((FM3.Package (id: 1) (name ''Office'')))'
]

{ #category : #tests }
FMMetaModelTest >> testDescriptionOf [
	| metamodel bookClass |
	metamodel := LIBRoot libraryMetaModel.
	bookClass := (metamodel packageNamed: 'LIB') classNamed: 'Book'.
	self assert: (metamodel descriptionOf: LIBBook) identicalTo: bookClass.
	self should: [ metamodel descriptionOf: FMMetaMetaModelTest ] raise: NotFound
]

{ #category : #tests }
FMMetaModelTest >> testDescriptionOfIfAbsent [
	| metamodel |
	metamodel := LIBRoot libraryMetaModel.
	self assert: (metamodel descriptionOf: LIBBook ifAbsent: [ nil ]) isNotNil.
	self assert: (metamodel descriptionOf: FMMetaMetaModelTest ifAbsent: [ nil ]) isNil
]

{ #category : #tests }
FMMetaModelTest >> testDescriptionOfIfPresentIfAbsent [
	| metamodel |
	metamodel := LIBRoot libraryMetaModel.
	self assert: (metamodel descriptionOf: LIBBook ifPresent: [ true ] ifAbsent: [ false ]).
	self deny: (metamodel descriptionOf: FMMetaMetaModelTest ifPresent: [ true ] ifAbsent: [ false ])
]

{ #category : #tests }
FMMetaModelTest >> testElementNamed [
	| metamodel |
	metamodel := FMMetaModel fromString: '((FM3.Package (name ''EG'') (classes (FM3.Class (name ''Boe'')))))'.
	self assert: (metamodel elementNamed: 'EG') notNil.
	self assert: (metamodel elementNamed: 'EG.Boe') notNil
]

{ #category : #tests }
FMMetaModelTest >> testImportExtension [
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
FMMetaModelTest >> testImporter [
	| metaModel |
	metaModel := self importedOfficeMetamodel.
	self assert: metaModel elements size equals: 1.
	self assert: metaModel elements anyOne name equals: #Office.
	self assert: metaModel elements anyOne fullName equals: 'Office'
]

{ #category : #tests }
FMMetaModelTest >> testReadEmptyProperties [
	| metamodel package |
	metamodel := self importedMetaModelWithEmptyPackage.
	package := metamodel elements anyOne.
	self assertEmpty: (metamodel get: 'name' element: package).
	self assertEmpty: (metamodel get: 'classes' element: package)
]

{ #category : #tests }
FMMetaModelTest >> testWriteProperties [
	| metamodel package |
	metamodel := self importedMetaModelWithEmptyPackage.
	package := metamodel elements anyOne.
	metamodel set: 'name' element: package values: (Array with: 'Eg').
	self assert: (metamodel get: 'name' element: package) size equals: 1
]
