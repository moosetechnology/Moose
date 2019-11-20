Class {
	#name : #FM3PackageTest,
	#superclass : #FM3ElementTest,
	#category : #'Fame-Tests-Core'
}

{ #category : #helpers }
FM3PackageTest >> actualClass [
	^ FM3Package
]

{ #category : #helpers }
FM3PackageTest >> addUnamedOwnerTo: anElement [
	"Package don't have parents."

	
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

{ #category : #tests }
FM3PackageTest >> testHasOwner [
	self deny: element hasOwner.
	self addUnamedOwnerTo: element.
	self deny: element hasOwner
]
