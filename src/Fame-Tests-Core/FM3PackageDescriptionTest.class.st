Class {
	#name : #FM3PackageDescriptionTest,
	#superclass : #TestCase,
	#instVars : [
		'tower'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FM3PackageDescriptionTest >> setUp [
	super setUp.
	tower := FMTower new
]

{ #category : #tests }
FM3PackageDescriptionTest >> testClassNamed [
	| package class |
	package := tower metaMetamodel packageNamed: 'FM3'.
	class := (package classNamed: 'Property').
	self assert: class isNotNil.
	self assert: class name equals: 'Property'.
	self assert: class package name equals: 'FM3'
]

{ #category : #tests }
FM3PackageDescriptionTest >> testClassNamedIfAbsent [
	| package |
	package := tower metaMetamodel packageNamed: 'FM3'.

	self deny: (package classNamed: 'Property' ifAbsent: [ 42 ]) equals: 42.
	self assert: (package classNamed: 'NonExisting' ifAbsent: [ 42 ]) equals: 42
]
