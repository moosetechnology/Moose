Class {
	#name : #FMCodeGenerationTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMCodeGenerationTest >> testClassNamePrefix [
	| gen |
	gen := FMDefaultCodeGenerator new.
	self assert: gen classNamePrefix equals: ''.
	gen classNamePrefix: 'Zork'.
	self assert: gen classNamePrefix equals: 'Zork'
]

{ #category : #tests }
FMCodeGenerationTest >> testComplexGeneration [
	| metamodel generator |
	metamodel := FMMetaModel fromString: FMMSEParserTest famix30mse.

	"We generate Smalltalk classes from the classes contained in the repository"
	generator := FMDefaultCodeGenerator new.
	generator visit: metamodel.
	self assert: generator model changes changesSize > 0.
	generator previewChangesIfShiftPressed
]

{ #category : #tests }
FMCodeGenerationTest >> testDefaultCategory [
	| gen |
	gen := FMDefaultCodeGenerator new.
	self assert: gen defaultCategory isNil.
	gen defaultCategory: 'Fame-Example'.
	self assert: gen defaultCategory equals: 'Fame-Example'
]

{ #category : #tests }
FMCodeGenerationTest >> testDefaultClass [
	| gen |
	gen := FMDefaultCodeGenerator new.
	self assert: gen defaultSuperclass name equals: #Object.
	gen defaultSuperclass: LIBRoot.
	self assert: gen defaultSuperclass name equals: #LIBRoot
]

{ #category : #tests }
FMCodeGenerationTest >> testFM3Generation [
	self
		shouldnt: [ FMDefaultCodeGenerator new
				visit: FMMetaMetaModel default;
				previewChangesIfShiftPressed ]
		raise: Error
]

{ #category : #tests }
FMCodeGenerationTest >> testLIBGeneration [
	| generator |
	generator := FMDefaultCodeGenerator new.
	generator defaultSuperclass: LIBRoot.
	generator visit: (FMMetaModel fromString: FMMSEParserTest sampleMetaMse).
	generator previewChangesIfShiftPressed
]

{ #category : #tests }
FMCodeGenerationTest >> testRPGGeneration [
	| generator |
	generator := FMDefaultCodeGenerator new.
	generator defaultCategory: 'Fame-Example'.
	generator visit: (FMMetaModel fromString: FMDungeonExample metamodelString).
	generator previewChangesIfShiftPressed
]

{ #category : #tests }
FMCodeGenerationTest >> testSimpleGeneration [
	| gen |
	gen := FMDefaultCodeGenerator new.
	gen classNamePrefix: 'Zork'.	"random prefix Zork"
	gen visit: (FMMetaModel fromString: FMMSEParserTest sampleMetaMse).
	gen previewChangesIfShiftPressed.
	self assert: gen model changes changesSize > 0.
	self assert: (gen model changes changes collect: #changeClassName) asSet size equals: 3.
	self assert: ((gen model changes changes collect: #changeClassName) includes: #ZorkLIBBook).
	self assert: ((gen model changes changes collect: #changeClassName) includes: #ZorkLIBPerson).
	self assert: ((gen model changes changes collect: #changeClassName) includes: #ZorkLIBLibrary)
]
