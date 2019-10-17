Class {
	#name : #FM3MetaDescriptionTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FM3MetaDescriptionTest >> setUp [
	super setUp.
	tower := FMTower new
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allProperties isNotNil.
	self assert: elem allProperties isCollection.
	self denyEmpty: elem allProperties
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributesMoreThanAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allProperties size > elem properties size.
	self assert: elem allProperties size equals: elem properties size + elem superclass properties size.
	self assert: (elem allProperties includesAll: elem properties)
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributesNotHot [
	| class prop size |
	class := tower metaMetamodel elementNamed: 'FM3.Class'.
	prop := class allProperties anyOne.
	size := class allProperties size.
	self assert: class allProperties size equals: size.
	self assert: prop mmClass equals: class.
	self should: [ class allProperties remove: prop ] raise: Error.
	self assert: class allProperties size equals: size.
	self assert: prop mmClass equals: class
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllSuperclasses [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 2.

	elem := FM3Class object.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assertEmpty: elem allSuperclasses.

	elem := FM3Class string.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1.

	elem := FM3Class number.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1.

	elem := FM3Class boolean.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributeNamedString [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (elem propertyNamed: 'owner') isNotNil.
	self assert: (elem propertyNamed: 'abstract') isNotNil.
	self assert: (elem propertyNamed: 'zork') isNil
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributeNamedSymbol [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (elem propertyNamed: #owner) isNotNil.
	self assert: (elem propertyNamed: #abstract) isNotNil.
	self assert: (elem propertyNamed: #zork) isNil
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem properties isNotNil.
	self assert: elem properties isCollection.
	self denyEmpty: elem properties
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributesIsHot [
	| class prop size |
	class := tower metaMetamodel elementNamed: 'FM3.Class'.
	prop := class properties anyOne.
	size := class properties size.
	self assert: class properties size equals: size.
	self assert: prop mmClass equals: class.
	class properties remove: prop.
	self assert: class properties size equals: size - 1.
	self assert: prop mmClass isNil
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasOwner [
	self deny: FM3Class object hasOwner.
	self deny: FM3Class string hasOwner.
	self deny: FM3Class number hasOwner.
	self deny: FM3Class boolean hasOwner.
	self assert: tower metaMetamodel classes anyOne hasOwner.
	self assert: tower metaMetamodel properties anyOne hasOwner.
	self deny: tower metaMetamodel packages anyOne hasOwner
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasPackage [
	self deny: FM3Class object hasPackage.
	self deny: FM3Class string hasPackage.
	self deny: FM3Class number hasPackage.
	self deny: FM3Class boolean hasPackage.
	self assert: tower metaMetamodel classes anyOne hasPackage
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasSuperclass [
	self deny: FM3Class object hasSuperclass.
	self assert: FM3Class string hasSuperclass.
	self assert: FM3Class number hasSuperclass.
	self assert: FM3Class boolean hasSuperclass.
	self assert: tower metaMetamodel classes anyOne hasSuperclass
]

{ #category : #running }
FM3MetaDescriptionTest >> testIsPrimitive [
	self deny: FM3Class object isPrimitive.
	self assert: FM3Class string isPrimitive.
	self assert: FM3Class number isPrimitive.
	self assert: FM3Class boolean isPrimitive.
	self deny: tower metaMetamodel classes anyOne isPrimitive
]

{ #category : #running }
FM3MetaDescriptionTest >> testIsRoot [
	self assert: FM3Class object isRoot.
	self deny: FM3Class string isRoot.
	self deny: FM3Class number isRoot.
	self deny: FM3Class boolean isRoot.
	self deny: tower metaMetamodel classes anyOne isRoot
]

{ #category : #running }
FM3MetaDescriptionTest >> testSubclasses [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Element'.
	self denyEmpty: elem subclasses
]
