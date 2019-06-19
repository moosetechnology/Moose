Class {
	#name : #FamixTestGenerator,
	#superclass : #Object,
	#instVars : [
		'package',
		'classes',
		'traitTest'
	],
	#category : #FamixTestGenerator
}

{ #category : #accessing }
FamixTestGenerator >> classes [
	^classes
]

{ #category : #accessing }
FamixTestGenerator >> createTraitOfTestFor: aClass [
	traitTest := Trait
		named: (self traitNameFrom: aClass)
		uses: TFamixTest
		slots: {(self slotNameOfTestTraitFrom: aClass), 1 asString . (self slotNameOfTestTraitFrom: aClass), 2 asString}
		category: 'Famix-Tests-Traits'
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
FamixTestGenerator >> traitNameFrom: aClass [
	^ 'T', aClass name, 'Test'.
]
