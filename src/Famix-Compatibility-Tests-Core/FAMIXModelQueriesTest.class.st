Class {
	#name : #FAMIXModelQueriesTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'class1',
		'stubClass1',
		'interface1',
		'stubInterface1',
		'stubNamespace',
		'namespace1',
		'namespace2',
		'stubPrimitiveType'
	],
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #running }
FAMIXModelQueriesTest >> setUp [
	super setUp.
	namespace1 := FAMIXNamespace new.
	namespace2 := FAMIXNamespace new.
	stubNamespace := FAMIXNamespace new isStub: true.
	class1 := FAMIXClass new.
	stubClass1 := FAMIXClass new isStub: true.
	interface1 := FAMIXClass new isInterface: true.
	stubInterface1 := FAMIXClass new
		isStub: true;
		isInterface: true.
	stubPrimitiveType := FAMIXPrimitiveType new isStub: true.
	class1 container: namespace1.
	stubClass1 container: stubNamespace.
	interface1 container: namespace2.
	stubInterface1 container: stubNamespace.
	model := FAMIXModel new.
	model add: class1.
	model add: stubClass1.
	model add: interface1.
	model add: stubInterface1.
	model add: stubPrimitiveType.
	model add: namespace1.
	model add: namespace2.
	model add: stubNamespace
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllClasses [
	self assert: model allClasses size equals: 4
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllModelClasses [
	self assert: model allModelPureClasses size equals: 1
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllModelNamespaces [
	self assert: model allModelNamespaces size equals: 2
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllModelTypes [
	self assert: model allModelTypes size equals: 2
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllNamespaces [
	self assert: model allNamespaces size equals: 3
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllTypes [
	self assert: model allTypes size equals: 5
]

{ #category : #tests }
FAMIXModelQueriesTest >> testAllWithTypeOfGroupClass [
	self assert: (model allWithType: FAMIXClass ofGroupClass: FAMIXTypeGroup) size equals: 4
]
