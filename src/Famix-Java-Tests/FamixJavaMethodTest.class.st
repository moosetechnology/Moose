Class {
	#name : #FamixJavaMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'method'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaMethodTest >> setUp [
	method := FamixJavaMethod new
]

{ #category : #tests }
FamixJavaMethodTest >> testDefaultIsStub [
	self deny: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testIsNotStubWhenParentIsNotStub [
	| aClass |
	aClass := FamixJavaClass new.
	method parentType: aClass.
	aClass isStub: false.
	self deny: aClass isStub.
	self deny: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testIsStubWhenParentIsStub [
	| aClass |
	aClass := FamixJavaClass new.
	method parentType: aClass.
	aClass isStub: true.
	self assert: aClass isStub.
	self assert: method isStub
]

{ #category : #tests }
FamixJavaMethodTest >> testSettingIsStub [
	method isStub: true.
	self assert: method isStub
]
