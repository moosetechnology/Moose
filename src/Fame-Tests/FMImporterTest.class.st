Class {
	#name : #FMImporterTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #running }
FMImporterTest class >> simpleCompositeMetamodel [

	^'((FM3.Package (name ''EG'') (classes
			(FM3.Class (id: 1) (name ''Container'') (properties (FM3.Property (id: 11) (name ''children'') (type (ref: 2)) (opposite (ref: 22)))))
			(FM3.Class (id: 2) (name ''Leaf'') (properties (FM3.Property (id:22) (name ''parent'') (type (ref: 1)) (opposite (ref: 11))))))))'.
]

{ #category : #running }
FMImporterTest class >> simpleCompositeMetamodelExtension [

	^'((FM3.Package (name ''MORE'') (extensions
			(FM3.Property (name ''name'') (type (ref: String)) (class (ref: EG.Leaf))))))'
]

{ #category : #running }
FMImporterTest >> testElementNamed [
	| metamodel |
	metamodel := FMMetaModel fromString: FMHeinekenExample metamodelMSE.
	self shouldnt: [ metamodel elementNamed: 'HNK.Beer' ] raise: Error.
	self assert: (metamodel elementNamed: 'HNK.Beer') isFM3Class.
	self assert: (metamodel elementNamed: 'HNK.Beer') fullName equals: 'HNK.Beer'
]

{ #category : #running }
FMImporterTest >> testImportBook [
	| importer builder |
	importer := FMImporter model: FMMetaModel new.
	builder := FMModelBuilder client: importer.
	builder document: [ builder new: 'FM3.Class' with: [ builder a: #name of: 'Book' ] ].

	self assert: importer model elements size equals: 1.
	self assert: importer model elements anyOne name equals: #Book
]

{ #category : #running }
FMImporterTest >> testImportHeinekenMetamodel [
	| metamodel |
	metamodel := FMMetaModel fromString: FMHeinekenExample metamodelMSE.
	self assert: metamodel packages size equals: 1.
	self assert: metamodel classes size equals: 3.
	self assert: metamodel properties size equals: 12
]

{ #category : #running }
FMImporterTest >> testImportHeinekenModel [
	| model |
	model := FMModel new.
	model metamodel importString: FMHeinekenExample metamodelMSE.
	model importString: FMHeinekenExample modelMSE.
	self assert: model elements size equals: 4
]

{ #category : #running }
FMImporterTest >> testOrderOfElements [
	| model metamodel containers |
	model := FMModel new.
	metamodel := model metamodel.
	metamodel importString: self class simpleCompositeMetamodel.
	metamodel importString: self class simpleCompositeMetamodelExtension.
	model
		importString:
			'((EG.Container (children (ref: 1) (ref: 4) (ref: 2) (ref: 3)))
		(EG.Leaf (id: 1) (name ''A'')) (EG.Leaf (id: 2) (name ''B'')) (EG.Leaf (id: 3) (name ''C'')) (EG.Leaf (id: 4) (name ''D'')))'.
	self assert: model elements size equals: 5.
	containers := model elements select: [ :element | (metamodel metaDescriptionOf: element) = (metamodel elementNamed: 'EG.Container') ].
	self assert: containers size equals: 1.
	self assert: (model elements select: [ :element | (metamodel metaDescriptionOf: element) = (metamodel elementNamed: 'EG.Leaf') ]) size equals: 4.
	self assert: (containers anyOne at: (metamodel elementNamed: 'EG.Container.children')) size equals: 4
]

{ #category : #running }
FMImporterTest >> testResolving [
	| importer builder |
	importer := FMImporter model: FMMetaModel new.
	builder := FMModelBuilder client: importer.
	builder document: [ builder new: 'FM3.Class' with: [ builder a: #name of: 'MyName' ] ].
	self assert: importer model elements size equals: 1.
	self assert: importer model elements anyOne isFM3Class
]

{ #category : #running }
FMImporterTest >> testResolvingId [
	| importer builder |
	importer := FMImporter model: FMMetaModel new.
	builder := FMModelBuilder client: importer.
	builder
		document: [ builder
				new: 'FM3.Class'
				with: [ builder id: 3.
					builder a: #name of: 'MyName'.
					builder a: #superclass of: [ builder ref: 2 ] ].
			builder
				new: 'FM3.Class'
				with: [ builder id: 2.
					builder a: #name of: 'MyName2' ] ].
	self assert: importer model elements size equals: 2
]

{ #category : #running }
FMImporterTest >> testResolvingMultiArgs [
	| importer pack ref2 ref4 ref5 model |
	importer := (FMImporter model: FMMetaModel new)
		beginDocument;
		beginElement: 'FM3.Package';
		serial: 3;
		beginAttribute: 'name';
		primitive: 'MyPackage';
		endAttribute: 'name';
		beginAttribute: 'classes';
		referenceNumber: 2;
		referenceNumber: 4;
		referenceNumber: 2;
		referenceNumber: 5;
		endAttribute: 'classes';
		endElement: 'FM3.Package';
		beginElement: 'FM3.Class';
		serial: 2;
		beginAttribute: 'name';
		primitive: 'MyName2';
		endAttribute: 'name';
		beginAttribute: 'superclass';
		referenceNumber: 5;
		endAttribute: 'superclass';
		endElement: 'FM3.Class';
		beginElement: 'FM3.Class';
		serial: 4;
		beginAttribute: 'superclass';
		referenceNumber: 2;
		endAttribute: 'superclass';
		beginAttribute: 'name';
		primitive: 'MyName4';
		endAttribute: 'name';
		endElement: 'FM3.Class';
		beginElement: 'FM3.Class';
		serial: 5;
		beginAttribute: 'name';
		primitive: 'MyName5';
		endAttribute: 'name';
		endElement: 'FM3.Class';
		endDocument;
		yourself.
	model := importer model.
	self assert: model elements size equals: 4.
	pack := model packageNamed: 'MyPackage'.
	ref2 := pack classNamed: 'MyName2'.
	ref4 := pack classNamed: 'MyName4'.
	ref5 := pack classNamed: 'MyName5'.
	self assert: pack notNil.
	self assert: ref2 notNil.
	self assert: ref4 notNil.
	self assert: ref5 notNil.
	self assert: (pack classes includes: ref2).
	self assert: (pack classes includes: ref4).
	self assert: (pack classes includes: ref5)
]

{ #category : #running }
FMImporterTest >> testSimpleExtensions [
	| metamodel |
	metamodel := FMMetaModel fromString: self class simpleCompositeMetamodel.
	metamodel importString: self class simpleCompositeMetamodelExtension.
	self assert: metamodel packages size equals: 2.
	self assert: metamodel classes size equals: 2.
	self assert: metamodel properties size equals: 3.
	self assert: (metamodel elementNamed: 'EG.Leaf.name') package equals: (metamodel elementNamed: 'MORE')
]

{ #category : #running }
FMImporterTest >> testSimpleMetamodel [
	| metamodel |
	metamodel := FMMetaModel fromString: self class simpleCompositeMetamodel.
	self assert: metamodel packages size equals: 1.
	self assert: metamodel classes size equals: 2.
	self assert: metamodel properties size equals: 2.
	self assert: (metamodel elementNamed: 'EG.Container.children') hasOpposite.
	self assert: (metamodel elementNamed: 'EG.Leaf.parent') hasOpposite.
	self assert: (metamodel elementNamed: 'EG.Container.children') opposite equals: (metamodel elementNamed: 'EG.Leaf.parent')
]
