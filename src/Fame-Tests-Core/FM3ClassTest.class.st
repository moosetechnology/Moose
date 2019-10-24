Class {
	#name : #FM3ClassTest,
	#superclass : #TestCase,
	#instVars : [
		'metaMetamodel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FM3ClassTest >> setUp [
	super setUp.
	metaMetamodel := FMMetaMetaModel new
]

{ #category : #running }
FM3ClassTest >> testAllAttributes [
	| elem |
	elem := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allProperties isNotNil.
	self assert: elem allProperties isCollection.
	self denyEmpty: elem allProperties
]

{ #category : #running }
FM3ClassTest >> testAllAttributesMoreThanAttributes [
	| elem |
	elem := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allProperties size > elem properties size.
	self assert: elem allProperties size equals: elem properties size + elem superclass properties size.
	self assert: (elem allProperties includesAll: elem properties)
]

{ #category : #running }
FM3ClassTest >> testAllAttributesNotHot [
	| class prop size |
	class := metaMetamodel elementNamed: 'FM3.Class'.
	prop := class allProperties anyOne.
	size := class allProperties size.
	self assert: class allProperties size equals: size.
	self assert: prop mmClass equals: class.
	self should: [ class allProperties remove: prop ] raise: Error.
	self assert: class allProperties size equals: size.
	self assert: prop mmClass equals: class
]

{ #category : #running }
FM3ClassTest >> testAllSuperclasses [
	| elem |
	elem := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 2.

	elem := FM3Object instance.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assertEmpty: elem allSuperclasses.

	elem := FM3String instance.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1.

	elem := FM3Number instance.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1.

	elem := FM3Boolean instance.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1
]

{ #category : #running }
FM3ClassTest >> testAttributeNamedString [
	| elem |
	elem := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (elem propertyNamed: 'owner') isNotNil.
	self assert: (elem propertyNamed: 'abstract') isNotNil.
	self assert: (elem propertyNamed: 'zork') isNil
]

{ #category : #running }
FM3ClassTest >> testAttributeNamedSymbol [
	| elem |
	elem := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (elem propertyNamed: #owner) isNotNil.
	self assert: (elem propertyNamed: #abstract) isNotNil.
	self assert: (elem propertyNamed: #zork) isNil
]

{ #category : #running }
FM3ClassTest >> testAttributes [
	| elem |
	elem := metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem properties isNotNil.
	self assert: elem properties isCollection.
	self denyEmpty: elem properties
]

{ #category : #running }
FM3ClassTest >> testAttributesIsHot [
	| class prop size |
	class := metaMetamodel elementNamed: 'FM3.Class'.
	prop := class properties anyOne.
	size := class properties size.
	self assert: class properties size equals: size.
	self assert: prop mmClass equals: class.
	class properties remove: prop.
	self assert: class properties size equals: size - 1.
	self assert: prop mmClass isNil
]

{ #category : #running }
FM3ClassTest >> testHasOwner [
	self deny: FM3Object instance hasOwner.
	self deny: FM3String instance hasOwner.
	self deny: FM3Number instance hasOwner.
	self deny: FM3Boolean instance hasOwner.
	self assert: metaMetamodel classes anyOne hasOwner.
	self assert: metaMetamodel properties anyOne hasOwner.
	self deny: metaMetamodel packages anyOne hasOwner
]

{ #category : #running }
FM3ClassTest >> testHasPackage [
	self deny: FM3Object instance hasPackage.
	self deny: FM3String instance hasPackage.
	self deny: FM3Number instance hasPackage.
	self deny: FM3Boolean instance hasPackage.
	self assert: metaMetamodel classes anyOne hasPackage
]

{ #category : #running }
FM3ClassTest >> testHasSuperclass [
	self deny: FM3Object instance hasSuperclass.
	self assert: FM3String instance hasSuperclass.
	self assert: FM3Number instance hasSuperclass.
	self assert: FM3Boolean instance hasSuperclass.
	self assert: metaMetamodel classes anyOne hasSuperclass
]

{ #category : #running }
FM3ClassTest >> testIsPrimitive [
	self deny: FM3Object instance isPrimitive.
	self assert: FM3String instance isPrimitive.
	self assert: FM3Number instance isPrimitive.
	self assert: FM3Boolean instance isPrimitive.
	self deny: metaMetamodel classes anyOne isPrimitive
]

{ #category : #running }
FM3ClassTest >> testIsRoot [
	self assert: FM3Object instance isRoot.
	self deny: FM3String instance isRoot.
	self deny: FM3Number instance isRoot.
	self deny: FM3Boolean instance isRoot.
	self deny: metaMetamodel classes anyOne isRoot
]

{ #category : #running }
FM3ClassTest >> testSubclasses [
	self denyEmpty: (metaMetamodel elementNamed: 'FM3.Element') subclasses
]
