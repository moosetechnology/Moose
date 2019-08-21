Class {
	#name : #FamixTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #tests }
FamixTest >> classWithUnknownAttribute [
	^ '
(
	(Famix-Test3-Entities.Class (id: 1)
		(name ''AClass'') 
		(unknownMetric 3)
	)
	(Famix-Test3-Entities.Class (id: 2)
		(name ''SuperClass'')
	)
	(Famix-Test3-Entities.Reference (id: 3)
		(source (ref: 4))
		(target (ref: 2))
	)
	(Famix-Test3-Entities.Method (id: 4)
		(name ''aMethod'') 
		(parentType (ref: 1))
	)
)'

	"(Famix-Test3-Entities.UnknownElement (id: 3))"
]

{ #category : #tests }
FamixTest >> oneClassAndOneMethod [
	
	^'
(
	(Famix-Test3-Entities.Class (id: 1)
		(name ''AClass'') 
	)
	(Famix-Test3-Entities.Method
		(name ''aMethod'') 
		(parentType (ref: 1))
	)
)	
	
	
	'
]

{ #category : #tests }
FamixTest >> testMSEImport [
	"self debug: #testMSEImport"

	| importer model |
	"MooseModel resetMeta."
	importer := FMImporter new.
	importer repository: FamixTest3Generator newRepository.
	importer fromString: self oneClassAndOneMethod.
	importer run.
	self assert: importer repository elements size equals: 2.
	model := FamixTest3MooseModel new.
	importer repository elements do: [ :each | model add: each ].
	self assert: model allClasses size equals: 1.
	self assert: model allMethods size equals: 1
]

{ #category : #tests }
FamixTest >> testRobustMSEImport [
	| importer model |
	"MooseModel resetMeta."
	importer := FMImporter new.
	importer repository: FamixTest3Generator newRepository.
	importer fromString: self classWithUnknownAttribute.
	importer run.

	self assert: importer repository elements size equals: 4.
	model := FamixTest3MooseModel new.
	importer repository elements do: [ :each | model add: each ].
	self assert: model allClasses size equals: 2.
	self assert: model allMethods size equals: 1.
	self assert: model allReferences size equals: 1
]

{ #category : #tests }
FamixTest >> testSlot [
	| fClass fMethod |
	fClass := FAMIXClass new.
	fMethod := FAMIXMethod new.
	fMethod parentType: fClass.
	self assert: (fClass methods at: 1) equals: fMethod
]

{ #category : #tests }
FamixTest >> testSourcesAnchorsAreNotDuplicatedAfterExport [
	| model package tempFile importedModel ws |
	model := MooseModel new name: 'Perdu'.
	package := FAMIXPackage new
		name: 'Package';
		mooseModel: model;
		yourself.
	FAMIXClass new
		name: 'Class';
		container: package;
		sourceAnchor:
			(FAMIXSourceTextAnchor new
				source: 'some text';
				mooseModel: model;
				yourself);
		mooseModel: model.
	tempFile := (FileSystem memory / 'export-test.mse') ensureCreateFile.
	ws := tempFile writeStream.
	model exportToMSEStream: ws.
	ws close; flush.
	importedModel := MooseModel new importFromMSEStream: tempFile readStream.
	self assert: importedModel size equals: model size.
	self assert: importedModel allClasses anyOne sourceAnchor notNil
]
