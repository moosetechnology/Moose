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
	self assert: elem allAttributes isNotNil.
	self assert: elem allAttributes isCollection.
	self denyEmpty: elem allAttributes
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributesMoreThanAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allAttributes size > elem attributes size.
	self assert: elem allAttributes size equals: elem attributes size + elem superclass attributes size.
	self assert: (elem allAttributes includesAll: elem attributes)
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributesNotHot [
	| class prop size |
	class := tower metaMetamodel elementNamed: 'FM3.Class'.
	prop := class allAttributes anyOne.
	size := class allAttributes size.
	self assert: class allAttributes size equals: size.
	self assert: prop mmClass equals: class.
	self should: [ class allAttributes remove: prop ] raise: Error.
	self assert: class allAttributes size equals: size.
	self assert: prop mmClass equals: class
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllSuperclasses [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 2.

	elem := FM3 object.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assertEmpty: elem allSuperclasses.

	elem := FM3 string.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1.

	elem := FM3 number.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1.

	elem := FM3 boolean.
	self assert: elem allSuperclasses isNotNil.
	self assert: elem allSuperclasses isCollection.
	self assert: elem allSuperclasses size equals: 1
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributeNamedString [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (elem attributeNamed: 'owner') isNotNil.
	self assert: (elem attributeNamed: 'abstract') isNotNil.
	self assert: (elem attributeNamed: 'zork') isNil
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributeNamedSymbol [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: (elem attributeNamed: #owner) isNotNil.
	self assert: (elem attributeNamed: #abstract) isNotNil.
	self assert: (elem attributeNamed: #zork) isNil
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	self assert: elem attributes isNotNil.
	self assert: elem attributes isCollection.
	self denyEmpty: elem attributes
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributesIsHot [
	| class prop size |
	class := tower metaMetamodel elementNamed: 'FM3.Class'.
	prop := class attributes anyOne.
	size := class attributes size.
	self assert: class attributes size equals: size.
	self assert: prop mmClass equals: class.
	class attributes remove: prop.
	self assert: class attributes size equals: size - 1.
	self assert: prop mmClass isNil
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasOwner [
	self deny: FM3 object hasOwner.
	self deny: FM3 string hasOwner.
	self deny: FM3 number hasOwner.
	self deny: FM3 boolean hasOwner.
	self assert: tower metaMetamodel classes anyOne hasOwner.
	self assert: tower metaMetamodel properties anyOne hasOwner.
	self deny: tower metaMetamodel packages anyOne hasOwner
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasPackage [
	self deny: FM3 object hasPackage.
	self deny: FM3 string hasPackage.
	self deny: FM3 number hasPackage.
	self deny: FM3 boolean hasPackage.
	self assert: tower metaMetamodel classes anyOne hasPackage
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasSuperclass [
	self deny: FM3 object hasSuperclass.
	self assert: FM3 string hasSuperclass.
	self assert: FM3 number hasSuperclass.
	self assert: FM3 boolean hasSuperclass.
	self assert: tower metaMetamodel classes anyOne hasSuperclass
]

{ #category : #running }
FM3MetaDescriptionTest >> testIsPrimitive [
	self deny: FM3 object isPrimitive.
	self assert: FM3 string isPrimitive.
	self assert: FM3 number isPrimitive.
	self assert: FM3 boolean isPrimitive.
	self deny: tower metaMetamodel classes anyOne isPrimitive
]

{ #category : #running }
FM3MetaDescriptionTest >> testIsRoot [
	self assert: FM3 object isRoot.
	self deny: FM3 string isRoot.
	self deny: FM3 number isRoot.
	self deny: FM3 boolean isRoot.
	self deny: tower metaMetamodel classes anyOne isRoot
]

{ #category : #running }
FM3MetaDescriptionTest >> testSubclasses [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Element'.
	self denyEmpty: elem subclasses
]
