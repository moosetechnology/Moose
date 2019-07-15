Class {
	#name : #FM3ElementTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FM3ElementTest >> setUp [

	super setUp.
	tower := FMTower new.
]

{ #category : #running }
FM3ElementTest >> testFullNameIsString [
	(tower metaMetamodel elementNamed: 'FM3') fullName isString should beTrue.
	(tower metaMetamodel elementNamed: 'FM3.Property') fullName isString should beTrue.
	(tower metaMetamodel elementNamed: 'FM3.Property.opposite') fullName isString should beTrue
]

{ #category : #running }
FM3ElementTest >> testFullNameOfNonameIsNil [
	| noname |
	noname := FM3PackageDescription new.
	self shouldnt: [ noname fullName ] raise: Error.
	noname fullName isNil should beTrue
]

{ #category : #running }
FM3ElementTest >> testFullNameOfNonameOwnerIsNil [
	| noname child |
	noname := FM3PackageDescription new.
	child := FM3MetaDescription new.
	child package: noname.
	child name: 'Child'.
	self shouldnt: [ child fullName ] raise: Error.
	child fullName isNil should beTrue
]

{ #category : #running }
FM3ElementTest >> testNameIsSymbol [
	(tower metaMetamodel elementNamed: 'FM3') name isSymbol should beTrue.
	(tower metaMetamodel elementNamed: 'FM3.Property') name isSymbol should beTrue.
	(tower metaMetamodel elementNamed: 'FM3.Property.opposite') name isSymbol should beTrue
]

{ #category : #running }
FM3ElementTest >> testPrintString [

	| noname |
	noname := FM3Element new.
	self shouldnt: [ noname printString ] raise: Error.
	
]
