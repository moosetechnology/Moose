Class {
	#name : #FamixJavaModelQueriesTest,
	#superclass : #TestCase,
	#instVars : [
		'namespace1',
		'namespace2',
		'stubNamespace',
		'class1',
		'stubClass1',
		'interface1',
		'stubInterface1',
		'stubPrimitiveType',
		'model'
	],
	#category : #'Famix-Java-Tests'
}

{ #category : #running }
FamixJavaModelQueriesTest >> setUp [
	super setUp.
	namespace1 := FamixJavaNamespace new. 
	namespace2 := FamixJavaNamespace new.
	stubNamespace := FamixJavaNamespace new isStub: true.
	class1 := FamixJavaClass new.
	stubClass1 := FamixJavaClass new isStub: true.
	interface1 := FamixJavaClass new isInterface: true ; yourself .
	stubInterface1 := FamixJavaClass new isStub: true; isInterface: true ; yourself.
	stubPrimitiveType := FamixJavaPrimitiveType new isStub: true.
	class1 container: namespace1.
	stubClass1 container: stubNamespace.
	interface1 container: namespace2.
	stubInterface1 container: stubNamespace.
	model := FamixJavaMooseModel new.
	model add: class1.
	model add: stubClass1.
	model add: interface1.
	model add: stubInterface1.
	model add: stubPrimitiveType.
	model add: namespace1.
	model add: namespace2.
	model add: stubNamespace
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllClasses [
	self assert: model allClasses size equals: 4
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllModelClasses [
	self assert: model allModelPureClasses size equals: 1
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllModelNamespaces [
	self assert: model allModelNamespaces size equals: 2
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllModelTypes [
	self assert: model allModelTypes size equals: 2
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllNamespaces [
	self assert: model allNamespaces size equals: 3
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllTypes [
	self assert: model allTypes size equals: 5
]

{ #category : #'as yet unclassified' }
FamixJavaModelQueriesTest >> testAllWithTypeOfGroupClass [
	self assert: (model allWithType: FamixJavaClass ofGroupClass: FAMIXTypeGroup) size equals: 4
]
