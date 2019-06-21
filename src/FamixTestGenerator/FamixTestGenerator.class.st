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
	test := TestCase subclass: (self testNameFrom: aClass)
	uses: (self traitNameFrom: aClass)
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Famix-Tests-Tests'
	
]

{ #category : #accessing }
FamixTestGenerator >> createTraitOfTestFor: aClass [
	traitTest := Trait
		named: (self traitNameFrom: aClass)
		uses: TFamixTest
		slots: {(self slotNameOfTestTraitFrom: aClass), 1 asString . (self slotNameOfTestTraitFrom: aClass), 2 asString}
		category: 'Famix-Tests-Traits'
]

{ #category : #'as yet unclassified' }
FamixTestGenerator >> generateSetUpCodeFor:aClass [
	^ String streamContents: [ :aStream | aStream nextPutAll: 'self entity: MooseEntity new copyWithTalent:'; 
		nextPutAll: aClass name;
		cr;
		nextPutAll: 'self entity class initializeSlots: self entity.' ]
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
