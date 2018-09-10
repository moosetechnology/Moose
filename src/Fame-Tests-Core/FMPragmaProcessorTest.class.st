Class {
	#name : #FMPragmaProcessorTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMPragmaProcessorTest >> testAnnotationTypes [
	| repo package class property properties |
	repo := FMMetaRepository fm3.
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

{ #category : #running }
FMPragmaProcessorTest >> testBuildFM3 [
	| processor all |
	processor := FMPragmaProcessor new.
	processor buildFM3.	"There are some elements."
	processor elements isEmpty should beFalse.	"There is one and only one package."
	all := processor packages.
	all size should = 1.
	all anyOne name should = #FM3	"We do not test more here, please refer to FMMetaRepositoryTest for more FM3 tests..."
]

{ #category : #running }
FMPragmaProcessorTest >> testEmptyProcessor [
	| processor |
	processor := FMPragmaProcessor new.
	"An empty processor knows all primitives, but does not contain them as elements!"
	processor elements size should = 0
]

{ #category : #running }
FMPragmaProcessorTest >> testSimple [
	"--- FIXME: these 4 lines are moot ---"

	| processor rep elements originalSize props mmClass |
	processor := FMPragmaProcessor new.
	originalSize := processor elements size.
	processor queue: FMPragmaProcessorTestDummy.
	processor run.
	processor elements size should = (originalSize + 2).
	rep := processor asMetamodel.
	rep should beKindOf: FMRepository.
	rep elements size should = (originalSize + 2).
	elements := rep classes.
	elements size should = (originalSize + 1).
	props := rep properties.
	props size should = 1.
	props anyOne mmClass notNil should beTrue.
	elements should include: props anyOne mmClass.
	mmClass := props anyOne mmClass.
	mmClass name should = #FMAnnotationTest.
	mmClass superclass name should = #Object.
	props anyOne type name should = #Boolean
]
