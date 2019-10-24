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
	| importer model |
	importer := (FMImporter model: (FMModel withMetamodel: FamixTest3Model metamodel))
		fromString: self oneClassAndOneMethod;
		run.
	self assert: importer model elements size equals: 2.
	model := FamixTest3Model new.
	model addAll: importer model elements.
	self assert: model allClasses size equals: 1.
	self assert: model allMethods size equals: 1
]

{ #category : #tests }
FamixTest >> testRobustMSEImport [
	| importer model |
	importer := (FMImporter model: (FMModel withMetamodel: FamixTest3Model metamodel))
		fromString: self classWithUnknownAttribute;
		run.

	self assert: importer model elements size equals: 4.
	model := FamixTest3Model new.
	model addAll: importer model elements.
	self assert: model allClasses size equals: 2.
	self assert: model allMethods size equals: 1.
	self assert: model allReferences size equals: 1
]

{ #category : #tests }
FamixTest >> testSlot [
	| fClass fMethod |
	fClass := FamixTest3Class new.
	fMethod := FamixTest3Method new.
	fMethod parentType: fClass.
	self assert: (fClass methods at: 1) equals: fMethod
]

{ #category : #tests }
FamixTest >> testSourcesAnchorsAreNotDuplicatedAfterExport [
	| model tempFile importedModel |
	model := FamixTest3Model new name: 'Perdu'.
	FamixTest3Class new
		name: 'Class';
		sourceAnchor:
			(FamixTest3SourceTextAnchor new
				source: 'some text';
				mooseModel: model;
				yourself);
		mooseModel: model.
	tempFile := (FileSystem memory / 'export-test.mse') ensureCreateFile.
	tempFile writeStreamDo: [ :s | model exportToMSEStream: s ].
	importedModel := FamixTest3Model new importFromMSEStream: tempFile readStream.
	self assert: importedModel size equals: model size.
	self assert: importedModel allClasses anyOne sourceAnchor notNil
]
