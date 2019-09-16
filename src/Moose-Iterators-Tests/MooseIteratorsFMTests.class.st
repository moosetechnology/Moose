Class {
	#name : #MooseIteratorsFMTests,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'class1',
		'method1',
		'method2'
	],
	#classInstVars : [
		'model'
	],
	#category : #'Moose-Iterators-Tests'
}

{ #category : #running }
MooseIteratorsFMTests >> setUp [
	super setUp.
	model := FamixStMooseModel new.
	class1 := FamixStClass new.
	method1 := FamixStMethod new.
	method2 := FamixStMethod new.
	class1 addMethod: method1.
	class1 addMethod: method2.
	
	model addAll: { class1. method1. method2 }
]

{ #category : #running }
MooseIteratorsFMTests >> testCanAskIteratorsOnFMSlotMultivalueLink [
	self assert: ((class1 methods iterator > Array) includesAll: { method1. method2 })
]
