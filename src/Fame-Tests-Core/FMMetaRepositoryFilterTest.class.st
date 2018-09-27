Class {
	#name : #FMMetaRepositoryFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'eqModel',
		'libModel',
		'rpgModel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #'buidling-models' }
FMMetaRepositoryFilterTest >> buildEQ [

	| builder |
	
	builder := FMPragmaProcessor new.
	builder queue: (OrderedCollection new
		add: EQCompound;
		add: EQEquation;
		add: EQEquationSystem;
		add: EQExpression;
		add: EQIdentifier;
		add: EQNumerical;
		add: EQOperator;
		add: EQSimple;
		add: EQVariable; 
		yourself).
	builder run.
	^ builder asMetamodel 
]

{ #category : #'buidling-models' }
FMMetaRepositoryFilterTest >> buildLIB [

	| builder |
	
	builder := FMPragmaProcessor new.
	builder queue: (OrderedCollection new
		"add: LIBRoot;"
		add: LIBBook;
		add: LIBLibrary;
		add: LIBPerson;
		yourself).
	builder run.
	^ builder asMetamodel 
]

{ #category : #'buidling-models' }
FMMetaRepositoryFilterTest >> buildRPG [

	| builder |
	
	builder := FMPragmaProcessor new.
	builder queue: (OrderedCollection new
		add: RPGDragon;
		add: RPGHero;
		add: RPGTreasure;
		yourself).
	builder run.
	^ builder asMetamodel 
]

{ #category : #'tests-export' }
FMMetaRepositoryFilterTest >> createLIBModelWithClass: class [

	| tower repository model filteredMetamodel stream filter importer |

	model := {LIBBook new title: 'aBook'. LIBLibrary new. LIBPerson new name: 'aPerson'}.
	stream := String new writeStream..

	filter := FMMetaRepositoryFilter new
	    metaRepository: libModel;
	    classes: {libModel descriptionOf: class}.
	filter run.

	"collecting the filtered metamodel"
	filteredMetamodel := filter newMetaRepository.

	"exporting the model (with the filtered metamodel) as mse"
	tower := FMCompleteTower new.
	tower metaMetamodel: filteredMetamodel metamodel.
	tower metamodel: filteredMetamodel.
	tower model: (repository := (FMRepository with: filteredMetamodel) addAll: model).
	tower model exportOn: stream.

	"reading the strem (mse) with the filtered model"
	tower := FMCompleteTower new.
	tower metamodel addAll: filteredMetamodel elements.
	importer := FMImporter new.
	importer repository: tower model.
	importer stream: stream contents readStream.
	importer run.
	tower model updateCache.
	^ tower model
]

{ #category : #'tests-export' }
FMMetaRepositoryFilterTest >> disabledBecauseItFailsOnTheServerInHeadlessModetestExportLIBBookWithPartialMetamodel [
	| model entity |
	model := self createLIBModelWithClass: LIBBook.
	self assert: model elements size equals: 2.
	entity := model selectKindOf: LIBBook.
	self assert: entity size equals: 1.
	self assert: entity first title equals: 'aBook'.
	entity := model selectKindOf: LIBPerson.
	self assert: entity size equals: 1.
	self assert: entity first name equals: 'aPerson'.
	entity := model selectKindOf: LIBLibrary.
	self assert: entity isEmpty
]

{ #category : #'tests-export' }
FMMetaRepositoryFilterTest >> disabledBecauseItFailsOnTheServerInHeadlessModetestExportLIBLibraryWithPartialMetamodel [
	| model entity |
	model := self createLIBModelWithClass: LIBLibrary.
	self assert: model elements size equals: 3.
	entity := model selectKindOf: LIBBook.
	self assert: entity size equals: 1.
	self assert: entity first title equals: 'aBook'.
	entity := model selectKindOf: LIBPerson.
	self assert: entity size equals: 1.
	self assert: entity first name equals: 'aPerson'.
	entity := model selectKindOf: LIBLibrary.
	self assert: entity size equals: 1
]

{ #category : #'tests-export' }
FMMetaRepositoryFilterTest >> disabledBecauseItFailsOnTheServerInHeadlessModetestExportLIBPersonWithPartialMetamodel [
	| model entity |
	model := self createLIBModelWithClass: LIBPerson.
	self assert: model elements size equals: 2.
	entity := model selectKindOf: LIBBook.
	self assert: entity size equals: 1.
	self assert: entity first title equals: 'aBook'.
	entity := model selectKindOf: LIBPerson.
	self assert: entity size equals: 1.
	self assert: entity first name equals: 'aPerson'.
	entity := model selectKindOf: LIBLibrary.
	self assert: entity isEmpty
]

{ #category : #running }
FMMetaRepositoryFilterTest >> setUp [

	super setUp.
	eqModel := self buildEQ.
	libModel := self buildLIB.
	rpgModel := self buildRPG.
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testAnnotationTypes [

	| repo package class property properties visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.
	
	package := repo elementNamed: 'FM3'.
	class := repo elementNamed: 'FM3.Element'.
	class isFM3Class should beTrue.
	class superclass should = FM3 object.
	class implementingClass should = FM3Element.
	(class at: 'name') isFM3Property should beTrue.
	(class at: 'name') name should = #name.
	(class at: 'name') mmClass should = class.
	(class at: 'name') owner should = class.
	(class at: 'name') type should = FM3 string.
	(class at: 'name') isContainer should beFalse.
	(class at: 'name') isMultivalued should beFalse.
	(class at: 'name') isComposite should beFalse.
	(class at: 'name') hasOpposite should beFalse.
	class owner should = package.	"We now test properties"
	class := package at: 'Property'.
	class isFM3Class should beTrue.
	class superclass should = (package at: 'Element').
	class implementingClass should = FM3PropertyDescription.
	(class at: 'opposite') isFM3Property should beTrue.
	(class at: 'opposite') name should = #opposite.
	(class at: 'opposite') mmClass should = class.
	(class at: 'opposite') owner should = class.
	(class at: 'opposite') type should = class.
	(class at: 'opposite') isContainer should beFalse.
	(class at: 'opposite') isMultivalued should beFalse.
	(class at: 'opposite') isComposite should beFalse.
	(class at: 'opposite') hasOpposite should beTrue.
	(class at: 'opposite') opposite should = (class at: 'opposite').	"We now test the container property of FM3's properties"
	property := (package at: 'Property') at: 'class'.
	property isContainer should beTrue.
	properties := (package at: 'Property') allAttributes copyWithout: property.
	(properties noneSatisfy: #isContainer) should beTrue.
	properties := (package at: 'Package') allAttributes.
	(properties noneSatisfy: #isContainer) should beTrue.
	property := (package at: 'Class') at: 'package'.
	property isContainer should beTrue.
	properties := (package at: 'Class') allAttributes copyWithout: property.
	(properties noneSatisfy: #isContainer) should beTrue.

]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testBookMetamodel [
	
	| or m repo fm3 visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	or := FMImporter new repository: (FMMetaRepository with: fm3).
	m := FMModelBuilder new client: or.
	m document: [ m new: 'FM3.Class' with: [ m a: #name of: 'Book' ] ].
	repo := or repository asMetarepository.
	repo elements isEmpty should beFalse.
	repo elements size should = 1.
	repo elements anyOne name should = #Book
]

{ #category : #'tests-basic' }
FMMetaRepositoryFilterTest >> testClassWithoutPackage [
	
	| aClassWithoutPackage repo visitor |
	aClassWithoutPackage := FM3MetaDescription new.
	aClassWithoutPackage name: 'AClass'.
	repo := FMMetaRepository with: FMMetaRepository fm3.
	repo add: aClassWithoutPackage.
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: repo;
		classes: {aClassWithoutPackage}.
	self shouldnt: [visitor run ] raise: Error
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testExportAsMSE [
	
	| repo visitor repoFM3 printer |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.
	
	printer := FMMSEPrinter new onString.
	repo accept: printer.
	printer stream contents isString should beTrue.
	printer stream contents first should = $(
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testExportAsXML [
	
	| repo visitor repoFM3 printer |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.
	
	printer := FMXMLPrinter new onString.
	repo accept: printer.
	printer stream contents isString should beTrue.
	printer stream contents first should = $<
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3 [
	| fm3 repoFM3 visitor |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	fm3 notNil should beTrue.
	fm3 metamodel should = fm3
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3Classes [
	
	| fm3 visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	(fm3 descriptionOf: FM3Element) notNil should beTrue.
	(fm3 descriptionOf: FM3PropertyDescription) notNil should beTrue.
	(fm3 descriptionOf: FM3PackageDescription) notNil should beTrue.
	(fm3 descriptionOf: FM3MetaDescription) notNil should beTrue.
	"No longer true Updated test since descriptionOf: can return nil"
	(fm3 descriptionOf: FMMetaRepositoryTest) isNil should beTrue.
"	self should: [ fm3 descriptionOf: FMMetaRepositoryTest ] raise: Error"
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| repo names visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.
	
	repo notNil should beTrue.	"boot strapping FM3 does internally run the pragma processor"
	names := repo elements collect: [ :each | each fullName ].	"The package"
	names should include: 'FM3'.
	(repo elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite should =
			(repo elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
	names should include: 'FM3.Element'.
	names should include: 'FM3.Element.name'.
	names should include: 'FM3.Element.fullName'.
	names should include: 'FM3.Element.owner'.
	names should include: 'FM3.Class'.
	names should include: 'FM3.Class.abstract'.
	names should include: 'FM3.Class.primitive'.
	names should include: 'FM3.Class.root'.
	names should include: 'FM3.Class.superclass'.
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
	(names select: [ :n | n beginsWith: 'FM3.' ]) size should = 25
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3NewVersion [
	"The current implementation of FameSystem does not provide a scope for its repository"

	| repo names visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.

	names := repo elements collect: [ :each | each fullName ].	"The package"
	names should include: 'FM3'.	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
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
	(names select: [ :n | n beginsWith: 'FM3' ]) size should = 26
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testImporter [

	| fm3 repoFM3 visitor string repo imp |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	string := '((FM3.Package (id: 1) (name ''Office'')))'.
	repo := FMMetaRepository with: fm3.
	imp := FMImporter new.
	imp repository: repo.
	imp fromString: string.
	imp run.
	repo elements size should = 1.
	repo elements anyOne name should = #Office.
	repo elements anyOne fullName should = 'Office'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQCompound [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQCompound}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Expression'.
	names should include: 'EQ.Operator'.
	names should include: 'EQ.Expression'.
	names should include: 'EQ.Identifier'.
	names should include: 'EQ.Compound'.
	names should include: 'EQ.Simple'.
	names should include: 'EQ.Numerical'.
	names should include: 'EQ.Variable'.
	
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQEquation [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQEquation}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Equation'.
	names should include: 'EQ.Expression'.
	names should include: 'EQ.Identifier'.
	names should include: 'EQ.Compound'.
	names should include: 'EQ.Simple'.
	names should include: 'EQ.Numerical'.
	names should include: 'EQ.Variable'.
	names should include: 'EQ.Operator'.
	
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQEquationSystem [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQEquationSystem}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Equation'.
	names should include: 'EQ.EquationSystem'.
	names should include: 'EQ.Variable'.
	names should include: 'EQ.Expression'.
	names should include: 'EQ.Identifier'.
	names should include: 'EQ.Compound'.
	names should include: 'EQ.Simple'.
	names should include: 'EQ.Numerical'.
	names should include: 'EQ.Operator'
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQExpression [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQExpression}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Expression'.
	
	names should not include: 'EQ.Equation'.
	names should not include: 'EQ.Variable'.
	names should not include: 'EQ.Identifier'.
	names should not include: 'EQ.Compound'.
	names should not include: 'EQ.Simple'.
	names should not include: 'EQ.Numerical'.
	names should not include: 'EQ.Operator'.
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQIdentifier [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQIdentifier}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Identifier'.
	
	names should not include: 'EQ.Expression'.
	names should not include: 'EQ.Equation'.
	names should not include: 'EQ.Variable'.
	names should not include: 'EQ.Compound'.
	names should not include: 'EQ.Simple'.
	names should not include: 'EQ.Numerical'.
	names should not include: 'EQ.Operator'.
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQNumerical [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQNumerical}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Simple'.
	names should include: 'EQ.Expression'.
	names should include: 'EQ.Numerical'.
	
	names should not include: 'EQ.Equation'.
	names should not include: 'EQ.Variable'.
	names should not include: 'EQ.Identifier'.
	names should not include: 'EQ.Compound'.
	names should not include: 'EQ.Operator'.
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQOperator [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQOperator}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Operator'.
	
	names should not include: 'EQ.Expression'.
	names should not include: 'EQ.Equation'.
	names should not include: 'EQ.Variable'.
	names should not include: 'EQ.Compound'.
	names should not include: 'EQ.Simple'.
	names should not include: 'EQ.Numerical'.
	names should not include: 'EQ.Identifier'.
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQSimple [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQSimple}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Simple'.
	names should include: 'EQ.Expression'.
	
	names should not include: 'EQ.Equation'.
	names should not include: 'EQ.Variable'.
	names should not include: 'EQ.Identifier'.
	names should not include: 'EQ.Compound'.
	names should not include: 'EQ.Numerical'.
	names should not include: 'EQ.Operator'.
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQVariable [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {eqModel descriptionOf: EQVariable}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'EQ'.
	names should include: 'EQ.Variable'.
	names should include: 'EQ.Simple'.
	names should include: 'EQ.Expression'.
	names should include: 'EQ.Identifier'.
	
	names should not include: 'EQ.Equation'.
	names should not include: 'EQ.Numerical'.
	names should not include: 'EQ.Compound'.
	names should not include: 'EQ.Operator'.
	names should not include: 'EQ.EquationSystem'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBBook [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {libModel descriptionOf: LIBBook}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'LIB'.
	names should include: 'LIB.Person'.
	names should include: 'LIB.Book'.
	
	names should not include: 'LIB.Library'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBLibrary [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {libModel descriptionOf: LIBLibrary}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'LIB'.
	names should include: 'LIB.Library'.
	names should include: 'LIB.Person'.
	names should include: 'LIB.Book'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBPerson [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {libModel descriptionOf: LIBPerson}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'LIB'.
	names should include: 'LIB.Person'.
	names should include: 'LIB.Book'.
	
	names should not include: 'LIB.Library'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGDragon [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {rpgModel descriptionOf: RPGDragon}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'RPG'.
	names should include: 'RPG.Dragon'.
	names should include: 'RPG.Hero'.
	names should include: 'RPG.Treasure'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGHero [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {rpgModel descriptionOf: RPGHero}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'RPG'.
	names should include: 'RPG.Dragon'.
	names should include: 'RPG.Hero'.
	names should include: 'RPG.Treasure'.
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGTreasure [

	| repo names visitor |
	
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {rpgModel descriptionOf: RPGTreasure}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	names should include: 'RPG'.
	names should include: 'RPG.Dragon'.
	names should include: 'RPG.Hero'.
	names should include: 'RPG.Treasure'.
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolving [
	
	| or m fm3 visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	or := FMImporter new repository: (FMMetaRepository with: fm3).
	m := FMModelBuilder new client: or.
	m document: [ m new: 'FM3.Class' with: [ m a: #name of: 'MyName' ] ].
	or repository elements isEmpty should beFalse.
	or repository elements size should = 1.
	or repository elements anyOne isFM3Class should beTrue
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolvingId [
	
	| or m fm3 visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	or := FMImporter new repository: (FMMetaRepository with: fm3).
	m := FMModelBuilder new client: or.
	m document:
			[ m new: 'FM3.Class'
				with:
					[ m id: 3.
					m a: #name of: 'MyName'.
					m a: #superclass of: [ m ref: 2 ] ].
			m new: 'FM3.Class'
				with:
					[ m id: 2.
					m a: #name of: 'MyName2' ] ].
	or repository elements isEmpty should beFalse.
	or repository elements size should = 2
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolvingMultiArgs [
	
	| or pack ref2 ref4 ref5 repo fm3 visitor repoFM3 |
	
	repoFM3 := FMMetaRepository fm3.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	
	or := FMImporter new repository: (FMMetaRepository with: fm3).
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
	repo elements isEmpty should beFalse.
	repo elements size should = 4.
	pack := repo at: 'MyPackage'.
	ref2 := pack at: 'MyName2'.
	ref4 := pack at: 'MyName4'.
	ref5 := pack at: 'MyName5'.
	pack notNil should beTrue.
	ref2 notNil should beTrue.
	ref4 notNil should beTrue.
	ref5 notNil should beTrue.
	pack classes should include: ref2.
	pack classes should include: ref4.
	pack classes should include: ref5
]
