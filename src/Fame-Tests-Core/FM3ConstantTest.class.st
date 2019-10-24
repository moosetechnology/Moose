Class {
	#name : #FM3ConstantTest,
	#superclass : #TestCase,
	#instVars : [
		'constant'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #testing }
FM3ConstantTest class >> isAbstract [
	^ self = FM3ConstantTest
]

{ #category : #testing }
FM3ConstantTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FM3ConstantTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
FM3ConstantTest >> numberOfSuperClasses [
	^ 1
]

{ #category : #running }
FM3ConstantTest >> setUp [
	super setUp.
	constant := self actualClass instance
]

{ #category : #tests }
FM3ConstantTest >> testAllSubperclasses [
	self assert: constant allSuperclasses isNotNil.
	self assert: constant allSuperclasses isCollection.
	self assert: constant allSuperclasses size equals: self numberOfSuperClasses
]

{ #category : #tests }
FM3ConstantTest >> testHasOwner [
	self deny: constant hasOwner
]

{ #category : #tests }
FM3ConstantTest >> testHasPackage [
	self deny: constant hasPackage
]

{ #category : #tests }
FM3ConstantTest >> testHasSuperclass [
	self assert: constant hasSuperclass
]

{ #category : #tests }
FM3ConstantTest >> testIsPrimitive [
	self assert: constant isPrimitive
]

{ #category : #tests }
FM3ConstantTest >> testIsRoot [
	self assert: constant isRoot equals: self numberOfSuperClasses = 0
]
