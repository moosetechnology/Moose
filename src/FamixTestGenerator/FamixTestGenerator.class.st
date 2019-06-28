Class {
	#name : #FamixTestGenerator,
	#superclass : #Object,
	#instVars : [
		'package',
		'classes',
		'traitTest',
		'test'
	],
	#category : #FamixTestGenerator
}

{ #category : #accessing }
FamixTestGenerator >> classes [
	^classes
]

{ #category : #accessing }
FamixTestGenerator >> createTestFor: aClass [
	test := TestCase subclass: (self testNameFrom: aClass) asSymbol
	uses: traitTest 
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Famix-Tests-Tests'
	
]

{ #category : #accessing }
FamixTestGenerator >> initializeClassesFrom: aBlock [
	classes := package classes select: aBlock.
]

{ #category : #initialization }
FamixTestGenerator >> initializePackageFrom: aPackageName [
	package := RPackageOrganizer default packageNamed: aPackageName.
]

{ #category : #accessing }
FamixTestGenerator >> package [
	^ package
]

{ #category : #accessing }
FamixTestGenerator >> testNameFrom: aClass [
	^ aClass name, 'Test'.
]

{ #category : #accessing }
FamixTestGenerator >> traitNameFrom: aClass [
	^ 'T', aClass name, 'Test'.
]
