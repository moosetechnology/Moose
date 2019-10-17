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
	tower := FMTower new
]

{ #category : #running }
FM3ElementTest >> testFullNameIsString [
	self assert: (tower metaMetamodel elementNamed: 'FM3') fullName isString.
	self assert: (tower metaMetamodel elementNamed: 'FM3.Property') fullName isString.
	self assert: (tower metaMetamodel elementNamed: 'FM3.Property.opposite') fullName isString
]

{ #category : #running }
FM3ElementTest >> testFullNameOfNonameIsNil [
	| noname |
	noname := FM3Package new.
	self shouldnt: [ noname fullName ] raise: Error.
	self assert: noname fullName isNil
]

{ #category : #running }
FM3ElementTest >> testFullNameOfNonameOwnerIsNil [
	| noname child |
	noname := FM3Package new.
	child := FM3Class named: 'child'.
	child package: noname.
	self shouldnt: [ child fullName ] raise: Error.
	self assert: child fullName isNil
]

{ #category : #running }
FM3ElementTest >> testNameIsSymbol [
	self assert: (tower metaMetamodel elementNamed: 'FM3') name isSymbol.
	self assert: (tower metaMetamodel elementNamed: 'FM3.Property') name isSymbol.
	self assert: (tower metaMetamodel elementNamed: 'FM3.Property.opposite') name isSymbol
]

{ #category : #running }
FM3ElementTest >> testPrintString [
	| noname |
	noname := FM3Element new.
	self shouldnt: [ noname printString ] raise: Error
]
