Class {
	#name : #FMMetaRepositoryFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'eqModel',
		'libModel',
		'rpgModel'
	],
	#category : #'Fame-Tests'
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

{ #category : #running }
FMMetaRepositoryFilterTest >> setUp [
	super setUp.
	eqModel := self buildEQ.
	libModel := self buildLIB.
	rpgModel := self buildRPG
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testAnnotationTypes [
	| metaModel package class property properties visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	metaModel := visitor newMetaRepository.

	package := metaModel elementNamed: 'FM3'.
	class := metaModel elementNamed: 'FM3.Element'.
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

{ #category : #tests }
FMMetaRepositoryFilterTest >> testClassWithoutPackage [
	| aClassWithoutPackage metaModel visitor |
	aClassWithoutPackage := FM3Class named: 'AClass'.
	metaModel := FMMetaModel new.
	metaModel add: aClassWithoutPackage.

	visitor := FMMetaRepositoryFilter new
		metaRepository: metaModel;
		classes: {aClassWithoutPackage}.
	self shouldnt: [ visitor run ] raise: Error
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testExportAsMSE [
	| metaModel visitor metaMetaModel printer |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	metaModel := visitor newMetaRepository.

	printer := FMMSEPrinter onString.
	metaModel accept: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $(
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testExportAsXML [
	| metaModel visitor metaMetaModel printer |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	metaModel := visitor newMetaRepository.

	printer := FMXMLPrinter onString.
	metaModel accept: printer.
	self assert: printer stream contents isString.
	self assert: printer stream contents first equals: $<
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3 [
	| fm3 metaMetaModel visitor |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	self assert: fm3 notNil.
	self assert: fm3 metamodel equals: fm3
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3Classes [
	| fm3 visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.
	self assert: (fm3 descriptionOf: FM3Element) notNil.
	self assert: (fm3 descriptionOf: FM3Property) notNil.
	self assert: (fm3 descriptionOf: FM3Package) notNil.
	self assert: (fm3 descriptionOf: FM3Class) notNil.
	"No longer true Updated test since descriptionOf: can return nil"
	self assert: (fm3 descriptionOf: FMMetaModelTest) isNil
	"	self should: [ fm3 descriptionOf: FMMetaRepositoryTest ] raise: Error"
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testFM3IsComplete [
	"More information about FM3 may be found on http://smallwiki.unibe.ch/fame/fm3/"

	| metaModel names visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	metaModel := visitor newMetaRepository.
	self assert: metaModel notNil.	"boot strapping FM3 does internally run the pragma processor"
	names := metaModel elements collect: [ :each | each fullName ].	"The package"
	self assert: (names includes: 'FM3').
	self
		assert: (metaModel elements detect: [ :el | el fullName = 'FM3.Class.package' ]) opposite
		equals: (metaModel elements detect: [ :el | el fullName = 'FM3.Package.classes' ]).	"The superclass of everything"	"name, fullName, and owner are the 3 properties that define an element"
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

	| metaModel names visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	metaModel := visitor newMetaRepository.

	names := metaModel elements collect: [ :each | each fullName ].	"The package"
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
FMMetaRepositoryFilterTest >> testImportBook [
	| importer builder model fm3 visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	importer := FMImporter model: (FMMetaModel withMetamodel: fm3).
	builder := FMModelBuilder client: importer.
	builder document: [ builder new: 'FM3.Class' with: [ builder a: #name of: 'Book' ] ].
	model := importer model.
	self denyEmpty: model elements.
	self assert: model elements size equals: 1.
	self assert: model elements anyOne name equals: #Book
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testImporter [
	| fm3 metaMetaModel visitor string metaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	string := '((FM3.Package (id: 1) (name ''Office'')))'.
	metaModel := FMMetaModel withMetamodel: fm3.
	(FMImporter model: metaModel)
		fromString: string;
		run.
	self assert: metaModel elements size equals: 1.
	self assert: metaModel elements anyOne name equals: #Office.
	self assert: metaModel elements anyOne fullName equals: 'Office'
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeEQCompound [
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQCompound)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQEquation)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQEquationSystem)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQExpression)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQIdentifier)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQNumerical)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQOperator)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQSimple)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: eqModel;
		classes: {(eqModel descriptionOf: EQVariable)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
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
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: LIBBook)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Book').
	self deny: (names includes: 'LIB.Library')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBLibrary [
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: LIBLibrary)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Library').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Book')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeLIBPerson [
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: libModel;
		classes: {(libModel descriptionOf: LIBPerson)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
	self assert: (names includes: 'LIB').
	self assert: (names includes: 'LIB.Person').
	self assert: (names includes: 'LIB.Book').
	self deny: (names includes: 'LIB.Library')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGDragon [
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {(rpgModel descriptionOf: RPGDragon)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
	self assert: (names includes: 'RPG').
	self assert: (names includes: 'RPG.Dragon').
	self assert: (names includes: 'RPG.Hero').
	self assert: (names includes: 'RPG.Treasure')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGHero [
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {(rpgModel descriptionOf: RPGHero)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
	self assert: (names includes: 'RPG').
	self assert: (names includes: 'RPG.Dragon').
	self assert: (names includes: 'RPG.Hero').
	self assert: (names includes: 'RPG.Treasure')
]

{ #category : #'test-include-fameexamples' }
FMMetaRepositoryFilterTest >> testIncludeRPGTreasure [
	| metaModel names visitor |
	visitor := FMMetaRepositoryFilter new
		metaRepository: rpgModel;
		classes: {(rpgModel descriptionOf: RPGTreasure)}.
	visitor run.

	metaModel := visitor newMetaRepository.
	names := metaModel elements collect: #fullName.
	self assert: (names includes: 'RPG').
	self assert: (names includes: 'RPG.Dragon').
	self assert: (names includes: 'RPG.Hero').
	self assert: (names includes: 'RPG.Treasure')
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolving [
	| importer builder fm3 visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	importer := FMImporter model: (FMMetaModel withMetamodel: fm3).
	builder := FMModelBuilder client: importer.
	builder document: [ builder new: 'FM3.Class' with: [ builder a: #name of: 'MyName' ] ].
	self denyEmpty: importer model elements.
	self assert: importer model elements size equals: 1.
	self assert: importer model elements anyOne isFM3Class
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolvingId [
	| importer builder fm3 visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	importer := FMImporter model: (FMMetaModel withMetamodel: fm3).
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
	self denyEmpty: importer model elements.
	self assert: importer model elements size equals: 2
]

{ #category : #'tests-metarepository' }
FMMetaRepositoryFilterTest >> testResolvingMultiArgs [
	| importer pack ref2 ref4 ref5 model fm3 visitor metaMetaModel |
	metaMetaModel := FMMetaMetaModel new.
	visitor := FMMetaRepositoryFilter new
		metaRepository: metaMetaModel;
		classes: metaMetaModel classes.
	visitor run.
	fm3 := visitor newMetaRepository.

	importer := (FMImporter model: (FMMetaModel withMetamodel: fm3))
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
	self denyEmpty: model elements.
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
