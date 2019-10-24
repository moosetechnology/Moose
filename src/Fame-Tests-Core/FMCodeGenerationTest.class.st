Class {
	#name : #FMCodeGenerationTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMCodeGenerationTest >> testClassNamePrefix [
	| gen |
	gen := FMDefaultCodeGenerator new.
	self assert: gen classNamePrefix equals: ''.
	gen classNamePrefix: 'Zork'.
	self assert: gen classNamePrefix equals: 'Zork'
]

{ #category : #running }
FMCodeGenerationTest >> testComplexGeneration [
	| metamodel generator |
	metamodel := FMMetaRepository new.
	metamodel importString: FMMSEParserTest famix30mse.

	"We generate Smalltalk classes from the classes contained in the repository"
	generator := FMDefaultCodeGenerator new.
	generator visit: metamodel.
	self assert: generator model changes changesSize > 0.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testDefaultCategory [
	| gen |
	gen := FMDefaultCodeGenerator new.
	self assert: gen defaultCategory isNil.
	gen defaultCategory: 'Fame-Example'.
	self assert: gen defaultCategory equals: 'Fame-Example'
]

{ #category : #running }
FMCodeGenerationTest >> testDefaultClass [
	| gen |
	gen := FMDefaultCodeGenerator new.
	self assert: gen defaultSuperclass name equals: #Object.
	gen defaultSuperclass: LIBRoot.
	self assert: gen defaultSuperclass name equals: #LIBRoot
]

{ #category : #running }
FMCodeGenerationTest >> testFM3Generation [
	self
		shouldnt: [ FMDefaultCodeGenerator new
				visit: FMMetaMetaRepository new;
				previewChangesIfShiftPressed ]
		raise: Error
]

{ #category : #running }
FMCodeGenerationTest >> testLIBGeneration [
	| metamodel generator |
	metamodel := FMMetaRepository new.
	metamodel importString: FMMSEParserTest sampleMetaMse.
	generator := FMDefaultCodeGenerator new.
	generator defaultSuperclass: LIBRoot.
	generator visit: metamodel.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testRPGGeneration [
	| metamodel generator |
	metamodel := FMMetaRepository new.
	metamodel importString: FMDungeonExample metamodelString.
	generator := FMDefaultCodeGenerator new.
	generator defaultCategory: 'Fame-Example'.
	generator visit: metamodel.
	generator previewChangesIfShiftPressed
]

{ #category : #running }
FMCodeGenerationTest >> testSimpleGeneration [
	| metamodel gen |
	metamodel := FMMetaRepository new.
	metamodel importString: FMMSEParserTest sampleMetaMse.
	gen := FMDefaultCodeGenerator new.
	gen classNamePrefix: 'Zork'.	"random prefix Zork"
	gen visit: metamodel.
	gen previewChangesIfShiftPressed.
	self assert: gen model changes changesSize > 0.
	self assert: (gen model changes changes collect: #changeClassName) asSet size equals: 3.
	self assert: ((gen model changes changes collect: #changeClassName) includes: #ZorkLIBBook).
	self assert: ((gen model changes changes collect: #changeClassName) includes: #ZorkLIBPerson).
	self assert: ((gen model changes changes collect: #changeClassName) includes: #ZorkLIBLibrary)
]
