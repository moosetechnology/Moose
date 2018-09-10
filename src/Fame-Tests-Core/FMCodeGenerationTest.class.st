Class {
	#name : #FMCodeGenerationTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMCodeGenerationTest >> testClassNamePrefix [
	| gen |
	gen := FMDefaultCodeGenerator new.
	gen classNamePrefix should = ''.
	gen classNamePrefix: 'Zork'.
	gen classNamePrefix should = 'Zork'
]

{ #category : #running }
FMCodeGenerationTest >> testComplexGeneration [
	"self run: #testComplexGeneration"
	| tower generator |
	tower := FMTower new.
	tower metamodel importString: FMMSEParserTest famix30mse.

	"We generate Smalltalk classes from the classes contained in the repository"
	generator := FMDefaultCodeGenerator new.
	generator visit: tower metamodel.
	generator model changes changesSize should > 0.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testDefaultCategory [
	| gen |
	gen := FMDefaultCodeGenerator new.
	gen defaultCategory isNil should beTrue.
	gen defaultCategory: 'Fame-Example'.
	gen defaultCategory should = 'Fame-Example'
]

{ #category : #running }
FMCodeGenerationTest >> testDefaultClass [
	| gen |
	gen := FMDefaultCodeGenerator new.
	gen defaultSuperclass name should = #Object.
	gen defaultSuperclass: LIBRoot.
	gen defaultSuperclass name should = #LIBRoot
]

{ #category : #running }
FMCodeGenerationTest >> testFM3Generation [
	| tower generator |
	tower := FMTower new.
	generator := FMDefaultCodeGenerator new.
	generator visit: tower metaMetamodel.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testLIBGeneration [
	| tower generator |
	tower := FMTower new.
	tower metamodel importString: FMMSEParserTest sampleMetaMse.
	generator := FMDefaultCodeGenerator new.
	generator defaultSuperclass: LIBRoot.
	generator visit: tower metamodel.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testRPGGeneration [
	| tower generator |
	tower := FMTower new.
	tower metamodel importString: FMDungeonExample metamodelString.
	generator := FMDefaultCodeGenerator new.
	generator defaultCategory: 'Fame-Example'.
	generator visit: tower metamodel.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testSimpleGeneration [
	| tower gen |
	tower := FMTower new.
	tower metamodel importString: FMMSEParserTest sampleMetaMse.
	gen := FMDefaultCodeGenerator new.
	gen classNamePrefix: 'Zork'.	"random prefix Zork"
	gen visit: tower metamodel.
	gen previewChangesIfShiftPressed.
	gen model changes changesSize should > 0.
	FMUtil default squeakDo:
			[ (gen model changes changes collect: #changeClassName) asSet size should = 3.
			(gen model changes changes collect: #changeClassName) should include: #ZorkLIBBook.
			(gen model changes changes collect: #changeClassName) should include: #ZorkLIBPerson.
			(gen model changes changes collect: #changeClassName) should include: #ZorkLIBLibrary ]
]
