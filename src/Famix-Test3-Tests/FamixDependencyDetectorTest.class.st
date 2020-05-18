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
FamixDependencyDetectorTest >> a3 [
	^ model entityNamed: 'Class3.attribute3'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> c1 [
	^ model entityNamed: 'Class1'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> c2 [
	^ model entityNamed: 'Class2'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> c3 [
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
FamixDependencyDetectorTest >> m1 [
	^ model entityNamed: 'Class1.method1'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> m2 [
	^ model entityNamed: 'Class2.method2'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> p1 [
	^ model entityNamed: 'package1'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> p2 [
	^ model entityNamed: 'package2'
]

{ #category : #helpers }
FamixDependencyDetectorTest >> p3 [
	^ model entityNamed: 'package3'
]

{ #category : #running }
FamixDependencyDetectorTest >> setUp [
	super setUp.
	model := FamixTest3Model new.
	1 to: 3 do: [ :number | self createTestEntities: number ].
	FamixTest3Invocation source: self m1 target: {self m2} model: model.
	FamixTest3Invocation source: self m2 target: {self m1} model: model.
	FamixTest3Access source: self m1 target: self a3
]

{ #category : #'tests-clients' }
FamixDependencyDetectorTest >> testClientClassesFromMethods [
	self assertCollection: (self c2 allClientsIn: model allModelMethods) hasSameElements: {self m1}
]

{ #category : #'tests-clients' }
FamixDependencyDetectorTest >> testClientMethodFromPackages [
	self assertCollection: (self m2 allClientsIn: model allModelPackages) hasSameElements: {self p1}
]

{ #category : #'tests-clients' }
FamixDependencyDetectorTest >> testClientsMethodFromClasses [
	self assertCollection: (self m2 allClientsIn: model allModelClasses) hasSameElements: { self c1 }
]

{ #category : #'tests-providers' }
FamixDependencyDetectorTest >> testProviderClassesToMethods [
	self assertCollection: (self c1 allProvidersIn: model allModelMethods) hasSameElements: { self m2 }
]

{ #category : #'tests-providers' }
FamixDependencyDetectorTest >> testProviderMethodToClasses [
	self assertCollection: (self m1 allProvidersIn: model allModelClasses) hasSameElements: { self c3 . self c2 }
]

{ #category : #'tests-providers' }
FamixDependencyDetectorTest >> testProviderMethodToPackages [
	self assertCollection: (self m1 allProvidersIn: model allModelPackages) hasSameElements: {self p2 . self p3}
]
