Class {
	#name : #FamixTestGenerator,
	#superclass : #Object,
	#instVars : [
		'package',
		'classes',
		'traitTest',
		'test',
		'generator'
	],
	#category : #FamixTestGenerator
}

{ #category : #accessing }
FamixTestGenerator >> classes [
	^classes
]

{ #category : #'as yet unclassified' }
FamixTestGenerator >> createPackageToPutGeneratedTests [
	(RPackageOrganizer new includesPackageNamed: self generator prefix, '-Tests') ifFalse: 
	[RPackageOrganizer new createPackageNamed: self generator prefix, '-Tests']

]

{ #category : #accessing }
FamixTestGenerator >> createTestFor: aClass [
	test := TestCase subclass: (self testNameFrom: aClass) asSymbol
	uses: traitTest 
	instanceVariableNames: ''
	classVariableNames: ''
	package: self generator prefix, '-Tests-Tests'
	
]

{ #category : #accessing }
FamixTestGenerator >> generator [
	^ generator
]

{ #category : #accessing }
FamixTestGenerator >> generator: anObject [
	generator := anObject
]

{ #category : #'as yet unclassified' }
FamixTestGenerator >> initClasses [
	classes := self package classes select:[:c| c name beginsWith: self generator prefix] .
]

{ #category : #'as yet unclassified' }
FamixTestGenerator >> initPackage [
	self initializePackageFrom: self generator packageName.
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

{ #category : #'as yet unclassified' }
FamixTestGenerator >> runFor: aClass [.
	self subclassResponsibility .
]

{ #category : #'as yet unclassified' }
FamixTestGenerator >> runForASpecificClass: aClass with: aGenerator [
	self generator: aGenerator.
	self initPackage.
	self runFor: aClass.
	
]

{ #category : #'as yet unclassified' }
FamixTestGenerator >> runForAllClassesWith: aGenerator [
	self generator: aGenerator.
	self initPackage.
	self initClasses.
	self classes do: [ :c | self runFor: c ].
	
]

{ #category : #accessing }
FamixTestGenerator >> testNameFrom: aClass [
	^ aClass name, 'Test'.
]

{ #category : #accessing }
FamixTestGenerator >> traitNameFrom: aClass [
	^ 'T', aClass name, 'Test'.
]
