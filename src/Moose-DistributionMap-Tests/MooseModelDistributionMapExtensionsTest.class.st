Class {
	#name : #MooseModelDistributionMapExtensionsTest,
	#superclass : #TestCase,
	#category : #'Moose-DistributionMap-Tests'
}

{ #category : #util }
MooseModelDistributionMapExtensionsTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #tests }
MooseModelDistributionMapExtensionsTest >> testPropertiesForDistributionMap [
	| model |
	model := self model.
	self assert: (model resultOfProperty: #numberOfLinesOfCode appliedTo: model allClasses first class) isNumber.
	self assert: (model resultOfProperty: #numberOfLinesOfCode appliedTo: model allClasses first) isNil.
	
	self assert: (model classConcernedByProperty: #numberOfLinesOfCode appliedTo: FamixStClass) isNil.

]

{ #category : #tests }
MooseModelDistributionMapExtensionsTest >> testPropertiesOnEmpty [
	self assertEmpty: DistributionMap new properties
]

{ #category : #tests }
MooseModelDistributionMapExtensionsTest >> testTitleBlock [
	| dm |
	dm := DistributionMap new.
	self assert: (dm elementTitleBlock value: 'My default name') equals: 'My default name'.
	dm elementTitleBlock: [ :each | 'My new element name' ].
	self assert: (dm elementTitleBlock value: 'asd') equals: 'My new element name'
]
