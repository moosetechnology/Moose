Class {
	#name : #FM3PackageTest,
	#superclass : #TestCase,
	#instVars : [
		'metaMetamodel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FM3PackageTest >> setUp [
	super setUp.
	metaMetamodel := FMMetaMetaRepository new
]

{ #category : #tests }
FM3PackageTest >> testClassNamed [
	| package class |
	package := metaMetamodel packageNamed: 'FM3'.
	class := package classNamed: 'Property'.
	self assert: class isNotNil.
	self assert: class name equals: 'Property'.
	self assert: class package name equals: 'FM3'
]

{ #category : #tests }
FM3PackageTest >> testClassNamedIfAbsent [
	| package |
	package := metaMetamodel packageNamed: 'FM3'.
	self deny: (package classNamed: 'Property' ifAbsent: [ 42 ]) equals: 42.
	self assert: (package classNamed: 'NonExisting' ifAbsent: [ 42 ]) equals: 42
]
