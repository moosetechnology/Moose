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
	tower := FMTower new.
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	elem allAttributes notNil should beTrue.
	elem allAttributes isCollection should beTrue.
	elem allAttributes isEmpty should beFalse
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributesMoreThanAttributes [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	elem allAttributes size should > elem attributes size.
	elem allAttributes size should
		= (elem attributes size + elem superclass attributes size).
	(elem allAttributes includesAll: elem attributes) should beTrue
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllAttributesNotHot [
	| class prop size |
	class := tower metaMetamodel elementNamed: 'FM3.Class'.
	prop := class allAttributes anyOne.
	size := class allAttributes size.
	class allAttributes size should = size.
	prop mmClass should = class.
	self 
		should: [ class allAttributes remove: prop ]
		raise: Error.
	class allAttributes size should = size.
	prop mmClass should = class
]

{ #category : #running }
FM3MetaDescriptionTest >> testAllSuperclasses [

	| elem |

	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	elem allSuperclasses notNil should beTrue.
	elem allSuperclasses isCollection should beTrue.
	elem allSuperclasses size should = 2.

	elem := FM3 object.
	elem allSuperclasses notNil should beTrue.
	elem allSuperclasses isCollection should beTrue.
	elem allSuperclasses isEmpty should beTrue.
	
	elem := FM3 string.
	elem allSuperclasses notNil should beTrue.
	elem allSuperclasses isCollection should beTrue.
	elem allSuperclasses size should = 1.	
	
	elem := FM3 number.
	elem allSuperclasses notNil should beTrue.
	elem allSuperclasses isCollection should beTrue.
	elem allSuperclasses size should = 1.
	
	elem := FM3 boolean.
	elem allSuperclasses notNil should beTrue.
	elem allSuperclasses isCollection should beTrue.
	elem allSuperclasses size should = 1.
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributeNamedString [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	(elem attributeNamed: 'owner') notNil should beTrue.
	(elem attributeNamed: 'abstract') notNil should beTrue.
	(elem attributeNamed: 'zork') isNil should beTrue
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributeNamedSymbol [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	(elem attributeNamed: #owner) notNil should beTrue.
	(elem attributeNamed: #abstract) notNil should beTrue.
	(elem attributeNamed: #zork) isNil should beTrue
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributes [
	| elem |

	elem := tower metaMetamodel elementNamed: 'FM3.Class'.
	elem attributes notNil should beTrue.
	elem attributes isCollection should beTrue.
	elem attributes isEmpty should beFalse
]

{ #category : #running }
FM3MetaDescriptionTest >> testAttributesIsHot [
	| class prop size |
	class := tower metaMetamodel elementNamed: 'FM3.Class'.
	prop := class attributes anyOne.
	size := class attributes size.
	class attributes size should = size.
	prop mmClass should = class.
	class attributes remove: prop.
	class attributes size should = (size - 1).
	prop mmClass isNil should beTrue
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasOwner [
	FM3 object hasOwner should beFalse.
	FM3 string hasOwner should beFalse.
	FM3 number hasOwner should beFalse.
	FM3 boolean hasOwner should beFalse.
	tower metaMetamodel classes anyOne hasOwner should beTrue.
	tower metaMetamodel properties anyOne hasOwner should beTrue.
	tower metaMetamodel packages anyOne hasOwner should beFalse
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasPackage [
	FM3 object hasPackage should beFalse.
	FM3 string hasPackage should beFalse.
	FM3 number hasPackage should beFalse.
	FM3 boolean hasPackage should beFalse.
	tower metaMetamodel classes anyOne hasPackage should beTrue
]

{ #category : #running }
FM3MetaDescriptionTest >> testHasSuperclass [
	FM3 object hasSuperclass should beFalse.
	FM3 string hasSuperclass should beTrue.
	FM3 number hasSuperclass should beTrue.
	FM3 boolean hasSuperclass should beTrue.
	tower metaMetamodel classes anyOne hasSuperclass should beTrue
]

{ #category : #running }
FM3MetaDescriptionTest >> testIsPrimitive [
	FM3 object isPrimitive should beFalse.
	FM3 string isPrimitive should beTrue.
	FM3 number isPrimitive should beTrue.
	FM3 boolean isPrimitive should beTrue.
	tower metaMetamodel classes anyOne isPrimitive should beFalse
]

{ #category : #running }
FM3MetaDescriptionTest >> testIsRoot [
	FM3 object isRoot should beTrue.
	FM3 string isRoot should beFalse.
	FM3 number isRoot should beFalse.
	FM3 boolean isRoot should beFalse.
	tower metaMetamodel classes anyOne isRoot should beFalse
]

{ #category : #running }
FM3MetaDescriptionTest >> testSubclasses [
	| elem |
	elem := tower metaMetamodel elementNamed: 'FM3.Element'.
	elem subclasses size should > 0
]
