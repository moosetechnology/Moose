Class {
	#name : #FM3ElementTest,
	#superclass : #TestCase,
	#instVars : [
		'element',
		'metaMetamodel'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #testing }
FM3ElementTest class >> isAbstract [
	^ self = FM3ElementTest
]

{ #category : #testing }
FM3ElementTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FM3ElementTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
FM3ElementTest >> addUnamedOwnerTo: anElement [
	self subclassResponsibility
]

{ #category : #running }
FM3ElementTest >> setUp [
	super setUp.
	element := self actualClass new.
	metaMetamodel := FMMetaMetaModel default
]

{ #category : #tests }
FM3ElementTest >> testFullNameIsString [
	element name: 'Test'.
	self assert: element fullName isString
]

{ #category : #tests }
FM3ElementTest >> testFullNameOfNonameIsNil [
	self shouldnt: [ element fullName ] raise: Error.
	self assert: element fullName isNil
]

{ #category : #tests }
FM3ElementTest >> testFullNameOfNonameOwnerIsNil [
	self addUnamedOwnerTo: element.
	self shouldnt: [ element fullName ] raise: Error.
	self assert: element fullName isNil
]

{ #category : #tests }
FM3ElementTest >> testHasOwner [
	self deny: element hasOwner.
	self addUnamedOwnerTo: element.
	self assert: element hasOwner
]

{ #category : #tests }
FM3ElementTest >> testNameIsSymbol [
	element name: 'Test'.
	self assert: element name isSymbol
]

{ #category : #tests }
FM3ElementTest >> testPrintOn [
	self shouldnt: [ element printString ] raise: Error
]
