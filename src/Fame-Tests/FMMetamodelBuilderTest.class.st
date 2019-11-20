Class {
	#name : #FMMetaModelBuilderTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests-Core'
}

{ #category : #tests }
FMMetaModelBuilderTest >> testAnnotationTypes [
	| metaMetaModel package class property properties |
	metaMetaModel := FMMetaMetaModel default.
	package := metaMetaModel elementNamed: 'FM3'.
	class := package classNamed: 'Element'.
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
	self deny: (class propertyNamed: 'name') isChildrenProperty.
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
	self deny: (class propertyNamed: 'opposite') isChildrenProperty.
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
FMMetaModelBuilderTest >> testBuildFM3 [
	| processor all |
	processor := FMMetaModelBuilder new.
	processor buildFM3.	"There are some elements."
	self denyEmpty: processor elements.	"There is one and only one package."
	all := processor packages.
	self assert: all size equals: 1.
	self assert: all anyOne name equals: #FM3	"We do not test more here, please refer to FMMetaRepositoryTest for more FM3 tests..."
]

{ #category : #tests }
FMMetaModelBuilderTest >> testEmptyProcessor [
	"An empty processor knows all primitives, but does not contain them as elements!"

	self assertEmpty: FMMetaModelBuilder new elements
]

{ #category : #tests }
FMMetaModelBuilderTest >> testSimple [
	"--- FIXME: these 4 lines are moot ---"

	| processor rep elements originalSize props mmClass |
	processor := FMMetaModelBuilder new.
	originalSize := processor elements size.
	processor queue: FMMetaModelBuilderTestDummy.
	processor run.
	self assert: processor elements size equals: originalSize + 2.
	rep := processor asMetamodel.
	self assert: (rep isKindOf: FMModel).
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
