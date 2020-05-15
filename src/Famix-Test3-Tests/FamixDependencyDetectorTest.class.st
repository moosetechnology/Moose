"
test that when entities passed a scope, they reply their outgoing or incoming according to that scope.
"
Class {
	#name : #FamixDependencyDetectorTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Test3-Tests'
}

{ #category : #running }
FamixDependencyDetectorTest >> addConnections [
	FamixTest3Invocation source: self method1 target: {self method2} model: model.
	FamixTest3Invocation source: self method2 target: {self method1} model: model.
	FamixTest3Access source: self method1 target: self attribute3
]

{ #category : #running }
FamixDependencyDetectorTest >> attribute3 [
	^ model entityNamed: 'Class3.attribute3'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> class1 [
	^ model entityNamed: 'Class1'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> class2 [
	^ model entityNamed: 'Class2'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> class3 [
	^ model entityNamed: 'Class3'
]

{ #category : #running }
FamixDependencyDetectorTest >> createTestEntities: counter [
	| package class method attribute |
	package := FamixTest3Package named: 'package' , counter asString model: model.
	class := FamixTest3Class named: 'Class' , counter asString model: model.
	method := FamixTest3Method named: 'method' , counter asString model: model.
	attribute := FamixTest3Attribute named: 'attribute' , counter asString model: model.

	package addChildEntity: class.
	method parentType: class.
	attribute parentType: class
]

{ #category : #helpers }
FamixDependencyDetectorTest >> method1 [
	^ model entityNamed: 'Class1.method1'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> method2 [
	^ model entityNamed: 'Class2.method2'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> package1 [
	^ model entityNamed: 'package1'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> package2 [
	^ model entityNamed: 'package2'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> package3 [
	^ model entityNamed: 'package3'
]

{ #category : #running }
FamixDependencyDetectorTest >> setUp [
	super setUp.
	model := FamixTest3Model new.
	1 to: 3 do: [ :number | self createTestEntities: number ].
	self addConnections
]

{ #category : #'tests-clients' }
FamixDependencyDetectorTest >> testClientClassesFromMethods [
	self assertCollection: (self class2 allClientsIn: model allModelMethods) hasSameElements: {self method1}
]

{ #category : #'tests-clients' }
FamixDependencyDetectorTest >> testClientMethodFromPackages [
	self assertCollection: (self method2 allClientsIn: model allModelPackages) hasSameElements: {self package1}
]

{ #category : #'tests-clients' }
FamixDependencyDetectorTest >> testClientsMethodFromClasses [
	self assertCollection: (self method2 allClientsIn: model allModelClasses) hasSameElements: { self class1 }
]

{ #category : #'tests-providers' }
FamixDependencyDetectorTest >> testProviderClassesToMethods [
	self assertCollection: (self class1 allProvidersIn: model allModelMethods) hasSameElements: { self method2 }
]

{ #category : #'tests-providers' }
FamixDependencyDetectorTest >> testProviderMethodToClasses [
	self assertCollection: (self method1 allProvidersIn: model allModelClasses) hasSameElements: { self class3 . self class2 }
]

{ #category : #'tests-providers' }
FamixDependencyDetectorTest >> testProviderMethodToPackages [
	self assertCollection: (self method1 allProvidersIn: model allModelPackages) hasSameElements: {self package2 . self package3}
]
