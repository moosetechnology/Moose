Class {
	#name : #FMImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
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
FMImporterTest >> setUp [

	super setUp.
	tower := FMTower new.
]

{ #category : #running }
FMImporterTest >> testBookMetamodel [
	| or m repo |
	or := FMImporter repository: (FMMetaRepository with: FMMetaRepository fm3).
	m := FMModelBuilder new client: or.
	m document: [ m new: 'FM3.Class' with: [ m a: #name of: 'Book' ] ].
	repo := or repository asMetarepository.
	self denyEmpty: repo elements.
	self assert: repo elements size equals: 1.
	self assert: repo elements anyOne name equals: #Book
]

{ #category : #running }
FMImporterTest >> testElementNamed [
	self testImportHeinekenMetamodel.
	self shouldnt: [ tower metamodel elementNamed: 'HNK.Beer' ] raise: Error.
	self assert: (tower metamodel elementNamed: 'HNK.Beer') isFM3Class.
	self assert: (tower metamodel elementNamed: 'HNK.Beer') fullName equals: 'HNK.Beer'
]

{ #category : #running }
FMImporterTest >> testImportHeinekenMetamodel [
	tower metamodel importString: FMHeinekenExample metamodelMSE.
	self assert: tower metamodel packages size equals: 1.
	self assert: tower metamodel classes size equals: 3.
	self assert: tower metamodel properties size equals: 12
]

{ #category : #running }
FMImporterTest >> testImportHeinekenModel [
	self testImportHeinekenMetamodel.
	tower model importString: FMHeinekenExample modelMSE.
	self assert: tower model elements size equals: 4
]

{ #category : #running }
FMImporterTest >> testOrderOfElements [
	| elem values |
	self testSimpleExtensions.
	tower model
		importString:
			'((EG.Container (children (ref: 1) (ref: 4) (ref: 2) (ref: 3)))
		(EG.Leaf (id: 1) (name ''A'')) (EG.Leaf (id: 2) (name ''B'')) (EG.Leaf (id: 3) (name ''C'')) (EG.Leaf (id: 4) (name ''D'')))'.
	self assert: tower model elements size equals: 5.
	self assert: (tower model selectKindOf: (tower metamodel elementNamed: 'EG.Container')) size equals: 1.
	self assert: (tower model selectKindOf: (tower metamodel elementNamed: 'EG.Leaf')) size equals: 4.
	elem := (tower model selectKindOf: (tower metamodel elementNamed: 'EG.Container')) anyOne.
	values := elem at: (tower metamodel elementNamed: 'EG.Container.children').
	self assert: values size equals: 4
]

{ #category : #running }
FMImporterTest >> testResolving [
	| or m |
	or := FMImporter repository: (FMMetaRepository with: FMMetaRepository fm3).
	m := FMModelBuilder new client: or.
	m document: [ m new: 'FM3.Class' with: [ m a: #name of: 'MyName' ] ].
	self denyEmpty: or repository elements.
	self assert: or repository elements size equals: 1.
	self assert: or repository elements anyOne isFM3Class
]

{ #category : #running }
FMImporterTest >> testResolvingId [
	| or m |
	or := FMImporter repository: (FMMetaRepository with: FMMetaRepository fm3).
	m := FMModelBuilder new client: or.
	m
		document: [ m
				new: 'FM3.Class'
				with: [ m id: 3.
					m a: #name of: 'MyName'.
					m a: #superclass of: [ m ref: 2 ] ].
			m
				new: 'FM3.Class'
				with: [ m id: 2.
					m a: #name of: 'MyName2' ] ].
	self denyEmpty: or repository elements.
	self assert: or repository elements size equals: 2
]

{ #category : #running }
FMImporterTest >> testResolvingMultiArgs [
	| or pack ref2 ref4 ref5 repo |
	or := FMImporter repository: (FMMetaRepository with: FMMetaRepository fm3).
	or beginDocument.
	or beginElement: 'FM3.Package'.
	or serial: 3.
	or beginAttribute: 'name'.
	or primitive: 'MyPackage'.
	or endAttribute: 'name'.
	or beginAttribute: 'classes'.
	or referenceNumber: 2.
	or referenceNumber: 4.
	or referenceNumber: 2.
	or referenceNumber: 5.
	or endAttribute: 'classes'.
	or endElement: 'FM3.Package'.
	or beginElement: 'FM3.Class'.
	or serial: 2.
	or beginAttribute: 'name'.
	or primitive: 'MyName2'.
	or endAttribute: 'name'.
	or beginAttribute: 'superclass'.
	or referenceNumber: 5.
	or endAttribute: 'superclass'.
	or endElement: 'FM3.Class'.
	or beginElement: 'FM3.Class'.
	or serial: 4.
	or beginAttribute: 'superclass'.
	or referenceNumber: 2.
	or endAttribute: 'superclass'.
	or beginAttribute: 'name'.
	or primitive: 'MyName4'.
	or endAttribute: 'name'.
	or endElement: 'FM3.Class'.
	or beginElement: 'FM3.Class'.
	or serial: 5.
	or beginAttribute: 'name'.
	or primitive: 'MyName5'.
	or endAttribute: 'name'.
	or endElement: 'FM3.Class'.
	or endDocument.
	repo := or repository asMetarepository.
	self denyEmpty: repo elements.
	self assert: repo elements size equals: 4.
	pack := repo at: 'MyPackage'.
	ref2 := pack at: 'MyName2'.
	ref4 := pack at: 'MyName4'.
	ref5 := pack at: 'MyName5'.
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
	self testSimpleMetamodel.
	tower metamodel importString: self class simpleCompositeMetamodelExtension.
	self assert: tower metamodel packages size equals: 2.
	self assert: tower metamodel classes size equals: 2.
	self assert: tower metamodel properties size equals: 3.
	self assert: (tower metamodel elementNamed: 'EG.Leaf.name') package equals: (tower metamodel elementNamed: 'MORE')
]

{ #category : #running }
FMImporterTest >> testSimpleMetamodel [
	tower metamodel importString: self class simpleCompositeMetamodel.
	self assert: tower metamodel packages size equals: 1.
	self assert: tower metamodel classes size equals: 2.
	self assert: tower metamodel properties size equals: 2.
	self assert: (tower metamodel elementNamed: 'EG.Container.children') hasOpposite.
	self assert: (tower metamodel elementNamed: 'EG.Leaf.parent') hasOpposite.
	self assert: (tower metamodel elementNamed: 'EG.Container.children') opposite equals: (tower metamodel elementNamed: 'EG.Leaf.parent')
]
