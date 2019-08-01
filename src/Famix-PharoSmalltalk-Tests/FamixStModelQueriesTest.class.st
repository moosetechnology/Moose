Class {
	#name : #FamixStModelQueriesTest,
	#superclass : #TestCase,
	#instVars : [
		'namespace1',
		'namespace2',
		'stubNamespace',
		'class1',
		'stubClass1',
		'interface1',
		'stubInterface1',
		'model'
	],
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #running }
FamixStModelQueriesTest >> setUp [
	super setUp.
	namespace1 := FamixStPackage new. 
	namespace2 := FamixStPackage new.
	namespace1 name: 'Package1'.
	namespace2 name: 'Package2'.
	stubNamespace := FamixStPackage new isStub: true ; yourself .
	class1 := FamixStClass new.
	stubClass1 := FamixStClass new isStub: true ; yourself.
	class1 parentPackage: namespace1.
	stubClass1 parentPackage: stubNamespace.
	model := FamixStMooseModel new.
	model add: class1.
	model add: stubClass1.
	model add: namespace1.
	model add: namespace2.
	model add: stubNamespace
]

{ #category : #'as yet unclassified' }
FamixStModelQueriesTest >> testAllClasses [
	self assert: model allClasses size equals: 2
]

{ #category : #'as yet unclassified' }
FamixStModelQueriesTest >> testAllModelPackages [
	self assert: model allModelPackages size equals: 2
]

{ #category : #'as yet unclassified' }
FamixStModelQueriesTest >> testAllModelTypes [
	self assert: model allModelTypes size equals: 1
]

{ #category : #'as yet unclassified' }
FamixStModelQueriesTest >> testAllPackages [
	self assert: model allPackages size equals: 3
]

{ #category : #'as yet unclassified' }
FamixStModelQueriesTest >> testAllTypes [
	self assert: model allTypes size equals: 2
]

{ #category : #'as yet unclassified' }
FamixStModelQueriesTest >> testAllWithTypeOfGroupClass [
	self assert: (model allWithType: FamixStClass ofGroupClass: FAMIXTypeGroup) size equals: 2
]
