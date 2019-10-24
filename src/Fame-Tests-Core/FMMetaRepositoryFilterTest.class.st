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
	^ FMPragmaProcessor
		metamodelFrom: {EQCompound . EQEquation . EQEquationSystem . EQExpression . EQIdentifier . EQNumerical . EQOperator . EQSimple . EQVariable}
]

{ #category : #'buidling-models' }
FMMetaRepositoryFilterTest >> buildLIB [
	^ FMPragmaProcessor metamodelFrom: {LIBBook . LIBLibrary . LIBPerson}
]

{ #category : #'buidling-models' }
FMMetaRepositoryFilterTest >> buildRPG [
	^ FMPragmaProcessor metamodelFrom: {RPGDragon . RPGHero . RPGTreasure}
]

{ #category : #'tests-export' }
FMMetaRepositoryFilterTest >> createLIBModelWithClass: class [
	| tower model metamodel filteredMetamodel stream filter |
	stream := String new writeStream.

	filter := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: class)}.
	filter run.

	"collecting the filtered metamodel"
	filteredMetamodel := filter newMetaRepository.

	"exporting the model (with the filtered metamodel) as mse"

	model := (FMRepository with: filteredMetamodel)
		addAll: {(LIBBook new title: 'aBook') . LIBLibrary new . (LIBPerson named: 'aPerson')};
		yourself.
	model exportOn: stream.

	"reading the strem (mse) with the filtered model"
	metamodel := FMMetaMetaRepository new.
	metamodel addAll: filteredMetamodel elements.
	(FMImporter repository: model)
		stream: stream contents readStream;
		run.
	model updateCache.
	^ model
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
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.

	package := repo elementNamed: 'FM3'.
	class := repo elementNamed: 'FM3.Element'.
	self assert: class isFM3Class.
	self assert: class superclass equals: FM3Object instance.
	self assert: class implementingClass equals: FM3Element.
	self assert: (class propertyNamed: 'name') isFM3Property.
	self assert: (class propertyNamed: 'name') name equals: #name.
	self assert: (class propertyNamed: 'name') mmClass equals: class.
	self assert: (class propertyNamed: 'name') owner equals: class.
	self assert: (class propertyNamed: 'name') type equals: FM3String instance.
	self deny: (class propertyNamed: 'name') isContainer.
	self deny: (class propertyNamed: 'name') isMultivalued.
	self deny: (class propertyNamed: 'name') isComposite.
	self deny: (class propertyNamed: 'name') hasOpposite.
	self assert: class owner equals: package.	"We now test properties"
	class := package classNamed: 'Property'.
	self assert: class isFM3Class.
	self assert: class superclass equals: (package classNamed: 'Element').
	self assert: class implementingClass equals: FM3Property.
	self assert: (class propertyNamed: 'opposite') isFM3Property.
	self assert: (class propertyNamed: 'opposite') name equals: #opposite.
	self assert: (class propertyNamed: 'opposite') mmClass equals: class.
	self assert: (class propertyNamed: 'opposite') owner equals: class.
	self assert: (class propertyNamed: 'opposite') type equals: class.
	self deny: (class propertyNamed: 'opposite') isContainer.
	self deny: (class propertyNamed: 'opposite') isMultivalued.
	self deny: (class propertyNamed: 'opposite') isComposite.
	self assert: (class propertyNamed: 'opposite') hasOpposite.
	self assert: (class propertyNamed: 'opposite') opposite equals: (class propertyNamed: 'opposite').	"We now test the container property of FM3's properties"
	property := (package classNamed: 'Property') propertyNamed: 'class'.
	self assert: property isContainer.
	properties := (package classNamed: 'Property') allProperties copyWithout: property.
	self assert: (properties noneSatisfy: #isContainer).
	properties := (package classNamed: 'Package') allProperties.
	self assert: (properties noneSatisfy: #isContainer).
	property := (package classNamed: 'Class') propertyNamed: 'package'.
	self assert: property isContainer.
	properties := (package classNamed: 'Class') allProperties copyWithout: property.
	self assert: (properties noneSatisfy: #isContainer)
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testBookMetamodel [
	| or m repo fm3 visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	or := FMImporter repository: (FMMetaRepository with: fm3).
	m := FMModelBuilder new client: or.
	m document: [ m new: 'FM3.Class' with: [ m a: #name of: 'Book' ] ].
	repo := or repository asMetarepository.
	self denyEmpty: repo elements.
	self assert: repo elements size equals: 1.
	self assert: repo elements anyOne name equals: #Book
]

{ #category : #'tests-basic' }
FMMetaRepositoryFilterTest >> testClassWithoutPackage [
	| aClassWithoutPackage repo visitor |
	aClassWithoutPackage := FM3Class named: 'AClass'.
	repo := FMMetaRepository new.
	repo add: aClassWithoutPackage.

	visitor := FMMetaRepositoryFilter new
		metaRepository: repo;
		classes: {aClassWithoutPackage}.
	self shouldnt: [ visitor run ] raise: Error
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testExportAsMSE [
	| repo visitor repoFM3 printer |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.

	printer := FMMSEPrinter new onString.
	repo accept: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $(
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testExportAsXML [
	| repo visitor repoFM3 printer |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.

	printer := FMXMLPrinter new onString.
	repo accept: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $<
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3 [
	| fm3 repoFM3 visitor |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	self assert: fm3 notNil.
	self assert: fm3 metamodel equals: fm3
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3Classes [
	| fm3 visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	self assert: (fm3 descriptionOf: FM3Element) notNil.
	self assert: (fm3 descriptionOf: FM3Property) notNil.
	self assert: (fm3 descriptionOf: FM3Package) notNil.
	self assert: (fm3 descriptionOf: FM3Class) notNil.
	"No longer true Updated test since descriptionOf: can return nil"
	self assert: (fm3 descriptionOf: FMMetaRepositoryTest) isNil
	"	self should: [ fm3 descriptionOf: FMMetaRepositoryTest ] raise: Error"
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| repo names visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.
	self assert: repo notNil.	"boot strapping FM3 does internally run the pragma processor"
	names := repo elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').
	self
		assert: (repo elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite
		equals: (repo elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
	self assert: (names includes: 'FM3.Element').
	self assert: (names includes: 'FM3.Element.name').
	self assert: (names includes: 'FM3.Element.fullName').
	self assert: (names includes: 'FM3.Element.owner').
	self assert: (names includes: 'FM3.Class').
	self assert: (names includes: 'FM3.Class.abstract').
	self assert: (names includes: 'FM3.Class.primitive').
	self assert: (names includes: 'FM3.Class.root').
	self assert: (names includes: 'FM3.Class.superclass').
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
	self assert: (names select: [ :n | n beginsWith: 'FM3.' ]) size equals: 26
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3NewVersion [
	"The current implementation of FameSystem does not provide a scope for its repository"

	| repo names visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	repo := visitor newMetaRepository.

	names := repo elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
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
	self assert: (names select: [ :n | n beginsWith: 'FM3' ]) size equals: 27
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testImporter [
	| fm3 repoFM3 visitor string repo |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	string := '((FM3.Package (id: 1) (name ''Office'')))'.
	repo := FMMetaRepository with: fm3.
	(FMImporter repository: repo)
		fromString: string;
		run.
	self assert: repo elements size equals: 1.
	self assert: repo elements anyOne name equals: #Office.
	self assert: repo elements anyOne fullName equals: 'Office'
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQCompound [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQCompound)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Expression').
	self assert: (names includes: 'EQ.Operator').
	self assert: (names includes: 'EQ.Expression').
	self assert: (names includes: 'EQ.Identifier').
	self assert: (names includes: 'EQ.Compound').
	self assert: (names includes: 'EQ.Simple').
	self assert: (names includes: 'EQ.Numerical').
	self assert: (names includes: 'EQ.Variable').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQEquation [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQEquation)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Equation').
	self assert: (names includes: 'EQ.Expression').
	self assert: (names includes: 'EQ.Identifier').
	self assert: (names includes: 'EQ.Compound').
	self assert: (names includes: 'EQ.Simple').
	self assert: (names includes: 'EQ.Numerical').
	self assert: (names includes: 'EQ.Variable').
	self assert: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQEquationSystem [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQEquationSystem)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Equation').
	self assert: (names includes: 'EQ.EquationSystem').
	self assert: (names includes: 'EQ.Variable').
	self assert: (names includes: 'EQ.Expression').
	self assert: (names includes: 'EQ.Identifier').
	self assert: (names includes: 'EQ.Compound').
	self assert: (names includes: 'EQ.Simple').
	self assert: (names includes: 'EQ.Numerical').
	self assert: (names includes: 'EQ.Operator')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQExpression [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQExpression)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Expression').
	self deny: (names includes: 'EQ.Equation').
	self deny: (names includes: 'EQ.Variable').
	self deny: (names includes: 'EQ.Identifier').
	self deny: (names includes: 'EQ.Compound').
	self deny: (names includes: 'EQ.Simple').
	self deny: (names includes: 'EQ.Numerical').
	self deny: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQIdentifier [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQIdentifier)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Identifier').
	self deny: (names includes: 'EQ.Expression').
	self deny: (names includes: 'EQ.Equation').
	self deny: (names includes: 'EQ.Variable').
	self deny: (names includes: 'EQ.Compound').
	self deny: (names includes: 'EQ.Simple').
	self deny: (names includes: 'EQ.Numerical').
	self deny: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQNumerical [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQNumerical)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Simple').
	self assert: (names includes: 'EQ.Expression').
	self assert: (names includes: 'EQ.Numerical').
	self deny: (names includes: 'EQ.Equation').
	self deny: (names includes: 'EQ.Variable').
	self deny: (names includes: 'EQ.Identifier').
	self deny: (names includes: 'EQ.Compound').
	self deny: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQOperator [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQOperator)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.Expression').
	self deny: (names includes: 'EQ.Equation').
	self deny: (names includes: 'EQ.Variable').
	self deny: (names includes: 'EQ.Compound').
	self deny: (names includes: 'EQ.Simple').
	self deny: (names includes: 'EQ.Numerical').
	self deny: (names includes: 'EQ.Identifier').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQSimple [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQSimple)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Simple').
	self assert: (names includes: 'EQ.Expression').
	self deny: (names includes: 'EQ.Equation').
	self deny: (names includes: 'EQ.Variable').
	self deny: (names includes: 'EQ.Identifier').
	self deny: (names includes: 'EQ.Compound').
	self deny: (names includes: 'EQ.Numerical').
	self deny: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQVariable [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQVariable)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'EQ').
	self assert: (names includes: 'EQ.Variable').
	self assert: (names includes: 'EQ.Simple').
	self assert: (names includes: 'EQ.Expression').
	self assert: (names includes: 'EQ.Identifier').
	self deny: (names includes: 'EQ.Equation').
	self deny: (names includes: 'EQ.Numerical').
	self deny: (names includes: 'EQ.Compound').
	self deny: (names includes: 'EQ.Operator').
	self deny: (names includes: 'EQ.EquationSystem')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBBook [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: LIBBook)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Book').
	self deny: (names includes: 'LIB.Library')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBLibrary [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: LIBLibrary)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Library').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Book')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBPerson [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: LIBPerson)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Book').
	self deny: (names includes: 'LIB.Library')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGDragon [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {(rpgModel descriptionOf: RPGDragon)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'RPG').
	self assert: (names includes: 'RPG.Dragon').
	self assert: (names includes: 'RPG.Hero').
	self assert: (names includes: 'RPG.Treasure')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGHero [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {(rpgModel descriptionOf: RPGHero)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'RPG').
	self assert: (names includes: 'RPG.Dragon').
	self assert: (names includes: 'RPG.Hero').
	self assert: (names includes: 'RPG.Treasure')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGTreasure [
	| repo names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {(rpgModel descriptionOf: RPGTreasure)}.
	visitor run.

	repo := visitor newMetaRepository.
	names := repo elements collect: #fullName.
	self assert: (names includes: 'RPG').
	self assert: (names includes: 'RPG.Dragon').
	self assert: (names includes: 'RPG.Hero').
	self assert: (names includes: 'RPG.Treasure')
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolving [
	| or m fm3 visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	or := FMImporter repository: (FMMetaRepository with: fm3).
	m := FMModelBuilder new client: or.
	m document: [ m new: 'FM3.Class' with: [ m a: #name of: 'MyName' ] ].
	self denyEmpty: or repository elements.
	self assert: or repository elements size equals: 1.
	self assert: or repository elements anyOne isFM3Class
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolvingId [
	| or m fm3 visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	or := FMImporter repository: (FMMetaRepository with: fm3).
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

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolvingMultiArgs [
	| or pack ref2 ref4 ref5 repo fm3 visitor repoFM3 |
	repoFM3 := FMMetaMetaRepository new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: repoFM3;
		classes: repoFM3 classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	or := FMImporter repository: (FMMetaRepository with: fm3).
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
	pack := repo packageNamed: 'MyPackage'.
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
