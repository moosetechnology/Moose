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
	self assert: class isFM3Class.
	self assert: class superclass equals: FM3 object.
	self assert: class implementingClass equals: FM3Element.
	self assert: (class at: 'name') isFM3Property.
	self assert: (class at: 'name') name equals: #name.
	self assert: (class at: 'name') mmClass equals: class.
	self assert: (class at: 'name') owner equals: class.
	self assert: (class at: 'name') type equals: FM3 string.
	self deny: (class at: 'name') isContainer.
	self deny: (class at: 'name') isMultivalued.
	self deny: (class at: 'name') isComposite.
	self deny: (class at: 'name') hasOpposite.
	self assert: class owner equals: package.	"We now test properties"
	class := package at: 'Property'.
	self assert: class isFM3Class.
	self assert: class superclass equals: (package at: 'Element').
	self assert: class implementingClass equals: FM3PropertyDescription.
	self assert: (class at: 'opposite') isFM3Property.
	self assert: (class at: 'opposite') name equals: #opposite.
	self assert: (class at: 'opposite') mmClass equals: class.
	self assert: (class at: 'opposite') owner equals: class.
	self assert: (class at: 'opposite') type equals: class.
	self deny: (class at: 'opposite') isContainer.
	self deny: (class at: 'opposite') isMultivalued.
	self deny: (class at: 'opposite') isComposite.
	self assert: (class at: 'opposite') hasOpposite.
	self assert: (class at: 'opposite') opposite equals: (class at: 'opposite').	"We now test the container property of FM3's properties"
	property := (package at: 'Property') at: 'class'.
	self assert: property isContainer.
	properties := (package at: 'Property') allAttributes copyWithout: property.
	self assert: (properties noneSatisfy: #isContainer).
	properties := (package at: 'Package') allAttributes.
	self assert: (properties noneSatisfy: #isContainer).
	property := (package at: 'Class') at: 'package'.
	self assert: property isContainer.
	properties := (package at: 'Class') allAttributes copyWithout: property.
	self assert: (properties noneSatisfy: #isContainer)
]

{ #category : #running }
FMPragmaProcessorTest >> testBuildFM3 [
	| processor all |
	processor := FMPragmaProcessor new.
	processor buildFM3.	"There are some elements."
	self denyEmpty: processor elements.	"There is one and only one package."
	all := processor packages.
	self assert: all size equals: 1.
	self assert: all anyOne name equals: #FM3	"We do not test more here, please refer to FMMetaRepositoryTest for more FM3 tests..."
]

{ #category : #running }
FMPragmaProcessorTest >> testEmptyProcessor [
	| processor |
	processor := FMPragmaProcessor new.
	"An empty processor knows all primitives, but does not contain them as elements!"
	self assert: processor elements size equals: 0
]

{ #category : #running }
FMPragmaProcessorTest >> testSimple [
	"--- FIXME: these 4 lines are moot ---"

	| processor rep elements originalSize props mmClass |
	processor := FMPragmaProcessor new.
	originalSize := processor elements size.
	processor queue: FMPragmaProcessorTestDummy.
	processor run.
	self assert: processor elements size equals: originalSize + 2.
	rep := processor asMetamodel.
	self assert: (rep isKindOf: FMRepository).
	self assert: rep elements size equals: originalSize + 2.
	elements := rep classes.
	self assert: elements size equals: originalSize + 1.
	props := rep properties.
	self assert: props size equals: 1.
	self assert: props anyOne mmClass notNil.
	self assert: (elements includes: props anyOne mmClass).
	mmClass := props anyOne mmClass.
	self assert: mmClass name equals: #FMAnnotationTest.
	self assert: mmClass superclass name equals: #Object.
	self assert: props anyOne type name equals: #Boolean
]
